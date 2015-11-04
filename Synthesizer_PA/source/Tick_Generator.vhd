--------------------------
-- Bit sampling generator:
--------------------------
-- Baud = 31.25  kHz => Bit sampling rate 
--
-- Detect start of midi signal
-- FSM Bit: Counts (with the bit-tick) the 8 bits of data
-- FSM Sample Bit in the middle: 1 Bit is 1.5 time midi-period, other bits each midi period 

--------------------

LIBRARY		ieee;
USE			ieee.std_logic_1164.all;
USE			ieee.numeric_std.all;


ENTITY Tick_Generator IS
	PORT(	edge, clk_12M5, reset_n		:  IN std_logic;
			data_start, baude_tick	: OUT std_logic);
END Tick_Generator;



ARCHITECTURE rtl OF Tick_Generator IS

CONSTANT	RELOAD_VALUE	: integer := 400;	-- Baudrate: 31250 = 1/( 400 * 80ns )
CONSTANT	LOAD_VALUE		: integer := 600;
CONSTANT	BITS			: integer := 8;

SIGNAL	sig_startcnt, sig_next_startcnt	: integer range 0 to BITS;   -- 8
SIGNAL	sig_baude_counter, sig_baude_counter_next	: integer range 0 to LOAD_VALUE;
SIGNAL	sig_baude_tick:	std_logic;


BEGIN	

-- Zähler der 8 daten-Bits
startcnt: PROCESS(clk_12M5, reset_n)
BEGIN
		IF(reset_n = '0') THEN
			sig_startcnt <= 0;      
		ELSIF(clk_12M5'EVENT and clk_12M5 = '1') THEN
			sig_startcnt <= sig_next_startcnt;
		END IF;
END PROCESS;
	
comb_startcnt: PROCESS(sig_startcnt, edge, sig_baude_tick)
BEGIN
		sig_next_startcnt <= sig_startcnt;
		IF(sig_startcnt = 0) THEN
			IF(edge = '1') THEN
				sig_next_startcnt <= BITS;
			ELSE
				sig_next_startcnt <= 0;
			END IF;
		ELSIF(sig_baude_tick = '1') THEN
			sig_next_startcnt <= sig_startcnt - 1;
		END IF;
END PROCESS;
	
generate_start_sig: PROCESS(sig_startcnt, edge)
BEGIN
		IF((sig_startcnt = 0) AND (edge = '1')) THEN
			data_start <= '1';
		ELSE
			data_start <= '0';
		END IF;
END PROCESS;
	
generate_baude_tick: PROCESS(sig_startcnt, sig_baude_counter_next, sig_baude_tick)
BEGIN
		IF((NOT(sig_startcnt = 0)) AND (sig_baude_counter_next = 0)) THEN
			sig_baude_tick <= '1';
		ELSE
			sig_baude_tick <= '0';
		END IF;
		baude_tick <= sig_baude_tick;
END PROCESS;
	
	-- Baudetickgenerator
	
baudecounter: PROCESS(clk_12M5, reset_n)
BEGIN
		IF(reset_n = '0') THEN
			sig_baude_counter <= 0;
		ELSIF(clk_12M5'EVENT and clk_12M5 = '1') THEN
			sig_baude_counter <= sig_baude_counter_next;
		END IF;
END PROCESS;
	
comb_baude_counter: PROCESS(sig_baude_counter, sig_startcnt, edge)
BEGIN
		sig_baude_counter_next <= sig_baude_counter;
		IF(sig_baude_counter = 0) THEN
			IF(sig_startcnt = 0) THEN
				IF(edge = '1') THEN
					sig_baude_counter_next <= LOAD_VALUE;
				END IF;
			ELSE
				sig_baude_counter_next <= RELOAD_VALUE;
			END IF;
		ELSE
			sig_baude_counter_next <= sig_baude_counter - 1;
		END IF;
END PROCESS;	

END rtl;













