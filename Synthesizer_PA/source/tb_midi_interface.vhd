-------------------------------------------
-- testbench midi_interface
-------------------------------------------
-- copyright: baek 
--
-- function:
--------------------------------------------------------------------


-- To Do:
-- Implement WAIT Until, damit der 2. Prozess auf das Ende des ersten wartet.
-- löschen aller falschen Signale


-- stimmt der Platz der Signalzuweisung Note_out ????==
-- first: only simple case of note on/off => line = 0
-- danach einen loop durch alle Zeilen

-- logic structer for diver types: simple, vector, polyphon
-- define constants for realising comands as midi-code (8 Bit)
-- destinguish between velocity (default) and velocity = 0 for polyphonie

-- check: why note_out have 9 bit, and notes in out_arry have 8 bit!!!!!!!!!!!!!!!!!!!!!!!

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
  
 -- signals testbench DUT
  SIGNAL tb_clk			 : STD_LOGIC := '0';
  SIGNAL tb_reset_n	    : STD_LOGIC :='1';
  SIGNAL tb_serial_in    : STD_LOGIC := '0';
  SIGNAL tb_note_1		 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL tb_note_2		 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL tb_note_3		 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL tb_note_4		 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL tb_note_5		 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL tb_note_6		 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL tb_note_7		 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL tb_note_8		 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL tb_note_9		 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL tb_note_10	    : STD_LOGIC_VECTOR (8 DOWNTO 0);
  

	-- file handling
	----------------------------------------------------------------
	
	-- array of input from file
	-- token structure: 
	-- | command | 4 x midi_data (note + velocity) |  numbers_of_notes_out |
	
		-- define midi_data
		type t_midi_data is record 
			note : std_logic_vector(7 downto 0);                        --!!!!!!!!!!!!!!!!!!!!!!!only 8 bit
			velocity : std_logic_vector(7 downto 0);
		end record;
		type t_midi_data_array is array (3 downto 0) of t_midi_data;
	
		-- define token structure
		type t_token_line is record
			token_cmd : string(1 to 5);
			token_midi_data : t_midi_data_array;
			token_number : std_logic_vector(3 downto 0);
		end record;

	-- hole array of input values
	CONSTANT NUMBR_INPUTLINES: natural := 8;
	type t_token_array is array( NUMBR_INPUTLINES-1 downto 0)  of t_token_line;
	signal token_array : t_token_array;
	
	
  -- array of (expected) output values 
  type t_note_out_array is array (0 to 9) of STD_LOGIC_VECTOR (8 DOWNTO 0);  
  signal s_note_out_array: t_note_out_array;
  
  	 
  file input_file: TEXT;       
  file output_file: TEXT;    

  SIGNAL s_read_input_finished: std_logic := '0'; 

  
BEGIN


i_midi_interface: midi_interface 
PORT MAP(clk_12M5_i   => tb_clk,
	  reset_n_i   => tb_reset_n,
	  serial_i   => tb_serial_in,
	  note_1_o   => tb_note_1,
	  note_2_o   => tb_note_1,
	  note_3_o   => tb_note_1,
	  note_4_o   => tb_note_1,
	  note_5_o   => tb_note_1,
	  note_6_o   => tb_note_1,
	  note_7_o   => tb_note_1,
	  note_8_o   => tb_note_1,
	  note_9_o   => tb_note_1,
	  note_10_o  => tb_note_1
	  );
	  
--------------------------------------------------------------------
-- testbased test 
--------------------------------------------------------------------

read_file: process

	variable line_in,line_out: Line; 
	variable line_nr: natural range 0 to (NUMBR_INPUTLINES-1) :=0;
	variable good: boolean := true;  
	variable line_cnt: natural range 0 to 2000 := 0;	 
	
	-- input token type
	variable token_cmd: string(1 to 5);
	variable token_note : std_logic_vector(7 downto 0);
	variable	token_velocity : std_logic_vector(7 downto 0);
	variable	token_number : std_logic_vector(3 downto 0);		
	
	
	
	BEGIN
	
	s_read_input_finished <= '0';
	FILE_OPEN(input_file,"../simulation/script/input_midi.txt", READ_MODE);
	FILE_OPEN(output_file,"../simulation/script/result_midi.txt", WRITE_MODE);	
	wait for 4 * SYS_CLK_HALFPERIOD;   

--	loop
      ---------------------------------
		-- Check end of file
		--------------------------------
