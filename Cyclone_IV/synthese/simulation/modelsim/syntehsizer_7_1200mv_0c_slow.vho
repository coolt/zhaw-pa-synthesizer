-- Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 14.0.0 Build 200 06/17/2014 SJ Full Version"

-- DATE "10/24/2015 10:50:06"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for QuestaSim (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	top_level IS
    PORT (
	CLOCK_50 : IN std_logic;
	KEY : IN std_logic_vector(3 DOWNTO 0);
	SW : IN std_logic_vector(17 DOWNTO 0);
	AUD_ADCDAT : IN std_logic;
	AUD_DACDAT : BUFFER std_logic;
	AUD_BCLK : BUFFER std_logic;
	AUD_XCK : BUFFER std_logic;
	AUD_DACLRCK : BUFFER std_logic;
	AUD_ADCLRCK : BUFFER std_logic;
	I2C_SCLK : BUFFER std_logic;
	I2C_SDAT : BUFFER std_logic
	);
END top_level;

-- Design Ports Information
-- KEY[1]	=>  Location: PIN_M21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[2]	=>  Location: PIN_N21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[14]	=>  Location: PIN_AA23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[15]	=>  Location: PIN_AA22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[16]	=>  Location: PIN_Y24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[17]	=>  Location: PIN_Y23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- AUD_ADCDAT	=>  Location: PIN_D2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- AUD_DACDAT	=>  Location: PIN_D1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- AUD_BCLK	=>  Location: PIN_F2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- AUD_XCK	=>  Location: PIN_E1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- AUD_DACLRCK	=>  Location: PIN_E3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- AUD_ADCLRCK	=>  Location: PIN_C2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- I2C_SCLK	=>  Location: PIN_B7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- SW[0]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[2]	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[3]	=>  Location: PIN_AD27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[4]	=>  Location: PIN_AB27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[5]	=>  Location: PIN_AC26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[6]	=>  Location: PIN_AD26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[7]	=>  Location: PIN_AB26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[8]	=>  Location: PIN_AC25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[9]	=>  Location: PIN_AB25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[10]	=>  Location: PIN_AC24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[11]	=>  Location: PIN_AB24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[12]	=>  Location: PIN_AB23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[13]	=>  Location: PIN_AA24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[3]	=>  Location: PIN_R24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- I2C_SDAT	=>  Location: PIN_A8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- KEY[0]	=>  Location: PIN_M23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK_50	=>  Location: PIN_Y2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF top_level IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL ww_KEY : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_SW : std_logic_vector(17 DOWNTO 0);
SIGNAL ww_AUD_ADCDAT : std_logic;
SIGNAL ww_AUD_DACDAT : std_logic;
SIGNAL ww_AUD_BCLK : std_logic;
SIGNAL ww_AUD_XCK : std_logic;
SIGNAL ww_AUD_DACLRCK : std_logic;
SIGNAL ww_AUD_ADCLRCK : std_logic;
SIGNAL ww_I2C_SCLK : std_logic;
SIGNAL ww_I2C_SDAT : std_logic;
SIGNAL \CLOCK_50~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst_3|divider_inst|count[3]~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \KEY[1]~input_o\ : std_logic;
SIGNAL \KEY[2]~input_o\ : std_logic;
SIGNAL \SW[14]~input_o\ : std_logic;
SIGNAL \SW[15]~input_o\ : std_logic;
SIGNAL \SW[16]~input_o\ : std_logic;
SIGNAL \SW[17]~input_o\ : std_logic;
SIGNAL \AUD_ADCDAT~input_o\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \SW[2]~input_o\ : std_logic;
SIGNAL \SW[3]~input_o\ : std_logic;
SIGNAL \SW[4]~input_o\ : std_logic;
SIGNAL \SW[5]~input_o\ : std_logic;
SIGNAL \SW[6]~input_o\ : std_logic;
SIGNAL \SW[7]~input_o\ : std_logic;
SIGNAL \SW[8]~input_o\ : std_logic;
SIGNAL \SW[9]~input_o\ : std_logic;
SIGNAL \SW[10]~input_o\ : std_logic;
SIGNAL \SW[11]~input_o\ : std_logic;
SIGNAL \SW[12]~input_o\ : std_logic;
SIGNAL \SW[13]~input_o\ : std_logic;
SIGNAL \KEY[3]~input_o\ : std_logic;
SIGNAL \I2C_SDAT~output_o\ : std_logic;
SIGNAL \AUD_DACDAT~output_o\ : std_logic;
SIGNAL \AUD_BCLK~output_o\ : std_logic;
SIGNAL \AUD_XCK~output_o\ : std_logic;
SIGNAL \AUD_DACLRCK~output_o\ : std_logic;
SIGNAL \AUD_ADCLRCK~output_o\ : std_logic;
SIGNAL \I2C_SCLK~output_o\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \CLOCK_50~inputclkctrl_outclk\ : std_logic;
SIGNAL \inst_3|divider_inst|count[0]~3_combout\ : std_logic;
SIGNAL \inst_3|divider_inst|count[1]~2_combout\ : std_logic;
SIGNAL \inst_3|divider_inst|count[2]~1_combout\ : std_logic;
SIGNAL \inst_3|divider_inst|count[3]~0_combout\ : std_logic;
SIGNAL \inst_3|divider_inst|count[3]~feeder_combout\ : std_logic;
SIGNAL \inst_3|divider_inst|count[3]~clkctrl_outclk\ : std_logic;
SIGNAL \inst_2|Selector37~0_combout\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \inst_4|FSM_BCLK_COUNT_INST|s_bclk~0_combout\ : std_logic;
SIGNAL \inst_4|FSM_BCLK_COUNT_INST|s_bclk~q\ : std_logic;
SIGNAL \inst_2|clk_divider[1]~4_combout\ : std_logic;
SIGNAL \inst_2|clk_divider[1]~5\ : std_logic;
SIGNAL \inst_2|clk_divider[2]~6_combout\ : std_logic;
SIGNAL \inst_2|clk_divider[2]~7\ : std_logic;
SIGNAL \inst_2|clk_divider[3]~8_combout\ : std_logic;
SIGNAL \inst_2|clk_mask[0]~feeder_combout\ : std_logic;
SIGNAL \inst_2|clk_divider[3]~9\ : std_logic;
SIGNAL \inst_2|clk_divider[4]~10_combout\ : std_logic;
SIGNAL \inst_2|clk_mask[1]~feeder_combout\ : std_logic;
SIGNAL \inst_2|Equal3~0_combout\ : std_logic;
SIGNAL \inst_2|Equal2~0_combout\ : std_logic;
SIGNAL \inst_2|byte_count[0]~0_combout\ : std_logic;
SIGNAL \inst_2|byte_count[0]~1_combout\ : std_logic;
SIGNAL \inst_2|Add0~0_combout\ : std_logic;
SIGNAL \I2C_SDAT~input_o\ : std_logic;
SIGNAL \inst_2|Selector30~3_combout\ : std_logic;
SIGNAL \inst_2|Selector30~4_combout\ : std_logic;
SIGNAL \inst_2|fsm_state.S_ACK_BYTE~q\ : std_logic;
SIGNAL \inst_2|next_scl~0_combout\ : std_logic;
SIGNAL \inst_2|ack~0_combout\ : std_logic;
SIGNAL \inst_2|ack~q\ : std_logic;
SIGNAL \inst_2|Selector31~4_combout\ : std_logic;
SIGNAL \inst_2|Selector31~2_combout\ : std_logic;
SIGNAL \inst_2|Selector31~0_combout\ : std_logic;
SIGNAL \inst_2|next_ack_error~0_combout\ : std_logic;
SIGNAL \inst_2|ack_error~q\ : std_logic;
SIGNAL \inst_2|next_write_done~0_combout\ : std_logic;
SIGNAL \inst_2|write_done~q\ : std_logic;
SIGNAL \inst_1|Add0~0_combout\ : std_logic;
SIGNAL \inst_1|Add0~1\ : std_logic;
SIGNAL \inst_1|Add0~2_combout\ : std_logic;
SIGNAL \inst_1|next_reg_idx~1_combout\ : std_logic;
SIGNAL \inst_1|Add0~3\ : std_logic;
SIGNAL \inst_1|Add0~4_combout\ : std_logic;
SIGNAL \inst_1|Add0~5\ : std_logic;
SIGNAL \inst_1|Add0~6_combout\ : std_logic;
SIGNAL \inst_1|next_reg_idx~0_combout\ : std_logic;
SIGNAL \inst_1|Add0~7\ : std_logic;
SIGNAL \inst_1|Add0~8_combout\ : std_logic;
SIGNAL \inst_1|Add0~9\ : std_logic;
SIGNAL \inst_1|Add0~10_combout\ : std_logic;
SIGNAL \inst_1|Add0~11\ : std_logic;
SIGNAL \inst_1|Add0~12_combout\ : std_logic;
SIGNAL \inst_1|Add0~13\ : std_logic;
SIGNAL \inst_1|Add0~14_combout\ : std_logic;
SIGNAL \inst_1|Add0~15\ : std_logic;
SIGNAL \inst_1|Add0~16_combout\ : std_logic;
SIGNAL \inst_1|Add0~17\ : std_logic;
SIGNAL \inst_1|Add0~18_combout\ : std_logic;
SIGNAL \inst_1|Add0~19\ : std_logic;
SIGNAL \inst_1|Add0~20_combout\ : std_logic;
SIGNAL \inst_1|Add0~21\ : std_logic;
SIGNAL \inst_1|Add0~22_combout\ : std_logic;
SIGNAL \inst_1|Add0~23\ : std_logic;
SIGNAL \inst_1|Add0~24_combout\ : std_logic;
SIGNAL \inst_1|Add0~25\ : std_logic;
SIGNAL \inst_1|Add0~26_combout\ : std_logic;
SIGNAL \inst_1|Add0~27\ : std_logic;
SIGNAL \inst_1|Add0~28_combout\ : std_logic;
SIGNAL \inst_1|Add0~29\ : std_logic;
SIGNAL \inst_1|Add0~30_combout\ : std_logic;
SIGNAL \inst_1|Add0~31\ : std_logic;
SIGNAL \inst_1|Add0~32_combout\ : std_logic;
SIGNAL \inst_1|Equal0~5_combout\ : std_logic;
SIGNAL \inst_1|Equal0~6_combout\ : std_logic;
SIGNAL \inst_1|Equal0~7_combout\ : std_logic;
SIGNAL \inst_1|Equal0~8_combout\ : std_logic;
SIGNAL \inst_1|Add0~33\ : std_logic;
SIGNAL \inst_1|Add0~34_combout\ : std_logic;
SIGNAL \inst_1|Add0~35\ : std_logic;
SIGNAL \inst_1|Add0~36_combout\ : std_logic;
SIGNAL \inst_1|Add0~37\ : std_logic;
SIGNAL \inst_1|Add0~38_combout\ : std_logic;
SIGNAL \inst_1|Add0~39\ : std_logic;
SIGNAL \inst_1|Add0~40_combout\ : std_logic;
SIGNAL \inst_1|Add0~41\ : std_logic;
SIGNAL \inst_1|Add0~42_combout\ : std_logic;
SIGNAL \inst_1|Add0~43\ : std_logic;
SIGNAL \inst_1|Add0~44_combout\ : std_logic;
SIGNAL \inst_1|Add0~45\ : std_logic;
SIGNAL \inst_1|Add0~46_combout\ : std_logic;
SIGNAL \inst_1|Add0~47\ : std_logic;
SIGNAL \inst_1|Add0~48_combout\ : std_logic;
SIGNAL \inst_1|Add0~49\ : std_logic;
SIGNAL \inst_1|Add0~50_combout\ : std_logic;
SIGNAL \inst_1|Add0~51\ : std_logic;
SIGNAL \inst_1|Add0~52_combout\ : std_logic;
SIGNAL \inst_1|Add0~53\ : std_logic;
SIGNAL \inst_1|Add0~54_combout\ : std_logic;
SIGNAL \inst_1|Add0~55\ : std_logic;
SIGNAL \inst_1|Add0~56_combout\ : std_logic;
SIGNAL \inst_1|Add0~57\ : std_logic;
SIGNAL \inst_1|Add0~58_combout\ : std_logic;
SIGNAL \inst_1|Add0~59\ : std_logic;
SIGNAL \inst_1|Add0~60_combout\ : std_logic;
SIGNAL \inst_1|Equal0~0_combout\ : std_logic;
SIGNAL \inst_1|Equal0~1_combout\ : std_logic;
SIGNAL \inst_1|Equal0~3_combout\ : std_logic;
SIGNAL \inst_1|Equal0~2_combout\ : std_logic;
SIGNAL \inst_1|Equal0~4_combout\ : std_logic;
SIGNAL \inst_1|Equal0~9_combout\ : std_logic;
SIGNAL \inst_1|Selector1~0_combout\ : std_logic;
SIGNAL \inst_1|zustand.send~q\ : std_logic;
SIGNAL \inst_1|folge_zustand.idle~0_combout\ : std_logic;
SIGNAL \inst_1|zustand.idle~q\ : std_logic;
SIGNAL \inst_1|Selector0~0_combout\ : std_logic;
SIGNAL \inst_1|zustand.start_write~q\ : std_logic;
SIGNAL \inst_2|Selector30~1_combout\ : std_logic;
SIGNAL \inst_2|Selector31~1_combout\ : std_logic;
SIGNAL \inst_2|Selector31~3_combout\ : std_logic;
SIGNAL \inst_2|Selector31~5_combout\ : std_logic;
SIGNAL \inst_2|fsm_state.S_WAIT_FOR_STOP~q\ : std_logic;
SIGNAL \inst_2|fsm_state.S_STOP~q\ : std_logic;
SIGNAL \inst_2|Selector25~0_combout\ : std_logic;
SIGNAL \inst_2|fsm_state.S_IDLE~q\ : std_logic;
SIGNAL \inst_2|Selector26~2_combout\ : std_logic;
SIGNAL \inst_2|Selector26~3_combout\ : std_logic;
SIGNAL \inst_2|Selector30~2_combout\ : std_logic;
SIGNAL \inst_2|Selector26~4_combout\ : std_logic;
SIGNAL \inst_2|fsm_state.S_WAIT_FOR_START~q\ : std_logic;
SIGNAL \inst_2|fsm_state.S_START~q\ : std_logic;
SIGNAL \inst_2|bit_count[0]~0_combout\ : std_logic;
SIGNAL \inst_2|Selector36~0_combout\ : std_logic;
SIGNAL \inst_2|Selector35~0_combout\ : std_logic;
SIGNAL \inst_2|Equal0~0_combout\ : std_logic;
SIGNAL \inst_2|Selector28~0_combout\ : std_logic;
SIGNAL \inst_2|fsm_state.S_WAIT_FOR_NEXT_BYTE~q\ : std_logic;
SIGNAL \inst_2|Selector0~2_combout\ : std_logic;
SIGNAL \inst_2|Selector29~0_combout\ : std_logic;
SIGNAL \inst_2|fsm_state.S_SEND_BYTE~q\ : std_logic;
SIGNAL \inst_2|Selector0~6_combout\ : std_logic;
SIGNAL \inst_2|Selector0~8_combout\ : std_logic;
SIGNAL \inst_2|Selector20~3_combout\ : std_logic;
SIGNAL \inst_2|Selector21~0_combout\ : std_logic;
SIGNAL \inst_2|data[3]~feeder_combout\ : std_logic;
SIGNAL \inst_2|Selector24~1_combout\ : std_logic;
SIGNAL \inst_2|Selector23~0_combout\ : std_logic;
SIGNAL \inst_2|Selector23~1_combout\ : std_logic;
SIGNAL \inst_2|Selector24~0_combout\ : std_logic;
SIGNAL \inst_2|Selector24~2_combout\ : std_logic;
SIGNAL \inst_2|Selector23~2_combout\ : std_logic;
SIGNAL \inst_1|Mux5~0_combout\ : std_logic;
SIGNAL \inst_2|Selector20~0_combout\ : std_logic;
SIGNAL \inst_2|Selector23~3_combout\ : std_logic;
SIGNAL \inst_2|Selector23~4_combout\ : std_logic;
SIGNAL \inst_2|data[16]~0_combout\ : std_logic;
SIGNAL \inst_2|data[16]~1_combout\ : std_logic;
SIGNAL \inst_2|Selector20~2_combout\ : std_logic;
SIGNAL \inst_2|Selector20~1_combout\ : std_logic;
SIGNAL \inst_2|Selector20~4_combout\ : std_logic;
SIGNAL \inst_2|Selector19~0_combout\ : std_logic;
SIGNAL \inst_2|Selector18~0_combout\ : std_logic;
SIGNAL \inst_2|Selector17~0_combout\ : std_logic;
SIGNAL \inst_2|Selector16~0_combout\ : std_logic;
SIGNAL \inst_2|Selector15~0_combout\ : std_logic;
SIGNAL \inst_2|Selector14~0_combout\ : std_logic;
SIGNAL \inst_2|Selector13~0_combout\ : std_logic;
SIGNAL \inst_2|Selector12~0_combout\ : std_logic;
SIGNAL \inst_2|Selector11~0_combout\ : std_logic;
SIGNAL \inst_2|Selector10~0_combout\ : std_logic;
SIGNAL \inst_2|Selector9~0_combout\ : std_logic;
SIGNAL \inst_2|Selector8~0_combout\ : std_logic;
SIGNAL \inst_2|Selector7~0_combout\ : std_logic;
SIGNAL \inst_2|Selector6~0_combout\ : std_logic;
SIGNAL \inst_2|Selector5~0_combout\ : std_logic;
SIGNAL \inst_2|Selector4~0_combout\ : std_logic;
SIGNAL \inst_2|Selector3~0_combout\ : std_logic;
SIGNAL \inst_2|Selector2~0_combout\ : std_logic;
SIGNAL \inst_2|Selector1~0_combout\ : std_logic;
SIGNAL \inst_2|Selector0~4_combout\ : std_logic;
SIGNAL \inst_2|Selector0~3_combout\ : std_logic;
SIGNAL \inst_2|Selector0~5_combout\ : std_logic;
SIGNAL \inst_2|Selector0~7_combout\ : std_logic;
SIGNAL \inst_2|sda~q\ : std_logic;
SIGNAL \inst_4|FSM_BCLK_COUNT_INST|reg_idx[1]~feeder_combout\ : std_logic;
SIGNAL \inst_2|next_scl~1_combout\ : std_logic;
SIGNAL \inst_2|next_scl~2_combout\ : std_logic;
SIGNAL \inst_2|scl~q\ : std_logic;
SIGNAL \inst_2|data\ : std_logic_vector(23 DOWNTO 0);
SIGNAL \inst_2|clk_mask\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst_2|clk_edge_mask\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \inst_2|clk_divider\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst_2|byte_count\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst_2|bit_count\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \inst_3|divider_inst|count\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst_4|FSM_BCLK_COUNT_INST|reg_idx\ : std_logic_vector(30 DOWNTO 0);
SIGNAL \inst_1|reg_idx\ : std_logic_vector(30 DOWNTO 0);
SIGNAL \inst_2|ALT_INV_sda~q\ : std_logic;
SIGNAL \inst_2|ALT_INV_fsm_state.S_SEND_BYTE~q\ : std_logic;
SIGNAL \inst_2|ALT_INV_fsm_state.S_STOP~q\ : std_logic;
SIGNAL \inst_2|ALT_INV_scl~q\ : std_logic;

BEGIN

ww_CLOCK_50 <= CLOCK_50;
ww_KEY <= KEY;
ww_SW <= SW;
ww_AUD_ADCDAT <= AUD_ADCDAT;
AUD_DACDAT <= ww_AUD_DACDAT;
AUD_BCLK <= ww_AUD_BCLK;
AUD_XCK <= ww_AUD_XCK;
AUD_DACLRCK <= ww_AUD_DACLRCK;
AUD_ADCLRCK <= ww_AUD_ADCLRCK;
I2C_SCLK <= ww_I2C_SCLK;
I2C_SDAT <= ww_I2C_SDAT;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\CLOCK_50~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLOCK_50~input_o\);

