-- ********************************************************************************
-- File:	Testbench_MDID_Interface_top.vhd
-- Author:	weii
-- Date:	12.02.2014
-- Beschreibung:
-- Testbench zum MIDI Interface.
-- ********************************************************************************

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

ENTITY tb_MIDIInterface IS
	
END tb_MIDIInterface;

ARCHITECTURE struct OF tb_MIDIInterface IS

	COMPONENT	MIDI_Interface
		PORT(	clk							: IN std_logic;
				serial_in					: IN std_logic;
				button_n					: IN std_logic;
				parallelNote 				: OUT std_logic_vector( 24 DOWNTO 0 ) );
	END COMPONENT;
	
	SIGNAL		t_serial_in, t_button_n		: std_logic;
	SIGNAL		t_serial_data				: std_logic_vector( 7 DOWNTO 0 );
	SIGNAL		t_parallelNote				: std_logic_vector( 24 DOWNTO 0 );
	SIGNAL		t_testParallelNote			: std_logic_vector( 24 DOWNTO 0 );
	SIGNAL		t_clk						: std_logic;
	SIGNAL		clk_halfp					: time := 10 ns;
	SIGNAL  	data_fullp  				: time := 32 us;	-- Baudrate: 31.25 kBaud

	TYPE		CHAR_TYPE IS ARRAY( 0 TO 14 ) OF std_logic_vector( 7 DOWNTO 0 );
	TYPE		NOTE_TYPE IS ARRAY( 0 TO 5 ) OF std_logic_vector( 24 DOWNTO 0 );

	SIGNAL		SERIAL_DATA		: CHAR_TYPE := (0=>x"90",1=>x"10",2=>x"08",		-- Taste 16 Ein mit v = 8
												3=>x"80",4=>x"10",5=>x"04",		-- Taste 16 Aus mit v = 4
												6=>x"90",7=>x"10",8=>x"08",		-- Taste 16 Ein mit v = 8
												9=>x"90",10=>x"10",11=>x"00",	-- Taste 16 Aus ( weil v = 0 )
												12=>x"91",13=>x"10",14=>x"08",	-- Taste 16 Ein mit v = 8 ( falscher Kanal )
												OTHERS => x"00" );

	SIGNAL		SERIAL_DATA_TEST: NOTE_TYPE := (0=>b"0000000010000000000000000",	-- Erwarteter Ausgang gemäss SERIAL_DATA
												1=>b"0000000000000000000000000",
												2=>b"0000000010000000000000000",
												3=>b"0000000000000000000000000",
												4=>b"0000000000000000000000000",
												OTHERS => b"0000000000000000000000000" );

