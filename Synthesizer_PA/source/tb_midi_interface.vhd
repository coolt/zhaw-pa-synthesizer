-------------------------------------------
-- testbench midi_interface
-------------------------------------------
-- copyright: baek 
--
-- function:
--------------------------------------------------------------------


-- To Do:
-- first: only simple case of note on/off
-- logic structer for diver types: simple, vector, polyphon
-- define constants for realising comands as midi-code (8 Bit)
-- destinguish between velocity (default) and velocity = 0 for polyphonie

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;
use std.textio.all;
use work.std_logic_textio.all; 


entity tb_midi_interface is
end;

architecture struct of tb_midi_interface is

--------------------------------------------------------------------
-- device under test
--------------------------------------------------------------------
COMPONENT midi_interface IS
PORT(   clk_12M5_i:   IN std_logic; 
        reset_n_i:    IN std_logic;
        serial_i:     IN std_logic; 
        note_1_o:     OUT std_logic_vector(8 downto 0); 
		  note_2_o:     OUT std_logic_vector(8 downto 0); 
		  note_3_o:     OUT std_logic_vector(8 downto 0); 
		  note_4_o:     OUT std_logic_vector(8 downto 0); 
		  note_5_o:     OUT std_logic_vector(8 downto 0); 
		  note_6_o:     OUT std_logic_vector(8 downto 0); 
		  note_7_o:     OUT std_logic_vector(8 downto 0); 
		  note_8_o:     OUT std_logic_vector(8 downto 0); 
		  note_9_o:     OUT std_logic_vector(8 downto 0); 
		  note_10_o:    OUT std_logic_vector(8 downto 0)
		  ); 
END COMPONENT;


--------------------------------------------------------------------
-- declarations
-------------------------------------------------------------------- 
  
  -- system clk: 12 MHz
  CONSTANT SYS_CLK_PERIOD: time   := 83333 ps;
  CONSTANT SYS_CLK_HALFPERIOD: time := 41667 ps;
  
  -- midi clki: 31.25 kHz
  CONSTANT MIDI_CLK_PERIOD: time   := 32 us;  
  CONSTANT MIDI_CLK_HALFPERIOD: time:= 16 us;
  

  -- file operations
  SIGNAL line_cnt: integer := 0;
  
  
  
  -- signals for data from/to IO DUT
  SIGNAL s_clk			 : STD_LOGIC := '0';
  SIGNAL s_reset_n	 : STD_LOGIC :='1';
  SIGNAL s_serial_in  : STD_LOGIC := '0';
  SIGNAL s_note_1		 : STD_LOGIC_VECTOR (8 DOWNTO 0) := (others => '0');
  SIGNAL s_note_2		 : STD_LOGIC_VECTOR (8 DOWNTO 0) := (others => '0');
  SIGNAL s_note_3		 : STD_LOGIC_VECTOR (8 DOWNTO 0) := (others => '0');
  SIGNAL s_note_4		 : STD_LOGIC_VECTOR (8 DOWNTO 0) := (others => '0');
  SIGNAL s_note_5		 : STD_LOGIC_VECTOR (8 DOWNTO 0) := (others => '0');
  SIGNAL s_note_6		 : STD_LOGIC_VECTOR (8 DOWNTO 0) := (others => '0');
  SIGNAL s_note_7		 : STD_LOGIC_VECTOR (8 DOWNTO 0) := (others => '0');
  SIGNAL s_note_8		 : STD_LOGIC_VECTOR (8 DOWNTO 0) := (others => '0');
  SIGNAL s_note_9		 : STD_LOGIC_VECTOR (8 DOWNTO 0) := (others => '0');
  SIGNAL s_note_10	 : STD_LOGIC_VECTOR (8 DOWNTO 0) := (others => '0');
  
  

BEGIN
--------------------------------------------------------------------
-- instantiation
--------------------------------------------------------------------

i_midi_interface: midi_interface 
PORT MAP(  clk_12M5_i   => s_clk,
        reset_n_i   => s_reset_n,
        serial_i   => s_serial_in,
        note_1_o   => s_note_1,
		  note_2_o   => s_note_2,
		  note_3_o   => s_note_3,
		  note_4_o   => s_note_4,
		  note_5_o   => s_note_5,
		  note_6_o   => s_note_6,
		  note_7_o   => s_note_7,
		  note_8_o   => s_note_8,
		  note_9_o   => s_note_9,
		  note_10_o  => s_note_10
        );
        
--------------------------------------------------------------------
-- testbased test 
--------------------------------------------------------------------
       
