-------------------------------------------------------------------------------
--  _____       ______  _____                                                 -
-- |_   _|     |  ____|/ ____|                                                -
--   | |  _ __ | |__  | (___    Institute of Embedded Systems                 -
--   | | | '_ \|  __|  \___ \   Zuercher Hochschule Winterthur                -
--  _| |_| | | | |____ ____) |  (University of Applied Sciences)              -
-- |_____|_| |_|______|_____/   8401 Winterthur, Switzerland                  -             
-------------------------------------------------------------------------------
--
-- Project     : HDMI_TEA
-- Filename    : mitm_i2c_slave.vhd
-- Description : This i2c slave receives i2c frames and transmits data to or from
--				Adressdecoder if slave address is 0x60 or 0xA0/0xA1 or 0x74/0x75.
--
-- Features    : 
--
-- Requirements:
-------------------------------------------------------------------------------
-- Change History
-- Date     |Name      |Modification
------------|----------|-------------------------------------------------------
-- 23.04.15 | scln     | file created
-- 02.06.15 | scln     | added "next_ack <= '1';" to st_hdcp_wr state
-- 15.06.15 | scln     | added "next_addr_valid	<= '0';" and
--						 "next_block_snk	<= '0';" to restart detection
-- 17.07.15 | scln     | added "AND hdmi_rx_5v_i = '1'" to start condition
-- 09.09.15 | scln     | added "EDID_control_i" signal to entity
-- 09.09.15 | scln     | added "EDID_control_i" signal to slave addr check in st_addr
-------------------------------------------------------------------------------


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;


------------------------------ENTITY-------------------------------------------
ENTITY mitm_i2c_slave IS
	PORT(
			clk_100m			: IN	std_logic;
			reset_n				: IN	std_logic;
			SCL					: IN	std_logic;
			SDA_in				: IN	std_logic;
			reg_data_i			: IN	std_logic_vector (7 DOWNTO 0);
			data_valid_i		: IN	std_logic;
			hdmi_rx_5v_i		: IN	std_logic;
			EDID_control_i		: IN	std_logic;

			SDA_drive			: OUT	std_logic := '0';
			SDA_out				: OUT	std_logic := '0';
			slave_addr_o		: OUT	std_logic_vector (7 DOWNTO 0);
			reg_data_o			: OUT	std_logic_vector (7 DOWNTO 0);
			wr_o				: OUT	std_logic;
			rd_o				: OUT	std_logic;
			addr_valid_o		: OUT	std_logic;
			block_snk_o			: OUT	std_logic := '0';
			int_frame_active_o	: OUT	std_logic
		);
END ENTITY;


