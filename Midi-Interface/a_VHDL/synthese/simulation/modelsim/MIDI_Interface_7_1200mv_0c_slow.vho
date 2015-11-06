-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Full Version"

-- DATE "04/22/2014 15:02:08"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	MIDI_Interface IS
    PORT (
	clk : IN std_logic;
	serial_in : IN std_logic;
	button_n : IN std_logic;
	parallelNote : OUT std_logic_vector(24 DOWNTO 0)
	);
END MIDI_Interface;

-- Design Ports Information
-- parallelNote[0]	=>  Location: PIN_H15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallelNote[1]	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallelNote[2]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallelNote[3]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallelNote[4]	=>  Location: PIN_H17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallelNote[5]	=>  Location: PIN_J16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallelNote[6]	=>  Location: PIN_H16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallelNote[7]	=>  Location: PIN_J15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallelNote[8]	=>  Location: PIN_G17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallelNote[9]	=>  Location: PIN_J17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallelNote[10]	=>  Location: PIN_H19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallelNote[11]	=>  Location: PIN_J19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallelNote[12]	=>  Location: PIN_E18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallelNote[13]	=>  Location: PIN_F18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallelNote[14]	=>  Location: PIN_F21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallelNote[15]	=>  Location: PIN_E19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallelNote[16]	=>  Location: PIN_F19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallelNote[17]	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallelNote[18]	=>  Location: PIN_G21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallelNote[19]	=>  Location: PIN_G22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallelNote[20]	=>  Location: PIN_G20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallelNote[21]	=>  Location: PIN_H21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallelNote[22]	=>  Location: PIN_E24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallelNote[23]	=>  Location: PIN_E25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallelNote[24]	=>  Location: PIN_E22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- button_n	=>  Location: PIN_M23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- serial_in	=>  Location: PIN_AE25,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default


ARCHITECTURE structure OF MIDI_Interface IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_serial_in : std_logic;
SIGNAL ww_button_n : std_logic;
SIGNAL ww_parallelNote : std_logic_vector(24 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \i_IO|clk_tmp~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \i_UART_RX|i_Tick_Generator|Add1~22_combout\ : std_logic;
SIGNAL \i_NoteToParallel|Decoder0~8_combout\ : std_logic;
SIGNAL \i_NoteToParallel|Decoder0~12_combout\ : std_logic;
SIGNAL \i_NoteToParallel|Decoder0~21_combout\ : std_logic;
SIGNAL \i_MIDIDecoder|state.VELOCITY_RECEIVED~q\ : std_logic;
SIGNAL \i_MIDIDecoder|state.NOTE_ON~q\ : std_logic;
SIGNAL \i_MIDIDecoder|Selector11~0_combout\ : std_logic;
SIGNAL \i_MIDIDecoder|Selector11~1_combout\ : std_logic;
SIGNAL \i_MIDIDecoder|state.NOTE_OFF~q\ : std_logic;
SIGNAL \i_MIDIDecoder|Selector3~0_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|Add1~27_combout\ : std_logic;
SIGNAL \i_MIDIDecoder|next_state.VELOCITY_RECEIVED~0_combout\ : std_logic;
SIGNAL \i_MIDIDecoder|Selector2~0_combout\ : std_logic;
SIGNAL \i_MIDIDecoder|Selector1~0_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|Equal0~1_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|sig_startcnt[1]~2_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Flanken_Det|q2~q\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|Add1~29_combout\ : std_logic;
SIGNAL \i_NoteToParallel|Decoder0~28_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \parallelNote[0]~output_o\ : std_logic;
SIGNAL \parallelNote[1]~output_o\ : std_logic;
SIGNAL \parallelNote[2]~output_o\ : std_logic;
SIGNAL \parallelNote[3]~output_o\ : std_logic;
SIGNAL \parallelNote[4]~output_o\ : std_logic;
SIGNAL \parallelNote[5]~output_o\ : std_logic;
SIGNAL \parallelNote[6]~output_o\ : std_logic;
SIGNAL \parallelNote[7]~output_o\ : std_logic;
SIGNAL \parallelNote[8]~output_o\ : std_logic;
SIGNAL \parallelNote[9]~output_o\ : std_logic;
SIGNAL \parallelNote[10]~output_o\ : std_logic;
SIGNAL \parallelNote[11]~output_o\ : std_logic;
SIGNAL \parallelNote[12]~output_o\ : std_logic;
SIGNAL \parallelNote[13]~output_o\ : std_logic;
SIGNAL \parallelNote[14]~output_o\ : std_logic;
SIGNAL \parallelNote[15]~output_o\ : std_logic;
SIGNAL \parallelNote[16]~output_o\ : std_logic;
SIGNAL \parallelNote[17]~output_o\ : std_logic;
SIGNAL \parallelNote[18]~output_o\ : std_logic;
SIGNAL \parallelNote[19]~output_o\ : std_logic;
SIGNAL \parallelNote[20]~output_o\ : std_logic;
SIGNAL \parallelNote[21]~output_o\ : std_logic;
SIGNAL \parallelNote[22]~output_o\ : std_logic;
SIGNAL \parallelNote[23]~output_o\ : std_logic;
SIGNAL \parallelNote[24]~output_o\ : std_logic;
SIGNAL \i_IO|clk_count~0_combout\ : std_logic;
SIGNAL \i_IO|clk_count~q\ : std_logic;
SIGNAL \i_IO|clk_tmp~0_combout\ : std_logic;
SIGNAL \i_IO|clk_tmp~feeder_combout\ : std_logic;
SIGNAL \i_IO|clk_tmp~q\ : std_logic;
SIGNAL \i_IO|clk_tmp~clkctrl_outclk\ : std_logic;
SIGNAL \serial_in~input_o\ : std_logic;
SIGNAL \i_IO|serial1~q\ : std_logic;
SIGNAL \i_IO|serial2~q\ : std_logic;
SIGNAL \button_n~input_o\ : std_logic;
SIGNAL \i_IO|button1_n~q\ : std_logic;
SIGNAL \i_IO|button2_n~q\ : std_logic;
SIGNAL \i_UART_RX|i_Flanken_Det|q1~q\ : std_logic;
SIGNAL \i_UART_RX|i_Flanken_Det|edge~0_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Flanken_Det|edge~q\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|data_start~combout\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|Add1~26_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|Add1~7\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|Add1~9\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|Add1~10_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|Add1~32_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|Add1~35_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|Equal2~0_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|Add1~11\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|Add1~12_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|Add1~34_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|Add1~13\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|Add1~15\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|Add1~16_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|Add1~31_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|Add1~17\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|Add1~18_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|Add1~33_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|Add1~14_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|Add1~28_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|Equal2~1_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|Equal2~2_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|Add1~19\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|Add1~20_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|Add1~30_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|Add1~21\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|Add1~23\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|Add1~24_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|Add1~6_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|baude_tick~8_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|baude_tick~5_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|baude_tick~6_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|Add1~8_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|baude_tick~9_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|baude_tick~7_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|baude_tick~combout\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|sig_startcnt[3]~0_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|sig_startcnt[0]~3_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|sig_startcnt[2]~1_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|Equal0~0_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Abaster|sig_shiftdata[5]~2_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Abaster|sig_shiftdata[0]~1_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Abaster|sig_shiftdata[4]~8_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|baude_tick~4_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Abaster|sig_next_data_valid~0_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Abaster|sig_rx_data_valid~q\ : std_logic;
SIGNAL \i_MIDIDecoder|Selector3~1_combout\ : std_logic;
SIGNAL \i_MIDIDecoder|state.NOTE_RECEIVED~q\ : std_logic;
SIGNAL \i_UART_RX|i_Abaster|sig_shiftdata[7]~7_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Abaster|sig_shiftdata[6]~0_combout\ : std_logic;
SIGNAL \i_MIDIDecoder|Selector0~0_combout\ : std_logic;
SIGNAL \i_MIDIDecoder|Selector0~1_combout\ : std_logic;
SIGNAL \i_MIDIDecoder|state.IDLE~q\ : std_logic;
SIGNAL \i_MIDIDecoder|note_geg[3]~0_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Abaster|sig_shiftdata[3]~4_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Abaster|sig_shiftdata[2]~5_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Abaster|sig_shiftdata[1]~6_combout\ : std_logic;
SIGNAL \i_MIDIDecoder|ch_geg[0]~0_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Abaster|sig_shiftdata[0]~3_combout\ : std_logic;
SIGNAL \i_MIDIDecoder|ch_geg[0]~1_combout\ : std_logic;
SIGNAL \i_MIDIDecoder|noteEN_folge~0_combout\ : std_logic;
SIGNAL \i_MIDIDecoder|noteEN_folge~1_combout\ : std_logic;
SIGNAL \i_MIDIDecoder|noteEN_geg~q\ : std_logic;
SIGNAL \i_NoteToParallel|logic~0_combout\ : std_logic;
SIGNAL \i_NoteToParallel|Decoder0~9_combout\ : std_logic;
SIGNAL \i_MIDIDecoder|Equal2~0_combout\ : std_logic;
SIGNAL \i_MIDIDecoder|Equal2~1_combout\ : std_logic;
SIGNAL \i_MIDIDecoder|Equal2~2_combout\ : std_logic;
SIGNAL \i_MIDIDecoder|noteOnOff_geg~0_combout\ : std_logic;
SIGNAL \i_MIDIDecoder|noteOnOff_geg~q\ : std_logic;
SIGNAL \i_NoteToParallel|parallelNote_geg[0]~0_combout\ : std_logic;
SIGNAL \i_NoteToParallel|Decoder0~10_combout\ : std_logic;
SIGNAL \i_NoteToParallel|parallelNote_geg[1]~1_combout\ : std_logic;
SIGNAL \i_NoteToParallel|parallelNote_geg[2]~2_combout\ : std_logic;
SIGNAL \i_NoteToParallel|Decoder0~26_combout\ : std_logic;
SIGNAL \i_MIDIDecoder|note_geg[0]~1_combout\ : std_logic;
SIGNAL \i_NoteToParallel|Decoder0~13_combout\ : std_logic;
SIGNAL \i_NoteToParallel|parallelNote_geg[3]~3_combout\ : std_logic;
SIGNAL \i_NoteToParallel|Decoder0~27_combout\ : std_logic;
SIGNAL \i_NoteToParallel|parallelNote_geg[4]~4_combout\ : std_logic;
SIGNAL \i_NoteToParallel|Decoder0~14_combout\ : std_logic;
SIGNAL \i_NoteToParallel|Decoder0~11_combout\ : std_logic;
SIGNAL \i_NoteToParallel|parallelNote_geg[5]~5_combout\ : std_logic;
SIGNAL \i_NoteToParallel|parallelNote_geg[6]~6_combout\ : std_logic;
SIGNAL \i_NoteToParallel|parallelNote_geg[7]~7_combout\ : std_logic;
SIGNAL \i_NoteToParallel|parallelNote_geg[8]~8_combout\ : std_logic;
SIGNAL \i_NoteToParallel|Decoder0~15_combout\ : std_logic;
SIGNAL \i_NoteToParallel|parallelNote_geg[9]~9_combout\ : std_logic;
SIGNAL \i_NoteToParallel|Decoder0~16_combout\ : std_logic;
SIGNAL \i_NoteToParallel|Decoder0~17_combout\ : std_logic;
SIGNAL \i_NoteToParallel|parallelNote_geg[10]~10_combout\ : std_logic;
SIGNAL \i_NoteToParallel|Decoder0~18_combout\ : std_logic;
SIGNAL \i_NoteToParallel|parallelNote_geg[11]~11_combout\ : std_logic;
SIGNAL \i_NoteToParallel|parallelNote_geg[12]~12_combout\ : std_logic;
SIGNAL \i_NoteToParallel|parallelNote_geg[13]~13_combout\ : std_logic;
SIGNAL \i_NoteToParallel|Decoder0~19_combout\ : std_logic;
SIGNAL \i_NoteToParallel|parallelNote_geg[14]~14_combout\ : std_logic;
SIGNAL \i_NoteToParallel|parallelNote_geg[15]~15_combout\ : std_logic;
SIGNAL \i_NoteToParallel|Decoder0~20_combout\ : std_logic;
SIGNAL \i_NoteToParallel|parallelNote_geg[16]~16_combout\ : std_logic;
SIGNAL \i_NoteToParallel|parallelNote_geg[17]~17_combout\ : std_logic;
SIGNAL \i_NoteToParallel|Decoder0~22_combout\ : std_logic;
SIGNAL \i_NoteToParallel|parallelNote_geg[18]~18_combout\ : std_logic;
SIGNAL \i_NoteToParallel|parallelNote_geg[19]~19_combout\ : std_logic;
SIGNAL \i_NoteToParallel|parallelNote_geg[20]~20_combout\ : std_logic;
SIGNAL \i_NoteToParallel|parallelNote_geg[21]~21_combout\ : std_logic;
SIGNAL \i_NoteToParallel|Decoder0~23_combout\ : std_logic;
SIGNAL \i_NoteToParallel|parallelNote_geg[22]~22_combout\ : std_logic;
SIGNAL \i_NoteToParallel|Decoder0~24_combout\ : std_logic;
SIGNAL \i_NoteToParallel|parallelNote_geg[23]~23_combout\ : std_logic;
SIGNAL \i_NoteToParallel|Decoder0~25_combout\ : std_logic;
SIGNAL \i_NoteToParallel|parallelNote_geg[24]~24_combout\ : std_logic;
SIGNAL \i_UART_RX|i_Tick_Generator|sig_startcnt\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \i_UART_RX|i_Tick_Generator|sig_baude_counter\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \i_UART_RX|i_Abaster|sig_data_out\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \i_NoteToParallel|parallelNote_geg\ : std_logic_vector(24 DOWNTO 0);
SIGNAL \i_MIDIDecoder|note_geg\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \i_MIDIDecoder|cmd_geg\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \i_MIDIDecoder|ch_geg\ : std_logic_vector(3 DOWNTO 0);

BEGIN

ww_clk <= clk;
ww_serial_in <= serial_in;
ww_button_n <= button_n;
parallelNote <= ww_parallelNote;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);

\i_IO|clk_tmp~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \i_IO|clk_tmp~q\);

