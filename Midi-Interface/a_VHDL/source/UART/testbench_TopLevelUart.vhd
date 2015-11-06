----------------------------------------------------------------------
-- Filename: testbench_TopLevelUart.vhd
-- Projektgruppe Weiss
-- Letzte Aenderung: 19.04.11
-- Funktionsbeschrieb:
-- - Überprüft die Funktionalität der UART-RX Blocks
----------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY testbench_TopLevelUart IS

END testbench_TopLevelUart;

ARCHITECTURE struct OF testbench_TopLevelUart IS
	COMPONENT UART_RX
		PORT (	serial_in, clk, reset_n			: IN std_logic;
				rx_data							: OUT std_logic_vector(7 DOWNTO 0);
				rx_data_valid					: OUT std_logic);
	END COMPONENT;

	SIGNAL  reset_n,clk,serial_in,rx_data_valid : std_logic;
	SIGNAL	rx_data	:std_logic_vector(7 downto 0);
	SIGNAL  clk_halfp 	: time := 40 ns;
	SIGNAL  data_fullp  : time := 32 us;
	
	CONSTANT CODE3	: std_logic_vector(7 downto 0) := x"64"; -- Testcode

BEGIN
	
	dut: UART_RX
		PORT MAP(	reset_n => reset_n,
					clk => clk,
					serial_in => serial_in,
					rx_data_valid => rx_data_valid,
					rx_data => rx_data);
					
stimuli: PROCESS
VARIABLE index	: Integer range 0 to 10 := 0; -- Für den Beginn
BEGIN
reset_n <= '1';
serial_in <= '1';
WAIT FOR 2 * clk_halfp;	
reset_n <= '0';			-- reset_n
WAIT FOR 2 * clk_halfp;
reset_n <= '1';
WAIT FOR 4 * clk_halfp;

--abgehacktes Signal
WAIT FOR data_fullp;
serial_in <= '0';
WAIT FOR data_fullp;
serial_in <= '1';
WAIT FOR data_fullp;
serial_in <= '0';
WAIT FOR data_fullp;
serial_in <= '0';
WAIT FOR data_fullp;
serial_in <= '0';
WAIT FOR data_fullp;
serial_in <= '1';
WAIT FOR 3*data_fullp;

WHILE index < 10 LOOP
	--negative Flanke  (Startbit)
	serial_in <= '0';
	--8 Bit seriell Code 1
	WAIT FOR data_fullp;
	serial_in <= '0';
	WAIT FOR data_fullp;
	serial_in <= '0';
	WAIT FOR data_fullp;
	serial_in <= '1';
	WAIT FOR data_fullp;
	serial_in <= '1';
	WAIT FOR data_fullp;
	serial_in <= '0';
	WAIT FOR data_fullp;
	serial_in <= '0';
	WAIT FOR data_fullp;
	serial_in <= '1';
	WAIT FOR data_fullp;
	serial_in <= '1';
	WAIT FOR data_fullp;
	serial_in <= '1';  -- Stopp Bit
	WAIT FOR 3*data_fullp;
	
	--negative Flanke (Startbit)
	serial_in <= '0';
	--8 Bit seriell Code 2
	WAIT FOR data_fullp;
	serial_in <= '1';
	WAIT FOR data_fullp;
	serial_in <= '1';
	WAIT FOR data_fullp;
	serial_in <= '0';
	WAIT FOR data_fullp;
	serial_in <= '0';
	WAIT FOR data_fullp;
	serial_in <= '1';
	WAIT FOR data_fullp;
	serial_in <= '1';
	WAIT FOR data_fullp;
	serial_in <= '0';
	WAIT FOR data_fullp;
	serial_in <= '0';
	WAIT FOR data_fullp;
	serial_in <= '1';  -- Stopp Bit
	WAIT FOR 3*data_fullp;
	index := index + 1; -- increment index
END LOOP;
	
--negative Flanke (Startbit)
serial_in <= '0';
--8 Bit seriell Code 3 (Testdaten)
WAIT FOR data_fullp;
serial_in <= CODE3(0);
WAIT FOR data_fullp;
serial_in <= CODE3(1);
WAIT FOR data_fullp;
serial_in <= CODE3(2);
WAIT FOR data_fullp;
serial_in <= CODE3(3);
WAIT FOR data_fullp;
serial_in <= CODE3(4);
WAIT FOR data_fullp;
serial_in <= CODE3(5);
WAIT FOR data_fullp;
serial_in <= CODE3(6);
WAIT FOR data_fullp;
serial_in <= CODE3(7);
WAIT FOR data_fullp;
serial_in <= '1';  -- Stopp Bit
WAIT FOR 3*data_fullp;
-- Testroutine
ASSERT(rx_data = CODE3) REPORT "rx_data falsch, Soll: x64" SEVERITY failure;
ASSERT(false) REPORT "--- TEST BESTANDEN ---" SEVERITY note;		
WAIT;

END PROCESS stimuli;
			
clk_gen : PROCESS
BEGIN
	clk <= '0';
	WAIT FOR clk_halfp;
	clk <= '1';
	WAIT FOR clk_halfp;
END PROCESS clk_gen;

END struct;