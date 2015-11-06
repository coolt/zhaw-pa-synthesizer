-------------------------------------------
-- testbench uart
-------------------------------------------
-- copyright: baek
--
-- function:
-- Two clockes: Midi_clk (31.25 kHz) and System_clk (12.5 MHz)
--------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;
use std.textio.all;
use work.std_logic_textio.all;



entity tb_uart is
end tb_uart;

architecture struct of tb_uart is

COMPONENT UART_Top 
	PORT(	serial_in, clk_12M5, reset_n	: IN 		std_logic;
			rx_data						: OUT 		std_logic_vector(7 DOWNTO 0);
			rx_data_valid				: OUT 		std_logic
			);
END COMPONENT;


  SIGNAL s_serial_in 	  : STD_LOGIC := '0';
  SIGNAL s_clk_12M5        : STD_LOGIC := '0';
  SIGNAL s_clk_midi       : STD_LOGIC := '0';
  SIGNAL s_reset_n	   	  : STD_LOGIC := '1';
  SIGNAL s_rx_data		  : STD_LOGIC_VECTOR (7 DOWNTO 0) := (others => '0');
  SIGNAL s_rx_data_valid  : STD_LOGIC := '0';
  
  SIGNAL s_temp_data      : STD_LOGIC_VECTOR (9 DOWNTO 0) := (others => '0');
  SIGNAL s_idle           : STD_LOGIC := '1';
  
  CONSTANT SYS_clk_12M5_PERIOD	  : time := 80 ns;
  CONSTANT SYS_clk_12M5_HALFPERIOD : time := 40 ns;
  
  CONSTANT MIDI_CLK_PERIOD	  : time := 32 us;  
  CONSTANT MIDI_CLK_HALFPERIOD: time := 16 us;
  
  CONSTANT SEND_TEST:     STD_LOGIC_VECTOR (9 DOWNTO 0) := "1010101010";
  CONSTANT DATA_TEST:     STD_LOGIC_VECTOR (7 DOWNTO 0) := "10101010";
  
  CONSTANT SEND_0:        STD_LOGIC_VECTOR (9 DOWNTO 0) := "1000000000";
  CONSTANT DATA_0:        STD_LOGIC_VECTOR (7 DOWNTO 0) := "00000000";
  
  CONSTANT SEND_NOTE_ON:  STD_LOGIC_VECTOR (9 DOWNTO 0) := "1100000000";
  CONSTANT DATA_NOTE_ON:  STD_LOGIC_VECTOR (7 DOWNTO 0) := "10000000";
  
  CONSTANT SEND_NOTE_OFF: STD_LOGIC_VECTOR (9 DOWNTO 0) := "1100100000";
  CONSTANT DATA_NOTE_OFF: STD_LOGIC_VECTOR (7 DOWNTO 0) := "10010000";
  
  CONSTANT SEND_POLYPHON: STD_LOGIC_VECTOR (9 DOWNTO 0) := "1101000000";
  CONSTANT DATA_POLYPHON: STD_LOGIC_VECTOR (7 DOWNTO 0) := "10100000";


BEGIN

--------------------------------------------------------------------
-- component instantiation
--------------------------------------------------------------------
inst_1: UART_Top 
	PORT MAP(serial_in      		=> s_serial_in,
			clk_12M5 				=> s_clk_12M5,    
			reset_n					=> s_reset_n,
			rx_data					=> s_rx_data,
			rx_data_valid			=> s_rx_data_valid
	);


--------------------------------------------------------------------
-- processes midi
--------------------------------------------------------------------