-- Location: LCCOMB_X83_Y72_N26
\i_UART_RX|i_Tick_Generator|Add1~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Tick_Generator|Add1~22_combout\ = (\i_UART_RX|i_Tick_Generator|sig_baude_counter\(8) & ((GND) # (!\i_UART_RX|i_Tick_Generator|Add1~21\))) # (!\i_UART_RX|i_Tick_Generator|sig_baude_counter\(8) & (\i_UART_RX|i_Tick_Generator|Add1~21\ $ (GND)))
-- \i_UART_RX|i_Tick_Generator|Add1~23\ = CARRY((\i_UART_RX|i_Tick_Generator|sig_baude_counter\(8)) # (!\i_UART_RX|i_Tick_Generator|Add1~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \i_UART_RX|i_Tick_Generator|sig_baude_counter\(8),
	datad => VCC,
	cin => \i_UART_RX|i_Tick_Generator|Add1~21\,
	combout => \i_UART_RX|i_Tick_Generator|Add1~22_combout\,
	cout => \i_UART_RX|i_Tick_Generator|Add1~23\);

-- Location: LCCOMB_X79_Y72_N18
\i_NoteToParallel|Decoder0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|Decoder0~8_combout\ = (!\i_MIDIDecoder|note_geg\(2) & (!\i_MIDIDecoder|note_geg\(1) & !\i_MIDIDecoder|note_geg\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_MIDIDecoder|note_geg\(2),
	datab => \i_MIDIDecoder|note_geg\(1),
	datad => \i_MIDIDecoder|note_geg\(0),
	combout => \i_NoteToParallel|Decoder0~8_combout\);

-- Location: LCCOMB_X76_Y72_N12
\i_NoteToParallel|Decoder0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|Decoder0~12_combout\ = (\i_NoteToParallel|Decoder0~26_combout\ & (!\i_MIDIDecoder|note_geg\(0) & (!\i_MIDIDecoder|note_geg\(3) & \i_MIDIDecoder|note_geg\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_NoteToParallel|Decoder0~26_combout\,
	datab => \i_MIDIDecoder|note_geg\(0),
	datac => \i_MIDIDecoder|note_geg\(3),
	datad => \i_MIDIDecoder|note_geg\(1),
	combout => \i_NoteToParallel|Decoder0~12_combout\);

-- Location: LCCOMB_X76_Y72_N10
\i_NoteToParallel|Decoder0~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|Decoder0~21_combout\ = (\i_NoteToParallel|Decoder0~20_combout\ & (\i_MIDIDecoder|note_geg\(0) & !\i_MIDIDecoder|note_geg\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_NoteToParallel|Decoder0~20_combout\,
	datab => \i_MIDIDecoder|note_geg\(0),
	datad => \i_MIDIDecoder|note_geg\(2),
	combout => \i_NoteToParallel|Decoder0~21_combout\);

-- Location: FF_X77_Y72_N23
\i_MIDIDecoder|cmd_geg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_MIDIDecoder|Selector11~1_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_MIDIDecoder|cmd_geg\(0));

-- Location: FF_X79_Y72_N1
\i_MIDIDecoder|state.VELOCITY_RECEIVED\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	asdata => \i_MIDIDecoder|next_state.VELOCITY_RECEIVED~0_combout\,
	clrn => \i_IO|button2_n~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_MIDIDecoder|state.VELOCITY_RECEIVED~q\);

-- Location: FF_X80_Y72_N5
\i_MIDIDecoder|ch_geg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	asdata => \i_UART_RX|i_Abaster|sig_data_out\(2),
	clrn => \i_IO|button2_n~q\,
	sload => VCC,
	ena => \i_MIDIDecoder|ch_geg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_MIDIDecoder|ch_geg\(2));

-- Location: FF_X77_Y72_N9
\i_MIDIDecoder|state.NOTE_ON\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_MIDIDecoder|Selector2~0_combout\,
	clrn => \i_IO|button2_n~q\,
	ena => \i_UART_RX|i_Abaster|sig_rx_data_valid~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_MIDIDecoder|state.NOTE_ON~q\);

-- Location: LCCOMB_X77_Y72_N10
\i_MIDIDecoder|Selector11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_MIDIDecoder|Selector11~0_combout\ = (!\i_MIDIDecoder|state.VELOCITY_RECEIVED~q\ & ((\i_MIDIDecoder|state.IDLE~q\) # ((\i_UART_RX|i_Abaster|sig_data_out\(7) & \i_UART_RX|i_Abaster|sig_rx_data_valid~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_MIDIDecoder|state.VELOCITY_RECEIVED~q\,
	datab => \i_UART_RX|i_Abaster|sig_data_out\(7),
	datac => \i_MIDIDecoder|state.IDLE~q\,
	datad => \i_UART_RX|i_Abaster|sig_rx_data_valid~q\,
	combout => \i_MIDIDecoder|Selector11~0_combout\);

-- Location: LCCOMB_X77_Y72_N22
\i_MIDIDecoder|Selector11~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_MIDIDecoder|Selector11~1_combout\ = (\i_MIDIDecoder|state.NOTE_ON~q\) # ((\i_MIDIDecoder|cmd_geg\(0) & ((\i_MIDIDecoder|state.NOTE_RECEIVED~q\) # (!\i_MIDIDecoder|Selector11~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_MIDIDecoder|Selector11~0_combout\,
	datab => \i_MIDIDecoder|state.NOTE_RECEIVED~q\,
	datac => \i_MIDIDecoder|cmd_geg\(0),
	datad => \i_MIDIDecoder|state.NOTE_ON~q\,
	combout => \i_MIDIDecoder|Selector11~1_combout\);

-- Location: FF_X77_Y72_N1
\i_MIDIDecoder|state.NOTE_OFF\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_MIDIDecoder|Selector1~0_combout\,
	clrn => \i_IO|button2_n~q\,
	ena => \i_UART_RX|i_Abaster|sig_rx_data_valid~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_MIDIDecoder|state.NOTE_OFF~q\);

-- Location: LCCOMB_X77_Y72_N26
\i_MIDIDecoder|Selector3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_MIDIDecoder|Selector3~0_combout\ = (\i_MIDIDecoder|state.NOTE_ON~q\) # ((\i_MIDIDecoder|state.NOTE_OFF~q\) # ((!\i_MIDIDecoder|state.IDLE~q\ & !\i_UART_RX|i_Abaster|sig_data_out\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_MIDIDecoder|state.NOTE_ON~q\,
	datab => \i_MIDIDecoder|state.NOTE_OFF~q\,
	datac => \i_MIDIDecoder|state.IDLE~q\,
	datad => \i_UART_RX|i_Abaster|sig_data_out\(7),
	combout => \i_MIDIDecoder|Selector3~0_combout\);

-- Location: FF_X81_Y72_N13
\i_UART_RX|i_Tick_Generator|sig_startcnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_UART_RX|i_Tick_Generator|sig_startcnt[1]~2_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_UART_RX|i_Tick_Generator|sig_startcnt\(1));

-- Location: FF_X82_Y72_N11
\i_UART_RX|i_Tick_Generator|sig_baude_counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_UART_RX|i_Tick_Generator|Add1~29_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_UART_RX|i_Tick_Generator|sig_baude_counter\(8));

-- Location: FF_X83_Y72_N7
\i_UART_RX|i_Tick_Generator|sig_baude_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_UART_RX|i_Tick_Generator|Add1~27_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_UART_RX|i_Tick_Generator|sig_baude_counter\(1));

-- Location: LCCOMB_X83_Y72_N6
\i_UART_RX|i_Tick_Generator|Add1~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Tick_Generator|Add1~27_combout\ = (\i_UART_RX|i_Tick_Generator|Add1~8_combout\ & !\i_UART_RX|i_Tick_Generator|Equal2~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_UART_RX|i_Tick_Generator|Add1~8_combout\,
	datad => \i_UART_RX|i_Tick_Generator|Equal2~2_combout\,
	combout => \i_UART_RX|i_Tick_Generator|Add1~27_combout\);

-- Location: LCCOMB_X77_Y72_N16
\i_MIDIDecoder|next_state.VELOCITY_RECEIVED~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_MIDIDecoder|next_state.VELOCITY_RECEIVED~0_combout\ = (\i_MIDIDecoder|state.NOTE_RECEIVED~q\ & \i_UART_RX|i_Abaster|sig_rx_data_valid~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_MIDIDecoder|state.NOTE_RECEIVED~q\,
	datad => \i_UART_RX|i_Abaster|sig_rx_data_valid~q\,
	combout => \i_MIDIDecoder|next_state.VELOCITY_RECEIVED~0_combout\);

-- Location: LCCOMB_X77_Y72_N8
\i_MIDIDecoder|Selector2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_MIDIDecoder|Selector2~0_combout\ = (\i_UART_RX|i_Abaster|sig_data_out\(4) & (!\i_MIDIDecoder|state.IDLE~q\ & (\i_MIDIDecoder|Equal2~0_combout\ & \i_UART_RX|i_Abaster|sig_data_out\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_UART_RX|i_Abaster|sig_data_out\(4),
	datab => \i_MIDIDecoder|state.IDLE~q\,
	datac => \i_MIDIDecoder|Equal2~0_combout\,
	datad => \i_UART_RX|i_Abaster|sig_data_out\(7),
	combout => \i_MIDIDecoder|Selector2~0_combout\);

-- Location: LCCOMB_X77_Y72_N0
\i_MIDIDecoder|Selector1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_MIDIDecoder|Selector1~0_combout\ = (!\i_UART_RX|i_Abaster|sig_data_out\(4) & (!\i_MIDIDecoder|state.IDLE~q\ & (\i_MIDIDecoder|Equal2~0_combout\ & \i_UART_RX|i_Abaster|sig_data_out\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_UART_RX|i_Abaster|sig_data_out\(4),
	datab => \i_MIDIDecoder|state.IDLE~q\,
	datac => \i_MIDIDecoder|Equal2~0_combout\,
	datad => \i_UART_RX|i_Abaster|sig_data_out\(7),
	combout => \i_MIDIDecoder|Selector1~0_combout\);

-- Location: LCCOMB_X83_Y72_N4
\i_UART_RX|i_Tick_Generator|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Tick_Generator|Equal0~1_combout\ = (!\i_UART_RX|i_Tick_Generator|sig_startcnt\(1) & (!\i_UART_RX|i_Tick_Generator|sig_startcnt\(0) & !\i_UART_RX|i_Tick_Generator|sig_startcnt\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_UART_RX|i_Tick_Generator|sig_startcnt\(1),
	datac => \i_UART_RX|i_Tick_Generator|sig_startcnt\(0),
	datad => \i_UART_RX|i_Tick_Generator|sig_startcnt\(2),
	combout => \i_UART_RX|i_Tick_Generator|Equal0~1_combout\);

-- Location: LCCOMB_X81_Y72_N12
\i_UART_RX|i_Tick_Generator|sig_startcnt[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Tick_Generator|sig_startcnt[1]~2_combout\ = \i_UART_RX|i_Tick_Generator|sig_startcnt\(1) $ (((!\i_UART_RX|i_Tick_Generator|sig_startcnt\(0) & \i_UART_RX|i_Tick_Generator|baude_tick~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_UART_RX|i_Tick_Generator|sig_startcnt\(0),
	datac => \i_UART_RX|i_Tick_Generator|sig_startcnt\(1),
	datad => \i_UART_RX|i_Tick_Generator|baude_tick~combout\,
	combout => \i_UART_RX|i_Tick_Generator|sig_startcnt[1]~2_combout\);

-- Location: FF_X81_Y72_N17
\i_UART_RX|i_Flanken_Det|q2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	asdata => \i_UART_RX|i_Flanken_Det|q1~q\,
	clrn => \i_IO|button2_n~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_UART_RX|i_Flanken_Det|q2~q\);

-- Location: LCCOMB_X82_Y72_N10
\i_UART_RX|i_Tick_Generator|Add1~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Tick_Generator|Add1~29_combout\ = (\i_UART_RX|i_Tick_Generator|Equal2~2_combout\ & ((\i_UART_RX|i_Tick_Generator|Equal0~0_combout\))) # (!\i_UART_RX|i_Tick_Generator|Equal2~2_combout\ & (\i_UART_RX|i_Tick_Generator|Add1~22_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_UART_RX|i_Tick_Generator|Add1~22_combout\,
	datab => \i_UART_RX|i_Tick_Generator|Equal0~0_combout\,
	datac => \i_UART_RX|i_Tick_Generator|Equal2~2_combout\,
	combout => \i_UART_RX|i_Tick_Generator|Add1~29_combout\);

-- Location: LCCOMB_X76_Y72_N26
\i_NoteToParallel|Decoder0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|Decoder0~28_combout\ = (\i_NoteToParallel|Decoder0~20_combout\ & (\i_MIDIDecoder|note_geg\(2) & !\i_MIDIDecoder|note_geg\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_NoteToParallel|Decoder0~20_combout\,
	datab => \i_MIDIDecoder|note_geg\(2),
	datad => \i_MIDIDecoder|note_geg\(1),
	combout => \i_NoteToParallel|Decoder0~28_combout\);

-- Location: IOIBUF_X0_Y36_N15
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G4
\clk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOOBUF_X60_Y73_N16
\parallelNote[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \i_NoteToParallel|parallelNote_geg\(0),
	devoe => ww_devoe,
	o => \parallelNote[0]~output_o\);

-- Location: IOOBUF_X67_Y73_N2
\parallelNote[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \i_NoteToParallel|parallelNote_geg\(1),
	devoe => ww_devoe,
	o => \parallelNote[1]~output_o\);

-- Location: IOOBUF_X65_Y73_N9
\parallelNote[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \i_NoteToParallel|parallelNote_geg\(2),
	devoe => ww_devoe,
	o => \parallelNote[2]~output_o\);

-- Location: IOOBUF_X58_Y73_N2
\parallelNote[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \i_NoteToParallel|parallelNote_geg\(3),
	devoe => ww_devoe,
	o => \parallelNote[3]~output_o\);

-- Location: IOOBUF_X67_Y73_N9
\parallelNote[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \i_NoteToParallel|parallelNote_geg\(4),
	devoe => ww_devoe,
	o => \parallelNote[4]~output_o\);

-- Location: IOOBUF_X65_Y73_N16
\parallelNote[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \i_NoteToParallel|parallelNote_geg\(5),
	devoe => ww_devoe,
	o => \parallelNote[5]~output_o\);

-- Location: IOOBUF_X65_Y73_N23
\parallelNote[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \i_NoteToParallel|parallelNote_geg\(6),
	devoe => ww_devoe,
	o => \parallelNote[6]~output_o\);

-- Location: IOOBUF_X60_Y73_N23
\parallelNote[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \i_NoteToParallel|parallelNote_geg\(7),
	devoe => ww_devoe,
	o => \parallelNote[7]~output_o\);

-- Location: IOOBUF_X83_Y73_N23
\parallelNote[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \i_NoteToParallel|parallelNote_geg\(8),
	devoe => ww_devoe,
	o => \parallelNote[8]~output_o\);

-- Location: IOOBUF_X69_Y73_N2
\parallelNote[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \i_NoteToParallel|parallelNote_geg\(9),
	devoe => ww_devoe,
	o => \parallelNote[9]~output_o\);

-- Location: IOOBUF_X72_Y73_N2
\parallelNote[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \i_NoteToParallel|parallelNote_geg\(10),
	devoe => ww_devoe,
	o => \parallelNote[10]~output_o\);

-- Location: IOOBUF_X72_Y73_N9
\parallelNote[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \i_NoteToParallel|parallelNote_geg\(11),
	devoe => ww_devoe,
	o => \parallelNote[11]~output_o\);

-- Location: IOOBUF_X87_Y73_N9
\parallelNote[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \i_NoteToParallel|parallelNote_geg\(12),
	devoe => ww_devoe,
	o => \parallelNote[12]~output_o\);

-- Location: IOOBUF_X87_Y73_N16
\parallelNote[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \i_NoteToParallel|parallelNote_geg\(13),
	devoe => ww_devoe,
	o => \parallelNote[13]~output_o\);

-- Location: IOOBUF_X107_Y73_N16
\parallelNote[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \i_NoteToParallel|parallelNote_geg\(14),
	devoe => ww_devoe,
	o => \parallelNote[14]~output_o\);

-- Location: IOOBUF_X94_Y73_N9
\parallelNote[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \i_NoteToParallel|parallelNote_geg\(15),
	devoe => ww_devoe,
	o => \parallelNote[15]~output_o\);

-- Location: IOOBUF_X94_Y73_N2
\parallelNote[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \i_NoteToParallel|parallelNote_geg\(16),
	devoe => ww_devoe,
	o => \parallelNote[16]~output_o\);

-- Location: IOOBUF_X69_Y73_N16
\parallelNote[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \i_NoteToParallel|parallelNote_geg\(17),
	devoe => ww_devoe,
	o => \parallelNote[17]~output_o\);

-- Location: IOOBUF_X74_Y73_N23
\parallelNote[18]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \i_NoteToParallel|parallelNote_geg\(18),
	devoe => ww_devoe,
	o => \parallelNote[18]~output_o\);

-- Location: IOOBUF_X72_Y73_N23
\parallelNote[19]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \i_NoteToParallel|parallelNote_geg\(19),
	devoe => ww_devoe,
	o => \parallelNote[19]~output_o\);

-- Location: IOOBUF_X74_Y73_N16
\parallelNote[20]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \i_NoteToParallel|parallelNote_geg\(20),
	devoe => ww_devoe,
	o => \parallelNote[20]~output_o\);

-- Location: IOOBUF_X72_Y73_N16
\parallelNote[21]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \i_NoteToParallel|parallelNote_geg\(21),
	devoe => ww_devoe,
	o => \parallelNote[21]~output_o\);

-- Location: IOOBUF_X85_Y73_N23
\parallelNote[22]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \i_NoteToParallel|parallelNote_geg\(22),
	devoe => ww_devoe,
	o => \parallelNote[22]~output_o\);

-- Location: IOOBUF_X83_Y73_N2
\parallelNote[23]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \i_NoteToParallel|parallelNote_geg\(23),
	devoe => ww_devoe,
	o => \parallelNote[23]~output_o\);

-- Location: IOOBUF_X111_Y73_N9
\parallelNote[24]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \i_NoteToParallel|parallelNote_geg\(24),
	devoe => ww_devoe,
	o => \parallelNote[24]~output_o\);

