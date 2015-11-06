-- ********************************************************************************
-- Filename: MIDI_Interface_top.vhd
-- Author:	weii
-- Date:	11.02.2014
-- Beschreibung:
-- - Top Level aller Componenten
-- ********************************************************************************
LIBRARY		ieee;
USE			ieee.std_logic_1164.all;
USE			ieee.numeric_std.all;

ENTITY MIDI_Interface IS
	PORT(	clk, serial_in, button_n	: IN std_logic;
			parallelNote 				: OUT std_logic_vector( 24 DOWNTO 0 ) );
END MIDI_Interface;

ARCHITECTURE behav OF MIDI_Interface IS
	COMPONENT UART_RX
		PORT(	serial_in, clk, reset_n	: IN std_logic;
				rx_data					: OUT std_logic_vector( 7 DOWNTO 0 );
				rx_data_valid			: OUT std_logic );
	END COMPONENT;

	COMPONENT IO
		PORT(	clk, serial_in			: IN std_logic;
				button_n 				: IN std_logic;
				reset, reset_n			: OUT std_logic;
				serial_in_sync			: OUT std_logic;
				clk_out					: OUT std_logic );
	END COMPONENT;

	COMPONENT MIDIDecoder
		PORT(	clk						: IN std_logic;			-- Systemclock
				reset_n					: IN std_logic;			-- Systemreset (Low aktiv)
				dataEN					: IN std_logic;			-- Enable der Inputdaten
				data					: IN std_logic_vector( 7 downto 0 );	-- Inputdaten
				noteOnOff				: OUT std_logic;		-- '0': Taste aus, '1' Taste ein
				noteEN					: OUT std_logic;		-- Gültige Werte am Ausgang
				note					: OUT std_logic_vector( 6 downto 0 ) );	-- Gedrückte Taste
	END COMPONENT;

	COMPONENT NoteToParallel
		PORT(	clk						: IN std_logic;			-- Systemclock
				reset_n					: IN std_logic;			-- Systemreset (Low aktiv)
				noteOnOff				: IN std_logic;			-- '0': Taste aus, '1' Taste ein
				noteEN					: IN std_logic;			-- Gültige Werte am Ausgang
				note					: IN std_logic_vector( 6 downto 0 );		-- Gedrückte Taste
				parallelNote			: OUT std_logic_vector( 24 downto 0 ) );	-- Parallele Noten
	END COMPONENT;


SIGNAL	reset_n									: std_logic;
SIGNAL	sig_serial_in_sync, sig_rx_data_valid	: std_logic;
SIGNAL	sig_noteOnOff, sig_noteEn				: std_logic;
SIGNAL  sig_rx_data								: std_logic_vector( 7 downto 0 );
SIGNAL	sig_note								: std_logic_vector( 6 downto 0 );
SIGNAL	sig_parallelNote						: std_logic_vector( 24 downto 0 );
SIGNAL	sig_clk_12_5_MHZ						: std_logic;

BEGIN
	
	i_UART_RX: UART_RX
		PORT MAP(	clk => sig_clk_12_5_MHZ,
					reset_n => reset_n,
					serial_in => sig_serial_in_sync,
					rx_data => sig_rx_data,
					rx_data_valid => sig_rx_data_valid );

	i_IO: IO
		PORT MAP(	clk => clk,
					serial_in => serial_in,
					button_n => button_n,
					reset => open,
					reset_n => reset_n,
					serial_in_sync => sig_serial_in_sync,
					clk_out => sig_clk_12_5_MHZ );

	i_MIDIDecoder: MIDIDecoder
		PORT MAP(	clk => sig_clk_12_5_MHZ,
					reset_n => reset_n,
					dataEN => sig_rx_data_valid,
					data => sig_rx_data,
					noteOnOff => sig_noteOnOff,
					noteEn => sig_noteEn,
					note => sig_note );

	i_NoteToParallel: NoteToParallel
		PORT MAP(	clk => sig_clk_12_5_MHZ,
					reset_n => reset_n,
					noteOnOff => sig_noteOnOff,
					noteEn => sig_noteEn,
					note => sig_note,
					parallelNote => sig_parallelNote );
	
	-- Output
	parallelNote <= sig_parallelNote;

END behav;










