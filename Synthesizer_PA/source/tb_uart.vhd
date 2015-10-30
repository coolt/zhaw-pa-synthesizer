
--------------------------------------------------------------------
-- Testbench Midi uart 
-- Two clockes: Midi_clk (31.25 kHz) and System_clk (12 MHz)
--------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;
use std.textio.all;
use work.std_logic_textio.all;



entity tb_uart is
end tb_uart;

architecture struct of tb_midi is

COMPONENT UART_Top 
	PORT(	serial_in, clk, reset_n		: IN 		std_logic;
			rx_data						: OUT 		std_logic_vector(7 DOWNTO 0);
			rx_data_valid				: OUT 		std_logic
			);
END COMPONENT;


--------------------------------------------------------------------
-- signal initialisation
-------------------------------------------------------------------- 
  SIGNAL s_serial_in 	 : STD_LOGIC := '0';
  SIGNAL s_clk			 : STD_LOGIC := '0';
  SIGNAL s_reset_n	 	 : STD_LOGIC := '1';
  SIGNAL s_rx_data		 : STD_LOGIC_VECTOR (7 DOWNTO 0) := (others => '0');
  SIGNAL s_rx_data_valid : STD_LOGIC := '0';
  
  SIGNAL temp_data : STD_LOGIC_VECTOR (9 DOWNTO 0) := (others => '0');
  
  CONSTANT SYS_CLK_PERIOD	  : time := 83333 ps;
  CONSTANT SYS_CLK_HALFPERIOD : time := 41667 ps;
  
  CONSTANT MIDI_CLK_PERIOD	  : time := 32 us;  
  CONSTANT MIDI_CLK_HALFPERIOD: time := 16 us;
  
  CONSTANT SEND_0:        STD_LOGIC_VECTOR (9 DOWNTO 0) := "0000000001";
  CONSTANT DATA_0:        STD_LOGIC_VECTOR (7 DOWNTO 0) := "00000000";
  
  CONSTANT SEND_NOTE_ON:  STD_LOGIC_VECTOR (9 DOWNTO 0) := "0100000001";
  CONSTANT DATA_NOTE_ON:  STD_LOGIC_VECTOR (7 DOWNTO 0) := "10000000";
  
  CONSTANT SEND_NOTE_OFF: STD_LOGIC_VECTOR (9 DOWNTO 0) := "0100100001";
  CONSTANT DATA_NOTE_OFF: STD_LOGIC_VECTOR (7 DOWNTO 0) := "10010000";
  
  CONSTANT SEND_POLYPHON: STD_LOGIC_VECTOR (9 DOWNTO 0) := "0101000001";
  CONSTANT DATA_POLYPHON: STD_LOGIC_VECTOR (7 DOWNTO 0) := "10100000";


BEGIN

--------------------------------------------------------------------
-- component instantiation
--------------------------------------------------------------------
inst_1: UART_Top 
	PORT MAP(serial_in      		=> s_serial_in,
			clk 					=> s_clk,    
			reset_n					=> s_reset_n,
			rx_data					=> s_rx_data,
			rx_data_valid			=> s_rx_data_valid
	);


--------------------------------------------------------------------
-- processes
--------------------------------------------------------------------
clock_system: PROCESS
BEGIN     
	  WAIT FOR 1 * SYS_CLK_HALFPERIOD;
      s_clk <= '1';
      WAIT FOR 1 * SYS_CLK_HALFPERIOD;
	  s_clk <= '0';
END PROCESS;  
 
 
 
set_input: process
begin     
		-------------------------------------
		-- Test reset
		-------------------------------------
		s_reset_n <= '0';
			wait for SYS_CLK_PERIOD; 
		s_reset_n <= '1';
			wait for 2 * SYS_CLK_PERIOD;  
			 			
		ASSERT (s_rx_data_valid = '0') REPORT "Reset falsch bei data valid" SEVERITY NOTE;
		ASSERT (s_rx_data = "00000000" ) REPORT "Reset falsch bei data" SEVERITY NOTE;
			
		
		-------------------------------------
		-- Test midi data (10 bit)
		-------------------------------------
		temp_data <= SEND_0;	
			-- Simulate midi send 10 bits
			s_serial_in <= temp_data(9); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= temp_data(8); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= temp_data(7); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= temp_data(6); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= temp_data(5); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= temp_data(4); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= temp_data(3); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= temp_data(2); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= temp_data(1); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= temp_data(0); 				
			WAIT FOR MIDI_CLK_PERIOD; 	
			
						
			---------------------------------
			-- Test command send
			----------------------------------
			wait for 2 * SYS_CLK_PERIOD;  
			
			ASSERT (s_rx_data = DATA_0) REPORT "Extraktion Daten 0 falsch" SEVERITY NOTE;
			ASSERT (s_rx_data_valid  = '1' ) REPORT "Reset falsch bei data valid" SEVERITY NOTE;
			
     wait;
end process;


-------------------------------------
-- Clock for testbench
-------------------------------------
clock: PROCESS
BEGIN
	  WAIT FOR 1 * SYS_CLK_HALFPERIOD;
      s_clk <= '1';
      WAIT FOR 1 * SYS_CLK_HALFPERIOD;
	  s_clk <= '0';
END PROCESS;
	
END struct; 