------------------------------ARCHITECTURE-------------------------------------
ARCHITECTURE rtl OF mitm_i2c_slave IS

	--SIGNALS/CONSTANTS
	TYPE 	states IS (st_idle, st_addr, st_data_wr, st_data_rd, st_ack, st_m_ack, st_wait, st_transm, st_hdcp_wr);
	SIGNAL 	state, next_state	: states;
	
	SIGNAL sda_old		: std_logic_vector(1 DOWNTO 0) := (OTHERS => '0');
	SIGNAL scl_old		: std_logic_vector(1 DOWNTO 0) := (OTHERS => '0');
	SIGNAL next_sda_old	: std_logic_vector(1 DOWNTO 0) := (OTHERS => '0');
	SIGNAL next_scl_old	: std_logic_vector(1 DOWNTO 0) := (OTHERS => '0');
	-- Counter
	SIGNAL bitcount		: natural RANGE 0 TO 9 := 7;
	SIGNAL next_bitcount: natural RANGE 0 TO 9 := 7;
	SIGNAL datacount: natural RANGE 0 TO 128;			-- counter for data bytes to read
	SIGNAL next_datacount: natural RANGE 0 TO 128;
	-- Registers
	SIGNAL tmp_addr		: std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
	SIGNAL tmp_cmd		: std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
	SIGNAL tmp_data		: std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
	SIGNAL next_tmp_addr: std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
	SIGNAL next_tmp_cmd	: std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
	SIGNAL next_tmp_data: std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
	-- shift register
	SIGNAL int_shift		: std_logic_vector(19 DOWNTO 0) := (0 => '1', OTHERS => '0');
	SIGNAL next_int_shift	: std_logic_vector(19 DOWNTO 0) := (0 => '1', OTHERS => '0');
	-- edge signals
	SIGNAL neg_edge_SDA	: std_logic := '0';
	SIGNAL pos_edge_SDA	: std_logic := '0';
	SIGNAL neg_edge_SCL	: std_logic := '0';
	SIGNAL pos_edge_SCL	: std_logic := '0';
	-- Flags
	SIGNAL check		: std_logic := '0';	-- flag indicates that a register is full / byte arrived
	SIGNAL next_check	: std_logic := '0';
	SIGNAL ack			: std_logic := '0';
	SIGNAL next_ack		: std_logic := '0';
	SIGNAL wr			: std_logic := '0';
	SIGNAL next_wr		: std_logic := '0';
	SIGNAL rd			: std_logic_vector(1 DOWNTO 0) := "00";
	SIGNAL next_rd		: std_logic_vector(1 DOWNTO 0) := "00";
	SIGNAL addr_valid		: std_logic := '0';
	SIGNAL next_addr_valid	: std_logic := '0';
	SIGNAL block_snk		: std_logic := '0';
	SIGNAL next_block_snk	: std_logic := '0';

	SIGNAL SDA_drv		: std_logic := '0';
	SIGNAL next_SDA_drv	: std_logic := '0';


	-- Slaveaddresses for EDID and HDCP. 7 bit values -> in comment the 8bit value is used.
	CONSTANT ADDR_EDID_seg		: std_logic_vector(6 DOWNTO 0) := "0110000";	-- 0x60		EDID | Segment select
	CONSTANT ADDR_EDID_reg		: std_logic_vector(6 DOWNTO 0) := "1010000";	-- 0xA0/A1	EDID | EDID register
	CONSTANT ADDR_HDCP			: std_logic_vector(6 DOWNTO 0) := "0111010";	-- 0x74/75	HDCP | HDCO register

	CONSTANT EDID_READ_LENGTH	: natural RANGE 0 TO 128 := 128;	-- data read at address 0xA1

BEGIN

	--COMPONENT INITIATION
	--nope
