-- ********************************************************************************
-- File:	Testbench_Note_to_Parallel.vhd
-- Author:	weii
-- Date:	10.02.2014
-- Beschreibung:
-- Testbench zum Note zu parallel Wandler.
-- ********************************************************************************

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

ENTITY tb_NoteToParallel IS
	
END tb_NoteToParallel;

ARCHITECTURE struct OF tb_NoteToParallel IS

	COMPONENT	NoteToParallel
		PORT(	clk			: IN std_logic;			-- Systemclock
				reset_n		: IN std_logic;			-- Systemreset (Low aktiv)
				noteOnOff	: IN std_logic;			-- '0': Taste aus, '1' Taste ein
				noteEN		: IN std_logic;			-- Gültige Werte am Ausgang
				note		: IN std_logic_vector( 7 downto 0 );		-- Gedrückte Taste
				parallelNote: OUT std_logic_vector( 24 downto 0 ) );	-- Parallele Noten
	END COMPONENT;
	
	SIGNAL		t_reset_n, t_noteEN, t_noteOnOff	: std_logic;
	SIGNAL		t_note								: std_logic_vector( 7 downto 0 );
	SIGNAL		t_parallelNote						: std_logic_vector( 24 downto 0 );
	SIGNAL		t_testParallelNote					: std_logic_vector( 24 downto 0 );
	SIGNAL		t_clk								: std_logic;
	SIGNAL		clk_halfp							: time := 40 ns;

BEGIN
	
	dut: NoteToParallel
		PORT MAP(	clk => t_clk,
					reset_n => t_reset_n,
					noteEN => t_noteEN,
					noteOnOff => t_noteOnOff,
					note => t_note,
					parallelNote => t_parallelNote );

	stimuli : PROCESS
	BEGIN
		-- Reseten
		t_reset_n <= '0';
		t_noteEN <= '0';
		t_noteOnOff <= '0';
		t_note <= ( OTHERS => '0' );
		t_testParallelNote <= ( OTHERS => '0' );
		WAIT FOR 9*clk_halfp;
		t_reset_n <= '1';
		WAIT FOR 2*clk_halfp;
		ASSERT t_parallelNote = t_testParallelNote REPORT "Reset Error: Expected note = 0" SEVERITY error;
		
		-- Alle Noten nacheinander einschalten
		t_testParallelNote <= ( OTHERS => '0' );
		t_noteOnOff <= '1';
		FOR I IN 0 TO 24 LOOP
			t_note <= std_logic_vector( to_unsigned( I, t_note'length) );
			t_noteEN <= '1';
			t_testParallelNote( I ) <= '1';
			WAIT FOR 2*clk_halfp;
			t_noteEN <= '0';
			WAIT FOR 6*clk_halfp;
			
			ASSERT t_parallelNote = t_testParallelNote REPORT "Note Error: parallelNote is wrong!" SEVERITY error;
		END LOOP;

		-- Alle Noten nacheinander wieder ausschalten
		t_noteOnOff <= '0';
		FOR I IN 0 TO 24 LOOP
			t_note <= std_logic_vector( to_unsigned( I, t_note'length) );
			t_noteEN <= '1';
			t_testParallelNote( I ) <= '0';
			WAIT FOR 2*clk_halfp;
			t_noteEN <= '0';
			WAIT FOR 6*clk_halfp;
			
			ASSERT t_parallelNote = t_testParallelNote REPORT "Note Error: parallelNote is wrong!" SEVERITY error;
		END LOOP;
		
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

