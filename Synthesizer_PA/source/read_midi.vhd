-------------------------------------------
-- read midi
-------------------------------------------
-- copyright: weii (1. version): Abtaster.vhd
-- commented: baek (2. version)
--
-- function:
-- Stores 8 serial databits in a vector
-- Data_valid is set with the last bit of the vector
-- This block is controlled by the bit sampling generators signals
----------------------------------------------------------------------
	
LIBRARY		ieee;
USE			ieee.std_logic_1164.all;
USE			ieee.numeric_std.all;


ENTITY read_midi IS
	PORT(	clk_12M5, reset_n, bit_tick, data_start, serial_in	:  IN std_logic;
			rx_data_valid									: OUT std_logic;
			rx_data											: OUT std_logic_vector(7 downto 0));
END read_midi;

ARCHITECTURE rtl OF read_midi IS

	SIGNAL	sig_shiftdata, sig_data_out				: std_logic_vector(7 downto 0);
	SIGNAL	sig_next_data_valid, sig_rx_data_valid	: std_logic;
	
BEGIN

	
out_seriell_to_parallel: PROCESS(serial_in, data_start, bit_tick, sig_data_out, sig_rx_data_valid)
	BEGIN
       
		IF(data_start = '1') THEN
            -- set shift_data_vector (last bit is 1: for set data_valid = '1')
			sig_shiftdata <= "10000000";
			sig_next_data_valid <= '0';
			
        -- each midi periode shift 1 bit in the vector
		ELSIF(bit_tick = '1') THEN
			sig_shiftdata(7) <= serial_in;			
			sig_shiftdata(6) <= sig_data_out(7);
			sig_shiftdata(5) <= sig_data_out(6);
			sig_shiftdata(4) <= sig_data_out(5);
			sig_shiftdata(3) <= sig_data_out(4);
			sig_shiftdata(2) <= sig_data_out(3);
			sig_shiftdata(1) <= sig_data_out(2);
			sig_shiftdata(0) <= sig_data_out(1);
            -- last bit sets data_valid = '1'
			sig_next_data_valid <= sig_data_out(0);
			
        -- waiting for tick
		ELSE
			sig_shiftdata <= sig_data_out;
			sig_next_data_valid <= '0';
		END IF;
		
		-- output signals
		rx_data <= sig_data_out;
		rx_data_valid <= sig_rx_data_valid;
END PROCESS;


shift:	PROCESS(clk_12M5, reset_n, sig_shiftdata, sig_next_data_valid)
	BEGIN
		IF(reset_n = '0') THEN
			sig_data_out <= "00000001";
			sig_rx_data_valid <= '0';
		ELSIF (clk_12M5'EVENT and clk_12M5 = '1') THEN
			sig_data_out <= sig_shiftdata;
			sig_rx_data_valid <= sig_next_data_valid;
		END IF;
END PROCESS;


END rtl;

