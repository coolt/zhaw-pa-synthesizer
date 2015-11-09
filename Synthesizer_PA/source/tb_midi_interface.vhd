-------------------------------------------
-- testbench midi_controller
-------------------------------------------
-- copyright: baek 
--
-- function:
--------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;
use std.textio.all;
use work.std_logic_textio.all;




entity tb_midi is
end tb_midi;

architecture struct of tb_midi is

--------------------------------------------------------------------
-- component declaration
--------------------------------------------------------------------
COMPONENT UART_Top 
	PORT(	serial_in, clk, reset_n		: IN 		std_logic;
			rx_data						: OUT 		std_logic_vector(7 DOWNTO 0);
			rx_data_valid				: OUT 		std_logic
			);
END COMPONENT;


--------------------------------------------------------------------
-- signal instantiation
-------------------------------------------------------------------- 
  SIGNAL s_serial_in 	 : STD_LOGIC := '0';
  SIGNAL s_clk			 : STD_LOGIC := '0';
  SIGNAL s_reset_n	 	 : STD_LOGIC :='1';
  SIGNAL s_rx_data		 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL s_rx_data_valid : STD_LOGIC := '0';
  
 
  CONSTANT SYS_CLK_PERIOD	: time   := 83333 ps;
  CONSTANT SYS_CLK_HALFPERIOD: time := 41667 ps;
  CONSTANT MIDI_CLK_PERIOD	: time   := 32 us;  
  CONSTANT MIDI_CLK_HALFPERIOD: time:= 16 us;
  
  SIGNAL lincnt			: integer := 0;
  

BEGIN
--------------------------------------------------------------------
-- component instantiation
--------------------------------------------------------------------

inst_1: UART_Top 
	PORT MAP(	serial_in      		=> s_serial_in,
			clk 					=> s_clk,    -- in Prozess generieren
			reset_n					=> s_reset_n,
			rx_data					=> s_rx_data,
			rx_data_valid			=> s_rx_data_valid
			);

   
 read_cmd: process
 
	file cmdfile: TEXT;       
	file outfile: TEXT;    
	
	variable line_in,line_out: Line; 
	variable good: boolean;   
	
	VARIABLE cmd_ti: string(1 to 6);
	VARIABLE midi_send_ti: std_logic_vector(11 downto 0) :=(OTHERS => '0');
	VARIABLE data_ti: std_logic_vector(7 downto 0):=(OTHERS => '0');
	VARIABLE valid_ti: std_logic_vector(3 downto 0);
		
	begin
	FILE_OPEN(cmdfile,"../simulation/script/test_midi.txt", READ_MODE);
	FILE_OPEN(outfile,"../simulation/script/result_test_midi.txt",WRITE_MODE);
	
	-------------------------------------
	-- Initial value 
	-------------------------------------
	s_serial_in 			<=  '0';
	s_rx_data   			<= (OTHERS => '0');
	s_rx_data_valid       	<= '0';
	wait for 4 * SYS_CLK_HALFPERIOD;   
		
	loop	
        --------------------------------------------------------------------------
		-- Check end of file
		------------------------------------------------------------------	
		if endfile(cmdfile) then  
				writeline(outfile,line_out);     
				writeline(OUTPUT,line_out);     
				assert false
				report "End of test"
				severity FAILURE;
			exit;
		end if;
			
		--------------------------------------------------------------------------
		-- Read file (and check for error)
		--------------------------------------------------------------------------
		readline(cmdfile, line_in);     
		lincnt <= lincnt + 1;
		
		next when line_in'length = 0;  -- Skip empty lines

		read(line_in, cmd_ti, good);    
			assert good
			report "Error by reading command from file"
			severity ERROR;
			
		hread(line_in, midi_send_ti, good);  
			assert good
			report "Error by reading the send_bits from file"
			severity ERROR;

		hread(line_in, data_ti, good);      
			assert good
			report "Text I/O read error send bits storing in vector"
			severity ERROR;
		
		hread(line_in,valid_ti,good);     
			assert good
			report "Text I/O read valid state"
			severity ERROR;			
		-------------------------------------
		-- Test reset
		-------------------------------------
		s_reset_n <= '0';
			wait for SYS_CLK_PERIOD; 
		s_reset_n <= '1';
			wait for 4 * SYS_CLK_PERIOD;   -- time propagation delay
			
		ASSERT (s_rx_data_valid = '0') REPORT "Reset falsch bei data valid" SEVERITY NOTE;
		ASSERT (s_rx_data = "00000000" ) REPORT "Reset falsch bei data" SEVERITY NOTE;
			
		
		-------------------------------------
		-- Execute command
		-------------------------------------
		if (cmd_ti = string'("10_bit")) THEN		
			
			-- Simulate midi send 10 bits
			s_serial_in <= midi_send_ti(9); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= midi_send_ti(8); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= midi_send_ti(7); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= midi_send_ti(6); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= midi_send_ti(5); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= midi_send_ti(4); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= midi_send_ti(3); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= midi_send_ti(2); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= midi_send_ti(1); 				
			WAIT FOR MIDI_CLK_PERIOD; 
			s_serial_in <= midi_send_ti(0); 				
			WAIT FOR MIDI_CLK_PERIOD; 	
			
						
			---------------------------------
			-- Test command send
			----------------------------------
			wait for 4 * SYS_CLK_PERIOD;   ----- check t_pd by simulation
			
			ASSERT (s_rx_data = data_ti) REPORT "Extraktion Datenbit falsch" SEVERITY NOTE;
			ASSERT (s_rx_data_valid  = valid_ti(0) ) REPORT "Reset falsch bei data valid" SEVERITY NOTE;
			
					
		END IF;		
		
     end loop;
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
