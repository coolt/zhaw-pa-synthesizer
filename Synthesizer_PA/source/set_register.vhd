-------------------------------------------
-- set register
-------------------------------------------
-- copyright: herscmic (1. version): code control
-- commented: baek (2. version)
--
-- function:
-- set the registers for the audio codec
--------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

LIBRARY work;
USE work.reg_table_pkg.all;



ENTITY set_register IS
  PORT( clk							:IN     	std_logic;
		reset_n							:IN     	std_logic;
		write_done_i 			  :IN     	std_logic;
		ack_error_i				  :IN     	std_logic;
		write_o     			  :OUT    	std_logic;
		write_data_o      	:OUT		  std_logic_vector (15 downto 0);
		event_ctrl_i			  :IN     	std_logic;
		audio_mode_i				:IN			  std_logic;	-- Umschalter für digital oder analog Loop
		LED_out							:OUT 	  	std_logic
		);
END set_register;										



ARCHITECTURE rtl OF set_register IS

TYPE state IS (idle, start_write, send);

SIGNAL folge_zustand		: 		state;
SIGNAL zustand					:		state;
SIGNAL last_reg					: 		std_logic;
SIGNAL reg_idx, next_reg_idx	:		natural;



BEGIN
--------------------------
-- i2c fsm
-- states: idle, start write, send
-- comands (registers) are send to audio codec
--------------------------
flip_flops_fsm : PROCESS(clk, reset_n)
BEGIN	
		IF 		reset_n = '0' THEN
				zustand<=  idle;
		ELSIF	clk'EVENT AND clk = '1' THEN
				zustand <=folge_zustand;
		END IF;
END PROCESS;	 
  

input_fsm_logic: PROCESS (write_done_i, ack_error_i, event_ctrl_i, zustand, last_reg)
BEGIN
	folge_zustand <= zustand; 
	CASE zustand IS
  
		WHEN idle =>
			IF 	event_ctrl_i ='1' THEN
					folge_zustand <= start_write;
			ELSE	
          folge_zustand <=idle;		
			END IF;
	
		WHEN	start_write =>	
          folge_zustand <= send;
			
		WHEN send =>
			IF 	write_done_i ='1' AND last_reg='0' THEN
					folge_zustand <= start_write;
			ELSIF 	ack_error_i='1' THEN
					folge_zustand <= idle;
			ELSIF 	write_done_i='1' AND last_reg='1' THEN
					folge_zustand<=idle;
			ELSIF 	write_done_i='0' THEN 
					folge_zustand<= send;
			END IF;
      
		WHEN OTHERS =>
		     folge_zustand <= idle;
	END CASE; 
END PROCESS;
	
ausg_fsm: PROCESS (zustand)
BEGIN
		CASE zustand IS
		  WHEN start_write	
              =>	write_o	<='1';
		  WHEN OTHERS			
              =>	write_o	<='0';
		END CASE;
END PROCESS;

--------------------------------------
-- counter for set registers
-- each "write done" (= register set) counts counter up.
-- count max is 9.
-- is max achieved, last_reg recievs a '1', and counter is set to '0'. 
--------------------------------------
ff_cnt: PROCESS (clk, reset_n)
BEGIN 
		IF	reset_n='0' THEN 
				reg_idx <= 0;
		ELSIF	clk'EVENT AND clk='1' THEN
				reg_idx <= next_reg_idx;
		END IF;
END PROCESS;


in_logic_cnt: PROCESS (reg_idx, write_done_i)
BEGIN
	IF write_done_i='1' THEN 
			IF	reg_idx = 9 THEN 
				next_reg_idx <= 0;
				last_reg <= '1';
			ELSE
				next_reg_idx <= reg_idx +1;
				last_reg <= '0';	
			END IF;
	ELSE 
			next_reg_idx <= reg_idx;
			last_reg <= '0';
	END IF;
END PROCESS;


ack: PROCESS(ack_error_i, reset_n, clk)
BEGIN
		IF reset_n = '0' THEN
				LED_out <='0';
		ELSIF clk'EVENT AND clk = '1' THEN
				IF	ack_error_i ='1' THEN
					  LED_out <= '1';	
				END IF;
		END IF;
END PROCESS;		



out_logic: PROCESS(reg_idx, audio_mode_i)
BEGIN
	--Adresse für I2C
	write_data_o(15 downto 9) <= std_logic_vector(to_unsigned(reg_idx,7));
	
  IF 	audio_mode_i ='1' THEN
		  --Einstellungen für Digitalloop
			write_data_o(8 downto 0)<= C_W8731_ADC_DAC_0DB_8K(reg_idx);
		
  -- Einstellungen für Analogloop
	ELSE 	
      write_data_o(8 downto 0)<= C_W8731_ANALOG_BYPASS(reg_idx);
	END IF;
END PROCESS;

END rtl;