set_input: process
begin     
        s_serial_in <= s_idle ;
         WAIT FOR 4 * MIDI_CLK_PERIOD; 
        
		-------------------------------------
		-- Test reset
		-------------------------------------
		s_reset_n <= '0';
			wait for SYS_clk_12M5_PERIOD; 
		s_reset_n <= '1';
			wait for 2 * SYS_clk_12M5_PERIOD;  
			 			
		ASSERT (s_rx_data_valid = '0') REPORT "Reset falsch bei data valid" SEVERITY NOTE;
		ASSERT (s_rx_data = "00000001" ) REPORT "Reset falsch bei data" SEVERITY NOTE;
			
		
		-------------------------------------
		-- Test 10101010
		-------------------------------------
		
		-- Simulate line in idle state (4 bit)
		s_serial_in <= s_idle ;
        WAIT FOR 4 * MIDI_CLK_PERIOD; 
        
		-- Simulate midi send 10 bits    
		s_temp_data <= SEND_TEST;				
			s_serial_in <= s_temp_data(0); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(1); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(2); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(3); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(4); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(5); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(6); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(7); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(8); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(9); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			
	    -- Simulate line in idle state (4 bit)							
	    s_serial_in <= s_idle;
        WAIT FOR 4 * MIDI_CLK_PERIOD; 
		    	
	    
	    -- Test result			
	    ASSERT (s_rx_data = DATA_TEST) REPORT "Extraktion TEST 10101010 falsch" SEVERITY NOTE;
	    ASSERT (s_rx_data_valid  = '1' ) REPORT "data valid bei TEST 10101010 falsch" SEVERITY NOTE;		
	    
	    
	    -------------------------------------
		-- Test 00000000
		-------------------------------------
		
		-- Simulate line in idle state (4 bit)
		s_serial_in <= s_idle ;
        WAIT FOR 4 * MIDI_CLK_PERIOD; 
        
		-- Simulate midi send 10 bits    
		s_temp_data <= SEND_0;				
			s_serial_in <= s_temp_data(0); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(1); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(2); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(3); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(4); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(5); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(6); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(7); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(8); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(9); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			
	    -- Simulate line in idle state (4 bit)							
	    s_serial_in <= s_idle;
        WAIT FOR 4 * MIDI_CLK_PERIOD; 
		    		    
	    -- Test result			
	    ASSERT (s_rx_data = DATA_0) REPORT "Extraktion DATEN 0 falsch" SEVERITY NOTE;
	    ASSERT (s_rx_data_valid  = '1' ) REPORT "data valid falsch bei DATEN 0" SEVERITY NOTE;			
	    
	    
	    -------------------------------------
		-- Test midi NOTE OFF
		-------------------------------------
		
		-- Simulate line in idle state (4 bit)
		s_serial_in <= s_idle ;
        WAIT FOR 4 * MIDI_CLK_PERIOD; 
        
		-- Simulate midi send 10 bits    
		s_temp_data <= SEND_NOTE_OFF;				
			s_serial_in <= s_temp_data(0); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(1); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(2); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(3); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(4); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(5); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(6); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(7); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(8); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(9); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			
	    -- Simulate line in idle state (4 bit)							
	    s_serial_in <= s_idle;
        WAIT FOR 4 * MIDI_CLK_PERIOD; 
		    	
	    -- Test result			
	    ASSERT (s_rx_data = DATA_NOTE_OFF) REPORT "Extraktion NOTE OFF falsch" SEVERITY NOTE;
	    ASSERT (s_rx_data_valid  = '1' ) REPORT "data valid falsch bei NOTE OFF" SEVERITY NOTE;			
	    
	    
	    -------------------------------------
		-- Test NOTE ON
		-------------------------------------
		
		-- Simulate line in idle state (4 bit)
		s_serial_in <= s_idle ;
        WAIT FOR 4 * MIDI_CLK_PERIOD; 
        
		-- Simulate midi send 10 bits    
		s_temp_data <= SEND_NOTE_ON;				
			s_serial_in <= s_temp_data(0); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(1); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(2); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(3); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(4); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(5); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(6); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(7); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(8); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(9); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			
	    -- Simulate line in idle state (4 bit)							
	    s_serial_in <= s_idle;
        WAIT FOR 4 * MIDI_CLK_PERIOD; 
		    		 
	    -- Test result			
	    ASSERT (s_rx_data = DATA_NOTE_ON) REPORT "Extraktion NOTE ON falsch" SEVERITY NOTE;
	    ASSERT (s_rx_data_valid  = '1' ) REPORT "data valid NOTE ON falsch" SEVERITY NOTE;				
		
		
	    -------------------------------------
		-- Test POLYPHONIE
		-------------------------------------
		
		-- Simulate line in idle state (4 bit)
		s_serial_in <= s_idle ;
        WAIT FOR 4 * MIDI_CLK_PERIOD; 
        
		-- Simulate midi send 10 bits    
		s_temp_data <= SEND_POLYPHON;				
			s_serial_in <= s_temp_data(0); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(1); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(2); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(3); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(4); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(5); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(6); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(7); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(8); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= s_temp_data(9); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			
	    -- Simulate line in idle state (4 bit)							
	    s_serial_in <= s_idle;
        WAIT FOR 4 * MIDI_CLK_PERIOD; 
		    		 
	    -- Test result			
	    ASSERT (s_rx_data = DATA_POLYPHON) REPORT "Extraktion NOTE ON falsch" SEVERITY NOTE;
	    ASSERT (s_rx_data_valid  = '1' ) REPORT "data valid NOTE ON falsch" SEVERITY NOTE;				
		
     wait;
end process;


-------------------------------------
-- Clock system
-------------------------------------
clock_12M5: PROCESS
BEGIN
	  WAIT FOR 1 * SYS_clk_12M5_HALFPERIOD;
      s_clk_12M5 <= '1';
      WAIT FOR 1 * SYS_clk_12M5_HALFPERIOD;
	  s_clk_12M5 <= '0';
END PROCESS;
	
END struct; 
