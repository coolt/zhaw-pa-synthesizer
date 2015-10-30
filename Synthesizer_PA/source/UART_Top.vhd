----------------------------------------------------------------------
-- Filename: UART_Top.vhd
-- Projektgruppe Weiss
-- Letzte Aenderung: 12.04.11
-- Funktionsbeschrieb:
-- - Dieser Block wandelt die seriellen Daten paralle Daten um
----------------------------------------------------------------------

LIBRARY		ieee;
USE			ieee.std_logic_1164.all;
USE			ieee.numeric_std.all;

ENTITY UART_Top IS
	PORT(	serial_in, clk, reset_n			: IN std_logic;
			rx_data							: OUT std_logic_vector(7 DOWNTO 0);
			rx_data_valid					: OUT std_logic);
END UART_Top;

ARCHITECTURE behav OF UART_Top IS
	COMPONENT Abaster
		PORT(	clk, reset_n, baude_tick	: IN  std_logic;
				data_start					: IN  std_logic;
				serial_in					: IN  std_logic;
				rx_data_valid				: OUT std_logic;
				rx_data						: OUT std_logic_vector(7 downto 0));
	END COMPONENT;
	
	COMPONENT Flanken_Det
		PORT (	serial_in,clk,reset_n		: IN    std_logic;
				edge        				: OUT   std_logic);
	END Component;
	
	COMPONENT Tick_Generator
		PORT(	edge, clk, reset_n			: IN  std_logic;
				baude_tick, data_start		: OUT std_logic);
	END Component;

SIGNAL edge, baude_tick, data_start	:std_logic;

BEGIN
	i_Flanken_Det: Flanken_Det
		PORT MAP(	clk 		=> clk,
					serial_in 	=> serial_in,
					reset_n 	=> reset_n,
					edge		=> edge);
	
	i_Tick_Generator: Tick_Generator
		PORT MAP(	edge		=> edge,
					clk			=> clk,
					reset_n		=> reset_n,
					baude_tick	=> baude_tick,
					data_start	=> data_start);
	
	i_Abaster: Abaster
		PORT MAP(	clk				=> clk,
					reset_n			=> reset_n,
					baude_tick		=> baude_tick,
					serial_in		=> serial_in,
					rx_data_valid	=> rx_data_valid,
					rx_data			=> rx_data,
					data_start		=> data_start);
END behav;