BEGIN
	
	dut: MIDI_Interface
		PORT MAP(	clk => t_clk,
					serial_in => t_serial_in,
					button_n => t_button_n,
					parallelNote => t_parallelNote );

	stimuli : PROCESS
	BEGIN
		-- Reseten
		t_button_n <= '0';
		t_serial_in <= '1';
		t_testParallelNote <= ( OTHERS => '0' );
		WAIT FOR 9*4*clk_halfp;
		t_button_n <= '1';
		WAIT FOR 8*clk_halfp;
		ASSERT t_parallelNote = t_testParallelNote REPORT "Reset Error: Expected parallelNote = 0" SEVERITY error;
		

		-- Einzelne Noten testen
		FOR I IN 0 TO SERIAL_DATA'LENGTH - 1 LOOP
			-- Ein Char senden
			t_serial_data <= SERIAL_DATA( I );
			t_testParallelNote <= SERIAL_DATA_TEST( I / 3 );
			-- Start Bit
			t_serial_in <= '0';
			WAIT FOR data_fullp;
			-- Datenbyte senden
			FOR B IN 0 TO t_serial_data'LENGTH - 1 LOOP
				t_serial_in <= t_serial_data( B );
				WAIT FOR data_fullp;
			END LOOP;
			-- Stop Bit
			t_serial_in <= '1';
			WAIT FOR data_fullp;

			-- Mit erwartetem Wert vergleichen
			IF ( I MOD 3 ) = 2 THEN
				ASSERT t_parallelNote = t_testParallelNote REPORT "Note Error: I=" & INTEGER'image( I ) SEVERITY error;
			END IF;

			-- Noch etwas warten, bis neu gesendet wird
			WAIT FOR 2*data_fullp;

		END LOOP;


		-- Mehrere Noten testen
		-- Alle Noten einschalten
		-- Note On senden ( 0x90 )
		t_serial_data <= x"90";
		t_testParallelNote <= ( OTHERS => '0' );
		-- Start Bit
		t_serial_in <= '0';
		WAIT FOR data_fullp;
		-- Datenbyte senden
		FOR B IN 0 TO t_serial_data'LENGTH - 1 LOOP
			t_serial_in <= t_serial_data( B );
			WAIT FOR data_fullp;
		END LOOP;
		-- Stop Bit
		t_serial_in <= '1';
		WAIT FOR 3*data_fullp;

		-- Noten nacheinander einschalten
		FOR I IN 0 TO t_parallelNote'LENGTH - 1 LOOP
			t_serial_data <= std_logic_vector( to_unsigned( I, t_serial_data'LENGTH ) );
			t_testParallelNote( I ) <= '1';

			-- Sende Note
			-- Start Bit
			t_serial_in <= '0';
			WAIT FOR data_fullp;
			-- Datenbyte senden
			FOR B IN 0 TO t_serial_data'LENGTH - 1 LOOP
				t_serial_in <= t_serial_data( B );
				WAIT FOR data_fullp;
			END LOOP;
			-- Stop Bit
			t_serial_in <= '1';
			WAIT FOR 3*data_fullp;

			-- Sende Velocity (0x08, wird nicht gebraucht)
			-- Start Bit
			t_serial_in <= '0';
			t_serial_data <= x"08";
			WAIT FOR data_fullp;
			-- Datenbyte senden
			FOR B IN 0 TO t_serial_data'LENGTH - 1 LOOP
				t_serial_in <= t_serial_data( B );
				WAIT FOR data_fullp;
			END LOOP;
			-- Stop Bit
			t_serial_in <= '1';
			WAIT FOR data_fullp;

			-- Mit erwartetem Wert vergleichen
			IF ( I MOD 3 ) = 2 THEN
				ASSERT t_parallelNote = t_testParallelNote REPORT "Note Error: I=" & INTEGER'image( I ) SEVERITY error;
			END IF;

			-- Noch etwas warten, bis neu gesendet wird
			WAIT FOR 2*data_fullp;

		END LOOP;

		-- Alle Noten wieder ausschalten
		-- Note Off senden ( 0x80 )
		t_serial_data <= x"80";
		-- Start Bit
		t_serial_in <= '0';
		WAIT FOR data_fullp;
		-- Datenbyte senden
		FOR B IN 0 TO t_serial_data'LENGTH - 1 LOOP
			t_serial_in <= t_serial_data( B );
			WAIT FOR data_fullp;
		END LOOP;
		-- Stop Bit
		t_serial_in <= '1';
		WAIT FOR 3*data_fullp;

		-- Noten nacheinander einschalten
		FOR I IN 0 TO t_parallelNote'LENGTH - 1 LOOP
			t_serial_data <= std_logic_vector( to_unsigned( I, t_serial_data'LENGTH ) );
			t_testParallelNote( I ) <= '0';

			-- Sende Note
			-- Start Bit
			t_serial_in <= '0';
			WAIT FOR data_fullp;
			-- Datenbyte senden
			FOR B IN 0 TO t_serial_data'LENGTH - 1 LOOP
				t_serial_in <= t_serial_data( B );
				WAIT FOR data_fullp;
			END LOOP;
			-- Stop Bit
			t_serial_in <= '1';
			WAIT FOR 3*data_fullp;

			-- Sende Velocity (0x08, wird nicht gebraucht)
			-- Start Bit
			t_serial_in <= '0';
			t_serial_data <= x"08";
			WAIT FOR data_fullp;
			-- Datenbyte senden
			FOR B IN 0 TO t_serial_data'LENGTH - 1 LOOP
				t_serial_in <= t_serial_data( B );
				WAIT FOR data_fullp;
			END LOOP;
			-- Stop Bit
			t_serial_in <= '1';
			WAIT FOR data_fullp;

			-- Mit erwartetem Wert vergleichen
			IF ( I MOD 3 ) = 2 THEN
				ASSERT t_parallelNote = t_testParallelNote REPORT "Note Error: I=" & INTEGER'image( I ) SEVERITY error;
			END IF;

			-- Noch etwas warten, bis neu gesendet wird
			WAIT FOR 2*data_fullp;

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

