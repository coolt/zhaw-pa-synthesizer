------------------------------------------
-- Bit sampling generator:
-- Commented version of:
-- Armin Weiss, 2011, Tick_generator.vhd
------------------------------------------
-- baud = 31.25  kHz => bit sampling rate 
--
-- FSM Counts midi bits: 
-- If (counting bits = 0) AND (falling edge = 1) start
-- After start signal counting 8 midi bits
-- 
-- FSM Generating bit period: 
-- 1 Bit is 1.5 time midi-period
-- other bits each midi period 

------------------------------------------

LIBRARY		ieee;
USE			ieee.std_logic_1164.all;
USE			ieee.numeric_std.all;


ENTITY bit_sampling_generator IS
	PORT(	edge, clk_12M5, reset_n		:  IN std_logic;
			data_start, bit_tick	    : OUT std_logic);
END bit_sampling_generator;



ARCHITECTURE rtl OF bit_sampling_generator IS

CONSTANT    VALUE_NORMAL_BITS : integer := 400;	 -- Baud: 31250 = 1/( 400 * 80ns )
CONSTANT	VALUE_FIRST_BIT   : integer := 600;
CONSTANT	BITS			  : integer := 8;

SIGNAL	sig_cnt_bit, sig_next_cnt_bit	            : integer range 0 to BITS;   
SIGNAL	sig_period_counter, sig_period_counter_next	: integer range 0 to VALUE_FIRST_BIT;
SIGNAL	sig_period_tick:	std_logic;


BEGIN	

--------------------------------------
-- Counter for generating midi period
--------------------------------------
	
output_period: PROCESS(sig_period_counter_next, sig_period_tick, sig_cnt_bit )
BEGIN
        -- detect period: 
        -- (bits are there) & (end of counted period)
		IF((NOT(sig_cnt_bit = 0)) AND (sig_period_counter_next = 0)) THEN
			sig_period_tick <= '1';
		ELSE
			sig_period_tick <= '0';
		END IF;
		-- output signal
		bit_tick <= sig_period_tick;
END PROCESS;
	
	
cnt_period: PROCESS(clk_12M5, reset_n)
BEGIN
		IF(reset_n = '0') THEN
			sig_period_counter <= 0;
		ELSIF(clk_12M5'EVENT and clk_12M5 = '1') THEN
			sig_period_counter <= sig_period_counter_next;
		END IF;
END PROCESS;

-- there are 2 periods:
-- the first bit has 1.5 * the normal periode time of a normal midi bit
logic_period: PROCESS(sig_period_counter, sig_cnt_bit, edge)
BEGIN
		sig_period_counter_next <= sig_period_counter;
		-- start counting for period
		IF(sig_period_counter = 0) THEN
            -- first bit: load this value
			IF(sig_cnt_bit = 0) THEN
				IF(edge = '1') THEN
					sig_period_counter_next <= VALUE_FIRST_BIT;
				END IF;
            -- other bits: load normal value
			ELSE
				sig_period_counter_next <= VALUE_NORMAL_BITS;
			END IF;
		-- count down
		ELSE
			sig_period_counter_next <= sig_period_counter - 1;
		END IF;
END PROCESS;	


---------------------------------------
-- Counter for recognizing 8 midi bits
---------------------------------------
cnt_bit: PROCESS(clk_12M5, reset_n)
BEGIN
		IF(reset_n = '0') THEN
			sig_cnt_bit <= 0;      
		ELSIF(clk_12M5'EVENT and clk_12M5 = '1') THEN
			sig_cnt_bit <= sig_next_cnt_bit;
		END IF;
END PROCESS;
	
logic_cnt_bit: PROCESS(edge, sig_period_tick, sig_cnt_bit)
BEGIN
        -- default: count down
		sig_next_cnt_bit <= sig_cnt_bit;
        
		IF(sig_cnt_bit = 0) THEN
		    -- restart counting
			IF(edge = '1') THEN
				sig_next_cnt_bit <= BITS;
			-- stop counting
			ELSE
				sig_next_cnt_bit <= 0;
			END IF;
		-- each bit-period count down
		ELSIF(sig_period_tick = '1') THEN
			sig_next_cnt_bit <= sig_cnt_bit - 1;
		END IF;
END PROCESS;
	
out_start_sig: PROCESS(sig_cnt_bit, edge)
BEGIN
        -- detect start
		IF((sig_cnt_bit = 0) AND (edge = '1')) THEN
            -- output signal
			data_start <= '1';
		ELSE
			data_start <= '0';
		END IF;
END PROCESS;


END rtl;













