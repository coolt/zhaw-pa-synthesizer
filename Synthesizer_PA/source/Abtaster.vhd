----------------------------------------------------------------------
-- Filename: Abtaster.vhd
-- Projektgruppe Weiss
-- Letzte Aenderung: 03.04.11
-- Funktionsbeschrieb:
-- - Nimmt die seriellen Daten der UART-Schnittstellen und gibt diese
--   als 8-Bit Vector heraus.
--   Dieser Block wird durch den Tickgenerator "gesteuert" 
----------------------------------------------------------------------
	
LIBRARY		ieee;
USE			ieee.std_logic_1164.all;
USE			ieee.numeric_std.all;


ENTITY Abaster IS
	PORT(	clk, reset_n, baude_tick, data_start, serial_in	:  IN std_logic;
			rx_data_valid									: OUT std_logic;
			rx_data											: OUT std_logic_vector(7 downto 0));
END Abaster;

ARCHITECTURE rtl OF Abaster IS
	SIGNAL	sig_shiftdata, sig_data_out				: std_logic_vector(7 downto 0);
	SIGNAL	sig_next_data_valid, sig_rx_data_valid	: std_logic;
BEGIN
	Schieb:	PROCESS(clk, reset_n, sig_shiftdata, sig_next_data_valid)
	BEGIN
		IF(reset_n = '0') THEN
			sig_data_out <= "00000001";
			sig_rx_data_valid <= '0';
		ELSIF (clk'EVENT and clk = '1') THEN
			sig_data_out <= sig_shiftdata;
			sig_rx_data_valid <= sig_next_data_valid;
		END IF;
	END PROCESS;
	
	-- baud_tick: Gibt Takt für Schieben der einzelnen Bits vor
	comb: PROCESS(data_start, serial_in, sig_data_out, baude_tick, sig_rx_data_valid)
	BEGIN
		IF(data_start = '1') THEN
			sig_shiftdata <= "10000000";
			sig_next_data_valid <= '0';
		ELSIF(baude_tick = '1') THEN
			sig_shiftdata(7) <= serial_in;			-- Schieberegister nach links
			sig_shiftdata(6) <= sig_data_out(7);
			sig_shiftdata(5) <= sig_data_out(6);
			sig_shiftdata(4) <= sig_data_out(5);
			sig_shiftdata(3) <= sig_data_out(4);
			sig_shiftdata(2) <= sig_data_out(3);
			sig_shiftdata(1) <= sig_data_out(2);
			sig_shiftdata(0) <= sig_data_out(1);
			sig_next_data_valid <= sig_data_out(0);
		ELSE
			sig_shiftdata <= sig_data_out;
			sig_next_data_valid <= '0';
		END IF;
		rx_data <= sig_data_out;
		rx_data_valid <= sig_rx_data_valid;
	END PROCESS;

END rtl;