------------------------------LOGIC--------------------------------------------
	logic_proc : PROCESS (state, neg_edge_SDA, pos_edge_SCL, neg_edge_SCL, SCL, SDA_in, tmp_addr, bitcount,
							check, ack, tmp_data, wr, rd, sda_old, scl_old, reg_data_i, datacount, clk_100m,
							EDID_control_i)
	--logic_proc : PROCESS (ALL)
	BEGIN
		-- default statement
		next_state 		<= state;
		next_bitcount 	<= bitcount;
		next_datacount 	<= datacount;
		next_check		<= check;
		next_ack		<= ack;
		next_tmp_addr	<= tmp_addr;
		next_tmp_data	<= tmp_data;
		next_wr			<= wr;
		next_rd			<= rd;
		next_SDA_drv 	<= SDA_drv;
		next_addr_valid <= addr_valid;
		next_block_snk	<= block_snk;

		next_sda_old	<= sda_old(0) & SDA_in;
		next_scl_old	<= scl_old(0) & SCL;
		next_int_shift	<= int_shift;

		IF (pos_edge_SDA = '1' and SCL = '1' AND SDA_drv = '0') THEN			-- idle / stop condition
			next_state		<= st_idle;
			next_addr_valid	<= '0';
			next_block_snk	<= '0';
			next_int_shift	<= (0 => '1', OTHERS => '0');-- reset running 1
		
		ELSIF neg_edge_SDA = '1' AND SCL = '1' AND hdmi_rx_5v_i = '1' THEN		-- detect restart condition
			next_state 		<= st_addr;
			next_bitcount	<= 7;
			next_addr_valid	<= '0';
			next_block_snk	<= '0';
			next_int_shift	<= (0 => '1', OTHERS => '0');-- reset running 1


		ELSE
			CASE state IS

				WHEN st_idle =>		IF neg_edge_SDA = '1' AND SCL = '1' AND hdmi_rx_5v_i = '1' THEN	-- start condition
										next_state <= st_addr;
										next_bitcount <= 7;
										next_int_shift	<= (0 => '1', OTHERS => '0');-- reset running 1
									END IF;
				--==============
				WHEN st_addr =>		IF pos_edge_SCL = '1' THEN					-- on pos edge of SCL read in SDA bit
										next_tmp_addr(bitcount) <= SDA_in;
										IF bitcount = 0 THEN
											next_bitcount <= 7;
											next_check    <= '1';				-- if byte complete set check
										ELSE
											next_bitcount <= bitcount - 1;
										END IF;

									ELSIF neg_edge_SCL = '1' THEN				-- on neg edge of SCL 
										IF check = '1' THEN						-- if byte complete
											next_check <= '0';
											-- check slave address
											IF (tmp_addr(7 DOWNTO 1) = ADDR_EDID_seg OR tmp_addr(7 DOWNTO 1) = ADDR_EDID_reg) AND EDID_control_i = '1' THEN
												next_ack	<= '1';				-- set ACK flag
												next_SDA_drv <= '1';			-- activate ACK for addr
												next_addr_valid <= '1';
												next_block_snk <= '1';
												IF tmp_addr(0) = '1' THEN
													next_state <= st_data_rd;	-- its a read
													next_datacount <= EDID_READ_LENGTH;
												ELSE
													next_state <= st_data_wr;	-- its a write
												END IF;
											-- INSERT ADDRESS CHECK
											ELSIF (tmp_addr(7 DOWNTO 1) = ADDR_EDID_seg OR tmp_addr(7 DOWNTO 1) = ADDR_EDID_reg) AND EDID_control_i = '0' THEN
												next_block_snk <= '1';		-- block EDID requests, otherwise chip will answer.
											ELSIF tmp_addr(7 DOWNTO 1) = ADDR_HDCP THEN	-- HDCP sniffing mode
												-- NO ACK!!! just flag!
												next_ack	<= '1';				-- set ACK flag
												next_addr_valid <= '1';
												-- NO block SNK!!!
												next_state	<= st_hdcp_wr;
											ELSE
												next_state	<= st_idle;			-- wrong slave address
											END IF;
										END IF;
									END IF;
				--==============
				WHEN st_data_rd =>	IF neg_edge_SCL = '1' THEN
										IF ack = '1' THEN					-- reset ACK
											next_ack <= '0';
											next_SDA_drv <= '0';			-- activate ACK for addr
											IF datacount = 0 THEN
												next_state <= st_idle;
											ELSE
												next_datacount <= datacount - 1;
												next_rd <= "01";
												next_state <= st_wait;
											END IF;
										END IF;
									END IF;
				--==============
				WHEN st_wait =>		-- After rd = 1 command FSM will wait until data from register are ready.
									-- it is important that this is done before the next change of SCL
									IF rd = "01" THEN
										IF data_valid_i = '1' THEN
											next_rd <= "10";
											next_tmp_data <= reg_data_i;	-- latch in data from register
										END IF;
									ELSIF rd = "10" THEN
										next_rd 		<= "00";
										next_SDA_drv	<= NOT tmp_data(bitcount);
										--next_bitcount 	<= bitcount - 1;
										next_state 		<= st_transm;
									END IF;
				--==============
				WHEN st_transm =>	IF neg_edge_SCL = '1' THEN
										IF bitcount = 0 THEN
											next_bitcount	<= 7;
											next_check		<= '1';			-- if byte complete set check
											next_SDA_drv	<= '0';			
											next_state		<= st_m_ack;
										ELSE
											next_SDA_drv <= NOT tmp_data(bitcount-1);
											next_bitcount <= bitcount - 1;
										END IF;
									END IF;
				--==============
				WHEN st_m_ack =>	IF pos_edge_SCL = '1' THEN					
										next_check <= '0';
										IF SDA_in = '0' THEN					-- check ack from master
											next_state <= st_data_rd;
											next_ack <= '1';
										ELSE
											next_state <= st_idle;
										END IF;
									
									--ELSIF neg_edge_SCL = '1' THEN
									--	next_check <= '0';
									END IF;
				--==============
				WHEN st_data_wr =>	IF pos_edge_SCL = '1' THEN					-- master wants to write data
										IF ack = '0' THEN
											next_tmp_data(bitcount) <= SDA_in;
											next_wr <= '0';
											IF bitcount = 0 THEN
												next_bitcount <= 7;
												next_check    <= '1';			-- if byte complete set check
											ELSE
												next_bitcount <= bitcount - 1;
											END IF;
										END IF;
									
									ELSIF neg_edge_SCL = '1' THEN
										IF check = '1' THEN
											next_check <= '0';
											--set ack
											next_ack <= '1';
											next_SDA_drv <= '1';
											--will stay in same state until end condition accures
											next_wr <= '1';	--DATA READY
										ELSIF ack = '1' THEN				-- reset ACK
											next_ack <= '0';
											next_SDA_drv <= '0';
										END IF;
									END IF;
				--==============
				WHEN st_hdcp_wr =>	IF pos_edge_SCL = '1' THEN					-- master wants to write data
										IF ack = '0' THEN
											next_tmp_data(bitcount) <= SDA_in;
											next_wr <= '0';
											IF bitcount = 0 THEN
												next_bitcount <= 7;
												next_check    <= '1';			-- if byte complete set check
											ELSE
												next_bitcount <= bitcount - 1;
											END IF;
										END IF;
									
									ELSIF neg_edge_SCL = '1' THEN
										IF check = '1' THEN
											next_check <= '0';
											next_ack <= '1';		-- added 02.06.15 scln
											--will stay in same state until end condition accures
											next_wr <= '1';	--DATA READY
										ELSIF ack = '1' THEN				-- reset ACK
											next_ack <= '0';
										END IF;
									END IF;
				--==============
				WHEN OTHERS =>	next_state <= st_idle;

			END CASE;

			IF neg_edge_SCL = '1' AND hdmi_rx_5v_i = '1' THEN
			--IF neg_edge_SCL = '1' THEN
				next_int_shift <= int_shift(18 DOWNTO 0) & '0';		-- shift 1 to left, fill with 0
			END IF;

		END IF;

	END PROCESS logic_proc;