-- Location: LCCOMB_X114_Y37_N18
\i_IO|clk_count~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_IO|clk_count~0_combout\ = !\i_IO|clk_count~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \i_IO|clk_count~q\,
	combout => \i_IO|clk_count~0_combout\);

-- Location: FF_X114_Y37_N19
\i_IO|clk_count\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \i_IO|clk_count~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_IO|clk_count~q\);

-- Location: LCCOMB_X114_Y37_N0
\i_IO|clk_tmp~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_IO|clk_tmp~0_combout\ = \i_IO|clk_tmp~q\ $ (\i_IO|clk_count~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \i_IO|clk_tmp~q\,
	datad => \i_IO|clk_count~q\,
	combout => \i_IO|clk_tmp~0_combout\);

-- Location: LCCOMB_X114_Y37_N16
\i_IO|clk_tmp~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_IO|clk_tmp~feeder_combout\ = \i_IO|clk_tmp~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \i_IO|clk_tmp~0_combout\,
	combout => \i_IO|clk_tmp~feeder_combout\);

-- Location: FF_X114_Y37_N17
\i_IO|clk_tmp\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \i_IO|clk_tmp~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_IO|clk_tmp~q\);

-- Location: CLKCTRL_G7
\i_IO|clk_tmp~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \i_IO|clk_tmp~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \i_IO|clk_tmp~clkctrl_outclk\);

-- Location: IOIBUF_X89_Y0_N8
\serial_in~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_serial_in,
	o => \serial_in~input_o\);

-- Location: FF_X83_Y72_N15
\i_IO|serial1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	asdata => \serial_in~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_IO|serial1~q\);

-- Location: FF_X82_Y72_N21
\i_IO|serial2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	asdata => \i_IO|serial1~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_IO|serial2~q\);

-- Location: IOIBUF_X115_Y40_N8
\button_n~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_button_n,
	o => \button_n~input_o\);

-- Location: FF_X80_Y72_N27
\i_IO|button1_n\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	asdata => \button_n~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_IO|button1_n~q\);

-- Location: FF_X80_Y72_N3
\i_IO|button2_n\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	asdata => \i_IO|button1_n~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_IO|button2_n~q\);

-- Location: FF_X81_Y72_N15
\i_UART_RX|i_Flanken_Det|q1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	asdata => \i_IO|serial2~q\,
	clrn => \i_IO|button2_n~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_UART_RX|i_Flanken_Det|q1~q\);

-- Location: LCCOMB_X83_Y72_N30
\i_UART_RX|i_Flanken_Det|edge~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Flanken_Det|edge~0_combout\ = (\i_UART_RX|i_Flanken_Det|q2~q\ & !\i_UART_RX|i_Flanken_Det|q1~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_UART_RX|i_Flanken_Det|q2~q\,
	datac => \i_UART_RX|i_Flanken_Det|q1~q\,
	combout => \i_UART_RX|i_Flanken_Det|edge~0_combout\);

-- Location: FF_X82_Y72_N19
\i_UART_RX|i_Flanken_Det|edge\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	asdata => \i_UART_RX|i_Flanken_Det|edge~0_combout\,
	clrn => \i_IO|button2_n~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_UART_RX|i_Flanken_Det|edge~q\);

-- Location: LCCOMB_X81_Y72_N14
\i_UART_RX|i_Tick_Generator|data_start\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Tick_Generator|data_start~combout\ = (!\i_UART_RX|i_Tick_Generator|Equal0~0_combout\ & \i_UART_RX|i_Flanken_Det|edge~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_UART_RX|i_Tick_Generator|Equal0~0_combout\,
	datad => \i_UART_RX|i_Flanken_Det|edge~q\,
	combout => \i_UART_RX|i_Tick_Generator|data_start~combout\);

-- Location: LCCOMB_X83_Y72_N0
\i_UART_RX|i_Tick_Generator|Add1~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Tick_Generator|Add1~26_combout\ = (\i_UART_RX|i_Tick_Generator|Add1~6_combout\ & !\i_UART_RX|i_Tick_Generator|Equal2~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_UART_RX|i_Tick_Generator|Add1~6_combout\,
	datad => \i_UART_RX|i_Tick_Generator|Equal2~2_combout\,
	combout => \i_UART_RX|i_Tick_Generator|Add1~26_combout\);

-- Location: FF_X83_Y72_N1
\i_UART_RX|i_Tick_Generator|sig_baude_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_UART_RX|i_Tick_Generator|Add1~26_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_UART_RX|i_Tick_Generator|sig_baude_counter\(0));

-- Location: LCCOMB_X83_Y72_N10
\i_UART_RX|i_Tick_Generator|Add1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Tick_Generator|Add1~6_combout\ = \i_UART_RX|i_Tick_Generator|sig_baude_counter\(0) $ (VCC)
-- \i_UART_RX|i_Tick_Generator|Add1~7\ = CARRY(\i_UART_RX|i_Tick_Generator|sig_baude_counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_UART_RX|i_Tick_Generator|sig_baude_counter\(0),
	datad => VCC,
	combout => \i_UART_RX|i_Tick_Generator|Add1~6_combout\,
	cout => \i_UART_RX|i_Tick_Generator|Add1~7\);

