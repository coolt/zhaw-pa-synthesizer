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
PORT(clk_12M5_i:   IN std_logic; 
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
  
  -- midi clk: 31.25 kHz
  CONSTANT MIDI_CLK_PERIOD: time   := 32 us;  
  CONSTANT MIDI_CLK_HALFPERIOD: time:= 16 us;
 
  SIGNAL s_clk: STD_LOGIC := '0';
  SIGNAL s_reset_n: STD_LOGIC :='1';
  SIGNAL s_serial_in: STD_LOGIC := '0';
  

	-- file handling
	
	-- token structure: command | 4 x midi_data (note + velocity) |  numbers_of_notes_out
		-- define midi_data
		type t_midi_data is record 
			note : std_logic_vector(7 downto 0);
			velocity : std_logic_vector(7 downto 0);
		end record;
		type t_midi_data_array is array (3 downto 0) of t_midi_data;
	
		-- define token structure
		type t_token is record
			token_cmd : string(1 to 5);
			token_midi_data : t_midi_data_array;
			token_number : std_logic_vector(3 downto 0);
		end record;

	-- array of input values
	CONSTANT NUMBR_INPUTLINES: natural := 8;
	type t_token_array is array( NUMBR_INPUTLINES-1 downto 0)  of t_token;
	
	
  -- array of (expected) output values 
  type t_note_out_array is array (0 to 9) of STD_LOGIC_VECTOR (8 DOWNTO 0);  
  signal note_out_array: t_note_out_array;
  	 
  file input_file: TEXT;       
  file output_file: TEXT;    

  SIGNAL s_line_in, s_line_out: Line; 
  SIGNAL s_line_is_executed: std_logic := '0';
  
  -- simulate midi signal
--  SIGNAL s_idle: std_logic := '1';
--  SIGNAL s_start_bit: std_logic := '0';
--  SIGNAL s_stop_bit: std_logic := '1';

BEGIN
--------------------------------------------------------------------
-- instantiation
--------------------------------------------------------------------

i_midi_interface: midi_interface 
PORT MAP(clk_12M5_i   => s_clk,
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

read_file: process

	-- File handling
	variable line_in,line_out: Line; 
	variable good: boolean := true;  
	variable line_cnt: natural range 0 to 2000 := 0;
	
	-- token structure: command_type | note_1 | velocity_1 | note_2 | velocity_2 | note_3 | velocity_3 | note_4 | velocity_4 | numbers_of_notes_out
	variable token_type_n: string(1 to 5);
	variable token_note_1: std_logic_vector(7 downto 0) :=(OTHERS => '0');
	variable token_velocity_1: std_logic_vector(7 downto 0) :=(OTHERS => '0');
	variable token_note_2: std_logic_vector(7 downto 0) :=(OTHERS => '0');
	variable token_velocity_2: std_logic_vector(7 downto 0) :=(OTHERS => '0');
	variable token_note_3: std_logic_vector(7 downto 0) :=(OTHERS => '0');
	variable token_velocity_3: std_logic_vector(7 downto 0) :=(OTHERS => '0');
	variable token_note_4: std_logic_vector(7 downto 0) :=(OTHERS => '0');
	variable token_velocity_4: std_logic_vector(7 downto 0) :=(OTHERS => '0');
	variable token_number_notes_out: std_logic_vector(3 downto 0) :=(OTHERS => '0');
	
	
	BEGIN
	FILE_OPEN(input_file,"../simulation/script/input_midi.txt", READ_MODE);
	FILE_OPEN(output_file,"../simulation/script/result_midi.txt", WRITE_MODE);
	
	wait for 4 * SYS_CLK_HALFPERIOD;   

	loop
		s_line_is_executed <= '0';
      ---------------------------------
		-- Check end of file
		--------------------------------
		if endfile(input_file) then

			-- output console read line numbers      
			write(line_out, string'("Number of read lines from file:"));
			writeline(OUTPUT,line_out);
			write(line_out, line_cnt);
			writeline(OUTPUT,line_out);
			
			-- output end
			write(line_out, string'("End of File"));
			writeline(OUTPUT,line_out);
			
			wait for 800 us;
			exit;
			
		end if;
			
		-----------------------------------
		-- Read 10 token in (and check for error)
		------------------------------------		
		readline(input_file, line_in);     
		line_cnt := line_cnt + 1;  
		
		-- Skip empty lines
		next when line_in'length = 0; 

		read(line_in, token_type_n, good);
		s_token_type_n <= token_type_n;
			if (not good) then
				write(line_out, string'("Error reading token 'type'."));
				writeline(OUTPUT,line_out);
			end if;
		hread(line_in, token_note_1, good); 
		s_token_note_1 <= token_note_1;
			if (not good) then
				write(line_out, string'("Error reading token 'note1'."));
				writeline(OUTPUT,line_out);
			end if;
		hread(line_in, token_velocity_1, good);
		s_token_velocity_1 <= token_velocity_1;
			if (not good) then
				write(line_out, string'("Error reading token 'velocity1'."));
				writeline(OUTPUT,line_out);
			end if;
		hread(line_in, token_note_2, good);
		s_token_note_2 <= token_note_2;
			if (not good) then
				write(line_out, string'("Error reading token 'note2'."));
				writeline(OUTPUT,line_out);
			end if;
		hread(line_in, token_velocity_2, good);
		s_token_velocity_2 <= token_velocity_2;
			if (not good) then
				write(line_out, string'("Error reading token 'velocity2'."));
				writeline(OUTPUT,line_out);
			end if;
		hread(line_in, token_note_3, good);
		s_token_note_3 <= token_note_3;
			if (not good) then
				write(line_out, string'("Error reading token 'note3'."));
				writeline(OUTPUT,line_out);
			end if;		
		hread(line_in, token_velocity_3, good);
		s_token_velocity_3 <= token_velocity_3;
			if (not good) then
				write(line_out, string'("Error reading token 'velocity3'."));
				writeline(OUTPUT,line_out);
			end if;		
		hread(line_in, token_note_4, good);
		s_token_note_4 <= token_note_4;
			if (not good) then
				write(line_out, string'("Error reading token 'note4'."));
				writeline(OUTPUT,line_out);
			end if;		
		hread(line_in, token_velocity_4, good);
		s_token_velocity_4 <= token_velocity_4;
			if (not good) then
				write(line_out, string'("Error reading token 'velocity4'."));
				writeline(OUTPUT,line_out);
			end if;				
		hread(line_in, token_number_notes_out, good);
		s_token_number_notes_out <= token_number_notes_out;
			if (not good) then
				write(line_out, string'("Error reading token 'number_notes_out'."));
				writeline(OUTPUT,line_out);
			end if;
					
		-- debugging	
		-- write(line_out, string'("All token in current line read in."));
		-- writeline(OUTPUT, line_out);   	
	  wait until (s_line_is_executed = '1');	
   end loop;
	wait;
end process;


execute_file: process

variable idle_bit: std_logic := '1';
variable start_bit: std_logic := '0';
variable stop_bit: std_logic := '1';

begin

	-------------------------------------
	-- Initialisation
	-------------------------------------
	s_reset_n   <= '0'; 
	s_serial_in <= '0';
	
	-------------------------------------
	-- Execute commands from file
	-------------------------------------
		
		-- reset 
		------------------------------------
		if (s_token_type_n = string'("reset")) then
			
			-- execute 
			s_reset_n <= '0';
			wait for 10 * SYS_CLK_PERIOD; 
		   s_reset_n <= '1';
			wait for 30 * SYS_CLK_PERIOD;   		
					
			-- set finished line
			s_line_is_execute <= '1';
			
			-- check result
			wait until (s_token_type_n = string'("check"))	    

				-- load expected value
				s_result_1 <= s_note_1;  ---------------ev. gleich in der if abfrage  (note_1_o = s_note_1)
				
				-- compare  
				if (not (note_1_o = s_result_1) ) then
					write(line_out, string'("Reset failure note 1"));
					writeline(OUTPUT,line_out);
				end if;
				
				-- output result
				write(line_out, string'("Result reset \n"));
				writeline(output_file,line_out);
				writeline(output_file,line_out);
				
			-- set finished line
			s_line_is_execute <= '1';			
		end if;
		
				
		-- set single notes
		------------------------------------	
		if (s_token_type_n = string'("singl")) then		
			
			-- assign required token
			
			-- execute 
			
			-- set finished line
			s_line_is_execute <= '1';
		end if;		
		
		
		-- check result
		----------------------------------
		if (s_token_type_n = string'("check")) then		    
			
			-- assign required token
			
			-- compare  

			-- output result
			
			-- set finished line
			s_line_is_execute <= '1';			
		end if;
		
		-- set polyphone notes
		------------------------------------	
		if (s_token_type_n = string'("polyp")) then
			-- asign required token
			
		   -- execute
		    
			-- set finished line
			s_line_is_execute <= '1';
		end if;
		
		-- check result
		----------------------------------
		if (s_token_type_n = string'("check")) then		    
			
			-- extract expected notes
			
			-- compare  			
			
			-- set finished line
			s_line_is_execute <= '1';			
		end if;		
		
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