\inst_3|divider_inst|count[3]~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \inst_3|divider_inst|count\(3));
\inst_2|ALT_INV_sda~q\ <= NOT \inst_2|sda~q\;
\inst_2|ALT_INV_fsm_state.S_SEND_BYTE~q\ <= NOT \inst_2|fsm_state.S_SEND_BYTE~q\;
\inst_2|ALT_INV_fsm_state.S_STOP~q\ <= NOT \inst_2|fsm_state.S_STOP~q\;
\inst_2|ALT_INV_scl~q\ <= NOT \inst_2|scl~q\;

-- Location: IOOBUF_X18_Y73_N23
\I2C_SDAT~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => \inst_2|ALT_INV_sda~q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \I2C_SDAT~output_o\);

-- Location: IOOBUF_X0_Y68_N9
\AUD_DACDAT~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \AUD_DACDAT~output_o\);

-- Location: IOOBUF_X0_Y60_N16
\AUD_BCLK~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_4|FSM_BCLK_COUNT_INST|s_bclk~q\,
	devoe => ww_devoe,
	o => \AUD_BCLK~output_o\);

-- Location: IOOBUF_X0_Y61_N23
\AUD_XCK~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_3|divider_inst|count\(3),
	devoe => ww_devoe,
	o => \AUD_XCK~output_o\);

-- Location: IOOBUF_X0_Y66_N16
\AUD_DACLRCK~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_4|FSM_BCLK_COUNT_INST|reg_idx\(1),
	devoe => ww_devoe,
	o => \AUD_DACLRCK~output_o\);

-- Location: IOOBUF_X0_Y69_N9
\AUD_ADCLRCK~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_4|FSM_BCLK_COUNT_INST|reg_idx\(1),
	devoe => ww_devoe,
	o => \AUD_ADCLRCK~output_o\);

-- Location: IOOBUF_X29_Y73_N9
\I2C_SCLK~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_2|ALT_INV_scl~q\,
	devoe => ww_devoe,
	o => \I2C_SCLK~output_o\);

-- Location: IOIBUF_X0_Y36_N15
\CLOCK_50~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

-- Location: CLKCTRL_G4
\CLOCK_50~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLOCK_50~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLOCK_50~inputclkctrl_outclk\);

-- Location: LCCOMB_X1_Y36_N24
\inst_3|divider_inst|count[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_3|divider_inst|count[0]~3_combout\ = !\inst_3|divider_inst|count\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_3|divider_inst|count\(0),
	combout => \inst_3|divider_inst|count[0]~3_combout\);

-- Location: FF_X1_Y36_N25
\inst_3|divider_inst|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst_3|divider_inst|count[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_3|divider_inst|count\(0));