--		if endfile(input_file) then
--
--			-- output console read line numbers      
--			write(line_out, string'("Number of read lines from file:"));
--			writeline(OUTPUT,line_out);
--			write(line_out, line_cnt);
--			writeline(OUTPUT,line_out);
--			
--			-- output end
--			write(line_out, string'("End of File"));
--			writeline(OUTPUT,line_out);
--			
--			-- set flag to pass to other process
--			s_read_input_finished <= '1';
----			exit;
--			
--		end if;
			
		-----------------------------------
		-- read all token in array
		------------------------------------		
		readline(input_file, line_in);     
		line_cnt := line_cnt + 1;  
		
		-- Skip empty lines
--		next when line_in'length = 0; 

		-- read linewise all tokens in array	
--		for line_nr in 0 to 1 loop		  ------------- Es geht bis 5  ?????? (also 6 Zeilen)
		
			-- read command
			read(line_in, token_cmd, good);
			token_array(line_nr).token_cmd <= token_cmd;                
				if (not good) then
					write(line_out, string'("Error reading token 'type'."));
					writeline(OUTPUT,line_out);				
		      else 
					write(line_out, token_cmd);
					writeline(OUTPUT,line_out);
				end if;			
				
 		-- read 4 times note and velocity	
		for i in 0 to 3 loop
				hread(line_in, token_note, good); 
				token_array(line_nr).token_midi_data(0).note <= token_note;  ----------------------------  i
				if (not good) then
					write(line_out, string'("Error reading note. Value is"));
					writeline(OUTPUT,line_out);	
					write(line_out, std_logic_vector(token_note));
					writeline(OUTPUT,line_out);
				else 
					write(line_out, string'("Read note:"));
					writeline(OUTPUT,line_out);	
					write(line_out, std_logic_vector(token_note));
					writeline(OUTPUT,line_out);
				end if;
				hread(line_in, token_velocity, good);
				token_array(line_nr).token_midi_data(0).velocity <= token_velocity; ------------------------ i
				if (not good) then
					write(line_out, string'("Error reading velocity. Value is"));
					writeline(OUTPUT,line_out);	
					write(line_out, std_logic_vector(token_note));
					writeline(OUTPUT,line_out);
				else 
					write(line_out, string'("Read velocity:"));
					writeline(OUTPUT,line_out);	
					write(line_out, std_logic_vector(token_note));
					writeline(OUTPUT,line_out);
				end if;	
		end loop;	
			
			-- read number of notes
			hread(line_in, token_number, good);
			token_array(line_nr).token_number <= token_number;	
			if (not good) then
					write(line_out, string'("Error note number. Value is"));
					writeline(OUTPUT,line_out);	
					write(line_out, std_logic_vector(token_note));
					writeline(OUTPUT,line_out);
				else 
					write(line_out, string'("Read note number:"));
					writeline(OUTPUT,line_out);	
					write(line_out, std_logic_vector(token_note));
					writeline(OUTPUT,line_out);
				end if;	
	-- end loop;
		
		-- debugging	
		-- write(line_out, string'("All token in current line read in."));
		-- writeline(OUTPUT, line_out);   	
	
--   end loop;
	wait;
end process;


execute_file: process

	-- simulate midi behavior
	variable idle_bit: std_logic := '1';
	variable start_bit: std_logic := '0';
	variable stop_bit: std_logic := '1';
	
	
	variable line_in,line_out: Line; 
	variable token_line: t_token_line;
	variable line_nmbr: natural range 0 to (NUMBR_INPUTLINES-1) := 0;

	
	begin
		
		-- process coodrdination
		wait until (s_read_input_finished <= '1');

		-- initialisation DUT
		tb_reset_n   <= '0'; 
		tb_serial_in <= '0';
		
		-------------------------------------
		-- Execute commands from file
		-------------------------------------
		
		------------------------Now: Line = 0 ------------------------------LOOP for ALL token_lines, for line_nmbr  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!

		-- reset 
		------------------------------------
					
		
--		type t_token_line is record
--			token_cmd : string(1 to 5);
--			token_midi_data : t_midi_data_array;
--			token_number : std_logic_vector(3 downto 0);
--		end record;
--		
		

		token_line := token_array(line_nmbr);
		if (token_line.token_cmd = string'("reset")) then
			
			-- execute 
			tb_reset_n <= '0';
			wait for 10 * SYS_CLK_PERIOD; 
		   tb_reset_n <= '1';
			wait for 30 * SYS_CLK_PERIOD;   		
									
			-- compare  
			if ((tb_note_1(7 downto 0) = token_line.token_midi_data(1).note) ) then    ---!!!!!!!!!!!!falsche länge: links 9, rechts 8 !!!!!
				write(line_out, string'("Reset note 1 good."));
				writeline(OUTPUT,line_out);
			else
				write(line_out, string'("Reset failure note 1"));
				writeline(OUTPUT,line_out);
			end if;
			
			-- output result
			write(line_out, string'("Result reset \n"));
			writeline(output_file,line_out);
			writeline(output_file,line_out);
						
		end if;
		
				
		-- set single notes
		------------------------------------	
		if (token_line.token_cmd = string'("singl")) then		
			
			-- assign required token
			
			-- execute 
			
		end if;		
		
		
		-- check result
		----------------------------------
		if (token_line.token_cmd = string'("check")) then		    
			
			-- assign required token
			
			-- compare  

			-- output result
			
		end if;
		
		-- set polyphone notes
		------------------------------------	
		if (token_line.token_cmd = string'("polyp")) then
			-- asign required token
			
		   -- execute
		    
			
		end if;
		
		wait;
end process;



-------------------------------------
-- Clock for testbench
-------------------------------------
clock: PROCESS
BEGIN
	  WAIT FOR 1 * SYS_CLK_HALFPERIOD;
      tb_clk <= '1';
      WAIT FOR 1 * SYS_CLK_HALFPERIOD;
	  tb_clk <= '0';
END PROCESS;
	
END struct; 