execute_file: process

    -------------------------------------
	-- File handling
	-------------------------------------
	file input_file: TEXT;       
	file output_file: TEXT;    
	
	variable line_in,line_out: Line; 
	variable good: boolean;   
	
	-- token structure: command_type | note_1 | velocity_1 | note_2 | velocity_2 | note_3 | velocity_3 | note_4 | velocity_4 | numbers_of_notes_out
	VARIABLE token_type_n: string(1 to 5);	
	VARIABLE token_note_1: std_logic_vector(7 downto 0) :=(OTHERS => '0');
	VARIABLE token_velocity_1: std_logic_vector(7 downto 0) :=(OTHERS => '0');
	VARIABLE token_note_2: std_logic_vector(7 downto 0) :=(OTHERS => '0');
	VARIABLE token_velocity_2: std_logic_vector(7 downto 0) :=(OTHERS => '0');
	VARIABLE token_note_3: std_logic_vector(7 downto 0) :=(OTHERS => '0');
	VARIABLE token_velocity_3: std_logic_vector(7 downto 0) :=(OTHERS => '0');
	VARIABLE token_note_4: std_logic_vector(7 downto 0) :=(OTHERS => '0');
	VARIABLE token_velocity_4: std_logic_vector(7 downto 0) :=(OTHERS => '0');
	VARIABLE token_number_notes_out: std_logic_vector(3 downto 0) :=(OTHERS => '0');
	
	BEGIN
	FILE_OPEN(input_file,"../simulation/script/input_midi.txt", READ_MODE);
	FILE_OPEN(output_file,"../simulation/script/result_midi.txt", WRITE_MODE);
	
	-------------------------------------
	-- Initialisation
	-------------------------------------
	s_reset_n   <= '0'; 
	s_serial_in <= '0';
	
	wait for 4 * SYS_CLK_HALFPERIOD;   
		
	loop	
        ---------------------------------
		-- Check end of file
		--------------------------------
		if endfile(input_file) then  
		        
		        -- output console read line numbers      
		        write(line_out, string'("Number of read lines from file:"));
		        writeline(OUTPUT,line_out);   		                       
		        write(line_out, line_cnt);			
				writeline(OUTPUT,line_out);      
				assert false
				report "End of test"
				severity FAILURE;
			exit;
		end if;
			
		-----------------------------------
		-- Read 10 token in (and check for error)
		------------------------------------
		readline(input_file, line_in);     
		line_cnt <= line_cnt + 1;
		
		-- Skip empty lines
		next when line_in'length = 0; 

		read(line_in, token_type_n, good);    
			assert good
			report "Error by reading input_file: First command (type) is failed."
			severity ERROR;			
		hread(line_in, token_note_1, good);  
			assert good
			report "Error by reading input_file: Second token (note_1) is failed."
			severity ERROR;
		hread(line_in, token_velocity_1, good);      
			assert good
			report "Error by reading input_file: Third token (velocity_1) is failed."
			severity ERROR;
		hread(line_in, token_note_2, good);  
			assert good
			report "Error by reading input_file: 4th token (note_2) is failed."
			severity ERROR;
		hread(line_in, token_velocity_2, good);      
			assert good
			report "Error by reading input_file: 5th token (velocity_2) is failed."
			severity ERROR;
			hread(line_in, token_note_3, good);  
			assert good
			report "Error by reading input_file: 6th token (note_3) is failed."
			severity ERROR;
		hread(line_in, token_velocity_3, good);      
			assert good
			report "Error by reading input_file: 7th token (velocity_3) is failed."
			severity ERROR;
		hread(line_in, token_note_4, good);  
			assert good
			report "Error by reading input_file: 8th token (note_4) is failed."
			severity ERROR;
		hread(line_in, token_velocity_4, good);      
			assert good
			report "Error by reading input_file: 9th token (velocity_4) is failed."
			severity ERROR;		
		hread(line_in, token_number_notes_out, good);      
			assert good
			report "Error by reading input_file: 10th token (number_of_notes_out) is failed."
			severity ERROR;
				write(line_out, string'("RAM read test passes at Adress: "));
				writeline(OUTPUT, line_out);   		
		
			
		
		-------------------------------------
		-- Execute commands from file
		-------------------------------------
		
		-- reset 
		------------------------------------
		if (token_type_n = string'("reset")) then					
			s_reset_n <= '0';
			wait for SYS_CLK_PERIOD; 
		    s_reset_n <= '1';
			wait for 40 * SYS_CLK_PERIOD;   
											
		end if;	
		
				
		-- set single notes
		------------------------------------	
		if (token_type_n = string'("singl")) then		
			
			-- simulate single notes on/off
								
		end if;		
		
		
		-- check result
		----------------------------------
		if (token_type_n = string'("check")) then		    
			
			-- extract expected notes
			
			-- compare  			
			--ASSERT (s_note_1 = ) REPORT "single falsch" SEVERITY NOTE;			
		end if;
		
		-- set polyphone notes
		------------------------------------	
		if (token_type_n = string'("polyp")) then
		
		    -- simulate polypohne notes
		    
		end if;
		
		-- check result
		----------------------------------
		if (token_type_n = string'("check")) then		    
			
			-- extract expected notes
			
			-- compare  			
			--ASSERT (s_note_1 = ) REPORT "single falsch" SEVERITY NOTE;			
		end if;
		
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