------------------------------FLIP-FLOP----------------------------------------
	ff_proc : PROCESS (clk_100m, reset_n)
	BEGIN
		IF reset_n = '0' THEN
			state			<= st_idle;
			bitcount		<= 7;
			check			<= '0';
			ack				<= '0';
			SDA_drv			<= '0';
			tmp_addr		<= "00000000";
			tmp_data		<= "00000000";
			wr				<= '0';
			rd				<= "00";
			addr_valid		<= '0';
			block_snk		<= '0';

			sda_old			<= "00";
			scl_old			<= "00";

			int_shift		<= (0 => '1', OTHERS => '0');

		ELSIF rising_edge(clk_100m) THEN
			state 		<= next_state;
			bitcount 	<= next_bitcount;
			datacount 	<= next_datacount;
			check		<= next_check;
			ack			<= next_ack;
			SDA_drv		<= next_SDA_drv;
			tmp_addr	<= next_tmp_addr;
			tmp_data	<= next_tmp_data;
			wr			<= next_wr;
			rd			<= next_rd;
			addr_valid	<= next_addr_valid;
			block_snk	<= next_block_snk;
			
			sda_old		<= next_sda_old;
			scl_old		<= next_scl_old;

			int_shift	<= next_int_shift;


		END IF;
	END PROCESS ff_proc;


------------------------------COMBINATORIAL------------------------------------
	-- Edge detection SDA/SCL
	neg_edge_SDA <= NOT(sda_old(0)) AND     sda_old(1);
	pos_edge_SDA <=     sda_old(0)  AND NOT(sda_old(1));
	neg_edge_SCL <= NOT(scl_old(0)) AND     scl_old(1);
	pos_edge_SCL <=     scl_old(0)  AND NOT(scl_old(1));

	-- SDA_out is always on '0' -> the output to the IO is controlled just by SDA_drive
	SDA_out		<= '0';

	-- tmp_addr is routed directly to the output and is just valid if rd or wr is high
	slave_addr_o	<= tmp_addr;
	reg_data_o		<= tmp_data;
	wr_o			<= wr;
	rd_o			<= rd(0);
	SDA_drive		<= SDA_drv;
	addr_valid_o	<= addr_valid;
	block_snk_o		<= block_snk;

	-- output for interrupt
	int_frame_active_o	<= int_shift(19);

------------------------------STIMULUS-----------------------------------------
	
--==========================================================	
	-- PROCEDURE: M_START_CONDITION

	


END ARCHITECTURE;