-- Location: LCCOMB_X1_Y36_N26
\inst_3|divider_inst|count[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_3|divider_inst|count[1]~2_combout\ = \inst_3|divider_inst|count\(1) $ (\inst_3|divider_inst|count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_3|divider_inst|count\(1),
	datad => \inst_3|divider_inst|count\(0),
	combout => \inst_3|divider_inst|count[1]~2_combout\);

-- Location: FF_X1_Y36_N27
\inst_3|divider_inst|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst_3|divider_inst|count[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_3|divider_inst|count\(1));

-- Location: LCCOMB_X1_Y36_N22
\inst_3|divider_inst|count[2]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_3|divider_inst|count[2]~1_combout\ = \inst_3|divider_inst|count\(2) $ (((\inst_3|divider_inst|count\(1) & \inst_3|divider_inst|count\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_3|divider_inst|count\(1),
	datac => \inst_3|divider_inst|count\(2),
	datad => \inst_3|divider_inst|count\(0),
	combout => \inst_3|divider_inst|count[2]~1_combout\);

-- Location: FF_X1_Y36_N23
\inst_3|divider_inst|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst_3|divider_inst|count[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_3|divider_inst|count\(2));

-- Location: LCCOMB_X1_Y36_N20
\inst_3|divider_inst|count[3]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_3|divider_inst|count[3]~0_combout\ = \inst_3|divider_inst|count\(3) $ (((\inst_3|divider_inst|count\(2) & (\inst_3|divider_inst|count\(1) & \inst_3|divider_inst|count\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_3|divider_inst|count\(2),
	datab => \inst_3|divider_inst|count\(3),
	datac => \inst_3|divider_inst|count\(1),
	datad => \inst_3|divider_inst|count\(0),
	combout => \inst_3|divider_inst|count[3]~0_combout\);

-- Location: LCCOMB_X1_Y36_N30
\inst_3|divider_inst|count[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_3|divider_inst|count[3]~feeder_combout\ = \inst_3|divider_inst|count[3]~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_3|divider_inst|count[3]~0_combout\,
	combout => \inst_3|divider_inst|count[3]~feeder_combout\);

-- Location: FF_X1_Y36_N31
\inst_3|divider_inst|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst_3|divider_inst|count[3]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_3|divider_inst|count\(3));

-- Location: CLKCTRL_G3
\inst_3|divider_inst|count[3]~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \inst_3|divider_inst|count[3]~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \inst_3|divider_inst|count[3]~clkctrl_outclk\);

-- Location: LCCOMB_X96_Y41_N24
\inst_2|Selector37~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector37~0_combout\ = (!\inst_2|bit_count\(0) & \inst_2|fsm_state.S_SEND_BYTE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_2|bit_count\(0),
	datad => \inst_2|fsm_state.S_SEND_BYTE~q\,
	combout => \inst_2|Selector37~0_combout\);

-- Location: IOIBUF_X115_Y40_N8
\KEY[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(0),
	o => \KEY[0]~input_o\);

-- Location: LCCOMB_X95_Y41_N12
\inst_4|FSM_BCLK_COUNT_INST|s_bclk~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_4|FSM_BCLK_COUNT_INST|s_bclk~0_combout\ = !\inst_4|FSM_BCLK_COUNT_INST|s_bclk~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_4|FSM_BCLK_COUNT_INST|s_bclk~q\,
	combout => \inst_4|FSM_BCLK_COUNT_INST|s_bclk~0_combout\);

-- Location: FF_X95_Y41_N13
\inst_4|FSM_BCLK_COUNT_INST|s_bclk\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_4|FSM_BCLK_COUNT_INST|s_bclk~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_4|FSM_BCLK_COUNT_INST|s_bclk~q\);

-- Location: LCCOMB_X95_Y41_N18
\inst_2|clk_divider[1]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|clk_divider[1]~4_combout\ = (\inst_4|FSM_BCLK_COUNT_INST|s_bclk~q\ & (\inst_2|clk_divider\(1) $ (VCC))) # (!\inst_4|FSM_BCLK_COUNT_INST|s_bclk~q\ & (\inst_2|clk_divider\(1) & VCC))
-- \inst_2|clk_divider[1]~5\ = CARRY((\inst_4|FSM_BCLK_COUNT_INST|s_bclk~q\ & \inst_2|clk_divider\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_4|FSM_BCLK_COUNT_INST|s_bclk~q\,
	datab => \inst_2|clk_divider\(1),
	datad => VCC,
	combout => \inst_2|clk_divider[1]~4_combout\,
	cout => \inst_2|clk_divider[1]~5\);

-- Location: FF_X95_Y41_N19
\inst_2|clk_divider[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|clk_divider[1]~4_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|clk_divider\(1));

-- Location: LCCOMB_X95_Y41_N20
\inst_2|clk_divider[2]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|clk_divider[2]~6_combout\ = (\inst_2|clk_divider\(2) & (!\inst_2|clk_divider[1]~5\)) # (!\inst_2|clk_divider\(2) & ((\inst_2|clk_divider[1]~5\) # (GND)))
-- \inst_2|clk_divider[2]~7\ = CARRY((!\inst_2|clk_divider[1]~5\) # (!\inst_2|clk_divider\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_2|clk_divider\(2),
	datad => VCC,
	cin => \inst_2|clk_divider[1]~5\,
	combout => \inst_2|clk_divider[2]~6_combout\,
	cout => \inst_2|clk_divider[2]~7\);

-- Location: FF_X95_Y41_N21
\inst_2|clk_divider[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|clk_divider[2]~6_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|clk_divider\(2));

-- Location: LCCOMB_X95_Y41_N22
\inst_2|clk_divider[3]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|clk_divider[3]~8_combout\ = (\inst_2|clk_divider\(3) & (\inst_2|clk_divider[2]~7\ $ (GND))) # (!\inst_2|clk_divider\(3) & (!\inst_2|clk_divider[2]~7\ & VCC))
-- \inst_2|clk_divider[3]~9\ = CARRY((\inst_2|clk_divider\(3) & !\inst_2|clk_divider[2]~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|clk_divider\(3),
	datad => VCC,
	cin => \inst_2|clk_divider[2]~7\,
	combout => \inst_2|clk_divider[3]~8_combout\,
	cout => \inst_2|clk_divider[3]~9\);

-- Location: FF_X95_Y41_N23
\inst_2|clk_divider[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|clk_divider[3]~8_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|clk_divider\(3));

-- Location: LCCOMB_X95_Y41_N0
\inst_2|clk_mask[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|clk_mask[0]~feeder_combout\ = \inst_2|clk_divider\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_2|clk_divider\(3),
	combout => \inst_2|clk_mask[0]~feeder_combout\);

-- Location: FF_X95_Y41_N1
\inst_2|clk_mask[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|clk_mask[0]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|clk_mask\(0));

-- Location: FF_X95_Y41_N5
\inst_2|clk_edge_mask[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	asdata => \inst_2|clk_mask\(0),
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|clk_edge_mask\(0));

-- Location: LCCOMB_X95_Y41_N24
\inst_2|clk_divider[4]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|clk_divider[4]~10_combout\ = \inst_2|clk_divider[3]~9\ $ (\inst_2|clk_divider\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \inst_2|clk_divider\(4),
	cin => \inst_2|clk_divider[3]~9\,
	combout => \inst_2|clk_divider[4]~10_combout\);

-- Location: FF_X95_Y41_N25
\inst_2|clk_divider[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|clk_divider[4]~10_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|clk_divider\(4));

-- Location: LCCOMB_X95_Y41_N30
\inst_2|clk_mask[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|clk_mask[1]~feeder_combout\ = \inst_2|clk_divider\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_2|clk_divider\(4),
	combout => \inst_2|clk_mask[1]~feeder_combout\);

-- Location: FF_X95_Y41_N31
\inst_2|clk_mask[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|clk_mask[1]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|clk_mask\(1));

-- Location: FF_X95_Y41_N9
\inst_2|clk_edge_mask[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	asdata => \inst_2|clk_mask\(1),
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|clk_edge_mask\(1));

-- Location: LCCOMB_X95_Y41_N10
\inst_2|Equal3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Equal3~0_combout\ = (\inst_2|clk_divider\(3) & ((\inst_2|clk_mask\(1) $ (\inst_2|clk_divider\(4))) # (!\inst_2|clk_mask\(0)))) # (!\inst_2|clk_divider\(3) & ((\inst_2|clk_mask\(0)) # (\inst_2|clk_mask\(1) $ (\inst_2|clk_divider\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110111111110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|clk_divider\(3),
	datab => \inst_2|clk_mask\(0),
	datac => \inst_2|clk_mask\(1),
	datad => \inst_2|clk_divider\(4),
	combout => \inst_2|Equal3~0_combout\);

-- Location: FF_X95_Y41_N11
\inst_2|clk_edge_mask[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|Equal3~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|clk_edge_mask\(2));

-- Location: LCCOMB_X95_Y41_N6
\inst_2|Equal2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Equal2~0_combout\ = (\inst_2|clk_edge_mask\(0) & (!\inst_2|clk_edge_mask\(1) & \inst_2|clk_edge_mask\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst_2|clk_edge_mask\(0),
	datac => \inst_2|clk_edge_mask\(1),
	datad => \inst_2|clk_edge_mask\(2),
	combout => \inst_2|Equal2~0_combout\);

-- Location: LCCOMB_X94_Y41_N18
\inst_2|byte_count[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|byte_count[0]~0_combout\ = (\inst_2|Equal2~0_combout\ & ((\inst_2|fsm_state.S_START~q\) # ((\inst_2|Equal0~0_combout\ & \inst_2|fsm_state.S_SEND_BYTE~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|fsm_state.S_START~q\,
	datab => \inst_2|Equal0~0_combout\,
	datac => \inst_2|fsm_state.S_SEND_BYTE~q\,
	datad => \inst_2|Equal2~0_combout\,
	combout => \inst_2|byte_count[0]~0_combout\);

-- Location: LCCOMB_X94_Y41_N16
\inst_2|byte_count[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|byte_count[0]~1_combout\ = (\inst_2|byte_count\(0) & ((!\inst_2|byte_count[0]~0_combout\))) # (!\inst_2|byte_count\(0) & (\inst_2|fsm_state.S_SEND_BYTE~q\ & \inst_2|byte_count[0]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst_2|fsm_state.S_SEND_BYTE~q\,
	datac => \inst_2|byte_count\(0),
	datad => \inst_2|byte_count[0]~0_combout\,
	combout => \inst_2|byte_count[0]~1_combout\);

-- Location: FF_X94_Y41_N17
\inst_2|byte_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|byte_count[0]~1_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|byte_count\(0));

-- Location: LCCOMB_X94_Y41_N12
\inst_2|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Add0~0_combout\ = \inst_2|byte_count\(1) $ (\inst_2|byte_count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_2|byte_count\(1),
	datad => \inst_2|byte_count\(0),
	combout => \inst_2|Add0~0_combout\);

-- Location: FF_X94_Y41_N13
\inst_2|byte_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|Add0~0_combout\,
	clrn => \KEY[0]~input_o\,
	sclr => \inst_2|ALT_INV_fsm_state.S_SEND_BYTE~q\,
	ena => \inst_2|byte_count[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|byte_count\(1));

-- Location: IOIBUF_X18_Y73_N22
\I2C_SDAT~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_I2C_SDAT,
	o => \I2C_SDAT~input_o\);

-- Location: LCCOMB_X95_Y41_N2
\inst_2|Selector30~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector30~3_combout\ = (\inst_2|fsm_state.S_ACK_BYTE~q\ & (((\inst_2|clk_edge_mask\(1)) # (\inst_2|clk_edge_mask\(0))) # (!\inst_2|clk_edge_mask\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|clk_edge_mask\(2),
	datab => \inst_2|clk_edge_mask\(1),
	datac => \inst_2|clk_edge_mask\(0),
	datad => \inst_2|fsm_state.S_ACK_BYTE~q\,
	combout => \inst_2|Selector30~3_combout\);

-- Location: LCCOMB_X96_Y41_N28
\inst_2|Selector30~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector30~4_combout\ = (\inst_2|Selector30~3_combout\) # ((\inst_2|Equal0~0_combout\ & (\inst_2|fsm_state.S_SEND_BYTE~q\ & \inst_2|Equal2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|Equal0~0_combout\,
	datab => \inst_2|fsm_state.S_SEND_BYTE~q\,
	datac => \inst_2|Equal2~0_combout\,
	datad => \inst_2|Selector30~3_combout\,
	combout => \inst_2|Selector30~4_combout\);

-- Location: FF_X96_Y41_N29
\inst_2|fsm_state.S_ACK_BYTE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|Selector30~4_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|fsm_state.S_ACK_BYTE~q\);

-- Location: LCCOMB_X95_Y41_N8
\inst_2|next_scl~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|next_scl~0_combout\ = (!\inst_2|clk_edge_mask\(0) & (\inst_2|clk_edge_mask\(1) & \inst_2|clk_edge_mask\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst_2|clk_edge_mask\(0),
	datac => \inst_2|clk_edge_mask\(1),
	datad => \inst_2|clk_edge_mask\(2),
	combout => \inst_2|next_scl~0_combout\);

-- Location: LCCOMB_X95_Y41_N28
\inst_2|ack~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|ack~0_combout\ = (\inst_2|fsm_state.S_ACK_BYTE~q\ & ((\inst_2|next_scl~0_combout\ & (\I2C_SDAT~input_o\)) # (!\inst_2|next_scl~0_combout\ & ((\inst_2|ack~q\))))) # (!\inst_2|fsm_state.S_ACK_BYTE~q\ & (((\inst_2|ack~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_SDAT~input_o\,
	datab => \inst_2|fsm_state.S_ACK_BYTE~q\,
	datac => \inst_2|ack~q\,
	datad => \inst_2|next_scl~0_combout\,
	combout => \inst_2|ack~0_combout\);

-- Location: FF_X95_Y41_N29
\inst_2|ack\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|ack~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|ack~q\);

-- Location: LCCOMB_X95_Y41_N16
\inst_2|Selector31~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector31~4_combout\ = (!\inst_2|ack~q\ & (!\I2C_SDAT~input_o\ & ((!\inst_2|byte_count\(0)) # (!\inst_2|byte_count\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|byte_count\(1),
	datab => \inst_2|ack~q\,
	datac => \inst_2|byte_count\(0),
	datad => \I2C_SDAT~input_o\,
	combout => \inst_2|Selector31~4_combout\);

-- Location: LCCOMB_X95_Y41_N4
\inst_2|Selector31~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector31~2_combout\ = (\inst_2|clk_edge_mask\(2) & (!\inst_2|clk_edge_mask\(1) & (!\inst_2|clk_edge_mask\(0) & \inst_2|fsm_state.S_ACK_BYTE~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|clk_edge_mask\(2),
	datab => \inst_2|clk_edge_mask\(1),
	datac => \inst_2|clk_edge_mask\(0),
	datad => \inst_2|fsm_state.S_ACK_BYTE~q\,
	combout => \inst_2|Selector31~2_combout\);

-- Location: LCCOMB_X96_Y41_N8
\inst_2|Selector31~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector31~0_combout\ = (((!\inst_2|Equal0~0_combout\ & \inst_2|fsm_state.S_SEND_BYTE~q\)) # (!\inst_2|Equal2~0_combout\)) # (!\inst_2|fsm_state.S_IDLE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|Equal0~0_combout\,
	datab => \inst_2|fsm_state.S_IDLE~q\,
	datac => \inst_2|Equal2~0_combout\,
	datad => \inst_2|fsm_state.S_SEND_BYTE~q\,
	combout => \inst_2|Selector31~0_combout\);

-- Location: LCCOMB_X95_Y41_N14
\inst_2|next_ack_error~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|next_ack_error~0_combout\ = (\inst_2|Selector31~2_combout\ & ((\I2C_SDAT~input_o\) # (\inst_2|ack~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_SDAT~input_o\,
	datab => \inst_2|ack~q\,
	datad => \inst_2|Selector31~2_combout\,
	combout => \inst_2|next_ack_error~0_combout\);

-- Location: FF_X95_Y41_N15
\inst_2|ack_error\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|next_ack_error~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|ack_error~q\);

-- Location: LCCOMB_X100_Y41_N4
\inst_2|next_write_done~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|next_write_done~0_combout\ = (!\inst_2|clk_edge_mask\(1) & (\inst_2|clk_edge_mask\(0) & (\inst_2|clk_edge_mask\(2) & !\inst_2|ack_error~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|clk_edge_mask\(1),
	datab => \inst_2|clk_edge_mask\(0),
	datac => \inst_2|clk_edge_mask\(2),
	datad => \inst_2|ack_error~q\,
	combout => \inst_2|next_write_done~0_combout\);

-- Location: FF_X100_Y41_N5
\inst_2|write_done\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|next_write_done~0_combout\,
	clrn => \KEY[0]~input_o\,
	sclr => \inst_2|ALT_INV_fsm_state.S_STOP~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|write_done~q\);

-- Location: LCCOMB_X101_Y41_N2
\inst_1|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Add0~0_combout\ = \inst_1|reg_idx\(0) $ (VCC)
-- \inst_1|Add0~1\ = CARRY(\inst_1|reg_idx\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst_1|reg_idx\(0),
	datad => VCC,
	combout => \inst_1|Add0~0_combout\,
	cout => \inst_1|Add0~1\);

-- Location: FF_X101_Y41_N3
\inst_1|reg_idx[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_1|Add0~0_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_1|reg_idx\(0));

-- Location: LCCOMB_X101_Y41_N4
\inst_1|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Add0~2_combout\ = (\inst_1|reg_idx\(1) & (!\inst_1|Add0~1\)) # (!\inst_1|reg_idx\(1) & ((\inst_1|Add0~1\) # (GND)))
-- \inst_1|Add0~3\ = CARRY((!\inst_1|Add0~1\) # (!\inst_1|reg_idx\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_1|reg_idx\(1),
	datad => VCC,
	cin => \inst_1|Add0~1\,
	combout => \inst_1|Add0~2_combout\,
	cout => \inst_1|Add0~3\);

-- Location: LCCOMB_X100_Y41_N6
\inst_1|next_reg_idx~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|next_reg_idx~1_combout\ = (\inst_1|Add0~2_combout\ & !\inst_1|Equal0~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_1|Add0~2_combout\,
	datac => \inst_1|Equal0~9_combout\,
	combout => \inst_1|next_reg_idx~1_combout\);

-- Location: FF_X101_Y41_N5
\inst_1|reg_idx[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	asdata => \inst_1|next_reg_idx~1_combout\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \inst_2|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_1|reg_idx\(1));

-- Location: LCCOMB_X101_Y41_N6
\inst_1|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Add0~4_combout\ = (\inst_1|reg_idx\(2) & (\inst_1|Add0~3\ $ (GND))) # (!\inst_1|reg_idx\(2) & (!\inst_1|Add0~3\ & VCC))
-- \inst_1|Add0~5\ = CARRY((\inst_1|reg_idx\(2) & !\inst_1|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_1|reg_idx\(2),
	datad => VCC,
	cin => \inst_1|Add0~3\,
	combout => \inst_1|Add0~4_combout\,
	cout => \inst_1|Add0~5\);

-- Location: FF_X101_Y41_N7
\inst_1|reg_idx[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_1|Add0~4_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_1|reg_idx\(2));

-- Location: LCCOMB_X101_Y41_N8
\inst_1|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Add0~6_combout\ = (\inst_1|reg_idx\(3) & (!\inst_1|Add0~5\)) # (!\inst_1|reg_idx\(3) & ((\inst_1|Add0~5\) # (GND)))
-- \inst_1|Add0~7\ = CARRY((!\inst_1|Add0~5\) # (!\inst_1|reg_idx\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_1|reg_idx\(3),
	datad => VCC,
	cin => \inst_1|Add0~5\,
	combout => \inst_1|Add0~6_combout\,
	cout => \inst_1|Add0~7\);

-- Location: LCCOMB_X101_Y41_N0
\inst_1|next_reg_idx~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|next_reg_idx~0_combout\ = (\inst_1|Add0~6_combout\ & !\inst_1|Equal0~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_1|Add0~6_combout\,
	datad => \inst_1|Equal0~9_combout\,
	combout => \inst_1|next_reg_idx~0_combout\);

-- Location: FF_X101_Y41_N1
\inst_1|reg_idx[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_1|next_reg_idx~0_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_1|reg_idx\(3));

-- Location: LCCOMB_X101_Y41_N10
\inst_1|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Add0~8_combout\ = (\inst_1|reg_idx\(4) & (\inst_1|Add0~7\ $ (GND))) # (!\inst_1|reg_idx\(4) & (!\inst_1|Add0~7\ & VCC))
-- \inst_1|Add0~9\ = CARRY((\inst_1|reg_idx\(4) & !\inst_1|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_1|reg_idx\(4),
	datad => VCC,
	cin => \inst_1|Add0~7\,
	combout => \inst_1|Add0~8_combout\,
	cout => \inst_1|Add0~9\);

-- Location: FF_X101_Y41_N11
\inst_1|reg_idx[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_1|Add0~8_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_1|reg_idx\(4));

-- Location: LCCOMB_X101_Y41_N12
\inst_1|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Add0~10_combout\ = (\inst_1|reg_idx\(5) & (!\inst_1|Add0~9\)) # (!\inst_1|reg_idx\(5) & ((\inst_1|Add0~9\) # (GND)))
-- \inst_1|Add0~11\ = CARRY((!\inst_1|Add0~9\) # (!\inst_1|reg_idx\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_1|reg_idx\(5),
	datad => VCC,
	cin => \inst_1|Add0~9\,
	combout => \inst_1|Add0~10_combout\,
	cout => \inst_1|Add0~11\);

-- Location: FF_X101_Y41_N13
\inst_1|reg_idx[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_1|Add0~10_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_1|reg_idx\(5));

-- Location: LCCOMB_X101_Y41_N14
\inst_1|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Add0~12_combout\ = (\inst_1|reg_idx\(6) & (\inst_1|Add0~11\ $ (GND))) # (!\inst_1|reg_idx\(6) & (!\inst_1|Add0~11\ & VCC))
-- \inst_1|Add0~13\ = CARRY((\inst_1|reg_idx\(6) & !\inst_1|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_1|reg_idx\(6),
	datad => VCC,
	cin => \inst_1|Add0~11\,
	combout => \inst_1|Add0~12_combout\,
	cout => \inst_1|Add0~13\);

-- Location: FF_X101_Y41_N15
\inst_1|reg_idx[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_1|Add0~12_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_1|reg_idx\(6));

-- Location: LCCOMB_X101_Y41_N16
\inst_1|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Add0~14_combout\ = (\inst_1|reg_idx\(7) & (!\inst_1|Add0~13\)) # (!\inst_1|reg_idx\(7) & ((\inst_1|Add0~13\) # (GND)))
-- \inst_1|Add0~15\ = CARRY((!\inst_1|Add0~13\) # (!\inst_1|reg_idx\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_1|reg_idx\(7),
	datad => VCC,
	cin => \inst_1|Add0~13\,
	combout => \inst_1|Add0~14_combout\,
	cout => \inst_1|Add0~15\);

-- Location: FF_X101_Y41_N17
\inst_1|reg_idx[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_1|Add0~14_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_1|reg_idx\(7));

-- Location: LCCOMB_X101_Y41_N18
\inst_1|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Add0~16_combout\ = (\inst_1|reg_idx\(8) & (\inst_1|Add0~15\ $ (GND))) # (!\inst_1|reg_idx\(8) & (!\inst_1|Add0~15\ & VCC))
-- \inst_1|Add0~17\ = CARRY((\inst_1|reg_idx\(8) & !\inst_1|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_1|reg_idx\(8),
	datad => VCC,
	cin => \inst_1|Add0~15\,
	combout => \inst_1|Add0~16_combout\,
	cout => \inst_1|Add0~17\);

-- Location: FF_X101_Y41_N19
\inst_1|reg_idx[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_1|Add0~16_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_1|reg_idx\(8));

-- Location: LCCOMB_X101_Y41_N20
\inst_1|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Add0~18_combout\ = (\inst_1|reg_idx\(9) & (!\inst_1|Add0~17\)) # (!\inst_1|reg_idx\(9) & ((\inst_1|Add0~17\) # (GND)))
-- \inst_1|Add0~19\ = CARRY((!\inst_1|Add0~17\) # (!\inst_1|reg_idx\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_1|reg_idx\(9),
	datad => VCC,
	cin => \inst_1|Add0~17\,
	combout => \inst_1|Add0~18_combout\,
	cout => \inst_1|Add0~19\);

-- Location: FF_X101_Y41_N21
\inst_1|reg_idx[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_1|Add0~18_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_1|reg_idx\(9));

-- Location: LCCOMB_X101_Y41_N22
\inst_1|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Add0~20_combout\ = (\inst_1|reg_idx\(10) & (\inst_1|Add0~19\ $ (GND))) # (!\inst_1|reg_idx\(10) & (!\inst_1|Add0~19\ & VCC))
-- \inst_1|Add0~21\ = CARRY((\inst_1|reg_idx\(10) & !\inst_1|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_1|reg_idx\(10),
	datad => VCC,
	cin => \inst_1|Add0~19\,
	combout => \inst_1|Add0~20_combout\,
	cout => \inst_1|Add0~21\);

-- Location: FF_X101_Y41_N23
\inst_1|reg_idx[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_1|Add0~20_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_1|reg_idx\(10));

-- Location: LCCOMB_X101_Y41_N24
\inst_1|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Add0~22_combout\ = (\inst_1|reg_idx\(11) & (!\inst_1|Add0~21\)) # (!\inst_1|reg_idx\(11) & ((\inst_1|Add0~21\) # (GND)))
-- \inst_1|Add0~23\ = CARRY((!\inst_1|Add0~21\) # (!\inst_1|reg_idx\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_1|reg_idx\(11),
	datad => VCC,
	cin => \inst_1|Add0~21\,
	combout => \inst_1|Add0~22_combout\,
	cout => \inst_1|Add0~23\);

-- Location: FF_X101_Y41_N25
\inst_1|reg_idx[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_1|Add0~22_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_1|reg_idx\(11));

-- Location: LCCOMB_X101_Y41_N26
\inst_1|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Add0~24_combout\ = (\inst_1|reg_idx\(12) & (\inst_1|Add0~23\ $ (GND))) # (!\inst_1|reg_idx\(12) & (!\inst_1|Add0~23\ & VCC))
-- \inst_1|Add0~25\ = CARRY((\inst_1|reg_idx\(12) & !\inst_1|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_1|reg_idx\(12),
	datad => VCC,
	cin => \inst_1|Add0~23\,
	combout => \inst_1|Add0~24_combout\,
	cout => \inst_1|Add0~25\);

-- Location: FF_X101_Y41_N27
\inst_1|reg_idx[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_1|Add0~24_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_1|reg_idx\(12));

-- Location: LCCOMB_X101_Y41_N28
\inst_1|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Add0~26_combout\ = (\inst_1|reg_idx\(13) & (!\inst_1|Add0~25\)) # (!\inst_1|reg_idx\(13) & ((\inst_1|Add0~25\) # (GND)))
-- \inst_1|Add0~27\ = CARRY((!\inst_1|Add0~25\) # (!\inst_1|reg_idx\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_1|reg_idx\(13),
	datad => VCC,
	cin => \inst_1|Add0~25\,
	combout => \inst_1|Add0~26_combout\,
	cout => \inst_1|Add0~27\);

-- Location: FF_X101_Y41_N29
\inst_1|reg_idx[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_1|Add0~26_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_1|reg_idx\(13));

-- Location: LCCOMB_X101_Y41_N30
\inst_1|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Add0~28_combout\ = (\inst_1|reg_idx\(14) & (\inst_1|Add0~27\ $ (GND))) # (!\inst_1|reg_idx\(14) & (!\inst_1|Add0~27\ & VCC))
-- \inst_1|Add0~29\ = CARRY((\inst_1|reg_idx\(14) & !\inst_1|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_1|reg_idx\(14),
	datad => VCC,
	cin => \inst_1|Add0~27\,
	combout => \inst_1|Add0~28_combout\,
	cout => \inst_1|Add0~29\);

-- Location: FF_X101_Y41_N31
\inst_1|reg_idx[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_1|Add0~28_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_1|reg_idx\(14));

-- Location: LCCOMB_X101_Y40_N0
\inst_1|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Add0~30_combout\ = (\inst_1|reg_idx\(15) & (!\inst_1|Add0~29\)) # (!\inst_1|reg_idx\(15) & ((\inst_1|Add0~29\) # (GND)))
-- \inst_1|Add0~31\ = CARRY((!\inst_1|Add0~29\) # (!\inst_1|reg_idx\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_1|reg_idx\(15),
	datad => VCC,
	cin => \inst_1|Add0~29\,
	combout => \inst_1|Add0~30_combout\,
	cout => \inst_1|Add0~31\);

-- Location: FF_X101_Y40_N1
\inst_1|reg_idx[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_1|Add0~30_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_1|reg_idx\(15));

-- Location: LCCOMB_X101_Y40_N2
\inst_1|Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Add0~32_combout\ = (\inst_1|reg_idx\(16) & (\inst_1|Add0~31\ $ (GND))) # (!\inst_1|reg_idx\(16) & (!\inst_1|Add0~31\ & VCC))
-- \inst_1|Add0~33\ = CARRY((\inst_1|reg_idx\(16) & !\inst_1|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_1|reg_idx\(16),
	datad => VCC,
	cin => \inst_1|Add0~31\,
	combout => \inst_1|Add0~32_combout\,
	cout => \inst_1|Add0~33\);

-- Location: FF_X101_Y40_N3
\inst_1|reg_idx[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_1|Add0~32_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_1|reg_idx\(16));

-- Location: LCCOMB_X100_Y41_N10
\inst_1|Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Equal0~5_combout\ = (!\inst_1|reg_idx\(13) & (!\inst_1|reg_idx\(15) & (!\inst_1|reg_idx\(16) & !\inst_1|reg_idx\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_1|reg_idx\(13),
	datab => \inst_1|reg_idx\(15),
	datac => \inst_1|reg_idx\(16),
	datad => \inst_1|reg_idx\(14),
	combout => \inst_1|Equal0~5_combout\);

-- Location: LCCOMB_X100_Y41_N28
\inst_1|Equal0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Equal0~6_combout\ = (!\inst_1|reg_idx\(12) & (!\inst_1|reg_idx\(11) & (!\inst_1|reg_idx\(9) & !\inst_1|reg_idx\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_1|reg_idx\(12),
	datab => \inst_1|reg_idx\(11),
	datac => \inst_1|reg_idx\(9),
	datad => \inst_1|reg_idx\(10),
	combout => \inst_1|Equal0~6_combout\);

-- Location: LCCOMB_X100_Y41_N26
\inst_1|Equal0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Equal0~7_combout\ = (!\inst_1|reg_idx\(5) & (!\inst_1|reg_idx\(7) & (!\inst_1|reg_idx\(6) & !\inst_1|reg_idx\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_1|reg_idx\(5),
	datab => \inst_1|reg_idx\(7),
	datac => \inst_1|reg_idx\(6),
	datad => \inst_1|reg_idx\(8),
	combout => \inst_1|Equal0~7_combout\);

-- Location: LCCOMB_X100_Y41_N8
\inst_1|Equal0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Equal0~8_combout\ = (!\inst_1|reg_idx\(2) & (!\inst_1|reg_idx\(1) & (\inst_1|Equal0~7_combout\ & !\inst_1|reg_idx\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_1|reg_idx\(2),
	datab => \inst_1|reg_idx\(1),
	datac => \inst_1|Equal0~7_combout\,
	datad => \inst_1|reg_idx\(4),
	combout => \inst_1|Equal0~8_combout\);

-- Location: LCCOMB_X101_Y40_N4
\inst_1|Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Add0~34_combout\ = (\inst_1|reg_idx\(17) & (!\inst_1|Add0~33\)) # (!\inst_1|reg_idx\(17) & ((\inst_1|Add0~33\) # (GND)))
-- \inst_1|Add0~35\ = CARRY((!\inst_1|Add0~33\) # (!\inst_1|reg_idx\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_1|reg_idx\(17),
	datad => VCC,
	cin => \inst_1|Add0~33\,
	combout => \inst_1|Add0~34_combout\,
	cout => \inst_1|Add0~35\);

-- Location: FF_X101_Y40_N5
\inst_1|reg_idx[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_1|Add0~34_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_1|reg_idx\(17));

-- Location: LCCOMB_X101_Y40_N6
\inst_1|Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Add0~36_combout\ = (\inst_1|reg_idx\(18) & (\inst_1|Add0~35\ $ (GND))) # (!\inst_1|reg_idx\(18) & (!\inst_1|Add0~35\ & VCC))
-- \inst_1|Add0~37\ = CARRY((\inst_1|reg_idx\(18) & !\inst_1|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_1|reg_idx\(18),
	datad => VCC,
	cin => \inst_1|Add0~35\,
	combout => \inst_1|Add0~36_combout\,
	cout => \inst_1|Add0~37\);

-- Location: FF_X101_Y40_N7
\inst_1|reg_idx[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_1|Add0~36_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_1|reg_idx\(18));

-- Location: LCCOMB_X101_Y40_N8
\inst_1|Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Add0~38_combout\ = (\inst_1|reg_idx\(19) & (!\inst_1|Add0~37\)) # (!\inst_1|reg_idx\(19) & ((\inst_1|Add0~37\) # (GND)))
-- \inst_1|Add0~39\ = CARRY((!\inst_1|Add0~37\) # (!\inst_1|reg_idx\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_1|reg_idx\(19),
	datad => VCC,
	cin => \inst_1|Add0~37\,
	combout => \inst_1|Add0~38_combout\,
	cout => \inst_1|Add0~39\);

-- Location: FF_X101_Y40_N9
\inst_1|reg_idx[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_1|Add0~38_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_1|reg_idx\(19));

-- Location: LCCOMB_X101_Y40_N10
\inst_1|Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Add0~40_combout\ = (\inst_1|reg_idx\(20) & (\inst_1|Add0~39\ $ (GND))) # (!\inst_1|reg_idx\(20) & (!\inst_1|Add0~39\ & VCC))
-- \inst_1|Add0~41\ = CARRY((\inst_1|reg_idx\(20) & !\inst_1|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_1|reg_idx\(20),
	datad => VCC,
	cin => \inst_1|Add0~39\,
	combout => \inst_1|Add0~40_combout\,
	cout => \inst_1|Add0~41\);

-- Location: FF_X101_Y40_N11
\inst_1|reg_idx[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_1|Add0~40_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_1|reg_idx\(20));

-- Location: LCCOMB_X101_Y40_N12
\inst_1|Add0~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Add0~42_combout\ = (\inst_1|reg_idx\(21) & (!\inst_1|Add0~41\)) # (!\inst_1|reg_idx\(21) & ((\inst_1|Add0~41\) # (GND)))
-- \inst_1|Add0~43\ = CARRY((!\inst_1|Add0~41\) # (!\inst_1|reg_idx\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_1|reg_idx\(21),
	datad => VCC,
	cin => \inst_1|Add0~41\,
	combout => \inst_1|Add0~42_combout\,
	cout => \inst_1|Add0~43\);

-- Location: FF_X101_Y40_N13
\inst_1|reg_idx[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_1|Add0~42_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_1|reg_idx\(21));

-- Location: LCCOMB_X101_Y40_N14
\inst_1|Add0~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Add0~44_combout\ = (\inst_1|reg_idx\(22) & (\inst_1|Add0~43\ $ (GND))) # (!\inst_1|reg_idx\(22) & (!\inst_1|Add0~43\ & VCC))
-- \inst_1|Add0~45\ = CARRY((\inst_1|reg_idx\(22) & !\inst_1|Add0~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_1|reg_idx\(22),
	datad => VCC,
	cin => \inst_1|Add0~43\,
	combout => \inst_1|Add0~44_combout\,
	cout => \inst_1|Add0~45\);

-- Location: FF_X101_Y40_N15
\inst_1|reg_idx[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_1|Add0~44_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_1|reg_idx\(22));

-- Location: LCCOMB_X101_Y40_N16
\inst_1|Add0~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Add0~46_combout\ = (\inst_1|reg_idx\(23) & (!\inst_1|Add0~45\)) # (!\inst_1|reg_idx\(23) & ((\inst_1|Add0~45\) # (GND)))
-- \inst_1|Add0~47\ = CARRY((!\inst_1|Add0~45\) # (!\inst_1|reg_idx\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_1|reg_idx\(23),
	datad => VCC,
	cin => \inst_1|Add0~45\,
	combout => \inst_1|Add0~46_combout\,
	cout => \inst_1|Add0~47\);

-- Location: FF_X101_Y40_N17
\inst_1|reg_idx[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_1|Add0~46_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_1|reg_idx\(23));

-- Location: LCCOMB_X101_Y40_N18
\inst_1|Add0~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Add0~48_combout\ = (\inst_1|reg_idx\(24) & (\inst_1|Add0~47\ $ (GND))) # (!\inst_1|reg_idx\(24) & (!\inst_1|Add0~47\ & VCC))
-- \inst_1|Add0~49\ = CARRY((\inst_1|reg_idx\(24) & !\inst_1|Add0~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_1|reg_idx\(24),
	datad => VCC,
	cin => \inst_1|Add0~47\,
	combout => \inst_1|Add0~48_combout\,
	cout => \inst_1|Add0~49\);

-- Location: FF_X101_Y40_N19
\inst_1|reg_idx[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_1|Add0~48_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_1|reg_idx\(24));

-- Location: LCCOMB_X101_Y40_N20
\inst_1|Add0~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Add0~50_combout\ = (\inst_1|reg_idx\(25) & (!\inst_1|Add0~49\)) # (!\inst_1|reg_idx\(25) & ((\inst_1|Add0~49\) # (GND)))
-- \inst_1|Add0~51\ = CARRY((!\inst_1|Add0~49\) # (!\inst_1|reg_idx\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_1|reg_idx\(25),
	datad => VCC,
	cin => \inst_1|Add0~49\,
	combout => \inst_1|Add0~50_combout\,
	cout => \inst_1|Add0~51\);

-- Location: FF_X101_Y40_N21
\inst_1|reg_idx[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_1|Add0~50_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_1|reg_idx\(25));

-- Location: LCCOMB_X101_Y40_N22
\inst_1|Add0~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Add0~52_combout\ = (\inst_1|reg_idx\(26) & (\inst_1|Add0~51\ $ (GND))) # (!\inst_1|reg_idx\(26) & (!\inst_1|Add0~51\ & VCC))
-- \inst_1|Add0~53\ = CARRY((\inst_1|reg_idx\(26) & !\inst_1|Add0~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_1|reg_idx\(26),
	datad => VCC,
	cin => \inst_1|Add0~51\,
	combout => \inst_1|Add0~52_combout\,
	cout => \inst_1|Add0~53\);

-- Location: FF_X101_Y40_N23
\inst_1|reg_idx[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_1|Add0~52_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_1|reg_idx\(26));

-- Location: LCCOMB_X101_Y40_N24
\inst_1|Add0~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Add0~54_combout\ = (\inst_1|reg_idx\(27) & (!\inst_1|Add0~53\)) # (!\inst_1|reg_idx\(27) & ((\inst_1|Add0~53\) # (GND)))
-- \inst_1|Add0~55\ = CARRY((!\inst_1|Add0~53\) # (!\inst_1|reg_idx\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_1|reg_idx\(27),
	datad => VCC,
	cin => \inst_1|Add0~53\,
	combout => \inst_1|Add0~54_combout\,
	cout => \inst_1|Add0~55\);

-- Location: FF_X101_Y40_N25
\inst_1|reg_idx[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_1|Add0~54_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_1|reg_idx\(27));

-- Location: LCCOMB_X101_Y40_N26
\inst_1|Add0~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Add0~56_combout\ = (\inst_1|reg_idx\(28) & (\inst_1|Add0~55\ $ (GND))) # (!\inst_1|reg_idx\(28) & (!\inst_1|Add0~55\ & VCC))
-- \inst_1|Add0~57\ = CARRY((\inst_1|reg_idx\(28) & !\inst_1|Add0~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_1|reg_idx\(28),
	datad => VCC,
	cin => \inst_1|Add0~55\,
	combout => \inst_1|Add0~56_combout\,
	cout => \inst_1|Add0~57\);

-- Location: FF_X101_Y40_N27
\inst_1|reg_idx[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_1|Add0~56_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_1|reg_idx\(28));

-- Location: LCCOMB_X101_Y40_N28
\inst_1|Add0~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Add0~58_combout\ = (\inst_1|reg_idx\(29) & (!\inst_1|Add0~57\)) # (!\inst_1|reg_idx\(29) & ((\inst_1|Add0~57\) # (GND)))
-- \inst_1|Add0~59\ = CARRY((!\inst_1|Add0~57\) # (!\inst_1|reg_idx\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_1|reg_idx\(29),
	datad => VCC,
	cin => \inst_1|Add0~57\,
	combout => \inst_1|Add0~58_combout\,
	cout => \inst_1|Add0~59\);

-- Location: FF_X101_Y40_N29
\inst_1|reg_idx[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_1|Add0~58_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_1|reg_idx\(29));

-- Location: LCCOMB_X101_Y40_N30
\inst_1|Add0~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Add0~60_combout\ = \inst_1|reg_idx\(30) $ (!\inst_1|Add0~59\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_1|reg_idx\(30),
	cin => \inst_1|Add0~59\,
	combout => \inst_1|Add0~60_combout\);

-- Location: FF_X101_Y40_N31
\inst_1|reg_idx[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_1|Add0~60_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_1|reg_idx\(30));

-- Location: LCCOMB_X100_Y41_N22
\inst_1|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Equal0~0_combout\ = (\inst_1|reg_idx\(3) & (\inst_1|reg_idx\(0) & (!\inst_1|reg_idx\(29) & !\inst_1|reg_idx\(30))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_1|reg_idx\(3),
	datab => \inst_1|reg_idx\(0),
	datac => \inst_1|reg_idx\(29),
	datad => \inst_1|reg_idx\(30),
	combout => \inst_1|Equal0~0_combout\);

-- Location: LCCOMB_X100_Y40_N0
\inst_1|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Equal0~1_combout\ = (!\inst_1|reg_idx\(25) & (!\inst_1|reg_idx\(27) & (!\inst_1|reg_idx\(28) & !\inst_1|reg_idx\(26))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_1|reg_idx\(25),
	datab => \inst_1|reg_idx\(27),
	datac => \inst_1|reg_idx\(28),
	datad => \inst_1|reg_idx\(26),
	combout => \inst_1|Equal0~1_combout\);

-- Location: LCCOMB_X100_Y41_N30
\inst_1|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Equal0~3_combout\ = (!\inst_1|reg_idx\(19) & (!\inst_1|reg_idx\(17) & (!\inst_1|reg_idx\(18) & !\inst_1|reg_idx\(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_1|reg_idx\(19),
	datab => \inst_1|reg_idx\(17),
	datac => \inst_1|reg_idx\(18),
	datad => \inst_1|reg_idx\(20),
	combout => \inst_1|Equal0~3_combout\);

-- Location: LCCOMB_X100_Y41_N0
\inst_1|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Equal0~2_combout\ = (!\inst_1|reg_idx\(24) & (!\inst_1|reg_idx\(21) & (!\inst_1|reg_idx\(23) & !\inst_1|reg_idx\(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_1|reg_idx\(24),
	datab => \inst_1|reg_idx\(21),
	datac => \inst_1|reg_idx\(23),
	datad => \inst_1|reg_idx\(22),
	combout => \inst_1|Equal0~2_combout\);

-- Location: LCCOMB_X100_Y41_N20
\inst_1|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Equal0~4_combout\ = (\inst_1|Equal0~0_combout\ & (\inst_1|Equal0~1_combout\ & (\inst_1|Equal0~3_combout\ & \inst_1|Equal0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_1|Equal0~0_combout\,
	datab => \inst_1|Equal0~1_combout\,
	datac => \inst_1|Equal0~3_combout\,
	datad => \inst_1|Equal0~2_combout\,
	combout => \inst_1|Equal0~4_combout\);

-- Location: LCCOMB_X100_Y41_N14
\inst_1|Equal0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Equal0~9_combout\ = (\inst_1|Equal0~5_combout\ & (\inst_1|Equal0~6_combout\ & (\inst_1|Equal0~8_combout\ & \inst_1|Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_1|Equal0~5_combout\,
	datab => \inst_1|Equal0~6_combout\,
	datac => \inst_1|Equal0~8_combout\,
	datad => \inst_1|Equal0~4_combout\,
	combout => \inst_1|Equal0~9_combout\);

-- Location: LCCOMB_X100_Y41_N24
\inst_1|Selector1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Selector1~0_combout\ = (\inst_1|zustand.start_write~q\) # ((!\inst_2|ack_error~q\ & (!\inst_2|write_done~q\ & \inst_1|zustand.send~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|ack_error~q\,
	datab => \inst_2|write_done~q\,
	datac => \inst_1|zustand.send~q\,
	datad => \inst_1|zustand.start_write~q\,
	combout => \inst_1|Selector1~0_combout\);

-- Location: FF_X100_Y41_N25
\inst_1|zustand.send\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_1|Selector1~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_1|zustand.send~q\);

-- Location: LCCOMB_X100_Y41_N16
\inst_1|folge_zustand.idle~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|folge_zustand.idle~0_combout\ = ((\inst_2|write_done~q\ & ((!\inst_1|Equal0~9_combout\))) # (!\inst_2|write_done~q\ & (!\inst_2|ack_error~q\))) # (!\inst_1|zustand.send~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001110111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|ack_error~q\,
	datab => \inst_2|write_done~q\,
	datac => \inst_1|Equal0~9_combout\,
	datad => \inst_1|zustand.send~q\,
	combout => \inst_1|folge_zustand.idle~0_combout\);

-- Location: FF_X100_Y41_N17
\inst_1|zustand.idle\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_1|folge_zustand.idle~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_1|zustand.idle~q\);

-- Location: LCCOMB_X100_Y41_N18
\inst_1|Selector0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Selector0~0_combout\ = ((\inst_2|write_done~q\ & (!\inst_1|Equal0~9_combout\ & \inst_1|zustand.send~q\))) # (!\inst_1|zustand.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|write_done~q\,
	datab => \inst_1|zustand.idle~q\,
	datac => \inst_1|Equal0~9_combout\,
	datad => \inst_1|zustand.send~q\,
	combout => \inst_1|Selector0~0_combout\);

-- Location: FF_X100_Y41_N19
\inst_1|zustand.start_write\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_1|Selector0~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_1|zustand.start_write~q\);

-- Location: LCCOMB_X99_Y41_N24
\inst_2|Selector30~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector30~1_combout\ = (!\inst_2|fsm_state.S_IDLE~q\ & \inst_1|zustand.start_write~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|fsm_state.S_IDLE~q\,
	datad => \inst_1|zustand.start_write~q\,
	combout => \inst_2|Selector30~1_combout\);

-- Location: LCCOMB_X96_Y41_N18
\inst_2|Selector31~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector31~1_combout\ = (\inst_2|fsm_state.S_SEND_BYTE~q\ & (((\inst_2|Selector31~0_combout\ & !\inst_2|Selector30~1_combout\)) # (!\inst_2|Equal2~0_combout\))) # (!\inst_2|fsm_state.S_SEND_BYTE~q\ & (\inst_2|Selector31~0_combout\ & 
-- ((!\inst_2|Selector30~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|fsm_state.S_SEND_BYTE~q\,
	datab => \inst_2|Selector31~0_combout\,
	datac => \inst_2|Equal2~0_combout\,
	datad => \inst_2|Selector30~1_combout\,
	combout => \inst_2|Selector31~1_combout\);

-- Location: LCCOMB_X96_Y41_N12
\inst_2|Selector31~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector31~3_combout\ = (!\inst_2|Selector31~2_combout\ & ((\inst_2|fsm_state.S_ACK_BYTE~q\) # (\inst_2|Selector31~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst_2|fsm_state.S_ACK_BYTE~q\,
	datac => \inst_2|Selector31~2_combout\,
	datad => \inst_2|Selector31~1_combout\,
	combout => \inst_2|Selector31~3_combout\);

-- Location: LCCOMB_X96_Y41_N20
\inst_2|Selector31~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector31~5_combout\ = (\inst_2|Selector31~4_combout\ & (((\inst_2|fsm_state.S_WAIT_FOR_STOP~q\ & \inst_2|Selector31~3_combout\)))) # (!\inst_2|Selector31~4_combout\ & ((\inst_2|Selector31~2_combout\) # ((\inst_2|fsm_state.S_WAIT_FOR_STOP~q\ & 
-- \inst_2|Selector31~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|Selector31~4_combout\,
	datab => \inst_2|Selector31~2_combout\,
	datac => \inst_2|fsm_state.S_WAIT_FOR_STOP~q\,
	datad => \inst_2|Selector31~3_combout\,
	combout => \inst_2|Selector31~5_combout\);

-- Location: FF_X96_Y41_N21
\inst_2|fsm_state.S_WAIT_FOR_STOP\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|Selector31~5_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|fsm_state.S_WAIT_FOR_STOP~q\);

-- Location: FF_X99_Y41_N5
\inst_2|fsm_state.S_STOP\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	asdata => \inst_2|fsm_state.S_WAIT_FOR_STOP~q\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \inst_2|Equal2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|fsm_state.S_STOP~q\);

-- Location: LCCOMB_X99_Y41_N6
\inst_2|Selector25~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector25~0_combout\ = (\inst_2|Equal2~0_combout\ & (!\inst_2|fsm_state.S_STOP~q\ & ((\inst_2|fsm_state.S_IDLE~q\) # (\inst_1|zustand.start_write~q\)))) # (!\inst_2|Equal2~0_combout\ & (((\inst_2|fsm_state.S_IDLE~q\) # 
-- (\inst_1|zustand.start_write~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011101110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|Equal2~0_combout\,
	datab => \inst_2|fsm_state.S_STOP~q\,
	datac => \inst_2|fsm_state.S_IDLE~q\,
	datad => \inst_1|zustand.start_write~q\,
	combout => \inst_2|Selector25~0_combout\);

-- Location: FF_X99_Y41_N7
\inst_2|fsm_state.S_IDLE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|Selector25~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|fsm_state.S_IDLE~q\);

-- Location: LCCOMB_X95_Y41_N26
\inst_2|Selector26~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector26~2_combout\ = ((\inst_2|clk_edge_mask\(1)) # (\inst_2|clk_edge_mask\(0) $ (!\inst_2|fsm_state.S_ACK_BYTE~q\))) # (!\inst_2|clk_edge_mask\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|clk_edge_mask\(2),
	datab => \inst_2|clk_edge_mask\(1),
	datac => \inst_2|clk_edge_mask\(0),
	datad => \inst_2|fsm_state.S_ACK_BYTE~q\,
	combout => \inst_2|Selector26~2_combout\);

-- Location: LCCOMB_X98_Y41_N24
\inst_2|Selector26~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector26~3_combout\ = (\inst_2|fsm_state.S_WAIT_FOR_START~q\ & (((\inst_2|fsm_state.S_SEND_BYTE~q\) # (\inst_2|Selector26~2_combout\)) # (!\inst_2|fsm_state.S_IDLE~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|fsm_state.S_IDLE~q\,
	datab => \inst_2|fsm_state.S_SEND_BYTE~q\,
	datac => \inst_2|fsm_state.S_WAIT_FOR_START~q\,
	datad => \inst_2|Selector26~2_combout\,
	combout => \inst_2|Selector26~3_combout\);

-- Location: LCCOMB_X98_Y41_N6
\inst_2|Selector30~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector30~2_combout\ = (\inst_2|Equal2~0_combout\ & (\inst_2|Equal0~0_combout\ & \inst_2|fsm_state.S_SEND_BYTE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst_2|Equal2~0_combout\,
	datac => \inst_2|Equal0~0_combout\,
	datad => \inst_2|fsm_state.S_SEND_BYTE~q\,
	combout => \inst_2|Selector30~2_combout\);

-- Location: LCCOMB_X98_Y41_N14
\inst_2|Selector26~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector26~4_combout\ = (!\inst_2|Selector30~2_combout\ & ((\inst_2|Selector26~3_combout\) # ((!\inst_2|fsm_state.S_IDLE~q\ & \inst_1|zustand.start_write~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|fsm_state.S_IDLE~q\,
	datab => \inst_2|Selector26~3_combout\,
	datac => \inst_1|zustand.start_write~q\,
	datad => \inst_2|Selector30~2_combout\,
	combout => \inst_2|Selector26~4_combout\);

-- Location: FF_X98_Y41_N15
\inst_2|fsm_state.S_WAIT_FOR_START\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|Selector26~4_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|fsm_state.S_WAIT_FOR_START~q\);

-- Location: FF_X99_Y41_N13
\inst_2|fsm_state.S_START\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	asdata => \inst_2|fsm_state.S_WAIT_FOR_START~q\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \inst_2|Equal2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|fsm_state.S_START~q\);

-- Location: LCCOMB_X96_Y41_N16
\inst_2|bit_count[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|bit_count[0]~0_combout\ = (\inst_2|Equal2~0_combout\ & ((\inst_2|fsm_state.S_START~q\) # (\inst_2|fsm_state.S_SEND_BYTE~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst_2|Equal2~0_combout\,
	datac => \inst_2|fsm_state.S_START~q\,
	datad => \inst_2|fsm_state.S_SEND_BYTE~q\,
	combout => \inst_2|bit_count[0]~0_combout\);

-- Location: FF_X96_Y41_N25
\inst_2|bit_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|Selector37~0_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|bit_count[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|bit_count\(0));

-- Location: LCCOMB_X96_Y41_N4
\inst_2|Selector36~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector36~0_combout\ = \inst_2|bit_count\(1) $ (\inst_2|bit_count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_2|bit_count\(1),
	datad => \inst_2|bit_count\(0),
	combout => \inst_2|Selector36~0_combout\);

-- Location: FF_X96_Y41_N5
\inst_2|bit_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|Selector36~0_combout\,
	clrn => \KEY[0]~input_o\,
	sclr => \inst_2|ALT_INV_fsm_state.S_SEND_BYTE~q\,
	ena => \inst_2|bit_count[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|bit_count\(1));

-- Location: LCCOMB_X96_Y41_N22
\inst_2|Selector35~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector35~0_combout\ = (\inst_2|fsm_state.S_SEND_BYTE~q\ & (\inst_2|bit_count\(2) $ (((\inst_2|bit_count\(0) & \inst_2|bit_count\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|fsm_state.S_SEND_BYTE~q\,
	datab => \inst_2|bit_count\(0),
	datac => \inst_2|bit_count\(2),
	datad => \inst_2|bit_count\(1),
	combout => \inst_2|Selector35~0_combout\);

-- Location: FF_X96_Y41_N23
\inst_2|bit_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|Selector35~0_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|bit_count[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|bit_count\(2));

-- Location: LCCOMB_X96_Y41_N30
\inst_2|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Equal0~0_combout\ = (\inst_2|bit_count\(2) & (\inst_2|bit_count\(1) & \inst_2|bit_count\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|bit_count\(2),
	datac => \inst_2|bit_count\(1),
	datad => \inst_2|bit_count\(0),
	combout => \inst_2|Equal0~0_combout\);

-- Location: LCCOMB_X96_Y41_N6
\inst_2|Selector28~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector28~0_combout\ = (\inst_2|Selector31~4_combout\ & ((\inst_2|Selector31~2_combout\) # ((\inst_2|fsm_state.S_WAIT_FOR_NEXT_BYTE~q\ & \inst_2|Selector31~3_combout\)))) # (!\inst_2|Selector31~4_combout\ & 
-- (((\inst_2|fsm_state.S_WAIT_FOR_NEXT_BYTE~q\ & \inst_2|Selector31~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|Selector31~4_combout\,
	datab => \inst_2|Selector31~2_combout\,
	datac => \inst_2|fsm_state.S_WAIT_FOR_NEXT_BYTE~q\,
	datad => \inst_2|Selector31~3_combout\,
	combout => \inst_2|Selector28~0_combout\);

-- Location: FF_X96_Y41_N7
\inst_2|fsm_state.S_WAIT_FOR_NEXT_BYTE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|Selector28~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|fsm_state.S_WAIT_FOR_NEXT_BYTE~q\);

-- Location: LCCOMB_X99_Y41_N18
\inst_2|Selector0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector0~2_combout\ = (!\inst_2|fsm_state.S_START~q\ & !\inst_2|fsm_state.S_WAIT_FOR_NEXT_BYTE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst_2|fsm_state.S_START~q\,
	datac => \inst_2|fsm_state.S_WAIT_FOR_NEXT_BYTE~q\,
	combout => \inst_2|Selector0~2_combout\);

-- Location: LCCOMB_X96_Y41_N14
\inst_2|Selector29~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector29~0_combout\ = (\inst_2|Equal2~0_combout\ & (((!\inst_2|Equal0~0_combout\ & \inst_2|fsm_state.S_SEND_BYTE~q\)) # (!\inst_2|Selector0~2_combout\))) # (!\inst_2|Equal2~0_combout\ & (((\inst_2|fsm_state.S_SEND_BYTE~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|Equal0~0_combout\,
	datab => \inst_2|Equal2~0_combout\,
	datac => \inst_2|fsm_state.S_SEND_BYTE~q\,
	datad => \inst_2|Selector0~2_combout\,
	combout => \inst_2|Selector29~0_combout\);

-- Location: FF_X96_Y41_N15
\inst_2|fsm_state.S_SEND_BYTE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|Selector29~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|fsm_state.S_SEND_BYTE~q\);

-- Location: LCCOMB_X99_Y41_N4
\inst_2|Selector0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector0~6_combout\ = (!\inst_2|fsm_state.S_WAIT_FOR_STOP~q\ & (!\inst_2|fsm_state.S_ACK_BYTE~q\ & (!\inst_2|fsm_state.S_STOP~q\ & !\inst_2|fsm_state.S_WAIT_FOR_START~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|fsm_state.S_WAIT_FOR_STOP~q\,
	datab => \inst_2|fsm_state.S_ACK_BYTE~q\,
	datac => \inst_2|fsm_state.S_STOP~q\,
	datad => \inst_2|fsm_state.S_WAIT_FOR_START~q\,
	combout => \inst_2|Selector0~6_combout\);

-- Location: LCCOMB_X99_Y41_N12
\inst_2|Selector0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector0~8_combout\ = (!\inst_2|fsm_state.S_SEND_BYTE~q\ & (\inst_2|Selector0~6_combout\ & (!\inst_2|fsm_state.S_START~q\ & !\inst_2|fsm_state.S_WAIT_FOR_NEXT_BYTE~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|fsm_state.S_SEND_BYTE~q\,
	datab => \inst_2|Selector0~6_combout\,
	datac => \inst_2|fsm_state.S_START~q\,
	datad => \inst_2|fsm_state.S_WAIT_FOR_NEXT_BYTE~q\,
	combout => \inst_2|Selector0~8_combout\);

-- Location: LCCOMB_X98_Y41_N26
\inst_2|Selector20~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector20~3_combout\ = (\inst_1|reg_idx\(1) & ((!\inst_1|reg_idx\(2)))) # (!\inst_1|reg_idx\(1) & (!\inst_1|reg_idx\(0) & \inst_1|reg_idx\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst_1|reg_idx\(1),
	datac => \inst_1|reg_idx\(0),
	datad => \inst_1|reg_idx\(2),
	combout => \inst_2|Selector20~3_combout\);

-- Location: LCCOMB_X98_Y41_N30
\inst_2|Selector21~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector21~0_combout\ = (!\inst_1|reg_idx\(2) & ((!\inst_1|reg_idx\(0)) # (!\inst_1|reg_idx\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_1|reg_idx\(3),
	datab => \inst_1|reg_idx\(0),
	datad => \inst_1|reg_idx\(2),
	combout => \inst_2|Selector21~0_combout\);

-- Location: LCCOMB_X98_Y41_N20
\inst_2|data[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|data[3]~feeder_combout\ = \inst_2|Selector21~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|Selector21~0_combout\,
	combout => \inst_2|data[3]~feeder_combout\);

-- Location: LCCOMB_X98_Y41_N16
\inst_2|Selector24~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector24~1_combout\ = (\inst_1|zustand.start_write~q\ & (!\inst_2|fsm_state.S_IDLE~q\ & ((\inst_1|reg_idx\(0)) # (!\inst_1|reg_idx\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_1|zustand.start_write~q\,
	datab => \inst_1|reg_idx\(0),
	datac => \inst_1|reg_idx\(3),
	datad => \inst_2|fsm_state.S_IDLE~q\,
	combout => \inst_2|Selector24~1_combout\);

-- Location: LCCOMB_X99_Y41_N2
\inst_2|Selector23~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector23~0_combout\ = (\inst_2|fsm_state.S_IDLE~q\ & (((!\inst_2|Equal0~0_combout\)) # (!\inst_2|fsm_state.S_SEND_BYTE~q\))) # (!\inst_2|fsm_state.S_IDLE~q\ & (\inst_1|zustand.start_write~q\ & ((!\inst_2|Equal0~0_combout\) # 
-- (!\inst_2|fsm_state.S_SEND_BYTE~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|fsm_state.S_IDLE~q\,
	datab => \inst_2|fsm_state.S_SEND_BYTE~q\,
	datac => \inst_2|Equal0~0_combout\,
	datad => \inst_1|zustand.start_write~q\,
	combout => \inst_2|Selector23~0_combout\);

-- Location: LCCOMB_X99_Y41_N20
\inst_2|Selector23~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector23~1_combout\ = (\inst_2|Selector0~6_combout\ & (\inst_2|Selector23~0_combout\ & ((\inst_2|Equal2~0_combout\) # (!\inst_2|fsm_state.S_SEND_BYTE~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|fsm_state.S_SEND_BYTE~q\,
	datab => \inst_2|Selector0~6_combout\,
	datac => \inst_2|Equal2~0_combout\,
	datad => \inst_2|Selector23~0_combout\,
	combout => \inst_2|Selector23~1_combout\);

-- Location: LCCOMB_X99_Y41_N10
\inst_2|Selector24~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector24~0_combout\ = (\inst_2|data\(0) & (((!\inst_2|Selector0~2_combout\ & !\inst_2|Equal2~0_combout\)) # (!\inst_2|Selector23~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|data\(0),
	datab => \inst_2|Selector0~2_combout\,
	datac => \inst_2|Equal2~0_combout\,
	datad => \inst_2|Selector23~1_combout\,
	combout => \inst_2|Selector24~0_combout\);

-- Location: LCCOMB_X99_Y41_N8
\inst_2|Selector24~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector24~2_combout\ = (\inst_2|Selector24~0_combout\) # ((!\inst_1|reg_idx\(2) & \inst_2|Selector24~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_1|reg_idx\(2),
	datac => \inst_2|Selector24~1_combout\,
	datad => \inst_2|Selector24~0_combout\,
	combout => \inst_2|Selector24~2_combout\);

-- Location: FF_X99_Y41_N9
\inst_2|data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|Selector24~2_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|data\(0));

-- Location: LCCOMB_X99_Y41_N22
\inst_2|Selector23~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector23~2_combout\ = (!\inst_2|Selector0~2_combout\ & ((\inst_2|Equal2~0_combout\ & ((\inst_2|data\(0)))) # (!\inst_2|Equal2~0_combout\ & (\inst_2|data\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|data\(1),
	datab => \inst_2|data\(0),
	datac => \inst_2|Equal2~0_combout\,
	datad => \inst_2|Selector0~2_combout\,
	combout => \inst_2|Selector23~2_combout\);

-- Location: LCCOMB_X100_Y41_N12
\inst_1|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_1|Mux5~0_combout\ = (\inst_1|reg_idx\(3)) # ((\inst_1|reg_idx\(2) & (\inst_1|reg_idx\(1) $ (\inst_1|reg_idx\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_1|reg_idx\(3),
	datab => \inst_1|reg_idx\(1),
	datac => \inst_1|reg_idx\(0),
	datad => \inst_1|reg_idx\(2),
	combout => \inst_1|Mux5~0_combout\);

-- Location: LCCOMB_X98_Y41_N28
\inst_2|Selector20~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector20~0_combout\ = (!\inst_2|Equal0~0_combout\ & (\inst_2|Equal2~0_combout\ & \inst_2|fsm_state.S_SEND_BYTE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|Equal0~0_combout\,
	datac => \inst_2|Equal2~0_combout\,
	datad => \inst_2|fsm_state.S_SEND_BYTE~q\,
	combout => \inst_2|Selector20~0_combout\);

-- Location: LCCOMB_X99_Y41_N28
\inst_2|Selector23~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector23~3_combout\ = (\inst_2|data\(0) & ((\inst_2|Selector20~0_combout\) # ((\inst_2|data\(1) & !\inst_2|Selector23~1_combout\)))) # (!\inst_2|data\(0) & (((\inst_2|data\(1) & !\inst_2|Selector23~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|data\(0),
	datab => \inst_2|Selector20~0_combout\,
	datac => \inst_2|data\(1),
	datad => \inst_2|Selector23~1_combout\,
	combout => \inst_2|Selector23~3_combout\);

-- Location: LCCOMB_X99_Y41_N30
\inst_2|Selector23~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector23~4_combout\ = (\inst_2|Selector23~2_combout\) # ((\inst_2|Selector23~3_combout\) # ((\inst_2|Selector30~1_combout\ & !\inst_1|Mux5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|Selector23~2_combout\,
	datab => \inst_2|Selector30~1_combout\,
	datac => \inst_1|Mux5~0_combout\,
	datad => \inst_2|Selector23~3_combout\,
	combout => \inst_2|Selector23~4_combout\);

-- Location: FF_X99_Y41_N31
\inst_2|data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|Selector23~4_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|data\(1));

-- Location: LCCOMB_X96_Y41_N10
\inst_2|data[16]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|data[16]~0_combout\ = ((!\inst_2|fsm_state.S_WAIT_FOR_NEXT_BYTE~q\ & ((\inst_2|Equal0~0_combout\) # (!\inst_2|fsm_state.S_SEND_BYTE~q\)))) # (!\inst_2|Equal2~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111110111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|Equal0~0_combout\,
	datab => \inst_2|fsm_state.S_SEND_BYTE~q\,
	datac => \inst_2|Equal2~0_combout\,
	datad => \inst_2|fsm_state.S_WAIT_FOR_NEXT_BYTE~q\,
	combout => \inst_2|data[16]~0_combout\);

-- Location: LCCOMB_X97_Y41_N16
\inst_2|data[16]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|data[16]~1_combout\ = (\inst_2|Selector30~1_combout\) # (((\inst_2|fsm_state.S_START~q\ & \inst_2|Equal2~0_combout\)) # (!\inst_2|data[16]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|fsm_state.S_START~q\,
	datab => \inst_2|Equal2~0_combout\,
	datac => \inst_2|Selector30~1_combout\,
	datad => \inst_2|data[16]~0_combout\,
	combout => \inst_2|data[16]~1_combout\);

-- Location: FF_X98_Y41_N31
\inst_2|data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|Selector21~0_combout\,
	asdata => \inst_2|data\(1),
	clrn => \KEY[0]~input_o\,
	sload => \inst_2|fsm_state.S_IDLE~q\,
	ena => \inst_2|data[16]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|data\(2));

-- Location: FF_X98_Y41_N21
\inst_2|data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|data[3]~feeder_combout\,
	asdata => \inst_2|data\(2),
	clrn => \KEY[0]~input_o\,
	sload => \inst_2|fsm_state.S_IDLE~q\,
	ena => \inst_2|data[16]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|data\(3));

-- Location: LCCOMB_X98_Y41_N4
\inst_2|Selector20~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector20~2_combout\ = (!\inst_2|Selector0~2_combout\ & ((\inst_2|Equal2~0_combout\ & (\inst_2|data\(3))) # (!\inst_2|Equal2~0_combout\ & ((\inst_2|data\(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|data\(3),
	datab => \inst_2|Equal2~0_combout\,
	datac => \inst_2|data\(4),
	datad => \inst_2|Selector0~2_combout\,
	combout => \inst_2|Selector20~2_combout\);

-- Location: LCCOMB_X98_Y41_N10
\inst_2|Selector20~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector20~1_combout\ = (\inst_2|data\(3) & ((\inst_2|Selector20~0_combout\) # ((\inst_2|data\(4) & !\inst_2|Selector23~1_combout\)))) # (!\inst_2|data\(3) & (\inst_2|data\(4) & (!\inst_2|Selector23~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|data\(3),
	datab => \inst_2|data\(4),
	datac => \inst_2|Selector23~1_combout\,
	datad => \inst_2|Selector20~0_combout\,
	combout => \inst_2|Selector20~1_combout\);

-- Location: LCCOMB_X98_Y41_N8
\inst_2|Selector20~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector20~4_combout\ = (\inst_2|Selector20~2_combout\) # ((\inst_2|Selector20~1_combout\) # ((\inst_2|Selector20~3_combout\ & \inst_2|Selector30~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|Selector20~3_combout\,
	datab => \inst_2|Selector30~1_combout\,
	datac => \inst_2|Selector20~2_combout\,
	datad => \inst_2|Selector20~1_combout\,
	combout => \inst_2|Selector20~4_combout\);

-- Location: FF_X98_Y41_N9
\inst_2|data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|Selector20~4_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|data\(4));

-- Location: LCCOMB_X98_Y41_N18
\inst_2|Selector19~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector19~0_combout\ = (\inst_2|fsm_state.S_IDLE~q\ & (((\inst_2|data\(4))))) # (!\inst_2|fsm_state.S_IDLE~q\ & (!\inst_1|reg_idx\(2) & (\inst_1|reg_idx\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_1|reg_idx\(2),
	datab => \inst_1|reg_idx\(1),
	datac => \inst_2|data\(4),
	datad => \inst_2|fsm_state.S_IDLE~q\,
	combout => \inst_2|Selector19~0_combout\);

-- Location: FF_X98_Y41_N19
\inst_2|data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|Selector19~0_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|data[16]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|data\(5));

-- Location: LCCOMB_X98_Y41_N0
\inst_2|Selector18~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector18~0_combout\ = (\inst_2|fsm_state.S_IDLE~q\ & (((\inst_2|data\(5))))) # (!\inst_2|fsm_state.S_IDLE~q\ & (!\inst_1|reg_idx\(2) & ((\inst_1|reg_idx\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_1|reg_idx\(2),
	datab => \inst_2|data\(5),
	datac => \inst_1|reg_idx\(1),
	datad => \inst_2|fsm_state.S_IDLE~q\,
	combout => \inst_2|Selector18~0_combout\);

-- Location: FF_X98_Y41_N1
\inst_2|data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|Selector18~0_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|data[16]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|data\(6));

-- Location: LCCOMB_X98_Y41_N22
\inst_2|Selector17~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector17~0_combout\ = (\inst_2|data\(6) & \inst_2|fsm_state.S_IDLE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst_2|data\(6),
	datad => \inst_2|fsm_state.S_IDLE~q\,
	combout => \inst_2|Selector17~0_combout\);

-- Location: FF_X98_Y41_N23
\inst_2|data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|Selector17~0_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|data[16]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|data\(7));

-- Location: LCCOMB_X98_Y41_N2
\inst_2|Selector16~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector16~0_combout\ = (\inst_2|data\(7) & \inst_2|fsm_state.S_IDLE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_2|data\(7),
	datad => \inst_2|fsm_state.S_IDLE~q\,
	combout => \inst_2|Selector16~0_combout\);

-- Location: FF_X98_Y41_N3
\inst_2|data[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|Selector16~0_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|data[16]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|data\(8));

-- Location: LCCOMB_X97_Y41_N6
\inst_2|Selector15~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector15~0_combout\ = (\inst_2|fsm_state.S_IDLE~q\ & (\inst_2|data\(8))) # (!\inst_2|fsm_state.S_IDLE~q\ & ((\inst_1|reg_idx\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|data\(8),
	datac => \inst_1|reg_idx\(0),
	datad => \inst_2|fsm_state.S_IDLE~q\,
	combout => \inst_2|Selector15~0_combout\);

-- Location: FF_X97_Y41_N7
\inst_2|data[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|Selector15~0_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|data[16]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|data\(9));

-- Location: LCCOMB_X97_Y41_N24
\inst_2|Selector14~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector14~0_combout\ = (\inst_2|fsm_state.S_IDLE~q\ & (\inst_2|data\(9))) # (!\inst_2|fsm_state.S_IDLE~q\ & ((\inst_1|reg_idx\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|data\(9),
	datac => \inst_1|reg_idx\(1),
	datad => \inst_2|fsm_state.S_IDLE~q\,
	combout => \inst_2|Selector14~0_combout\);

-- Location: FF_X97_Y41_N25
\inst_2|data[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|Selector14~0_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|data[16]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|data\(10));

-- Location: LCCOMB_X97_Y41_N10
\inst_2|Selector13~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector13~0_combout\ = (\inst_2|fsm_state.S_IDLE~q\ & (\inst_2|data\(10))) # (!\inst_2|fsm_state.S_IDLE~q\ & ((\inst_1|reg_idx\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst_2|data\(10),
	datac => \inst_1|reg_idx\(2),
	datad => \inst_2|fsm_state.S_IDLE~q\,
	combout => \inst_2|Selector13~0_combout\);

-- Location: FF_X97_Y41_N11
\inst_2|data[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|Selector13~0_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|data[16]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|data\(11));

-- Location: LCCOMB_X97_Y41_N4
\inst_2|Selector12~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector12~0_combout\ = (\inst_2|fsm_state.S_IDLE~q\ & (\inst_2|data\(11))) # (!\inst_2|fsm_state.S_IDLE~q\ & ((\inst_1|reg_idx\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|data\(11),
	datac => \inst_1|reg_idx\(3),
	datad => \inst_2|fsm_state.S_IDLE~q\,
	combout => \inst_2|Selector12~0_combout\);

-- Location: FF_X97_Y41_N5
\inst_2|data[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|Selector12~0_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|data[16]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|data\(12));

-- Location: LCCOMB_X97_Y41_N2
\inst_2|Selector11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector11~0_combout\ = (\inst_2|fsm_state.S_IDLE~q\ & ((\inst_2|data\(12)))) # (!\inst_2|fsm_state.S_IDLE~q\ & (\inst_1|reg_idx\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_1|reg_idx\(4),
	datac => \inst_2|data\(12),
	datad => \inst_2|fsm_state.S_IDLE~q\,
	combout => \inst_2|Selector11~0_combout\);

-- Location: FF_X97_Y41_N3
\inst_2|data[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|Selector11~0_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|data[16]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|data\(13));

-- Location: LCCOMB_X97_Y41_N20
\inst_2|Selector10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector10~0_combout\ = (\inst_2|fsm_state.S_IDLE~q\ & (\inst_2|data\(13))) # (!\inst_2|fsm_state.S_IDLE~q\ & ((\inst_1|reg_idx\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst_2|data\(13),
	datac => \inst_1|reg_idx\(5),
	datad => \inst_2|fsm_state.S_IDLE~q\,
	combout => \inst_2|Selector10~0_combout\);

-- Location: FF_X97_Y41_N21
\inst_2|data[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|Selector10~0_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|data[16]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|data\(14));

-- Location: LCCOMB_X97_Y41_N26
\inst_2|Selector9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector9~0_combout\ = (\inst_2|fsm_state.S_IDLE~q\ & ((\inst_2|data\(14)))) # (!\inst_2|fsm_state.S_IDLE~q\ & (\inst_1|reg_idx\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_1|reg_idx\(6),
	datab => \inst_2|data\(14),
	datad => \inst_2|fsm_state.S_IDLE~q\,
	combout => \inst_2|Selector9~0_combout\);

-- Location: FF_X97_Y41_N27
\inst_2|data[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|Selector9~0_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|data[16]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|data\(15));

-- Location: LCCOMB_X97_Y41_N8
\inst_2|Selector8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector8~0_combout\ = (\inst_2|data\(15) & \inst_2|fsm_state.S_IDLE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_2|data\(15),
	datad => \inst_2|fsm_state.S_IDLE~q\,
	combout => \inst_2|Selector8~0_combout\);

-- Location: FF_X97_Y41_N9
\inst_2|data[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|Selector8~0_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|data[16]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|data\(16));

-- Location: LCCOMB_X97_Y41_N18
\inst_2|Selector7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector7~0_combout\ = (\inst_2|data\(16) & \inst_2|fsm_state.S_IDLE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_2|data\(16),
	datad => \inst_2|fsm_state.S_IDLE~q\,
	combout => \inst_2|Selector7~0_combout\);

-- Location: FF_X97_Y41_N19
\inst_2|data[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|Selector7~0_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|data[16]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|data\(17));

-- Location: LCCOMB_X97_Y41_N0
\inst_2|Selector6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector6~0_combout\ = (\inst_2|data\(17)) # (!\inst_2|fsm_state.S_IDLE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst_2|data\(17),
	datad => \inst_2|fsm_state.S_IDLE~q\,
	combout => \inst_2|Selector6~0_combout\);

-- Location: FF_X97_Y41_N1
\inst_2|data[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|Selector6~0_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|data[16]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|data\(18));

-- Location: LCCOMB_X97_Y41_N30
\inst_2|Selector5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector5~0_combout\ = (\inst_2|data\(18) & \inst_2|fsm_state.S_IDLE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst_2|data\(18),
	datad => \inst_2|fsm_state.S_IDLE~q\,
	combout => \inst_2|Selector5~0_combout\);

-- Location: FF_X97_Y41_N31
\inst_2|data[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|Selector5~0_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|data[16]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|data\(19));

-- Location: LCCOMB_X97_Y41_N28
\inst_2|Selector4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector4~0_combout\ = (\inst_2|data\(19)) # (!\inst_2|fsm_state.S_IDLE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_2|data\(19),
	datad => \inst_2|fsm_state.S_IDLE~q\,
	combout => \inst_2|Selector4~0_combout\);

-- Location: FF_X97_Y41_N29
\inst_2|data[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|Selector4~0_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|data[16]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|data\(20));

-- Location: LCCOMB_X97_Y41_N14
\inst_2|Selector3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector3~0_combout\ = (\inst_2|data\(20)) # (!\inst_2|fsm_state.S_IDLE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst_2|data\(20),
	datad => \inst_2|fsm_state.S_IDLE~q\,
	combout => \inst_2|Selector3~0_combout\);

-- Location: FF_X97_Y41_N15
\inst_2|data[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|Selector3~0_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|data[16]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|data\(21));

-- Location: LCCOMB_X97_Y41_N22
\inst_2|Selector2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector2~0_combout\ = (\inst_2|data\(21) & \inst_2|fsm_state.S_IDLE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_2|data\(21),
	datad => \inst_2|fsm_state.S_IDLE~q\,
	combout => \inst_2|Selector2~0_combout\);

-- Location: FF_X97_Y41_N23
\inst_2|data[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|Selector2~0_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|data[16]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|data\(22));

-- Location: LCCOMB_X97_Y41_N12
\inst_2|Selector1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector1~0_combout\ = (\inst_2|data\(22) & \inst_2|fsm_state.S_IDLE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_2|data\(22),
	datad => \inst_2|fsm_state.S_IDLE~q\,
	combout => \inst_2|Selector1~0_combout\);

-- Location: FF_X97_Y41_N13
\inst_2|data[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|Selector1~0_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \inst_2|data[16]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|data\(23));

-- Location: LCCOMB_X99_Y41_N26
\inst_2|Selector0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector0~4_combout\ = (\inst_2|data\(23)) # ((\inst_2|Selector0~2_combout\ & ((\inst_2|Equal0~0_combout\) # (!\inst_2|fsm_state.S_SEND_BYTE~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|fsm_state.S_SEND_BYTE~q\,
	datab => \inst_2|data\(23),
	datac => \inst_2|Equal0~0_combout\,
	datad => \inst_2|Selector0~2_combout\,
	combout => \inst_2|Selector0~4_combout\);

-- Location: LCCOMB_X99_Y41_N16
\inst_2|Selector0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector0~3_combout\ = ((\inst_2|Equal2~0_combout\ & !\inst_2|fsm_state.S_ACK_BYTE~q\)) # (!\inst_2|sda~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst_2|sda~q\,
	datac => \inst_2|Equal2~0_combout\,
	datad => \inst_2|fsm_state.S_ACK_BYTE~q\,
	combout => \inst_2|Selector0~3_combout\);

-- Location: LCCOMB_X99_Y41_N0
\inst_2|Selector0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector0~5_combout\ = (!\inst_2|fsm_state.S_WAIT_FOR_START~q\ & (!\inst_2|fsm_state.S_WAIT_FOR_STOP~q\ & (\inst_2|Selector0~4_combout\ & \inst_2|Selector0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|fsm_state.S_WAIT_FOR_START~q\,
	datab => \inst_2|fsm_state.S_WAIT_FOR_STOP~q\,
	datac => \inst_2|Selector0~4_combout\,
	datad => \inst_2|Selector0~3_combout\,
	combout => \inst_2|Selector0~5_combout\);

-- Location: LCCOMB_X99_Y41_N14
\inst_2|Selector0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|Selector0~7_combout\ = (!\inst_2|Selector0~8_combout\ & (!\inst_2|Selector0~5_combout\ & ((\inst_2|Equal2~0_combout\) # (\inst_2|sda~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|Selector0~8_combout\,
	datab => \inst_2|Equal2~0_combout\,
	datac => \inst_2|sda~q\,
	datad => \inst_2|Selector0~5_combout\,
	combout => \inst_2|Selector0~7_combout\);

-- Location: FF_X99_Y41_N15
\inst_2|sda\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|Selector0~7_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|sda~q\);

-- Location: LCCOMB_X94_Y41_N2
\inst_4|FSM_BCLK_COUNT_INST|reg_idx[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_4|FSM_BCLK_COUNT_INST|reg_idx[1]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \inst_4|FSM_BCLK_COUNT_INST|reg_idx[1]~feeder_combout\);

-- Location: FF_X94_Y41_N3
\inst_4|FSM_BCLK_COUNT_INST|reg_idx[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_4|FSM_BCLK_COUNT_INST|reg_idx[1]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_4|FSM_BCLK_COUNT_INST|reg_idx\(1));

-- Location: LCCOMB_X98_Y41_N12
\inst_2|next_scl~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|next_scl~1_combout\ = ((\inst_2|fsm_state.S_WAIT_FOR_START~q\) # ((\inst_2|clk_edge_mask\(0)) # (!\inst_2|fsm_state.S_IDLE~q\))) # (!\inst_2|clk_edge_mask\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|clk_edge_mask\(2),
	datab => \inst_2|fsm_state.S_WAIT_FOR_START~q\,
	datac => \inst_2|clk_edge_mask\(0),
	datad => \inst_2|fsm_state.S_IDLE~q\,
	combout => \inst_2|next_scl~1_combout\);

-- Location: LCCOMB_X96_Y41_N26
\inst_2|next_scl~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_2|next_scl~2_combout\ = (!\inst_2|next_scl~0_combout\ & ((\inst_2|scl~q\) # ((!\inst_2|fsm_state.S_STOP~q\ & !\inst_2|next_scl~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_2|next_scl~0_combout\,
	datab => \inst_2|fsm_state.S_STOP~q\,
	datac => \inst_2|scl~q\,
	datad => \inst_2|next_scl~1_combout\,
	combout => \inst_2|next_scl~2_combout\);

-- Location: FF_X96_Y41_N27
\inst_2|scl\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst_3|divider_inst|count[3]~clkctrl_outclk\,
	d => \inst_2|next_scl~2_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_2|scl~q\);

-- Location: IOIBUF_X115_Y53_N15
\KEY[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(1),
	o => \KEY[1]~input_o\);

-- Location: IOIBUF_X115_Y42_N15
\KEY[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(2),
	o => \KEY[2]~input_o\);

-- Location: IOIBUF_X115_Y10_N8
\SW[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(14),
	o => \SW[14]~input_o\);

-- Location: IOIBUF_X115_Y6_N15
\SW[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(15),
	o => \SW[15]~input_o\);

-- Location: IOIBUF_X115_Y13_N1
\SW[16]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(16),
	o => \SW[16]~input_o\);

-- Location: IOIBUF_X115_Y14_N8
\SW[17]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(17),
	o => \SW[17]~input_o\);

-- Location: IOIBUF_X0_Y68_N1
\AUD_ADCDAT~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_AUD_ADCDAT,
	o => \AUD_ADCDAT~input_o\);

-- Location: IOIBUF_X115_Y17_N1
\SW[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

-- Location: IOIBUF_X115_Y14_N1
\SW[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(1),
	o => \SW[1]~input_o\);

-- Location: IOIBUF_X115_Y15_N8
\SW[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(2),
	o => \SW[2]~input_o\);

-- Location: IOIBUF_X115_Y13_N8
\SW[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(3),
	o => \SW[3]~input_o\);

-- Location: IOIBUF_X115_Y18_N8
\SW[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(4),
	o => \SW[4]~input_o\);

-- Location: IOIBUF_X115_Y11_N8
\SW[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(5),
	o => \SW[5]~input_o\);

-- Location: IOIBUF_X115_Y10_N1
\SW[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(6),
	o => \SW[6]~input_o\);

-- Location: IOIBUF_X115_Y15_N1
\SW[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(7),
	o => \SW[7]~input_o\);

-- Location: IOIBUF_X115_Y4_N22
\SW[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(8),
	o => \SW[8]~input_o\);

-- Location: IOIBUF_X115_Y16_N8
\SW[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(9),
	o => \SW[9]~input_o\);

-- Location: IOIBUF_X115_Y4_N15
\SW[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(10),
	o => \SW[10]~input_o\);

-- Location: IOIBUF_X115_Y5_N15
\SW[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(11),
	o => \SW[11]~input_o\);

-- Location: IOIBUF_X115_Y7_N15
\SW[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(12),
	o => \SW[12]~input_o\);

-- Location: IOIBUF_X115_Y9_N22
\SW[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(13),
	o => \SW[13]~input_o\);

-- Location: IOIBUF_X115_Y35_N22
\KEY[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(3),
	o => \KEY[3]~input_o\);

ww_AUD_DACDAT <= \AUD_DACDAT~output_o\;

ww_AUD_BCLK <= \AUD_BCLK~output_o\;

ww_AUD_XCK <= \AUD_XCK~output_o\;

ww_AUD_DACLRCK <= \AUD_DACLRCK~output_o\;

ww_AUD_ADCLRCK <= \AUD_ADCLRCK~output_o\;

ww_I2C_SCLK <= \I2C_SCLK~output_o\;

ww_I2C_SDAT <= \I2C_SDAT~output_o\;
END structure;


