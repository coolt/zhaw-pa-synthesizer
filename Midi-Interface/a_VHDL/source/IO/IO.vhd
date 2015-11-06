-- ********************************************************************************
-- File:	MDID_Decoder.vdl
-- Author:	weii
-- Date:	22.01.2014
-- Beschreibung:
-- Entprellt Schalter und stellt das Signal "reset" zur Verfügung
-- ********************************************************************************
LIBRARY		ieee;
USE			ieee.std_logic_1164.all;
USE			ieee.numeric_std.all;

ENTITY IO IS
	PORT(	clk, serial_in		: IN std_logic;
			button_n 			: IN std_logic;
			reset, reset_n		: OUT std_logic;
			serial_in_sync		: OUT std_logic;
			clk_out				: OUT std_logic
		);
END IO;

ARCHITECTURE rtl OF IO IS
	SIGNAL	button1_n, button2_n	: std_logic;
	SIGNAL	serial1, serial2		: std_logic;

	CONSTANT	ENTPRELL_RELOAD		: INTEGER := 1;	-- Zählt von ENTPRELL_RELOAD auf 0, für Simulaiton auf 1 setzen
	CONSTANT	CLK_DIVIDE_VALUE	: integer := 4;	-- Teilt den Clock um diesen Wert

	CONSTANT	CLK_COUNT_MAX		: integer := CLK_DIVIDE_VALUE / 2 - 1;
	SIGNAL		entprell_cnt_now	: integer RANGE 0 TO ENTPRELL_RELOAD - 1;
	SIGNAL		entprell_cnt_next	: integer RANGE 0 TO ENTPRELL_RELOAD - 1;
	SIGNAL		clk_count			: integer RANGE 0 to CLK_COUNT_MAX := 0;
	SIGNAL		clk_count_folge		: integer RANGE 0 to CLK_COUNT_MAX := 0;
	SIGNAL		clk_tmp				: std_logic := '0';
	SIGNAL		clk_tmp_folge		: std_logic;
	SIGNAL		sig_reset_n			: std_logic;
BEGIN
	-- 50 MHz clock auf 12.5 MHz teilen
	clk_div: PROCESS( clk )
	BEGIN
		IF( clk'EVENT AND clk = '1' ) THEN
			clk_count <= clk_count_folge;
			clk_tmp <= clk_tmp_folge;
		END IF;		
	END PROCESS;

	clk_div_rtl: PROCESS( clk_count )
	BEGIN
		IF clk_count = CLK_COUNT_MAX THEN
			clk_count_folge <= 0;
		ELSE
			clk_count_folge <= clk_count + 1;
		END IF;		
	END PROCESS;

	clk_out_rtl: PROCESS( clk_count, clk_tmp )
	BEGIN
		IF clk_count = CLK_COUNT_MAX THEN
			clk_tmp_folge <= not clk_tmp;
		ELSE
			clk_tmp_folge <= clk_tmp;
		END IF;		
	END PROCESS;


	resetl: PROCESS( clk_tmp )   -- Entprellen der Taster und synchronisation des Eingangssignals durch zwei Latches
	BEGIN
		IF ( clk_tmp'EVENT AND clk_tmp='1' ) THEN
			IF( entprell_cnt_now = 0 ) THEN
				button1_n <= button_n;		-- Reset Button synchronisieren
				button2_n <= button1_n;
			END IF;
			entprell_cnt_now <= entprell_cnt_next;
			serial1 <= serial_in;
			serial2 <= serial1;
		END IF;		
	END PROCESS;

	-- Schaltung für die Tasterentprellung
	entprell: PROCESS( entprell_cnt_now )
	BEGIN
		IF entprell_cnt_now = 0 THEN
			entprell_cnt_next <= ENTPRELL_RELOAD - 1;
		ELSE
			entprell_cnt_next <= entprell_cnt_now - 1;
		END IF;
	END PROCESS;
	
	-- Zuweisung des Ausgangs
	sig_reset_n <= button2_n;
	reset   <= NOT sig_reset_n;	
	reset_n <= sig_reset_n;
	serial_in_sync <= serial2;
	clk_out <= clk_tmp;
END rtl;