-- Location: LCCOMB_X83_Y72_N12
\i_UART_RX|i_Tick_Generator|Add1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Tick_Generator|Add1~8_combout\ = (\i_UART_RX|i_Tick_Generator|sig_baude_counter\(1) & (\i_UART_RX|i_Tick_Generator|Add1~7\ & VCC)) # (!\i_UART_RX|i_Tick_Generator|sig_baude_counter\(1) & (!\i_UART_RX|i_Tick_Generator|Add1~7\))
-- \i_UART_RX|i_Tick_Generator|Add1~9\ = CARRY((!\i_UART_RX|i_Tick_Generator|sig_baude_counter\(1) & !\i_UART_RX|i_Tick_Generator|Add1~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \i_UART_RX|i_Tick_Generator|sig_baude_counter\(1),
	datad => VCC,
	cin => \i_UART_RX|i_Tick_Generator|Add1~7\,
	combout => \i_UART_RX|i_Tick_Generator|Add1~8_combout\,
	cout => \i_UART_RX|i_Tick_Generator|Add1~9\);

-- Location: LCCOMB_X83_Y72_N14
\i_UART_RX|i_Tick_Generator|Add1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Tick_Generator|Add1~10_combout\ = (\i_UART_RX|i_Tick_Generator|sig_baude_counter\(2) & ((GND) # (!\i_UART_RX|i_Tick_Generator|Add1~9\))) # (!\i_UART_RX|i_Tick_Generator|sig_baude_counter\(2) & (\i_UART_RX|i_Tick_Generator|Add1~9\ $ (GND)))
-- \i_UART_RX|i_Tick_Generator|Add1~11\ = CARRY((\i_UART_RX|i_Tick_Generator|sig_baude_counter\(2)) # (!\i_UART_RX|i_Tick_Generator|Add1~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \i_UART_RX|i_Tick_Generator|sig_baude_counter\(2),
	datad => VCC,
	cin => \i_UART_RX|i_Tick_Generator|Add1~9\,
	combout => \i_UART_RX|i_Tick_Generator|Add1~10_combout\,
	cout => \i_UART_RX|i_Tick_Generator|Add1~11\);

-- Location: LCCOMB_X83_Y72_N8
\i_UART_RX|i_Tick_Generator|Add1~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Tick_Generator|Add1~32_combout\ = (\i_UART_RX|i_Tick_Generator|Add1~10_combout\ & !\i_UART_RX|i_Tick_Generator|Equal2~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \i_UART_RX|i_Tick_Generator|Add1~10_combout\,
	datad => \i_UART_RX|i_Tick_Generator|Equal2~2_combout\,
	combout => \i_UART_RX|i_Tick_Generator|Add1~32_combout\);

-- Location: FF_X83_Y72_N9
\i_UART_RX|i_Tick_Generator|sig_baude_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_UART_RX|i_Tick_Generator|Add1~32_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_UART_RX|i_Tick_Generator|sig_baude_counter\(2));

-- Location: LCCOMB_X82_Y72_N0
\i_UART_RX|i_Tick_Generator|Add1~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Tick_Generator|Add1~35_combout\ = (\i_UART_RX|i_Tick_Generator|Equal2~2_combout\ & (!\i_UART_RX|i_Tick_Generator|Equal0~0_combout\ & (\i_UART_RX|i_Flanken_Det|edge~q\))) # (!\i_UART_RX|i_Tick_Generator|Equal2~2_combout\ & 
-- (((\i_UART_RX|i_Tick_Generator|Add1~24_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_UART_RX|i_Tick_Generator|Equal2~2_combout\,
	datab => \i_UART_RX|i_Tick_Generator|Equal0~0_combout\,
	datac => \i_UART_RX|i_Flanken_Det|edge~q\,
	datad => \i_UART_RX|i_Tick_Generator|Add1~24_combout\,
	combout => \i_UART_RX|i_Tick_Generator|Add1~35_combout\);

-- Location: FF_X82_Y72_N1
\i_UART_RX|i_Tick_Generator|sig_baude_counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_UART_RX|i_Tick_Generator|Add1~35_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_UART_RX|i_Tick_Generator|sig_baude_counter\(9));

-- Location: LCCOMB_X82_Y72_N30
\i_UART_RX|i_Tick_Generator|Equal2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Tick_Generator|Equal2~0_combout\ = (!\i_UART_RX|i_Tick_Generator|sig_baude_counter\(8) & (!\i_UART_RX|i_Tick_Generator|sig_baude_counter\(9) & (!\i_UART_RX|i_Tick_Generator|sig_baude_counter\(0) & 
-- !\i_UART_RX|i_Tick_Generator|sig_baude_counter\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_UART_RX|i_Tick_Generator|sig_baude_counter\(8),
	datab => \i_UART_RX|i_Tick_Generator|sig_baude_counter\(9),
	datac => \i_UART_RX|i_Tick_Generator|sig_baude_counter\(0),
	datad => \i_UART_RX|i_Tick_Generator|sig_baude_counter\(7),
	combout => \i_UART_RX|i_Tick_Generator|Equal2~0_combout\);

-- Location: LCCOMB_X83_Y72_N16
\i_UART_RX|i_Tick_Generator|Add1~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Tick_Generator|Add1~12_combout\ = (\i_UART_RX|i_Tick_Generator|sig_baude_counter\(3) & (\i_UART_RX|i_Tick_Generator|Add1~11\ & VCC)) # (!\i_UART_RX|i_Tick_Generator|sig_baude_counter\(3) & (!\i_UART_RX|i_Tick_Generator|Add1~11\))
-- \i_UART_RX|i_Tick_Generator|Add1~13\ = CARRY((!\i_UART_RX|i_Tick_Generator|sig_baude_counter\(3) & !\i_UART_RX|i_Tick_Generator|Add1~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \i_UART_RX|i_Tick_Generator|sig_baude_counter\(3),
	datad => VCC,
	cin => \i_UART_RX|i_Tick_Generator|Add1~11\,
	combout => \i_UART_RX|i_Tick_Generator|Add1~12_combout\,
	cout => \i_UART_RX|i_Tick_Generator|Add1~13\);

-- Location: LCCOMB_X82_Y72_N18
\i_UART_RX|i_Tick_Generator|Add1~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Tick_Generator|Add1~34_combout\ = (\i_UART_RX|i_Tick_Generator|Equal2~2_combout\ & (!\i_UART_RX|i_Tick_Generator|Equal0~0_combout\ & (\i_UART_RX|i_Flanken_Det|edge~q\))) # (!\i_UART_RX|i_Tick_Generator|Equal2~2_combout\ & 
-- (((\i_UART_RX|i_Tick_Generator|Add1~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_UART_RX|i_Tick_Generator|Equal0~0_combout\,
	datab => \i_UART_RX|i_Tick_Generator|Equal2~2_combout\,
	datac => \i_UART_RX|i_Flanken_Det|edge~q\,
	datad => \i_UART_RX|i_Tick_Generator|Add1~12_combout\,
	combout => \i_UART_RX|i_Tick_Generator|Add1~34_combout\);

-- Location: FF_X82_Y72_N7
\i_UART_RX|i_Tick_Generator|sig_baude_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	asdata => \i_UART_RX|i_Tick_Generator|Add1~34_combout\,
	clrn => \i_IO|button2_n~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_UART_RX|i_Tick_Generator|sig_baude_counter\(3));

-- Location: LCCOMB_X83_Y72_N18
\i_UART_RX|i_Tick_Generator|Add1~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Tick_Generator|Add1~14_combout\ = (\i_UART_RX|i_Tick_Generator|sig_baude_counter\(4) & ((GND) # (!\i_UART_RX|i_Tick_Generator|Add1~13\))) # (!\i_UART_RX|i_Tick_Generator|sig_baude_counter\(4) & (\i_UART_RX|i_Tick_Generator|Add1~13\ $ (GND)))
-- \i_UART_RX|i_Tick_Generator|Add1~15\ = CARRY((\i_UART_RX|i_Tick_Generator|sig_baude_counter\(4)) # (!\i_UART_RX|i_Tick_Generator|Add1~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \i_UART_RX|i_Tick_Generator|sig_baude_counter\(4),
	datad => VCC,
	cin => \i_UART_RX|i_Tick_Generator|Add1~13\,
	combout => \i_UART_RX|i_Tick_Generator|Add1~14_combout\,
	cout => \i_UART_RX|i_Tick_Generator|Add1~15\);

-- Location: LCCOMB_X83_Y72_N20
\i_UART_RX|i_Tick_Generator|Add1~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Tick_Generator|Add1~16_combout\ = (\i_UART_RX|i_Tick_Generator|sig_baude_counter\(5) & (\i_UART_RX|i_Tick_Generator|Add1~15\ & VCC)) # (!\i_UART_RX|i_Tick_Generator|sig_baude_counter\(5) & (!\i_UART_RX|i_Tick_Generator|Add1~15\))
-- \i_UART_RX|i_Tick_Generator|Add1~17\ = CARRY((!\i_UART_RX|i_Tick_Generator|sig_baude_counter\(5) & !\i_UART_RX|i_Tick_Generator|Add1~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \i_UART_RX|i_Tick_Generator|sig_baude_counter\(5),
	datad => VCC,
	cin => \i_UART_RX|i_Tick_Generator|Add1~15\,
	combout => \i_UART_RX|i_Tick_Generator|Add1~16_combout\,
	cout => \i_UART_RX|i_Tick_Generator|Add1~17\);

-- Location: LCCOMB_X83_Y72_N2
\i_UART_RX|i_Tick_Generator|Add1~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Tick_Generator|Add1~31_combout\ = (\i_UART_RX|i_Tick_Generator|Add1~16_combout\ & !\i_UART_RX|i_Tick_Generator|Equal2~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_UART_RX|i_Tick_Generator|Add1~16_combout\,
	datad => \i_UART_RX|i_Tick_Generator|Equal2~2_combout\,
	combout => \i_UART_RX|i_Tick_Generator|Add1~31_combout\);

-- Location: FF_X83_Y72_N3
\i_UART_RX|i_Tick_Generator|sig_baude_counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_UART_RX|i_Tick_Generator|Add1~31_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_UART_RX|i_Tick_Generator|sig_baude_counter\(5));

-- Location: LCCOMB_X83_Y72_N22
\i_UART_RX|i_Tick_Generator|Add1~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Tick_Generator|Add1~18_combout\ = (\i_UART_RX|i_Tick_Generator|sig_baude_counter\(6) & ((GND) # (!\i_UART_RX|i_Tick_Generator|Add1~17\))) # (!\i_UART_RX|i_Tick_Generator|sig_baude_counter\(6) & (\i_UART_RX|i_Tick_Generator|Add1~17\ $ (GND)))
-- \i_UART_RX|i_Tick_Generator|Add1~19\ = CARRY((\i_UART_RX|i_Tick_Generator|sig_baude_counter\(6)) # (!\i_UART_RX|i_Tick_Generator|Add1~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \i_UART_RX|i_Tick_Generator|sig_baude_counter\(6),
	datad => VCC,
	cin => \i_UART_RX|i_Tick_Generator|Add1~17\,
	combout => \i_UART_RX|i_Tick_Generator|Add1~18_combout\,
	cout => \i_UART_RX|i_Tick_Generator|Add1~19\);

-- Location: LCCOMB_X82_Y72_N4
\i_UART_RX|i_Tick_Generator|Add1~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Tick_Generator|Add1~33_combout\ = (\i_UART_RX|i_Tick_Generator|Equal2~2_combout\ & (!\i_UART_RX|i_Tick_Generator|Equal0~0_combout\ & (\i_UART_RX|i_Flanken_Det|edge~q\))) # (!\i_UART_RX|i_Tick_Generator|Equal2~2_combout\ & 
-- (((\i_UART_RX|i_Tick_Generator|Add1~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_UART_RX|i_Tick_Generator|Equal0~0_combout\,
	datab => \i_UART_RX|i_Flanken_Det|edge~q\,
	datac => \i_UART_RX|i_Tick_Generator|Equal2~2_combout\,
	datad => \i_UART_RX|i_Tick_Generator|Add1~18_combout\,
	combout => \i_UART_RX|i_Tick_Generator|Add1~33_combout\);

-- Location: FF_X82_Y72_N5
\i_UART_RX|i_Tick_Generator|sig_baude_counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_UART_RX|i_Tick_Generator|Add1~33_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_UART_RX|i_Tick_Generator|sig_baude_counter\(6));

-- Location: LCCOMB_X82_Y72_N12
\i_UART_RX|i_Tick_Generator|Add1~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Tick_Generator|Add1~28_combout\ = (\i_UART_RX|i_Tick_Generator|Equal2~2_combout\ & ((\i_UART_RX|i_Flanken_Det|edge~q\) # ((\i_UART_RX|i_Tick_Generator|Equal0~0_combout\)))) # (!\i_UART_RX|i_Tick_Generator|Equal2~2_combout\ & 
-- (((\i_UART_RX|i_Tick_Generator|Add1~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_UART_RX|i_Flanken_Det|edge~q\,
	datab => \i_UART_RX|i_Tick_Generator|Equal0~0_combout\,
	datac => \i_UART_RX|i_Tick_Generator|Equal2~2_combout\,
	datad => \i_UART_RX|i_Tick_Generator|Add1~14_combout\,
	combout => \i_UART_RX|i_Tick_Generator|Add1~28_combout\);

-- Location: FF_X82_Y72_N17
\i_UART_RX|i_Tick_Generator|sig_baude_counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	asdata => \i_UART_RX|i_Tick_Generator|Add1~28_combout\,
	clrn => \i_IO|button2_n~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_UART_RX|i_Tick_Generator|sig_baude_counter\(4));

-- Location: LCCOMB_X82_Y72_N16
\i_UART_RX|i_Tick_Generator|Equal2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Tick_Generator|Equal2~1_combout\ = (!\i_UART_RX|i_Tick_Generator|sig_baude_counter\(3) & (!\i_UART_RX|i_Tick_Generator|sig_baude_counter\(6) & (!\i_UART_RX|i_Tick_Generator|sig_baude_counter\(4) & 
-- !\i_UART_RX|i_Tick_Generator|sig_baude_counter\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_UART_RX|i_Tick_Generator|sig_baude_counter\(3),
	datab => \i_UART_RX|i_Tick_Generator|sig_baude_counter\(6),
	datac => \i_UART_RX|i_Tick_Generator|sig_baude_counter\(4),
	datad => \i_UART_RX|i_Tick_Generator|sig_baude_counter\(5),
	combout => \i_UART_RX|i_Tick_Generator|Equal2~1_combout\);

-- Location: LCCOMB_X82_Y72_N14
\i_UART_RX|i_Tick_Generator|Equal2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Tick_Generator|Equal2~2_combout\ = (!\i_UART_RX|i_Tick_Generator|sig_baude_counter\(1) & (!\i_UART_RX|i_Tick_Generator|sig_baude_counter\(2) & (\i_UART_RX|i_Tick_Generator|Equal2~0_combout\ & \i_UART_RX|i_Tick_Generator|Equal2~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_UART_RX|i_Tick_Generator|sig_baude_counter\(1),
	datab => \i_UART_RX|i_Tick_Generator|sig_baude_counter\(2),
	datac => \i_UART_RX|i_Tick_Generator|Equal2~0_combout\,
	datad => \i_UART_RX|i_Tick_Generator|Equal2~1_combout\,
	combout => \i_UART_RX|i_Tick_Generator|Equal2~2_combout\);

-- Location: LCCOMB_X83_Y72_N24
\i_UART_RX|i_Tick_Generator|Add1~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Tick_Generator|Add1~20_combout\ = (\i_UART_RX|i_Tick_Generator|sig_baude_counter\(7) & (\i_UART_RX|i_Tick_Generator|Add1~19\ & VCC)) # (!\i_UART_RX|i_Tick_Generator|sig_baude_counter\(7) & (!\i_UART_RX|i_Tick_Generator|Add1~19\))
-- \i_UART_RX|i_Tick_Generator|Add1~21\ = CARRY((!\i_UART_RX|i_Tick_Generator|sig_baude_counter\(7) & !\i_UART_RX|i_Tick_Generator|Add1~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \i_UART_RX|i_Tick_Generator|sig_baude_counter\(7),
	datad => VCC,
	cin => \i_UART_RX|i_Tick_Generator|Add1~19\,
	combout => \i_UART_RX|i_Tick_Generator|Add1~20_combout\,
	cout => \i_UART_RX|i_Tick_Generator|Add1~21\);

-- Location: LCCOMB_X82_Y72_N28
\i_UART_RX|i_Tick_Generator|Add1~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Tick_Generator|Add1~30_combout\ = (\i_UART_RX|i_Tick_Generator|Equal2~2_combout\ & (\i_UART_RX|i_Tick_Generator|Equal0~0_combout\)) # (!\i_UART_RX|i_Tick_Generator|Equal2~2_combout\ & ((\i_UART_RX|i_Tick_Generator|Add1~20_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_UART_RX|i_Tick_Generator|Equal0~0_combout\,
	datac => \i_UART_RX|i_Tick_Generator|Equal2~2_combout\,
	datad => \i_UART_RX|i_Tick_Generator|Add1~20_combout\,
	combout => \i_UART_RX|i_Tick_Generator|Add1~30_combout\);

-- Location: FF_X82_Y72_N29
\i_UART_RX|i_Tick_Generator|sig_baude_counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_UART_RX|i_Tick_Generator|Add1~30_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_UART_RX|i_Tick_Generator|sig_baude_counter\(7));

-- Location: LCCOMB_X83_Y72_N28
\i_UART_RX|i_Tick_Generator|Add1~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Tick_Generator|Add1~24_combout\ = \i_UART_RX|i_Tick_Generator|sig_baude_counter\(9) $ (!\i_UART_RX|i_Tick_Generator|Add1~23\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \i_UART_RX|i_Tick_Generator|sig_baude_counter\(9),
	cin => \i_UART_RX|i_Tick_Generator|Add1~23\,
	combout => \i_UART_RX|i_Tick_Generator|Add1~24_combout\);

-- Location: LCCOMB_X82_Y72_N2
\i_UART_RX|i_Tick_Generator|baude_tick~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Tick_Generator|baude_tick~8_combout\ = (!\i_UART_RX|i_Tick_Generator|Add1~34_combout\ & ((\i_UART_RX|i_Tick_Generator|Equal2~2_combout\ & (!\i_UART_RX|i_Tick_Generator|data_start~combout\)) # (!\i_UART_RX|i_Tick_Generator|Equal2~2_combout\ & 
-- ((!\i_UART_RX|i_Tick_Generator|Add1~6_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_UART_RX|i_Tick_Generator|data_start~combout\,
	datab => \i_UART_RX|i_Tick_Generator|Equal2~2_combout\,
	datac => \i_UART_RX|i_Tick_Generator|Add1~6_combout\,
	datad => \i_UART_RX|i_Tick_Generator|Add1~34_combout\,
	combout => \i_UART_RX|i_Tick_Generator|baude_tick~8_combout\);

-- Location: LCCOMB_X82_Y72_N8
\i_UART_RX|i_Tick_Generator|baude_tick~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Tick_Generator|baude_tick~5_combout\ = (!\i_UART_RX|i_Tick_Generator|Add1~33_combout\ & (\i_UART_RX|i_Tick_Generator|baude_tick~8_combout\ & ((\i_UART_RX|i_Tick_Generator|Equal2~2_combout\) # (!\i_UART_RX|i_Tick_Generator|Add1~24_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_UART_RX|i_Tick_Generator|Equal2~2_combout\,
	datab => \i_UART_RX|i_Tick_Generator|Add1~24_combout\,
	datac => \i_UART_RX|i_Tick_Generator|Add1~33_combout\,
	datad => \i_UART_RX|i_Tick_Generator|baude_tick~8_combout\,
	combout => \i_UART_RX|i_Tick_Generator|baude_tick~5_combout\);

-- Location: LCCOMB_X82_Y72_N22
\i_UART_RX|i_Tick_Generator|baude_tick~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Tick_Generator|baude_tick~6_combout\ = (\i_UART_RX|i_Tick_Generator|Equal2~2_combout\ & (!\i_UART_RX|i_Tick_Generator|Equal0~0_combout\)) # (!\i_UART_RX|i_Tick_Generator|Equal2~2_combout\ & (((!\i_UART_RX|i_Tick_Generator|Add1~10_combout\ & 
-- !\i_UART_RX|i_Tick_Generator|Add1~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_UART_RX|i_Tick_Generator|Equal0~0_combout\,
	datab => \i_UART_RX|i_Tick_Generator|Equal2~2_combout\,
	datac => \i_UART_RX|i_Tick_Generator|Add1~10_combout\,
	datad => \i_UART_RX|i_Tick_Generator|Add1~20_combout\,
	combout => \i_UART_RX|i_Tick_Generator|baude_tick~6_combout\);

-- Location: LCCOMB_X82_Y72_N20
\i_UART_RX|i_Tick_Generator|baude_tick~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Tick_Generator|baude_tick~9_combout\ = (!\i_UART_RX|i_Tick_Generator|Add1~28_combout\ & ((\i_UART_RX|i_Tick_Generator|Equal2~2_combout\) # (!\i_UART_RX|i_Tick_Generator|Add1~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_UART_RX|i_Tick_Generator|Equal2~2_combout\,
	datab => \i_UART_RX|i_Tick_Generator|Add1~8_combout\,
	datad => \i_UART_RX|i_Tick_Generator|Add1~28_combout\,
	combout => \i_UART_RX|i_Tick_Generator|baude_tick~9_combout\);

-- Location: LCCOMB_X82_Y72_N26
\i_UART_RX|i_Tick_Generator|baude_tick~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Tick_Generator|baude_tick~7_combout\ = (\i_UART_RX|i_Tick_Generator|baude_tick~6_combout\ & (\i_UART_RX|i_Tick_Generator|baude_tick~9_combout\ & ((\i_UART_RX|i_Tick_Generator|Equal2~2_combout\) # 
-- (!\i_UART_RX|i_Tick_Generator|Add1~22_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_UART_RX|i_Tick_Generator|Add1~22_combout\,
	datab => \i_UART_RX|i_Tick_Generator|Equal2~2_combout\,
	datac => \i_UART_RX|i_Tick_Generator|baude_tick~6_combout\,
	datad => \i_UART_RX|i_Tick_Generator|baude_tick~9_combout\,
	combout => \i_UART_RX|i_Tick_Generator|baude_tick~7_combout\);

-- Location: LCCOMB_X81_Y72_N16
\i_UART_RX|i_Tick_Generator|baude_tick\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Tick_Generator|baude_tick~combout\ = (\i_UART_RX|i_Tick_Generator|baude_tick~4_combout\ & (\i_UART_RX|i_Tick_Generator|baude_tick~5_combout\ & \i_UART_RX|i_Tick_Generator|baude_tick~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_UART_RX|i_Tick_Generator|baude_tick~4_combout\,
	datab => \i_UART_RX|i_Tick_Generator|baude_tick~5_combout\,
	datad => \i_UART_RX|i_Tick_Generator|baude_tick~7_combout\,
	combout => \i_UART_RX|i_Tick_Generator|baude_tick~combout\);

-- Location: LCCOMB_X81_Y72_N4
\i_UART_RX|i_Tick_Generator|sig_startcnt[3]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Tick_Generator|sig_startcnt[3]~0_combout\ = (\i_UART_RX|i_Tick_Generator|Equal0~1_combout\ & ((\i_UART_RX|i_Tick_Generator|data_start~combout\) # ((\i_UART_RX|i_Tick_Generator|sig_startcnt\(3) & 
-- !\i_UART_RX|i_Tick_Generator|baude_tick~combout\)))) # (!\i_UART_RX|i_Tick_Generator|Equal0~1_combout\ & ((\i_UART_RX|i_Tick_Generator|sig_startcnt\(3)) # ((\i_UART_RX|i_Tick_Generator|data_start~combout\ & 
-- \i_UART_RX|i_Tick_Generator|baude_tick~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_UART_RX|i_Tick_Generator|Equal0~1_combout\,
	datab => \i_UART_RX|i_Tick_Generator|data_start~combout\,
	datac => \i_UART_RX|i_Tick_Generator|sig_startcnt\(3),
	datad => \i_UART_RX|i_Tick_Generator|baude_tick~combout\,
	combout => \i_UART_RX|i_Tick_Generator|sig_startcnt[3]~0_combout\);

-- Location: FF_X81_Y72_N5
\i_UART_RX|i_Tick_Generator|sig_startcnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_UART_RX|i_Tick_Generator|sig_startcnt[3]~0_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_UART_RX|i_Tick_Generator|sig_startcnt\(3));

-- Location: LCCOMB_X81_Y72_N18
\i_UART_RX|i_Tick_Generator|sig_startcnt[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Tick_Generator|sig_startcnt[0]~3_combout\ = \i_UART_RX|i_Tick_Generator|sig_startcnt\(0) $ (((\i_UART_RX|i_Tick_Generator|baude_tick~4_combout\ & (\i_UART_RX|i_Tick_Generator|baude_tick~5_combout\ & 
-- \i_UART_RX|i_Tick_Generator|baude_tick~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_UART_RX|i_Tick_Generator|baude_tick~4_combout\,
	datab => \i_UART_RX|i_Tick_Generator|baude_tick~5_combout\,
	datac => \i_UART_RX|i_Tick_Generator|sig_startcnt\(0),
	datad => \i_UART_RX|i_Tick_Generator|baude_tick~7_combout\,
	combout => \i_UART_RX|i_Tick_Generator|sig_startcnt[0]~3_combout\);

-- Location: FF_X81_Y72_N19
\i_UART_RX|i_Tick_Generator|sig_startcnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_UART_RX|i_Tick_Generator|sig_startcnt[0]~3_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_UART_RX|i_Tick_Generator|sig_startcnt\(0));

-- Location: LCCOMB_X81_Y72_N8
\i_UART_RX|i_Tick_Generator|sig_startcnt[2]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Tick_Generator|sig_startcnt[2]~1_combout\ = \i_UART_RX|i_Tick_Generator|sig_startcnt\(2) $ (((!\i_UART_RX|i_Tick_Generator|sig_startcnt\(1) & (!\i_UART_RX|i_Tick_Generator|sig_startcnt\(0) & \i_UART_RX|i_Tick_Generator|baude_tick~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_UART_RX|i_Tick_Generator|sig_startcnt\(1),
	datab => \i_UART_RX|i_Tick_Generator|sig_startcnt\(0),
	datac => \i_UART_RX|i_Tick_Generator|sig_startcnt\(2),
	datad => \i_UART_RX|i_Tick_Generator|baude_tick~combout\,
	combout => \i_UART_RX|i_Tick_Generator|sig_startcnt[2]~1_combout\);

-- Location: FF_X81_Y72_N9
\i_UART_RX|i_Tick_Generator|sig_startcnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_UART_RX|i_Tick_Generator|sig_startcnt[2]~1_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_UART_RX|i_Tick_Generator|sig_startcnt\(2));

-- Location: LCCOMB_X81_Y72_N28
\i_UART_RX|i_Tick_Generator|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Tick_Generator|Equal0~0_combout\ = (\i_UART_RX|i_Tick_Generator|sig_startcnt\(1)) # ((\i_UART_RX|i_Tick_Generator|sig_startcnt\(3)) # ((\i_UART_RX|i_Tick_Generator|sig_startcnt\(2)) # (\i_UART_RX|i_Tick_Generator|sig_startcnt\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_UART_RX|i_Tick_Generator|sig_startcnt\(1),
	datab => \i_UART_RX|i_Tick_Generator|sig_startcnt\(3),
	datac => \i_UART_RX|i_Tick_Generator|sig_startcnt\(2),
	datad => \i_UART_RX|i_Tick_Generator|sig_startcnt\(0),
	combout => \i_UART_RX|i_Tick_Generator|Equal0~0_combout\);

-- Location: LCCOMB_X81_Y72_N22
\i_UART_RX|i_Abaster|sig_shiftdata[5]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Abaster|sig_shiftdata[5]~2_combout\ = (\i_UART_RX|i_Abaster|sig_data_out\(6) & ((\i_UART_RX|i_Tick_Generator|Equal0~0_combout\) # (!\i_UART_RX|i_Flanken_Det|edge~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_UART_RX|i_Abaster|sig_data_out\(6),
	datab => \i_UART_RX|i_Tick_Generator|Equal0~0_combout\,
	datad => \i_UART_RX|i_Flanken_Det|edge~q\,
	combout => \i_UART_RX|i_Abaster|sig_shiftdata[5]~2_combout\);

-- Location: LCCOMB_X81_Y72_N0
\i_UART_RX|i_Abaster|sig_shiftdata[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Abaster|sig_shiftdata[0]~1_combout\ = (\i_UART_RX|i_Tick_Generator|data_start~combout\) # ((\i_UART_RX|i_Tick_Generator|baude_tick~4_combout\ & (\i_UART_RX|i_Tick_Generator|baude_tick~5_combout\ & 
-- \i_UART_RX|i_Tick_Generator|baude_tick~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_UART_RX|i_Tick_Generator|baude_tick~4_combout\,
	datab => \i_UART_RX|i_Tick_Generator|data_start~combout\,
	datac => \i_UART_RX|i_Tick_Generator|baude_tick~5_combout\,
	datad => \i_UART_RX|i_Tick_Generator|baude_tick~7_combout\,
	combout => \i_UART_RX|i_Abaster|sig_shiftdata[0]~1_combout\);

-- Location: FF_X81_Y72_N23
\i_UART_RX|i_Abaster|sig_data_out[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_UART_RX|i_Abaster|sig_shiftdata[5]~2_combout\,
	clrn => \i_IO|button2_n~q\,
	ena => \i_UART_RX|i_Abaster|sig_shiftdata[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_UART_RX|i_Abaster|sig_data_out\(5));

-- Location: LCCOMB_X81_Y72_N20
\i_UART_RX|i_Abaster|sig_shiftdata[4]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Abaster|sig_shiftdata[4]~8_combout\ = (\i_UART_RX|i_Abaster|sig_data_out\(5) & ((\i_UART_RX|i_Tick_Generator|Equal0~0_combout\) # (!\i_UART_RX|i_Flanken_Det|edge~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_UART_RX|i_Tick_Generator|Equal0~0_combout\,
	datac => \i_UART_RX|i_Abaster|sig_data_out\(5),
	datad => \i_UART_RX|i_Flanken_Det|edge~q\,
	combout => \i_UART_RX|i_Abaster|sig_shiftdata[4]~8_combout\);

-- Location: FF_X81_Y72_N21
\i_UART_RX|i_Abaster|sig_data_out[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_UART_RX|i_Abaster|sig_shiftdata[4]~8_combout\,
	clrn => \i_IO|button2_n~q\,
	ena => \i_UART_RX|i_Abaster|sig_shiftdata[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_UART_RX|i_Abaster|sig_data_out\(4));

-- Location: LCCOMB_X82_Y72_N6
\i_UART_RX|i_Tick_Generator|baude_tick~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Tick_Generator|baude_tick~4_combout\ = (\i_UART_RX|i_Tick_Generator|Equal0~0_combout\ & ((\i_UART_RX|i_Tick_Generator|Equal2~2_combout\) # (!\i_UART_RX|i_Tick_Generator|Add1~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_UART_RX|i_Tick_Generator|Equal0~0_combout\,
	datab => \i_UART_RX|i_Tick_Generator|Equal2~2_combout\,
	datad => \i_UART_RX|i_Tick_Generator|Add1~16_combout\,
	combout => \i_UART_RX|i_Tick_Generator|baude_tick~4_combout\);

-- Location: LCCOMB_X82_Y72_N24
\i_UART_RX|i_Abaster|sig_next_data_valid~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Abaster|sig_next_data_valid~0_combout\ = (!\i_UART_RX|i_Abaster|sig_data_out\(0) & (\i_UART_RX|i_Tick_Generator|baude_tick~4_combout\ & (\i_UART_RX|i_Tick_Generator|baude_tick~7_combout\ & \i_UART_RX|i_Tick_Generator|baude_tick~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_UART_RX|i_Abaster|sig_data_out\(0),
	datab => \i_UART_RX|i_Tick_Generator|baude_tick~4_combout\,
	datac => \i_UART_RX|i_Tick_Generator|baude_tick~7_combout\,
	datad => \i_UART_RX|i_Tick_Generator|baude_tick~5_combout\,
	combout => \i_UART_RX|i_Abaster|sig_next_data_valid~0_combout\);

-- Location: FF_X82_Y72_N25
\i_UART_RX|i_Abaster|sig_rx_data_valid\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_UART_RX|i_Abaster|sig_next_data_valid~0_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_UART_RX|i_Abaster|sig_rx_data_valid~q\);

-- Location: LCCOMB_X77_Y72_N24
\i_MIDIDecoder|Selector3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_MIDIDecoder|Selector3~1_combout\ = (\i_UART_RX|i_Abaster|sig_rx_data_valid~q\ & (\i_MIDIDecoder|Selector3~0_combout\)) # (!\i_UART_RX|i_Abaster|sig_rx_data_valid~q\ & ((\i_MIDIDecoder|state.NOTE_RECEIVED~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_MIDIDecoder|Selector3~0_combout\,
	datac => \i_MIDIDecoder|state.NOTE_RECEIVED~q\,
	datad => \i_UART_RX|i_Abaster|sig_rx_data_valid~q\,
	combout => \i_MIDIDecoder|Selector3~1_combout\);

-- Location: FF_X77_Y72_N25
\i_MIDIDecoder|state.NOTE_RECEIVED\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_MIDIDecoder|Selector3~1_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_MIDIDecoder|state.NOTE_RECEIVED~q\);

-- Location: LCCOMB_X81_Y72_N30
\i_UART_RX|i_Abaster|sig_shiftdata[7]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Abaster|sig_shiftdata[7]~7_combout\ = (\i_IO|serial2~q\) # ((!\i_UART_RX|i_Tick_Generator|Equal0~0_combout\ & \i_UART_RX|i_Flanken_Det|edge~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_UART_RX|i_Tick_Generator|Equal0~0_combout\,
	datac => \i_IO|serial2~q\,
	datad => \i_UART_RX|i_Flanken_Det|edge~q\,
	combout => \i_UART_RX|i_Abaster|sig_shiftdata[7]~7_combout\);

-- Location: FF_X81_Y72_N31
\i_UART_RX|i_Abaster|sig_data_out[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_UART_RX|i_Abaster|sig_shiftdata[7]~7_combout\,
	clrn => \i_IO|button2_n~q\,
	ena => \i_UART_RX|i_Abaster|sig_shiftdata[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_UART_RX|i_Abaster|sig_data_out\(7));

-- Location: LCCOMB_X81_Y72_N6
\i_UART_RX|i_Abaster|sig_shiftdata[6]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Abaster|sig_shiftdata[6]~0_combout\ = (\i_UART_RX|i_Abaster|sig_data_out\(7) & ((\i_UART_RX|i_Tick_Generator|Equal0~0_combout\) # (!\i_UART_RX|i_Flanken_Det|edge~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_UART_RX|i_Tick_Generator|Equal0~0_combout\,
	datac => \i_UART_RX|i_Abaster|sig_data_out\(7),
	datad => \i_UART_RX|i_Flanken_Det|edge~q\,
	combout => \i_UART_RX|i_Abaster|sig_shiftdata[6]~0_combout\);

-- Location: FF_X81_Y72_N7
\i_UART_RX|i_Abaster|sig_data_out[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_UART_RX|i_Abaster|sig_shiftdata[6]~0_combout\,
	clrn => \i_IO|button2_n~q\,
	ena => \i_UART_RX|i_Abaster|sig_shiftdata[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_UART_RX|i_Abaster|sig_data_out\(6));

-- Location: LCCOMB_X77_Y72_N30
\i_MIDIDecoder|Selector0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_MIDIDecoder|Selector0~0_combout\ = ((\i_UART_RX|i_Abaster|sig_data_out\(7) & ((\i_UART_RX|i_Abaster|sig_data_out\(5)) # (\i_UART_RX|i_Abaster|sig_data_out\(6))))) # (!\i_UART_RX|i_Abaster|sig_rx_data_valid~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_UART_RX|i_Abaster|sig_data_out\(5),
	datab => \i_UART_RX|i_Abaster|sig_data_out\(7),
	datac => \i_UART_RX|i_Abaster|sig_data_out\(6),
	datad => \i_UART_RX|i_Abaster|sig_rx_data_valid~q\,
	combout => \i_MIDIDecoder|Selector0~0_combout\);

-- Location: LCCOMB_X77_Y72_N4
\i_MIDIDecoder|Selector0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_MIDIDecoder|Selector0~1_combout\ = (!\i_MIDIDecoder|state.VELOCITY_RECEIVED~q\ & ((\i_MIDIDecoder|state.IDLE~q\) # (!\i_MIDIDecoder|Selector0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010101000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_MIDIDecoder|state.VELOCITY_RECEIVED~q\,
	datab => \i_MIDIDecoder|state.IDLE~q\,
	datac => \i_MIDIDecoder|Selector0~0_combout\,
	combout => \i_MIDIDecoder|Selector0~1_combout\);

-- Location: FF_X79_Y72_N5
\i_MIDIDecoder|state.IDLE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	asdata => \i_MIDIDecoder|Selector0~1_combout\,
	clrn => \i_IO|button2_n~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_MIDIDecoder|state.IDLE~q\);

-- Location: LCCOMB_X77_Y72_N6
\i_MIDIDecoder|note_geg[3]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_MIDIDecoder|note_geg[3]~0_combout\ = (!\i_MIDIDecoder|state.VELOCITY_RECEIVED~q\ & (!\i_MIDIDecoder|state.NOTE_RECEIVED~q\ & ((\i_MIDIDecoder|state.IDLE~q\) # (!\i_UART_RX|i_Abaster|sig_data_out\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_MIDIDecoder|state.VELOCITY_RECEIVED~q\,
	datab => \i_MIDIDecoder|state.NOTE_RECEIVED~q\,
	datac => \i_MIDIDecoder|state.IDLE~q\,
	datad => \i_UART_RX|i_Abaster|sig_data_out\(7),
	combout => \i_MIDIDecoder|note_geg[3]~0_combout\);

-- Location: FF_X79_Y72_N3
\i_MIDIDecoder|note_geg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	asdata => \i_UART_RX|i_Abaster|sig_data_out\(4),
	clrn => \i_IO|button2_n~q\,
	sload => VCC,
	ena => \i_MIDIDecoder|note_geg[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_MIDIDecoder|note_geg\(4));

-- Location: FF_X79_Y72_N19
\i_MIDIDecoder|note_geg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	asdata => \i_UART_RX|i_Abaster|sig_data_out\(5),
	clrn => \i_IO|button2_n~q\,
	sload => VCC,
	ena => \i_MIDIDecoder|note_geg[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_MIDIDecoder|note_geg\(5));

-- Location: LCCOMB_X81_Y72_N24
\i_UART_RX|i_Abaster|sig_shiftdata[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Abaster|sig_shiftdata[3]~4_combout\ = (\i_UART_RX|i_Abaster|sig_data_out\(4) & ((\i_UART_RX|i_Tick_Generator|Equal0~0_combout\) # (!\i_UART_RX|i_Flanken_Det|edge~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_UART_RX|i_Tick_Generator|Equal0~0_combout\,
	datac => \i_UART_RX|i_Abaster|sig_data_out\(4),
	datad => \i_UART_RX|i_Flanken_Det|edge~q\,
	combout => \i_UART_RX|i_Abaster|sig_shiftdata[3]~4_combout\);

-- Location: FF_X81_Y72_N25
\i_UART_RX|i_Abaster|sig_data_out[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_UART_RX|i_Abaster|sig_shiftdata[3]~4_combout\,
	clrn => \i_IO|button2_n~q\,
	ena => \i_UART_RX|i_Abaster|sig_shiftdata[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_UART_RX|i_Abaster|sig_data_out\(3));

-- Location: LCCOMB_X81_Y72_N26
\i_UART_RX|i_Abaster|sig_shiftdata[2]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Abaster|sig_shiftdata[2]~5_combout\ = (\i_UART_RX|i_Abaster|sig_data_out\(3) & ((\i_UART_RX|i_Tick_Generator|Equal0~0_combout\) # (!\i_UART_RX|i_Flanken_Det|edge~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_UART_RX|i_Tick_Generator|Equal0~0_combout\,
	datac => \i_UART_RX|i_Abaster|sig_data_out\(3),
	datad => \i_UART_RX|i_Flanken_Det|edge~q\,
	combout => \i_UART_RX|i_Abaster|sig_shiftdata[2]~5_combout\);

-- Location: FF_X81_Y72_N27
\i_UART_RX|i_Abaster|sig_data_out[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_UART_RX|i_Abaster|sig_shiftdata[2]~5_combout\,
	clrn => \i_IO|button2_n~q\,
	ena => \i_UART_RX|i_Abaster|sig_shiftdata[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_UART_RX|i_Abaster|sig_data_out\(2));

-- Location: LCCOMB_X81_Y72_N10
\i_UART_RX|i_Abaster|sig_shiftdata[1]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Abaster|sig_shiftdata[1]~6_combout\ = (\i_UART_RX|i_Abaster|sig_data_out\(2) & ((\i_UART_RX|i_Tick_Generator|Equal0~0_combout\) # (!\i_UART_RX|i_Flanken_Det|edge~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_UART_RX|i_Tick_Generator|Equal0~0_combout\,
	datac => \i_UART_RX|i_Abaster|sig_data_out\(2),
	datad => \i_UART_RX|i_Flanken_Det|edge~q\,
	combout => \i_UART_RX|i_Abaster|sig_shiftdata[1]~6_combout\);

-- Location: FF_X81_Y72_N11
\i_UART_RX|i_Abaster|sig_data_out[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_UART_RX|i_Abaster|sig_shiftdata[1]~6_combout\,
	clrn => \i_IO|button2_n~q\,
	ena => \i_UART_RX|i_Abaster|sig_shiftdata[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_UART_RX|i_Abaster|sig_data_out\(1));

-- Location: LCCOMB_X77_Y72_N18
\i_MIDIDecoder|ch_geg[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_MIDIDecoder|ch_geg[0]~0_combout\ = (\i_UART_RX|i_Abaster|sig_data_out\(7) & (!\i_MIDIDecoder|state.IDLE~q\ & \i_UART_RX|i_Abaster|sig_rx_data_valid~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_UART_RX|i_Abaster|sig_data_out\(7),
	datac => \i_MIDIDecoder|state.IDLE~q\,
	datad => \i_UART_RX|i_Abaster|sig_rx_data_valid~q\,
	combout => \i_MIDIDecoder|ch_geg[0]~0_combout\);

-- Location: FF_X80_Y72_N15
\i_MIDIDecoder|ch_geg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	asdata => \i_UART_RX|i_Abaster|sig_data_out\(1),
	clrn => \i_IO|button2_n~q\,
	sload => VCC,
	ena => \i_MIDIDecoder|ch_geg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_MIDIDecoder|ch_geg\(1));

-- Location: FF_X80_Y72_N17
\i_MIDIDecoder|ch_geg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	asdata => \i_UART_RX|i_Abaster|sig_data_out\(3),
	clrn => \i_IO|button2_n~q\,
	sload => VCC,
	ena => \i_MIDIDecoder|ch_geg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_MIDIDecoder|ch_geg\(3));

-- Location: LCCOMB_X81_Y72_N2
\i_UART_RX|i_Abaster|sig_shiftdata[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_UART_RX|i_Abaster|sig_shiftdata[0]~3_combout\ = (\i_UART_RX|i_Tick_Generator|data_start~combout\) # ((\i_UART_RX|i_Tick_Generator|baude_tick~combout\ & (!\i_UART_RX|i_Abaster|sig_data_out\(1))) # (!\i_UART_RX|i_Tick_Generator|baude_tick~combout\ & 
-- ((\i_UART_RX|i_Abaster|sig_data_out\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_UART_RX|i_Abaster|sig_data_out\(1),
	datab => \i_UART_RX|i_Tick_Generator|data_start~combout\,
	datac => \i_UART_RX|i_Abaster|sig_data_out\(0),
	datad => \i_UART_RX|i_Tick_Generator|baude_tick~combout\,
	combout => \i_UART_RX|i_Abaster|sig_shiftdata[0]~3_combout\);

-- Location: FF_X81_Y72_N3
\i_UART_RX|i_Abaster|sig_data_out[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_UART_RX|i_Abaster|sig_shiftdata[0]~3_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_UART_RX|i_Abaster|sig_data_out\(0));

-- Location: LCCOMB_X75_Y72_N6
\i_MIDIDecoder|ch_geg[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_MIDIDecoder|ch_geg[0]~1_combout\ = !\i_UART_RX|i_Abaster|sig_data_out\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \i_UART_RX|i_Abaster|sig_data_out\(0),
	combout => \i_MIDIDecoder|ch_geg[0]~1_combout\);

-- Location: FF_X80_Y72_N29
\i_MIDIDecoder|ch_geg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	asdata => \i_MIDIDecoder|ch_geg[0]~1_combout\,
	clrn => \i_IO|button2_n~q\,
	sload => VCC,
	ena => \i_MIDIDecoder|ch_geg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_MIDIDecoder|ch_geg\(0));

-- Location: LCCOMB_X80_Y72_N16
\i_MIDIDecoder|noteEN_folge~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_MIDIDecoder|noteEN_folge~0_combout\ = (!\i_MIDIDecoder|ch_geg\(2) & (!\i_MIDIDecoder|ch_geg\(1) & (!\i_MIDIDecoder|ch_geg\(3) & !\i_MIDIDecoder|ch_geg\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_MIDIDecoder|ch_geg\(2),
	datab => \i_MIDIDecoder|ch_geg\(1),
	datac => \i_MIDIDecoder|ch_geg\(3),
	datad => \i_MIDIDecoder|ch_geg\(0),
	combout => \i_MIDIDecoder|noteEN_folge~0_combout\);

-- Location: LCCOMB_X79_Y72_N20
\i_MIDIDecoder|noteEN_folge~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_MIDIDecoder|noteEN_folge~1_combout\ = (\i_MIDIDecoder|state.VELOCITY_RECEIVED~q\ & \i_MIDIDecoder|noteEN_folge~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_MIDIDecoder|state.VELOCITY_RECEIVED~q\,
	datad => \i_MIDIDecoder|noteEN_folge~0_combout\,
	combout => \i_MIDIDecoder|noteEN_folge~1_combout\);

-- Location: FF_X79_Y72_N21
\i_MIDIDecoder|noteEN_geg\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_MIDIDecoder|noteEN_folge~1_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_MIDIDecoder|noteEN_geg~q\);

-- Location: LCCOMB_X79_Y72_N0
\i_NoteToParallel|logic~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|logic~0_combout\ = (!\i_MIDIDecoder|note_geg\(6) & (!\i_MIDIDecoder|note_geg\(5) & \i_MIDIDecoder|noteEN_geg~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_MIDIDecoder|note_geg\(6),
	datab => \i_MIDIDecoder|note_geg\(5),
	datad => \i_MIDIDecoder|noteEN_geg~q\,
	combout => \i_NoteToParallel|logic~0_combout\);

-- Location: LCCOMB_X79_Y72_N4
\i_NoteToParallel|Decoder0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|Decoder0~9_combout\ = (\i_NoteToParallel|Decoder0~8_combout\ & (!\i_MIDIDecoder|note_geg\(4) & \i_NoteToParallel|logic~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_NoteToParallel|Decoder0~8_combout\,
	datab => \i_MIDIDecoder|note_geg\(4),
	datad => \i_NoteToParallel|logic~0_combout\,
	combout => \i_NoteToParallel|Decoder0~9_combout\);

-- Location: LCCOMB_X77_Y72_N14
\i_MIDIDecoder|Equal2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_MIDIDecoder|Equal2~0_combout\ = (!\i_UART_RX|i_Abaster|sig_data_out\(5) & !\i_UART_RX|i_Abaster|sig_data_out\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_UART_RX|i_Abaster|sig_data_out\(5),
	datac => \i_UART_RX|i_Abaster|sig_data_out\(6),
	combout => \i_MIDIDecoder|Equal2~0_combout\);

-- Location: LCCOMB_X79_Y72_N30
\i_MIDIDecoder|Equal2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_MIDIDecoder|Equal2~1_combout\ = (!\i_UART_RX|i_Abaster|sig_data_out\(1) & (\i_UART_RX|i_Abaster|sig_data_out\(0) & (!\i_UART_RX|i_Abaster|sig_data_out\(2) & !\i_UART_RX|i_Abaster|sig_data_out\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_UART_RX|i_Abaster|sig_data_out\(1),
	datab => \i_UART_RX|i_Abaster|sig_data_out\(0),
	datac => \i_UART_RX|i_Abaster|sig_data_out\(2),
	datad => \i_UART_RX|i_Abaster|sig_data_out\(3),
	combout => \i_MIDIDecoder|Equal2~1_combout\);

-- Location: LCCOMB_X77_Y72_N20
\i_MIDIDecoder|Equal2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_MIDIDecoder|Equal2~2_combout\ = (!\i_UART_RX|i_Abaster|sig_data_out\(4) & (\i_MIDIDecoder|Equal2~0_combout\ & (\i_MIDIDecoder|Equal2~1_combout\ & !\i_UART_RX|i_Abaster|sig_data_out\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_UART_RX|i_Abaster|sig_data_out\(4),
	datab => \i_MIDIDecoder|Equal2~0_combout\,
	datac => \i_MIDIDecoder|Equal2~1_combout\,
	datad => \i_UART_RX|i_Abaster|sig_data_out\(7),
	combout => \i_MIDIDecoder|Equal2~2_combout\);

-- Location: LCCOMB_X77_Y72_N28
\i_MIDIDecoder|noteOnOff_geg~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_MIDIDecoder|noteOnOff_geg~0_combout\ = (\i_MIDIDecoder|state.NOTE_RECEIVED~q\ & (\i_MIDIDecoder|cmd_geg\(0) & ((!\i_MIDIDecoder|Equal2~2_combout\)))) # (!\i_MIDIDecoder|state.NOTE_RECEIVED~q\ & (((\i_MIDIDecoder|noteOnOff_geg~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_MIDIDecoder|cmd_geg\(0),
	datab => \i_MIDIDecoder|state.NOTE_RECEIVED~q\,
	datac => \i_MIDIDecoder|noteOnOff_geg~q\,
	datad => \i_MIDIDecoder|Equal2~2_combout\,
	combout => \i_MIDIDecoder|noteOnOff_geg~0_combout\);

-- Location: FF_X77_Y72_N29
\i_MIDIDecoder|noteOnOff_geg\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_MIDIDecoder|noteOnOff_geg~0_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_MIDIDecoder|noteOnOff_geg~q\);

-- Location: LCCOMB_X79_Y72_N28
\i_NoteToParallel|parallelNote_geg[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|parallelNote_geg[0]~0_combout\ = (\i_MIDIDecoder|note_geg\(3) & (((\i_NoteToParallel|parallelNote_geg\(0))))) # (!\i_MIDIDecoder|note_geg\(3) & ((\i_NoteToParallel|Decoder0~9_combout\ & ((\i_MIDIDecoder|noteOnOff_geg~q\))) # 
-- (!\i_NoteToParallel|Decoder0~9_combout\ & (\i_NoteToParallel|parallelNote_geg\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_MIDIDecoder|note_geg\(3),
	datab => \i_NoteToParallel|Decoder0~9_combout\,
	datac => \i_NoteToParallel|parallelNote_geg\(0),
	datad => \i_MIDIDecoder|noteOnOff_geg~q\,
	combout => \i_NoteToParallel|parallelNote_geg[0]~0_combout\);

-- Location: FF_X79_Y72_N29
\i_NoteToParallel|parallelNote_geg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_NoteToParallel|parallelNote_geg[0]~0_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_NoteToParallel|parallelNote_geg\(0));

-- Location: FF_X79_Y72_N31
\i_MIDIDecoder|note_geg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	asdata => \i_UART_RX|i_Abaster|sig_data_out\(2),
	clrn => \i_IO|button2_n~q\,
	sload => VCC,
	ena => \i_MIDIDecoder|note_geg[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_MIDIDecoder|note_geg\(2));

-- Location: LCCOMB_X76_Y72_N30
\i_NoteToParallel|Decoder0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|Decoder0~10_combout\ = (!\i_MIDIDecoder|note_geg\(1) & !\i_MIDIDecoder|note_geg\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_MIDIDecoder|note_geg\(1),
	datad => \i_MIDIDecoder|note_geg\(2),
	combout => \i_NoteToParallel|Decoder0~10_combout\);

-- Location: LCCOMB_X79_Y72_N10
\i_NoteToParallel|parallelNote_geg[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|parallelNote_geg[1]~1_combout\ = (\i_NoteToParallel|Decoder0~11_combout\ & ((\i_NoteToParallel|Decoder0~10_combout\ & ((\i_MIDIDecoder|noteOnOff_geg~q\))) # (!\i_NoteToParallel|Decoder0~10_combout\ & 
-- (\i_NoteToParallel|parallelNote_geg\(1))))) # (!\i_NoteToParallel|Decoder0~11_combout\ & (((\i_NoteToParallel|parallelNote_geg\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_NoteToParallel|Decoder0~11_combout\,
	datab => \i_NoteToParallel|Decoder0~10_combout\,
	datac => \i_NoteToParallel|parallelNote_geg\(1),
	datad => \i_MIDIDecoder|noteOnOff_geg~q\,
	combout => \i_NoteToParallel|parallelNote_geg[1]~1_combout\);

-- Location: FF_X79_Y72_N11
\i_NoteToParallel|parallelNote_geg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_NoteToParallel|parallelNote_geg[1]~1_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_NoteToParallel|parallelNote_geg\(1));

-- Location: LCCOMB_X76_Y72_N16
\i_NoteToParallel|parallelNote_geg[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|parallelNote_geg[2]~2_combout\ = (\i_NoteToParallel|Decoder0~12_combout\ & ((\i_MIDIDecoder|note_geg\(2) & ((\i_NoteToParallel|parallelNote_geg\(2)))) # (!\i_MIDIDecoder|note_geg\(2) & (\i_MIDIDecoder|noteOnOff_geg~q\)))) # 
-- (!\i_NoteToParallel|Decoder0~12_combout\ & (((\i_NoteToParallel|parallelNote_geg\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_NoteToParallel|Decoder0~12_combout\,
	datab => \i_MIDIDecoder|noteOnOff_geg~q\,
	datac => \i_NoteToParallel|parallelNote_geg\(2),
	datad => \i_MIDIDecoder|note_geg\(2),
	combout => \i_NoteToParallel|parallelNote_geg[2]~2_combout\);

-- Location: FF_X76_Y72_N17
\i_NoteToParallel|parallelNote_geg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_NoteToParallel|parallelNote_geg[2]~2_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_NoteToParallel|parallelNote_geg\(2));

-- Location: FF_X79_Y72_N15
\i_MIDIDecoder|note_geg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	asdata => \i_UART_RX|i_Abaster|sig_data_out\(6),
	clrn => \i_IO|button2_n~q\,
	sload => VCC,
	ena => \i_MIDIDecoder|note_geg[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_MIDIDecoder|note_geg\(6));

-- Location: LCCOMB_X79_Y72_N14
\i_NoteToParallel|Decoder0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|Decoder0~26_combout\ = (!\i_MIDIDecoder|note_geg\(4) & (!\i_MIDIDecoder|note_geg\(5) & (!\i_MIDIDecoder|note_geg\(6) & \i_MIDIDecoder|noteEN_geg~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_MIDIDecoder|note_geg\(4),
	datab => \i_MIDIDecoder|note_geg\(5),
	datac => \i_MIDIDecoder|note_geg\(6),
	datad => \i_MIDIDecoder|noteEN_geg~q\,
	combout => \i_NoteToParallel|Decoder0~26_combout\);

-- Location: FF_X79_Y72_N13
\i_MIDIDecoder|note_geg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	asdata => \i_UART_RX|i_Abaster|sig_data_out\(1),
	clrn => \i_IO|button2_n~q\,
	sload => VCC,
	ena => \i_MIDIDecoder|note_geg[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_MIDIDecoder|note_geg\(1));

-- Location: LCCOMB_X75_Y72_N20
\i_MIDIDecoder|note_geg[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_MIDIDecoder|note_geg[0]~1_combout\ = !\i_UART_RX|i_Abaster|sig_data_out\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \i_UART_RX|i_Abaster|sig_data_out\(0),
	combout => \i_MIDIDecoder|note_geg[0]~1_combout\);

-- Location: FF_X79_Y72_N25
\i_MIDIDecoder|note_geg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	asdata => \i_MIDIDecoder|note_geg[0]~1_combout\,
	clrn => \i_IO|button2_n~q\,
	sload => VCC,
	ena => \i_MIDIDecoder|note_geg[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_MIDIDecoder|note_geg\(0));

-- Location: LCCOMB_X79_Y72_N12
\i_NoteToParallel|Decoder0~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|Decoder0~13_combout\ = (!\i_MIDIDecoder|note_geg\(3) & (\i_NoteToParallel|Decoder0~26_combout\ & (\i_MIDIDecoder|note_geg\(1) & \i_MIDIDecoder|note_geg\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_MIDIDecoder|note_geg\(3),
	datab => \i_NoteToParallel|Decoder0~26_combout\,
	datac => \i_MIDIDecoder|note_geg\(1),
	datad => \i_MIDIDecoder|note_geg\(0),
	combout => \i_NoteToParallel|Decoder0~13_combout\);

-- Location: LCCOMB_X79_Y72_N16
\i_NoteToParallel|parallelNote_geg[3]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|parallelNote_geg[3]~3_combout\ = (\i_MIDIDecoder|note_geg\(2) & (((\i_NoteToParallel|parallelNote_geg\(3))))) # (!\i_MIDIDecoder|note_geg\(2) & ((\i_NoteToParallel|Decoder0~13_combout\ & (\i_MIDIDecoder|noteOnOff_geg~q\)) # 
-- (!\i_NoteToParallel|Decoder0~13_combout\ & ((\i_NoteToParallel|parallelNote_geg\(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_MIDIDecoder|note_geg\(2),
	datab => \i_MIDIDecoder|noteOnOff_geg~q\,
	datac => \i_NoteToParallel|parallelNote_geg\(3),
	datad => \i_NoteToParallel|Decoder0~13_combout\,
	combout => \i_NoteToParallel|parallelNote_geg[3]~3_combout\);

-- Location: FF_X79_Y72_N17
\i_NoteToParallel|parallelNote_geg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_NoteToParallel|parallelNote_geg[3]~3_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_NoteToParallel|parallelNote_geg\(3));

-- Location: LCCOMB_X79_Y72_N24
\i_NoteToParallel|Decoder0~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|Decoder0~27_combout\ = (\i_MIDIDecoder|note_geg\(2) & (!\i_MIDIDecoder|note_geg\(1) & (!\i_MIDIDecoder|note_geg\(0) & \i_NoteToParallel|Decoder0~26_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_MIDIDecoder|note_geg\(2),
	datab => \i_MIDIDecoder|note_geg\(1),
	datac => \i_MIDIDecoder|note_geg\(0),
	datad => \i_NoteToParallel|Decoder0~26_combout\,
	combout => \i_NoteToParallel|Decoder0~27_combout\);

-- Location: FF_X79_Y72_N7
\i_MIDIDecoder|note_geg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	asdata => \i_UART_RX|i_Abaster|sig_data_out\(3),
	clrn => \i_IO|button2_n~q\,
	sload => VCC,
	ena => \i_MIDIDecoder|note_geg[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_MIDIDecoder|note_geg\(3));

-- Location: LCCOMB_X80_Y72_N18
\i_NoteToParallel|parallelNote_geg[4]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|parallelNote_geg[4]~4_combout\ = (\i_NoteToParallel|Decoder0~27_combout\ & ((\i_MIDIDecoder|note_geg\(3) & ((\i_NoteToParallel|parallelNote_geg\(4)))) # (!\i_MIDIDecoder|note_geg\(3) & (\i_MIDIDecoder|noteOnOff_geg~q\)))) # 
-- (!\i_NoteToParallel|Decoder0~27_combout\ & (((\i_NoteToParallel|parallelNote_geg\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_MIDIDecoder|noteOnOff_geg~q\,
	datab => \i_NoteToParallel|Decoder0~27_combout\,
	datac => \i_NoteToParallel|parallelNote_geg\(4),
	datad => \i_MIDIDecoder|note_geg\(3),
	combout => \i_NoteToParallel|parallelNote_geg[4]~4_combout\);

-- Location: FF_X80_Y72_N19
\i_NoteToParallel|parallelNote_geg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_NoteToParallel|parallelNote_geg[4]~4_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_NoteToParallel|parallelNote_geg\(4));

-- Location: LCCOMB_X80_Y72_N2
\i_NoteToParallel|Decoder0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|Decoder0~14_combout\ = (!\i_MIDIDecoder|note_geg\(1) & \i_MIDIDecoder|note_geg\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_MIDIDecoder|note_geg\(1),
	datad => \i_MIDIDecoder|note_geg\(2),
	combout => \i_NoteToParallel|Decoder0~14_combout\);

-- Location: LCCOMB_X80_Y72_N26
\i_NoteToParallel|Decoder0~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|Decoder0~11_combout\ = (!\i_MIDIDecoder|note_geg\(3) & (\i_MIDIDecoder|note_geg\(0) & \i_NoteToParallel|Decoder0~26_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_MIDIDecoder|note_geg\(3),
	datab => \i_MIDIDecoder|note_geg\(0),
	datad => \i_NoteToParallel|Decoder0~26_combout\,
	combout => \i_NoteToParallel|Decoder0~11_combout\);

-- Location: LCCOMB_X80_Y72_N20
\i_NoteToParallel|parallelNote_geg[5]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|parallelNote_geg[5]~5_combout\ = (\i_NoteToParallel|Decoder0~14_combout\ & ((\i_NoteToParallel|Decoder0~11_combout\ & (\i_MIDIDecoder|noteOnOff_geg~q\)) # (!\i_NoteToParallel|Decoder0~11_combout\ & 
-- ((\i_NoteToParallel|parallelNote_geg\(5)))))) # (!\i_NoteToParallel|Decoder0~14_combout\ & (((\i_NoteToParallel|parallelNote_geg\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_MIDIDecoder|noteOnOff_geg~q\,
	datab => \i_NoteToParallel|Decoder0~14_combout\,
	datac => \i_NoteToParallel|parallelNote_geg\(5),
	datad => \i_NoteToParallel|Decoder0~11_combout\,
	combout => \i_NoteToParallel|parallelNote_geg[5]~5_combout\);

-- Location: FF_X80_Y72_N21
\i_NoteToParallel|parallelNote_geg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_NoteToParallel|parallelNote_geg[5]~5_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_NoteToParallel|parallelNote_geg\(5));

-- Location: LCCOMB_X76_Y72_N2
\i_NoteToParallel|parallelNote_geg[6]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|parallelNote_geg[6]~6_combout\ = (\i_NoteToParallel|Decoder0~12_combout\ & ((\i_MIDIDecoder|note_geg\(2) & (\i_MIDIDecoder|noteOnOff_geg~q\)) # (!\i_MIDIDecoder|note_geg\(2) & ((\i_NoteToParallel|parallelNote_geg\(6)))))) # 
-- (!\i_NoteToParallel|Decoder0~12_combout\ & (((\i_NoteToParallel|parallelNote_geg\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_NoteToParallel|Decoder0~12_combout\,
	datab => \i_MIDIDecoder|noteOnOff_geg~q\,
	datac => \i_NoteToParallel|parallelNote_geg\(6),
	datad => \i_MIDIDecoder|note_geg\(2),
	combout => \i_NoteToParallel|parallelNote_geg[6]~6_combout\);

-- Location: FF_X76_Y72_N3
\i_NoteToParallel|parallelNote_geg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_NoteToParallel|parallelNote_geg[6]~6_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_NoteToParallel|parallelNote_geg\(6));

-- Location: LCCOMB_X79_Y72_N26
\i_NoteToParallel|parallelNote_geg[7]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|parallelNote_geg[7]~7_combout\ = (\i_MIDIDecoder|note_geg\(2) & ((\i_NoteToParallel|Decoder0~13_combout\ & (\i_MIDIDecoder|noteOnOff_geg~q\)) # (!\i_NoteToParallel|Decoder0~13_combout\ & ((\i_NoteToParallel|parallelNote_geg\(7)))))) # 
-- (!\i_MIDIDecoder|note_geg\(2) & (((\i_NoteToParallel|parallelNote_geg\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_MIDIDecoder|note_geg\(2),
	datab => \i_MIDIDecoder|noteOnOff_geg~q\,
	datac => \i_NoteToParallel|parallelNote_geg\(7),
	datad => \i_NoteToParallel|Decoder0~13_combout\,
	combout => \i_NoteToParallel|parallelNote_geg[7]~7_combout\);

-- Location: FF_X79_Y72_N27
\i_NoteToParallel|parallelNote_geg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_NoteToParallel|parallelNote_geg[7]~7_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_NoteToParallel|parallelNote_geg\(7));

-- Location: LCCOMB_X80_Y72_N6
\i_NoteToParallel|parallelNote_geg[8]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|parallelNote_geg[8]~8_combout\ = (\i_NoteToParallel|Decoder0~9_combout\ & ((\i_MIDIDecoder|note_geg\(3) & (\i_MIDIDecoder|noteOnOff_geg~q\)) # (!\i_MIDIDecoder|note_geg\(3) & ((\i_NoteToParallel|parallelNote_geg\(8)))))) # 
-- (!\i_NoteToParallel|Decoder0~9_combout\ & (((\i_NoteToParallel|parallelNote_geg\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_MIDIDecoder|noteOnOff_geg~q\,
	datab => \i_NoteToParallel|Decoder0~9_combout\,
	datac => \i_NoteToParallel|parallelNote_geg\(8),
	datad => \i_MIDIDecoder|note_geg\(3),
	combout => \i_NoteToParallel|parallelNote_geg[8]~8_combout\);

-- Location: FF_X80_Y72_N7
\i_NoteToParallel|parallelNote_geg[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_NoteToParallel|parallelNote_geg[8]~8_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_NoteToParallel|parallelNote_geg\(8));

-- Location: LCCOMB_X80_Y72_N28
\i_NoteToParallel|Decoder0~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|Decoder0~15_combout\ = (\i_MIDIDecoder|note_geg\(3) & (\i_MIDIDecoder|note_geg\(0) & \i_NoteToParallel|Decoder0~26_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_MIDIDecoder|note_geg\(3),
	datab => \i_MIDIDecoder|note_geg\(0),
	datad => \i_NoteToParallel|Decoder0~26_combout\,
	combout => \i_NoteToParallel|Decoder0~15_combout\);

-- Location: LCCOMB_X79_Y72_N8
\i_NoteToParallel|parallelNote_geg[9]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|parallelNote_geg[9]~9_combout\ = (\i_NoteToParallel|Decoder0~10_combout\ & ((\i_NoteToParallel|Decoder0~15_combout\ & ((\i_MIDIDecoder|noteOnOff_geg~q\))) # (!\i_NoteToParallel|Decoder0~15_combout\ & 
-- (\i_NoteToParallel|parallelNote_geg\(9))))) # (!\i_NoteToParallel|Decoder0~10_combout\ & (((\i_NoteToParallel|parallelNote_geg\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_NoteToParallel|Decoder0~10_combout\,
	datab => \i_NoteToParallel|Decoder0~15_combout\,
	datac => \i_NoteToParallel|parallelNote_geg\(9),
	datad => \i_MIDIDecoder|noteOnOff_geg~q\,
	combout => \i_NoteToParallel|parallelNote_geg[9]~9_combout\);

-- Location: FF_X79_Y72_N9
\i_NoteToParallel|parallelNote_geg[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_NoteToParallel|parallelNote_geg[9]~9_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_NoteToParallel|parallelNote_geg\(9));

-- Location: LCCOMB_X80_Y72_N4
\i_NoteToParallel|Decoder0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|Decoder0~16_combout\ = (\i_MIDIDecoder|note_geg\(1) & (!\i_MIDIDecoder|note_geg\(0) & \i_NoteToParallel|Decoder0~26_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_MIDIDecoder|note_geg\(1),
	datab => \i_MIDIDecoder|note_geg\(0),
	datad => \i_NoteToParallel|Decoder0~26_combout\,
	combout => \i_NoteToParallel|Decoder0~16_combout\);

-- Location: LCCOMB_X76_Y72_N6
\i_NoteToParallel|Decoder0~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|Decoder0~17_combout\ = (\i_MIDIDecoder|note_geg\(3) & !\i_MIDIDecoder|note_geg\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \i_MIDIDecoder|note_geg\(3),
	datad => \i_MIDIDecoder|note_geg\(2),
	combout => \i_NoteToParallel|Decoder0~17_combout\);

-- Location: LCCOMB_X80_Y72_N8
\i_NoteToParallel|parallelNote_geg[10]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|parallelNote_geg[10]~10_combout\ = (\i_NoteToParallel|Decoder0~16_combout\ & ((\i_NoteToParallel|Decoder0~17_combout\ & (\i_MIDIDecoder|noteOnOff_geg~q\)) # (!\i_NoteToParallel|Decoder0~17_combout\ & 
-- ((\i_NoteToParallel|parallelNote_geg\(10)))))) # (!\i_NoteToParallel|Decoder0~16_combout\ & (((\i_NoteToParallel|parallelNote_geg\(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_MIDIDecoder|noteOnOff_geg~q\,
	datab => \i_NoteToParallel|Decoder0~16_combout\,
	datac => \i_NoteToParallel|parallelNote_geg\(10),
	datad => \i_NoteToParallel|Decoder0~17_combout\,
	combout => \i_NoteToParallel|parallelNote_geg[10]~10_combout\);

-- Location: FF_X80_Y72_N9
\i_NoteToParallel|parallelNote_geg[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_NoteToParallel|parallelNote_geg[10]~10_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_NoteToParallel|parallelNote_geg\(10));

-- Location: LCCOMB_X76_Y72_N24
\i_NoteToParallel|Decoder0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|Decoder0~18_combout\ = (\i_MIDIDecoder|note_geg\(1) & (\i_MIDIDecoder|note_geg\(0) & \i_NoteToParallel|Decoder0~26_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_MIDIDecoder|note_geg\(1),
	datab => \i_MIDIDecoder|note_geg\(0),
	datad => \i_NoteToParallel|Decoder0~26_combout\,
	combout => \i_NoteToParallel|Decoder0~18_combout\);

-- Location: LCCOMB_X76_Y72_N4
\i_NoteToParallel|parallelNote_geg[11]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|parallelNote_geg[11]~11_combout\ = (\i_NoteToParallel|Decoder0~17_combout\ & ((\i_NoteToParallel|Decoder0~18_combout\ & ((\i_MIDIDecoder|noteOnOff_geg~q\))) # (!\i_NoteToParallel|Decoder0~18_combout\ & 
-- (\i_NoteToParallel|parallelNote_geg\(11))))) # (!\i_NoteToParallel|Decoder0~17_combout\ & (((\i_NoteToParallel|parallelNote_geg\(11)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_NoteToParallel|Decoder0~17_combout\,
	datab => \i_NoteToParallel|Decoder0~18_combout\,
	datac => \i_NoteToParallel|parallelNote_geg\(11),
	datad => \i_MIDIDecoder|noteOnOff_geg~q\,
	combout => \i_NoteToParallel|parallelNote_geg[11]~11_combout\);

-- Location: FF_X76_Y72_N5
\i_NoteToParallel|parallelNote_geg[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_NoteToParallel|parallelNote_geg[11]~11_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_NoteToParallel|parallelNote_geg\(11));

-- Location: LCCOMB_X80_Y72_N0
\i_NoteToParallel|parallelNote_geg[12]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|parallelNote_geg[12]~12_combout\ = (\i_NoteToParallel|Decoder0~27_combout\ & ((\i_MIDIDecoder|note_geg\(3) & (\i_MIDIDecoder|noteOnOff_geg~q\)) # (!\i_MIDIDecoder|note_geg\(3) & ((\i_NoteToParallel|parallelNote_geg\(12)))))) # 
-- (!\i_NoteToParallel|Decoder0~27_combout\ & (((\i_NoteToParallel|parallelNote_geg\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_MIDIDecoder|noteOnOff_geg~q\,
	datab => \i_NoteToParallel|Decoder0~27_combout\,
	datac => \i_NoteToParallel|parallelNote_geg\(12),
	datad => \i_MIDIDecoder|note_geg\(3),
	combout => \i_NoteToParallel|parallelNote_geg[12]~12_combout\);

-- Location: FF_X80_Y72_N1
\i_NoteToParallel|parallelNote_geg[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_NoteToParallel|parallelNote_geg[12]~12_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_NoteToParallel|parallelNote_geg\(12));

-- Location: LCCOMB_X80_Y72_N12
\i_NoteToParallel|parallelNote_geg[13]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|parallelNote_geg[13]~13_combout\ = (\i_NoteToParallel|Decoder0~14_combout\ & ((\i_NoteToParallel|Decoder0~15_combout\ & (\i_MIDIDecoder|noteOnOff_geg~q\)) # (!\i_NoteToParallel|Decoder0~15_combout\ & 
-- ((\i_NoteToParallel|parallelNote_geg\(13)))))) # (!\i_NoteToParallel|Decoder0~14_combout\ & (((\i_NoteToParallel|parallelNote_geg\(13)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_MIDIDecoder|noteOnOff_geg~q\,
	datab => \i_NoteToParallel|Decoder0~14_combout\,
	datac => \i_NoteToParallel|parallelNote_geg\(13),
	datad => \i_NoteToParallel|Decoder0~15_combout\,
	combout => \i_NoteToParallel|parallelNote_geg[13]~13_combout\);

-- Location: FF_X80_Y72_N13
\i_NoteToParallel|parallelNote_geg[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_NoteToParallel|parallelNote_geg[13]~13_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_NoteToParallel|parallelNote_geg\(13));

-- Location: LCCOMB_X80_Y72_N14
\i_NoteToParallel|Decoder0~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|Decoder0~19_combout\ = (\i_MIDIDecoder|note_geg\(3) & \i_MIDIDecoder|note_geg\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_MIDIDecoder|note_geg\(3),
	datad => \i_MIDIDecoder|note_geg\(2),
	combout => \i_NoteToParallel|Decoder0~19_combout\);

-- Location: LCCOMB_X80_Y72_N30
\i_NoteToParallel|parallelNote_geg[14]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|parallelNote_geg[14]~14_combout\ = (\i_NoteToParallel|Decoder0~16_combout\ & ((\i_NoteToParallel|Decoder0~19_combout\ & (\i_MIDIDecoder|noteOnOff_geg~q\)) # (!\i_NoteToParallel|Decoder0~19_combout\ & 
-- ((\i_NoteToParallel|parallelNote_geg\(14)))))) # (!\i_NoteToParallel|Decoder0~16_combout\ & (((\i_NoteToParallel|parallelNote_geg\(14)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_MIDIDecoder|noteOnOff_geg~q\,
	datab => \i_NoteToParallel|Decoder0~16_combout\,
	datac => \i_NoteToParallel|parallelNote_geg\(14),
	datad => \i_NoteToParallel|Decoder0~19_combout\,
	combout => \i_NoteToParallel|parallelNote_geg[14]~14_combout\);

-- Location: FF_X80_Y72_N31
\i_NoteToParallel|parallelNote_geg[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_NoteToParallel|parallelNote_geg[14]~14_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_NoteToParallel|parallelNote_geg\(14));

-- Location: LCCOMB_X80_Y72_N22
\i_NoteToParallel|parallelNote_geg[15]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|parallelNote_geg[15]~15_combout\ = (\i_NoteToParallel|Decoder0~19_combout\ & ((\i_NoteToParallel|Decoder0~18_combout\ & (\i_MIDIDecoder|noteOnOff_geg~q\)) # (!\i_NoteToParallel|Decoder0~18_combout\ & 
-- ((\i_NoteToParallel|parallelNote_geg\(15)))))) # (!\i_NoteToParallel|Decoder0~19_combout\ & (((\i_NoteToParallel|parallelNote_geg\(15)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_MIDIDecoder|noteOnOff_geg~q\,
	datab => \i_NoteToParallel|Decoder0~19_combout\,
	datac => \i_NoteToParallel|parallelNote_geg\(15),
	datad => \i_NoteToParallel|Decoder0~18_combout\,
	combout => \i_NoteToParallel|parallelNote_geg[15]~15_combout\);

-- Location: FF_X80_Y72_N23
\i_NoteToParallel|parallelNote_geg[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_NoteToParallel|parallelNote_geg[15]~15_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_NoteToParallel|parallelNote_geg\(15));

-- Location: LCCOMB_X79_Y72_N6
\i_NoteToParallel|Decoder0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|Decoder0~20_combout\ = (\i_MIDIDecoder|note_geg\(4) & (!\i_MIDIDecoder|note_geg\(3) & \i_NoteToParallel|logic~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_MIDIDecoder|note_geg\(4),
	datac => \i_MIDIDecoder|note_geg\(3),
	datad => \i_NoteToParallel|logic~0_combout\,
	combout => \i_NoteToParallel|Decoder0~20_combout\);

-- Location: LCCOMB_X79_Y72_N22
\i_NoteToParallel|parallelNote_geg[16]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|parallelNote_geg[16]~16_combout\ = (\i_NoteToParallel|Decoder0~8_combout\ & ((\i_NoteToParallel|Decoder0~20_combout\ & (\i_MIDIDecoder|noteOnOff_geg~q\)) # (!\i_NoteToParallel|Decoder0~20_combout\ & 
-- ((\i_NoteToParallel|parallelNote_geg\(16)))))) # (!\i_NoteToParallel|Decoder0~8_combout\ & (((\i_NoteToParallel|parallelNote_geg\(16)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_NoteToParallel|Decoder0~8_combout\,
	datab => \i_MIDIDecoder|noteOnOff_geg~q\,
	datac => \i_NoteToParallel|parallelNote_geg\(16),
	datad => \i_NoteToParallel|Decoder0~20_combout\,
	combout => \i_NoteToParallel|parallelNote_geg[16]~16_combout\);

-- Location: FF_X79_Y72_N23
\i_NoteToParallel|parallelNote_geg[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_NoteToParallel|parallelNote_geg[16]~16_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_NoteToParallel|parallelNote_geg\(16));

-- Location: LCCOMB_X76_Y72_N22
\i_NoteToParallel|parallelNote_geg[17]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|parallelNote_geg[17]~17_combout\ = (\i_NoteToParallel|Decoder0~21_combout\ & ((\i_MIDIDecoder|note_geg\(1) & ((\i_NoteToParallel|parallelNote_geg\(17)))) # (!\i_MIDIDecoder|note_geg\(1) & (\i_MIDIDecoder|noteOnOff_geg~q\)))) # 
-- (!\i_NoteToParallel|Decoder0~21_combout\ & (((\i_NoteToParallel|parallelNote_geg\(17)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_NoteToParallel|Decoder0~21_combout\,
	datab => \i_MIDIDecoder|noteOnOff_geg~q\,
	datac => \i_NoteToParallel|parallelNote_geg\(17),
	datad => \i_MIDIDecoder|note_geg\(1),
	combout => \i_NoteToParallel|parallelNote_geg[17]~17_combout\);

-- Location: FF_X76_Y72_N23
\i_NoteToParallel|parallelNote_geg[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_NoteToParallel|parallelNote_geg[17]~17_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_NoteToParallel|parallelNote_geg\(17));

-- Location: LCCOMB_X76_Y72_N28
\i_NoteToParallel|Decoder0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|Decoder0~22_combout\ = (\i_MIDIDecoder|note_geg\(1) & (!\i_MIDIDecoder|note_geg\(0) & (\i_NoteToParallel|Decoder0~20_combout\ & !\i_MIDIDecoder|note_geg\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_MIDIDecoder|note_geg\(1),
	datab => \i_MIDIDecoder|note_geg\(0),
	datac => \i_NoteToParallel|Decoder0~20_combout\,
	datad => \i_MIDIDecoder|note_geg\(2),
	combout => \i_NoteToParallel|Decoder0~22_combout\);

-- Location: LCCOMB_X77_Y72_N12
\i_NoteToParallel|parallelNote_geg[18]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|parallelNote_geg[18]~18_combout\ = (\i_NoteToParallel|Decoder0~22_combout\ & (\i_MIDIDecoder|noteOnOff_geg~q\)) # (!\i_NoteToParallel|Decoder0~22_combout\ & ((\i_NoteToParallel|parallelNote_geg\(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_MIDIDecoder|noteOnOff_geg~q\,
	datac => \i_NoteToParallel|parallelNote_geg\(18),
	datad => \i_NoteToParallel|Decoder0~22_combout\,
	combout => \i_NoteToParallel|parallelNote_geg[18]~18_combout\);

-- Location: FF_X77_Y72_N13
\i_NoteToParallel|parallelNote_geg[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_NoteToParallel|parallelNote_geg[18]~18_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_NoteToParallel|parallelNote_geg\(18));

-- Location: LCCOMB_X76_Y72_N0
\i_NoteToParallel|parallelNote_geg[19]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|parallelNote_geg[19]~19_combout\ = (\i_NoteToParallel|Decoder0~21_combout\ & ((\i_MIDIDecoder|note_geg\(1) & (\i_MIDIDecoder|noteOnOff_geg~q\)) # (!\i_MIDIDecoder|note_geg\(1) & ((\i_NoteToParallel|parallelNote_geg\(19)))))) # 
-- (!\i_NoteToParallel|Decoder0~21_combout\ & (((\i_NoteToParallel|parallelNote_geg\(19)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_NoteToParallel|Decoder0~21_combout\,
	datab => \i_MIDIDecoder|noteOnOff_geg~q\,
	datac => \i_NoteToParallel|parallelNote_geg\(19),
	datad => \i_MIDIDecoder|note_geg\(1),
	combout => \i_NoteToParallel|parallelNote_geg[19]~19_combout\);

-- Location: FF_X76_Y72_N1
\i_NoteToParallel|parallelNote_geg[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_NoteToParallel|parallelNote_geg[19]~19_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_NoteToParallel|parallelNote_geg\(19));

-- Location: LCCOMB_X76_Y72_N14
\i_NoteToParallel|parallelNote_geg[20]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|parallelNote_geg[20]~20_combout\ = (\i_NoteToParallel|Decoder0~28_combout\ & ((\i_MIDIDecoder|note_geg\(0) & (\i_NoteToParallel|parallelNote_geg\(20))) # (!\i_MIDIDecoder|note_geg\(0) & ((\i_MIDIDecoder|noteOnOff_geg~q\))))) # 
-- (!\i_NoteToParallel|Decoder0~28_combout\ & (((\i_NoteToParallel|parallelNote_geg\(20)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_NoteToParallel|Decoder0~28_combout\,
	datab => \i_MIDIDecoder|note_geg\(0),
	datac => \i_NoteToParallel|parallelNote_geg\(20),
	datad => \i_MIDIDecoder|noteOnOff_geg~q\,
	combout => \i_NoteToParallel|parallelNote_geg[20]~20_combout\);

-- Location: FF_X76_Y72_N15
\i_NoteToParallel|parallelNote_geg[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_NoteToParallel|parallelNote_geg[20]~20_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_NoteToParallel|parallelNote_geg\(20));

-- Location: LCCOMB_X76_Y72_N8
\i_NoteToParallel|parallelNote_geg[21]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|parallelNote_geg[21]~21_combout\ = (\i_NoteToParallel|Decoder0~28_combout\ & ((\i_MIDIDecoder|note_geg\(0) & ((\i_MIDIDecoder|noteOnOff_geg~q\))) # (!\i_MIDIDecoder|note_geg\(0) & (\i_NoteToParallel|parallelNote_geg\(21))))) # 
-- (!\i_NoteToParallel|Decoder0~28_combout\ & (((\i_NoteToParallel|parallelNote_geg\(21)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_NoteToParallel|Decoder0~28_combout\,
	datab => \i_MIDIDecoder|note_geg\(0),
	datac => \i_NoteToParallel|parallelNote_geg\(21),
	datad => \i_MIDIDecoder|noteOnOff_geg~q\,
	combout => \i_NoteToParallel|parallelNote_geg[21]~21_combout\);

-- Location: FF_X76_Y72_N9
\i_NoteToParallel|parallelNote_geg[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_NoteToParallel|parallelNote_geg[21]~21_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_NoteToParallel|parallelNote_geg\(21));

-- Location: LCCOMB_X76_Y72_N18
\i_NoteToParallel|Decoder0~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|Decoder0~23_combout\ = (\i_MIDIDecoder|note_geg\(1) & (!\i_MIDIDecoder|note_geg\(0) & (\i_NoteToParallel|Decoder0~20_combout\ & \i_MIDIDecoder|note_geg\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_MIDIDecoder|note_geg\(1),
	datab => \i_MIDIDecoder|note_geg\(0),
	datac => \i_NoteToParallel|Decoder0~20_combout\,
	datad => \i_MIDIDecoder|note_geg\(2),
	combout => \i_NoteToParallel|Decoder0~23_combout\);

-- Location: LCCOMB_X80_Y72_N10
\i_NoteToParallel|parallelNote_geg[22]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|parallelNote_geg[22]~22_combout\ = (\i_NoteToParallel|Decoder0~23_combout\ & (\i_MIDIDecoder|noteOnOff_geg~q\)) # (!\i_NoteToParallel|Decoder0~23_combout\ & ((\i_NoteToParallel|parallelNote_geg\(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_MIDIDecoder|noteOnOff_geg~q\,
	datac => \i_NoteToParallel|parallelNote_geg\(22),
	datad => \i_NoteToParallel|Decoder0~23_combout\,
	combout => \i_NoteToParallel|parallelNote_geg[22]~22_combout\);

-- Location: FF_X80_Y72_N11
\i_NoteToParallel|parallelNote_geg[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_NoteToParallel|parallelNote_geg[22]~22_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_NoteToParallel|parallelNote_geg\(22));

-- Location: LCCOMB_X76_Y72_N20
\i_NoteToParallel|Decoder0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|Decoder0~24_combout\ = (\i_MIDIDecoder|note_geg\(1) & (\i_MIDIDecoder|note_geg\(0) & (\i_NoteToParallel|Decoder0~20_combout\ & \i_MIDIDecoder|note_geg\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_MIDIDecoder|note_geg\(1),
	datab => \i_MIDIDecoder|note_geg\(0),
	datac => \i_NoteToParallel|Decoder0~20_combout\,
	datad => \i_MIDIDecoder|note_geg\(2),
	combout => \i_NoteToParallel|Decoder0~24_combout\);

-- Location: LCCOMB_X77_Y72_N2
\i_NoteToParallel|parallelNote_geg[23]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|parallelNote_geg[23]~23_combout\ = (\i_NoteToParallel|Decoder0~24_combout\ & (\i_MIDIDecoder|noteOnOff_geg~q\)) # (!\i_NoteToParallel|Decoder0~24_combout\ & ((\i_NoteToParallel|parallelNote_geg\(23))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_MIDIDecoder|noteOnOff_geg~q\,
	datac => \i_NoteToParallel|parallelNote_geg\(23),
	datad => \i_NoteToParallel|Decoder0~24_combout\,
	combout => \i_NoteToParallel|parallelNote_geg[23]~23_combout\);

-- Location: FF_X77_Y72_N3
\i_NoteToParallel|parallelNote_geg[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_NoteToParallel|parallelNote_geg[23]~23_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_NoteToParallel|parallelNote_geg\(23));

-- Location: LCCOMB_X79_Y72_N2
\i_NoteToParallel|Decoder0~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|Decoder0~25_combout\ = (\i_NoteToParallel|Decoder0~8_combout\ & (\i_NoteToParallel|logic~0_combout\ & (\i_MIDIDecoder|note_geg\(4) & \i_MIDIDecoder|note_geg\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_NoteToParallel|Decoder0~8_combout\,
	datab => \i_NoteToParallel|logic~0_combout\,
	datac => \i_MIDIDecoder|note_geg\(4),
	datad => \i_MIDIDecoder|note_geg\(3),
	combout => \i_NoteToParallel|Decoder0~25_combout\);

-- Location: LCCOMB_X80_Y72_N24
\i_NoteToParallel|parallelNote_geg[24]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \i_NoteToParallel|parallelNote_geg[24]~24_combout\ = (\i_NoteToParallel|Decoder0~25_combout\ & (\i_MIDIDecoder|noteOnOff_geg~q\)) # (!\i_NoteToParallel|Decoder0~25_combout\ & ((\i_NoteToParallel|parallelNote_geg\(24))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_MIDIDecoder|noteOnOff_geg~q\,
	datac => \i_NoteToParallel|parallelNote_geg\(24),
	datad => \i_NoteToParallel|Decoder0~25_combout\,
	combout => \i_NoteToParallel|parallelNote_geg[24]~24_combout\);

-- Location: FF_X80_Y72_N25
\i_NoteToParallel|parallelNote_geg[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_IO|clk_tmp~clkctrl_outclk\,
	d => \i_NoteToParallel|parallelNote_geg[24]~24_combout\,
	clrn => \i_IO|button2_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \i_NoteToParallel|parallelNote_geg\(24));

ww_parallelNote(0) <= \parallelNote[0]~output_o\;

ww_parallelNote(1) <= \parallelNote[1]~output_o\;

ww_parallelNote(2) <= \parallelNote[2]~output_o\;

ww_parallelNote(3) <= \parallelNote[3]~output_o\;

ww_parallelNote(4) <= \parallelNote[4]~output_o\;

ww_parallelNote(5) <= \parallelNote[5]~output_o\;

ww_parallelNote(6) <= \parallelNote[6]~output_o\;

ww_parallelNote(7) <= \parallelNote[7]~output_o\;

ww_parallelNote(8) <= \parallelNote[8]~output_o\;

ww_parallelNote(9) <= \parallelNote[9]~output_o\;

ww_parallelNote(10) <= \parallelNote[10]~output_o\;

ww_parallelNote(11) <= \parallelNote[11]~output_o\;

ww_parallelNote(12) <= \parallelNote[12]~output_o\;

ww_parallelNote(13) <= \parallelNote[13]~output_o\;

ww_parallelNote(14) <= \parallelNote[14]~output_o\;

ww_parallelNote(15) <= \parallelNote[15]~output_o\;

ww_parallelNote(16) <= \parallelNote[16]~output_o\;

ww_parallelNote(17) <= \parallelNote[17]~output_o\;

ww_parallelNote(18) <= \parallelNote[18]~output_o\;

ww_parallelNote(19) <= \parallelNote[19]~output_o\;

ww_parallelNote(20) <= \parallelNote[20]~output_o\;

ww_parallelNote(21) <= \parallelNote[21]~output_o\;

ww_parallelNote(22) <= \parallelNote[22]~output_o\;

ww_parallelNote(23) <= \parallelNote[23]~output_o\;

ww_parallelNote(24) <= \parallelNote[24]~output_o\;
END structure;


