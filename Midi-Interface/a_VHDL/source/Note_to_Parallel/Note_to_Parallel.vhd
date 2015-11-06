-- ********************************************************************************
-- File:	Note_to_Parallel.vhd
-- Author:	weii
-- Date:	10.02.2014
-- Beschreibung:
-- Die Funktion dieses Blockes ist die Umwandlung der dekodierten Noten in
-- parallele Datenleitungen. Dabei entspricht jede Datenleitung einer Note, wobei
-- ein "1" bedeutet, dass die Note eingeschaltet ist, und eine "0", dass sie aus-
-- geschaltet ist. 
-- ********************************************************************************

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

ENTITY NoteToParallel IS
	PORT(	clk			: IN std_logic;			-- Systemclock
			reset_n		: IN std_logic;			-- Systemreset (Low aktiv)
			noteOnOff	: IN std_logic;			-- '0': Taste aus, '1' Taste ein
			noteEN		: IN std_logic;			-- Gültige Werte am Ausgang
			note		: IN std_logic_vector( 6 DOWNTO 0 );		-- Gedrückte Taste
			parallelNote: OUT std_logic_vector( 24 DOWNTO 0 ) );	-- Parallele Noten
END NoteToParallel;

ARCHITECTURE rtl OF NoteToParallel IS

SIGNAL	parallelNote_geg,
		parallelNote_folge	: std_logic_vector( 24 DOWNTO 0 );

BEGIN
		logic : PROCESS( note, noteEN, noteOnOff, parallelNote_geg )
		BEGIN
			-- Default: Aktuellen Zustand behalten
			parallelNote_folge <= parallelNote_geg;
			
			-- Bei neuen, gültigen Daten...
			IF noteEN = '1' AND unsigned( note ) < parallelNote'LENGTH THEN
				-- ... die Datenleitung gemäss der empfangenen Note ein-/ausschalten
				parallelNote_folge( to_integer( unsigned( note ) ) ) <= noteOnOff;
			END IF;
		END PROCESS logic;
		
		
		ff : PROCESS( clk, reset_n )
		BEGIN
			-- Resetten des Ausgangs
			IF reset_n = '0' THEN
				parallelNote_geg <= ( OTHERS => '0' );
				
			ELSIF clk'EVENT AND clk = '1' THEN
				parallelNote_geg <= parallelNote_folge;
			END IF;
		END PROCESS ff;
		
		-- Output Zuweisung
		parallelNote <= parallelNote_geg;
END rtl;


