-- ********************************************************************************
-- File:	Testbench_MDID_Decoder.vhd
-- Author:	weii
-- Date:	22.01.2014
-- Beschreibung:
-- Testbench zum MIDI_Decoder.
-- ********************************************************************************

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

ENTITY tb_MIDIDecoder IS
	
END tb_MIDIDecoder;

ARCHITECTURE struct OF tb_MIDIDecoder IS

	COMPONENT	MIDIDecoder
		PORT(	clk			: IN std_logic;
				reset_n		: IN std_logic;
				dataEN		: IN std_logic;
				data		: IN std_logic_vector( 7 downto 0 );
				noteOnOff	: OUT std_logic;
				noteEN		: OUT std_logic;
				note		: OUT std_logic_vector( 7 downto 0 ) );
	END COMPONENT;
	
	SIGNAL		t_reset_n, t_dataEN, t_noteOnOff, t_noteEn	: std_logic;
	SIGNAL		t_data, t_note								: std_logic_vector( 7 downto 0 );
	SIGNAL		t_clk										: std_logic;
	SIGNAL		clk_halfp									: time := 40 ns;

BEGIN
	
	dut: MIDIDecoder
		PORT MAP(	clk => t_clk,
					reset_n => t_reset_n,
					dataEN => t_dataEN,
					data => t_data,
					noteOnOff => t_noteOnOff,
					noteEN => t_noteEN,
					note => t_note );

	stimuli : PROCESS
	BEGIN
		-- Reseten
		t_reset_n <= '0';
		t_dataEN <= '0';
		t_data <= ( OTHERS => '0' );
		WAIT FOR 9*clk_halfp;
		t_reset_n <= '1';
		WAIT FOR 2*clk_halfp;
		ASSERT t_note = b"00000000" REPORT "Reset Error: Expected note = 0" SEVERITY error;
		ASSERT t_noteEN = '0' REPORT "Reset Error: Expected noteEN = 0" SEVERITY error;
		ASSERT t_noteOnOff = '0' REPORT "Reset Error: Expected noteOnOff = 0" SEVERITY error;
		
		-- Einzelne Note simulieren ( Kanal 0, v nicht 0 )
		t_data <= b"10010000";		-- CMD ( 0x90 )
		t_dataEN <= '1';
		WAIT FOR 2*clk_halfp;
		ASSERT t_noteEN = '0' REPORT "One Note Error: Expected noteEN = 0" SEVERITY error;
		t_dataEN <= '0';
		WAIT FOR 10*clk_halfp;
		ASSERT t_noteEN = '0' REPORT "One Note Error: Expected noteEN = 0" SEVERITY error;
		t_data <= b"00010000";		-- Note ( 16 )
		t_dataEN <= '1';
		WAIT FOR 2*clk_halfp;
		ASSERT t_noteEN = '0' REPORT "One Note Error: Expected noteEN = 0" SEVERITY error;
		t_dataEN <= '0';
		WAIT FOR 10*clk_halfp;
		ASSERT t_noteEN = '0' REPORT "One Note Error: Expected noteEN = 0" SEVERITY error;
		t_data <= b"00001000";		-- Velocity
		t_dataEN <= '1';
		WAIT FOR 2*clk_halfp;
		t_dataEN <= '0';
		WAIT FOR 3*clk_halfp;
		ASSERT t_noteEN = '1' REPORT "One Note Error: Expected noteEN = 1" SEVERITY error;
		ASSERT t_noteOnOff = '1' REPORT "One Note Error: Expected noteOnOff = 1" SEVERITY error;
		ASSERT t_note = b"00010000" REPORT "One Note Error: Expected note = 16" SEVERITY error;
		WAIT FOR 9*clk_halfp;
		ASSERT t_noteEN = '0' REPORT "One Note Error: Expected noteEN = 0" SEVERITY error;
		
		-- Taste wieder verstummen
		t_data <= b"10000000";		-- CMD ( 0x80 )
		t_dataEN <= '1';
		WAIT FOR 2*clk_halfp;
		ASSERT t_noteEN = '0' REPORT "One Note Error: Expected noteEN = 0" SEVERITY error;
		t_dataEN <= '0';
		WAIT FOR 10*clk_halfp;
		ASSERT t_noteEN = '0' REPORT "One Note Error: Expected noteEN = 0" SEVERITY error;
		t_data <= b"00010000";		-- Note ( 16 )
		t_dataEN <= '1';
		WAIT FOR 2*clk_halfp;
		ASSERT t_noteEN = '0' REPORT "One Note Error: Expected noteEN = 0" SEVERITY error;
		t_dataEN <= '0';
		WAIT FOR 10*clk_halfp;
		ASSERT t_noteEN = '0' REPORT "One Note Error: Expected noteEN = 0" SEVERITY error;
		t_data <= b"00001000";		-- Velocity
		t_dataEN <= '1';
		WAIT FOR 2*clk_halfp;
		t_dataEN <= '0';
		WAIT FOR 3*clk_halfp;
		ASSERT t_noteEN = '1' REPORT "One Note Error: Expected noteEN = 1" SEVERITY error;
		ASSERT t_noteOnOff = '0' REPORT "One Note Error: Expected noteOnOff = 0" SEVERITY error;
		ASSERT t_note = b"00010000" REPORT "One Note Error: Expected note = 16" SEVERITY error;
		WAIT FOR 9*clk_halfp;
		ASSERT t_noteEN = '0' REPORT "One Note Error: Expected noteEN = 0" SEVERITY error;
		
		-- Einzelne Note simulieren ( Kanal 0, v = 0 )
		t_data <= b"10010000";		-- CMD ( 0x90 )
		t_dataEN <= '1';
		WAIT FOR 2*clk_halfp;
		ASSERT t_noteEN = '0' REPORT "One Note Error: Expected noteEN = 0" SEVERITY error;
		t_dataEN <= '0';
		WAIT FOR 10*clk_halfp;
		ASSERT t_noteEN = '0' REPORT "One Note Error: Expected noteEN = 0" SEVERITY error;
		t_data <= b"00010000";		-- Note ( 16 )
		t_dataEN <= '1';
		WAIT FOR 2*clk_halfp;
		ASSERT t_noteEN = '0' REPORT "One Note Error: Expected noteEN = 0" SEVERITY error;
		t_dataEN <= '0';
		WAIT FOR 10*clk_halfp;
		ASSERT t_noteEN = '0' REPORT "One Note Error: Expected noteEN = 0" SEVERITY error;
		t_data <= b"00001000";		-- Velocity
		t_dataEN <= '1';
		WAIT FOR 2*clk_halfp;
		t_dataEN <= '0';
		WAIT FOR 3*clk_halfp;
		ASSERT t_noteEN = '1' REPORT "One Note Error: Expected noteEN = 1" SEVERITY error;
		ASSERT t_noteOnOff = '1' REPORT "One Note Error: Expected noteOnOff = 1" SEVERITY error;
		ASSERT t_note = "00010000" REPORT "One Note Error: Expected note = 16" SEVERITY error;
		WAIT FOR 9*clk_halfp;
		ASSERT t_noteEN = '0' REPORT "One Note Error: Expected noteEN = 0" SEVERITY error;
		
		-- Taste wieder verstummen
		t_data <= b"10010000";		-- CMD ( 0x90 )
		t_dataEN <= '1';
		WAIT FOR 2*clk_halfp;
		ASSERT t_noteEN = '0' REPORT "One Note Error: Expected noteEN = 0" SEVERITY error;
		t_dataEN <= '0';
		WAIT FOR 10*clk_halfp;
		ASSERT t_noteEN = '0' REPORT "One Note Error: Expected noteEN = 0" SEVERITY error;
		t_data <= b"00010000";		-- Note ( 16 )
		t_dataEN <= '1';
		WAIT FOR 2*clk_halfp;
		ASSERT t_noteEN = '0' REPORT "One Note Error: Expected noteEN = 0" SEVERITY error;
		t_dataEN <= '0';
		WAIT FOR 10*clk_halfp;
		ASSERT t_noteEN = '0' REPORT "One Note Error: Expected noteEN = 0" SEVERITY error;
		t_data <= b"00000000";		-- Velocity
		t_dataEN <= '1';
		WAIT FOR 2*clk_halfp;
		t_dataEN <= '0';
		WAIT FOR 3*clk_halfp;
		ASSERT t_noteEN = '1' REPORT "One Note Error: Expected noteEN = 1" SEVERITY error;
		ASSERT t_noteOnOff = '0' REPORT "One Note Error: Expected noteOnOff = 0" SEVERITY error;
		ASSERT t_note = "00010000" REPORT "One Note Error: Expected note = 16" SEVERITY error;
		WAIT FOR 9*clk_halfp;
		ASSERT t_noteEN = '0' REPORT "One Note Error: Expected noteEN = 0" SEVERITY error;
		
		-- Mehrere Noten simulieren ( Kanal 0 )
		-- 1. Note
		t_data <= b"10010000";		-- CMD ( 0x90 )
		t_dataEN <= '1';
		WAIT FOR 2*clk_halfp;
		ASSERT t_noteEN = '0' REPORT "One Note Error: Expected noteEN = 0" SEVERITY error;
		t_dataEN <= '0';
		WAIT FOR 10*clk_halfp;
		ASSERT t_noteEN = '0' REPORT "One Note Error: Expected noteEN = 0" SEVERITY error;
		t_data <= b"00010000";		-- Note ( 16 )
		t_dataEN <= '1';
		WAIT FOR 2*clk_halfp;
		ASSERT t_noteEN = '0' REPORT "One Note Error: Expected noteEN = 0" SEVERITY error;
		t_dataEN <= '0';
		WAIT FOR 10*clk_halfp;
		ASSERT t_noteEN = '0' REPORT "One Note Error: Expected noteEN = 0" SEVERITY error;
		t_data <= b"00001000";		-- Velocity
		t_dataEN <= '1';
		WAIT FOR 2*clk_halfp;
		t_dataEN <= '0';
		WAIT FOR 3*clk_halfp;
		ASSERT t_noteEN = '1' REPORT "One Note Error: Expected noteEN = 1" SEVERITY error;
		ASSERT t_noteOnOff = '1' REPORT "One Note Error: Expected noteOnOff = 1" SEVERITY error;
		ASSERT t_note = b"00010000" REPORT "One Note Error: Expected note = 16" SEVERITY error;
		WAIT FOR 9*clk_halfp;
		ASSERT t_noteEN = '0' REPORT "One Note Error: Expected noteEN = 0" SEVERITY error;
		
		-- 2. Note
		t_data <= "00010100";		-- Note ( 20 )
		t_dataEN <= '1';
		WAIT FOR 2*clk_halfp;
		ASSERT t_noteEN = '0' REPORT "One Note Error: Expected noteEN = 0" SEVERITY error;
		t_dataEN <= '0';
		WAIT FOR 10*clk_halfp;
		ASSERT t_noteEN = '0' REPORT "One Note Error: Expected noteEN = 0" SEVERITY error;
		t_data <= b"00001000";		-- Velocity
		t_dataEN <= '1';
		WAIT FOR 2*clk_halfp;
		t_dataEN <= '0';
		WAIT FOR 3*clk_halfp;
		ASSERT t_noteEN = '1' REPORT "One Note Error: Expected noteEN = 1" SEVERITY error;
		ASSERT t_noteOnOff = '1' REPORT "One Note Error: Expected noteOnOff = 1" SEVERITY error;
		ASSERT t_note = b"00010100" REPORT "One Note Error: Expected note = 20" SEVERITY error;
		WAIT FOR 9*clk_halfp;
		ASSERT t_noteEN = '0' REPORT "One Note Error: Expected noteEN = 0" SEVERITY error;
		
		-- 1. Note verstummen
		t_data <= b"00010000";		-- Note ( 16 )
		t_dataEN <= '1';
		WAIT FOR 2*clk_halfp;
		ASSERT t_noteEN = '0' REPORT "One Note Error: Expected noteEN = 0" SEVERITY error;
		t_dataEN <= '0';
		WAIT FOR 10*clk_halfp;
		ASSERT t_noteEN = '0' REPORT "One Note Error: Expected noteEN = 0" SEVERITY error;
		t_data <= b"00000000";		-- Velocity
		t_dataEN <= '1';
		WAIT FOR 2*clk_halfp;
		t_dataEN <= '0';
		WAIT FOR 3*clk_halfp;
		ASSERT t_noteEN = '1' REPORT "One Note Error: Expected noteEN = 1" SEVERITY error;
		ASSERT t_noteOnOff = '0' REPORT "One Note Error: Expected noteOnOff = 0" SEVERITY error;
		ASSERT t_note = b"00010000" REPORT "One Note Error: Expected note = 16" SEVERITY error;
		WAIT FOR 9*clk_halfp;
		ASSERT t_noteEN = '0' REPORT "One Note Error: Expected noteEN = 0" SEVERITY error;
		
		-- 2. Note verstummen
		t_data <= b"00010100";		-- Note ( 20 )
		t_dataEN <= '1';
		WAIT FOR 2*clk_halfp;
		ASSERT t_noteEN = '0' REPORT "One Note Error: Expected noteEN = 0" SEVERITY error;
		t_dataEN <= '0';
		WAIT FOR 10*clk_halfp;
		ASSERT t_noteEN = '0' REPORT "One Note Error: Expected noteEN = 0" SEVERITY error;
		t_data <= b"00000000";		-- Velocity
		t_dataEN <= '1';
		WAIT FOR 2*clk_halfp;
		t_dataEN <= '0';
		WAIT FOR 3*clk_halfp;
		ASSERT t_noteEN = '1' REPORT "One Note Error: Expected noteEN = 1" SEVERITY error;
		ASSERT t_noteOnOff = '0' REPORT "One Note Error: Expected noteOnOff = 0" SEVERITY error;
		ASSERT t_note = b"00010100" REPORT "One Note Error: Expected note = 20" SEVERITY error;
		WAIT FOR 9*clk_halfp;
		ASSERT t_noteEN = '0' REPORT "One Note Error: Expected noteEN = 0" SEVERITY error;

		-- Falscher Kanal Test
		t_data <= b"10010001";		-- CMD ( 0x91 )
		t_dataEN <= '1';
		WAIT FOR 2*clk_halfp;
		ASSERT t_noteEN = '0' REPORT "One Note Error: Expected noteEN = 0" SEVERITY error;
		t_dataEN <= '0';
		WAIT FOR 10*clk_halfp;
		ASSERT t_noteEN = '0' REPORT "One Note Error: Expected noteEN = 0" SEVERITY error;
		t_data <= b"00010000";		-- Note ( 16 )
		t_dataEN <= '1';
		WAIT FOR 2*clk_halfp;
		ASSERT t_noteEN = '0' REPORT "One Note Error: Expected noteEN = 0" SEVERITY error;
		t_dataEN <= '0';
		WAIT FOR 10*clk_halfp;
		ASSERT t_noteEN = '0' REPORT "One Note Error: Expected noteEN = 0" SEVERITY error;
		t_data <= b"00001000";		-- Velocity
		t_dataEN <= '1';
		WAIT FOR 2*clk_halfp;
		t_dataEN <= '0';
		WAIT FOR 3*clk_halfp;
		ASSERT t_noteEN = '0' REPORT "One Note Error: Expected noteEN = 0" SEVERITY error;
		WAIT FOR 9*clk_halfp;
		
		-- END OF TEST
		ASSERT false REPORT "--- ALL TESTS PASSED! ---" SEVERITY failure;
		
	END PROCESS stimuli;
	
	clkgen : PROCESS
	BEGIN
		WAIT FOR 1*clk_halfp;
		t_clk <= '1';
		WAIT FOR 1*clk_halfp;
		t_clk <= '0';
	END PROCESS clkgen;
END struct;

