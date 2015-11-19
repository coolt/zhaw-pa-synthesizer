-------------------------------------------
-- testbench midi_interface
-------------------------------------------
-- copyright: baek 
--
-- function:
--------------------------------------------------------------------

-- To Do:
-- make procedure for: check result, send midi data !!
-- implement polyphonie

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
  
  -- midi signals
  CONSTANT NOTE_ON:  std_logic_vector(7 downto 0) := "10010000";
  CONSTANT NOTE_OFF: std_logic_vector(7 downto 0) := "10000000";
  
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
	-- | command | 4 x midi_data (note + attribut) |  numbers_of_notes_out |
	
		-- define midi_data
		type t_midi_data is record                      -- note_5  = "0000 1001"  = 0x05
			token_note : std_logic_vector(7 downto 0);  -- note on = "1001 0000"  = 0x90                   
			token_attribut : std_logic_vector(7 downto 0);
		end record;
		type t_midi_data_array is array (0 to 3) of t_midi_data;
	
		-- define token structure
		type t_token_line is record
			token_cmd : string(1 to 5);
			t_midi_data : t_midi_data_array;
			token_number : std_logic_vector(7 downto 0);
		end record;

	-- hole array of input values
	CONSTANT NUMBR_INPUTLINES: natural := 8;
	CONSTANT NUMBR_TESTS: natural := 4;
	type t_token_array is array( 0 to (NUMBR_INPUTLINES-1))  of t_token_line;
	signal token_array : t_token_array;
	
	
  -- array of (expected) output values 
  type t_note_out_array is array (0 to 9) of STD_LOGIC_VECTOR (8 DOWNTO 0);  
  signal s_note_out_array: t_note_out_array;
  
  	 
  file input_file: TEXT;       
  file output_file: TEXT;    

  SIGNAL s_read_input_finished: std_logic := '0'; 
  signal s_bit_tmp: std_logic;

  
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
	variable token_attribut : std_logic_vector(7 downto 0);
	variable token_number : std_logic_vector(7 downto 0);		
	
	
	
	BEGIN
	
	s_read_input_finished <= '0';
	FILE_OPEN(input_file,"../simulation/script/input_midi.txt", READ_MODE);
	FILE_OPEN(output_file,"../simulation/script/result_midi.txt", WRITE_MODE);	
	wait for 4 * SYS_CLK_HALFPERIOD;   

   ---------------------------------
	-- check end of file
	--------------------------------
	loop
        
		if endfile(input_file) then
        
			-- include space bevor result read in
			write(line_out, string'(""));
			writeline(OUTPUT,line_out);	
            
			-- output console read line numbers      
			write(line_out, string'("Number of read lines from file:"));
			writeline(OUTPUT,line_out);
			write(line_out, line_cnt);
			writeline(OUTPUT,line_out);
			
			-- output end
			write(line_out, string'("Finished read whole file"));
			writeline(OUTPUT,line_out);
			
			-- set flag to pass to other process
			s_read_input_finished <= '1';
            
			-- include space after read feedback
			write(line_out, string'("-----------------------------"));
			writeline(OUTPUT,line_out);
			write(line_out, string'(""));
			writeline(OUTPUT,line_out);	
			write(line_out, string'(""));
			writeline(OUTPUT,line_out);	
            
			exit;
			
		end if;

		
		
		-----------------------------------
		-- read linewise all tokens in array	
		------------------------------------	
		
		-- loop for all lines
		for line_nr in 0 to (NUMBR_INPUTLINES-1) loop		 
			readline(input_file, line_in);     
			line_cnt := line_cnt + 1;  
			
			-- Skip empty lines
			next when line_in'length = 0; 
	
	
			-- read all tokens
			--------------------------------
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
			
			-- read 4 times note and attribut	
			for i in 0 to 3 loop
				hread(line_in, token_note, good); 
				token_array(line_nr).t_midi_data(i).token_note <= token_note;  
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
				hread(line_in, token_attribut, good);
				token_array(line_nr).t_midi_data(i).token_attribut <= token_attribut; 
				if (not good) then
					write(line_out, string'("Error reading attribut. Value is"));
					writeline(OUTPUT,line_out);	
					write(line_out, std_logic_vector(token_attribut));
					writeline(OUTPUT,line_out);
				else 
					write(line_out, string'("Read attribut:"));
					writeline(OUTPUT,line_out);	
					write(line_out, std_logic_vector(token_attribut));
					writeline(OUTPUT,line_out);
				end if;	
			end loop; -- 4 times struct midi_data
			
			-- read number of notes
			hread(line_in, token_number, good);
			token_array(line_nr).token_number <= token_number;	
			if (not good) then
				write(line_out, string'("Error note number. Value is"));
				writeline(OUTPUT,line_out);	
				write(line_out, std_logic_vector(token_number));
				writeline(OUTPUT,line_out);
			else 
				write(line_out, string'("Read note number:"));
				writeline(OUTPUT,line_out);	
				write(line_out, std_logic_vector(token_number));
				writeline(OUTPUT,line_out);
			end if;	
			write(line_out, string'(""));
			writeline(OUTPUT,line_out);
			-- read all token (= 1 line)	
				
		end loop; -- read all lines (= 1 array)	
		
    end loop; -- searching end of line		
	
	wait;
end process;


execute_file: process

	-- simulate midi behavior
	variable idle_bit: std_logic := '1';
	variable start_bit: std_logic := '0';
	variable stop_bit: std_logic := '1';
	
	-- input array handling
	variable line_in,line_out, line_out_d, line_out_t: Line; 
	variable line_nmbr: integer;	
	variable test_value, check_value: t_token_line;	
	variable token_temp: std_logic_vector(7 downto 0);
	 
	-- expected results (from check-line)
	variable result_note_1: std_logic_vector(7 downto 0);
	variable result_note_2: std_logic_vector(7 downto 0);
	variable result_note_3: std_logic_vector(7 downto 0);
	variable result_note_4: std_logic_vector(7 downto 0);
	variable result_note_5: std_logic_vector(7 downto 0);
	variable result_note_6: std_logic_vector(7 downto 0);
	variable result_note_7: std_logic_vector(7 downto 0);
	variable result_note_8: std_logic_vector(7 downto 0);
	variable result_number_of_notes: std_logic_vector(7 downto 0);
 

	begin
		
		-- process coordination
		wait until (s_read_input_finished <= '1');

		-- initialisation DUT
		tb_reset_n   <= '0'; 
		tb_serial_in <= '0';
		
		-------------------------------------
		-- Execute commands from file
		-------------------------------------
		      
	  -- go throw all test lines
	  for i in 0 to (NUMBR_TESTS-1) loop    
			line_nmbr := i * 2;
			test_value := token_array(line_nmbr); 
			check_value := token_array(line_nmbr + 1); 
			
			-- debugging
			write(line_out_d, string'("Test auf Zeile:"));
			writeline(OUTPUT,line_out_d);
			write(line_out_d, line_nmbr);
			writeline(OUTPUT,line_out_d);
	
			-- reset 
			------------------------------------	    
			if (test_value.token_cmd = string'("reset")) then
				 write(line_out_d, string'("reset"));
				 writeline(OUTPUT,line_out_d);
				 
				 -- execute 
				 tb_reset_n <= '0';
				 wait for 10 * SYS_CLK_PERIOD; 
				 tb_reset_n <= '1';
				 wait for 30 * SYS_CLK_PERIOD;   		
												 
				 -- compare output DUT with expected output from file
				 if ((tb_note_1(7 downto 0) = check_value.t_midi_data(0).token_note) ) then    
					  write(line_out, string'("Reset note 1 good."));
					  writeline(OUTPUT,line_out);
					  
					  write(line_out_d, std_logic_vector(tb_note_1(7 downto 0)));
					  writeline(OUTPUT,line_out_d);                   
					  write(line_out_d, std_logic_vector(check_value.t_midi_data(0).token_note));
					  writeline(OUTPUT,line_out_d);
				 else                
					  write(line_out, string'("Reset failure note 1"));
					  writeline(OUTPUT,line_out);   
			  
					  write(line_out_d, std_logic_vector(tb_note_1(7 downto 0)));
					  writeline(OUTPUT,line_out_d);                   
					  write(line_out_d, std_logic_vector(check_value.t_midi_data(0).token_note));
					  writeline(OUTPUT,line_out_d);
					  
				 end if;
				 
				 -- output result in file
				 write(line_out_t, string'("Result reset \n"));
				 writeline(output_file,line_out_t);
				 writeline(output_file,line_out);
	
				 
				 write(line_out, string'(""));
				 writeline(OUTPUT,line_out);
			end if; -- line "reset"
			
					  
			-- set single notes: test note on/off
			--------------------------------------	
			if (test_value.token_cmd = string'("singl")) then	
				 write(line_out_d, string'("singl"));
				 writeline(OUTPUT,line_out_d);
			
				 -- execute (only) 3 times pair of midi-note (note /attribut)
				 -- (because first token (note = 0x55) has to be ignored)
				 for i in 0 to 2 loop 
							  
					  -- read note on/off
					  token_temp := test_value.t_midi_data(i).token_attribut;
					  write(line_out_d, string'("note on/off"));
					  writeline(OUTPUT,line_out_d);
					  write(line_out_d, std_logic_vector(token_temp));
					  writeline(OUTPUT,line_out_d);
					  
					  -- send note on/off
					  tb_serial_in <= idle_bit ;
					  WAIT FOR 2 * MIDI_CLK_PERIOD;
					  
					  tb_serial_in <= start_bit;
					  WAIT FOR 1 * MIDI_CLK_PERIOD; 
					  
					  for j in 0 to 7 loop            
							tb_serial_in <= token_temp(j);
							WAIT FOR MIDI_CLK_PERIOD;            
					  end loop;
					  
					  tb_serial_in <= stop_bit;
					  WAIT FOR 1 * MIDI_CLK_PERIOD; 
					  
					  tb_serial_in <= idle_bit ;
					  WAIT FOR 2 * MIDI_CLK_PERIOD; 
					  
					  -- read note value
					  token_temp := test_value.t_midi_data(i+1).token_note;
					  write(line_out_d, string'("note value"));
					  writeline(OUTPUT,line_out_d);
					  write(line_out_d, std_logic_vector(token_temp));
					  writeline(OUTPUT,line_out_d);
				  
					  -- send note
					  tb_serial_in <= idle_bit ;
					  WAIT FOR 2 * MIDI_CLK_PERIOD; 
					  
					  tb_serial_in <= start_bit;
					  WAIT FOR 1 * MIDI_CLK_PERIOD; 
					  
					  for j in 0 to 7 loop            
							tb_serial_in <= token_temp(j);
							WAIT FOR MIDI_CLK_PERIOD;            
					  end loop;
					  
					  tb_serial_in <= stop_bit;
					  WAIT FOR 1 * MIDI_CLK_PERIOD; 
					  
					  tb_serial_in <= idle_bit ;
					  WAIT FOR 2 * MIDI_CLK_PERIOD; 
					  
					  -- send dummy velociy
					  token_temp := "11111111";
					  tb_serial_in <= idle_bit ;
					  WAIT FOR 2 * MIDI_CLK_PERIOD;
					  
					  tb_serial_in <= start_bit;
					  WAIT FOR 1 * MIDI_CLK_PERIOD; 
					  
					  for j in 0 to 7 loop            
							tb_serial_in <= token_temp(j);
							WAIT FOR MIDI_CLK_PERIOD;            
					  end loop;
					  
					  tb_serial_in <= stop_bit;
					  WAIT FOR 1 * MIDI_CLK_PERIOD; 
					  
					  tb_serial_in <= idle_bit ;
					  WAIT FOR 2 * MIDI_CLK_PERIOD; 
					  
				-- compare output DUT with expected output from file	
				 if ((tb_note_1(7 downto 0) = check_value.t_midi_data(i+1).token_note) ) then    
					  write(line_out, string'("Single note  good."));
					  writeline(OUTPUT,line_out);
					  
					  write(line_out_d, std_logic_vector(tb_note_1(7 downto 0)));
					  writeline(OUTPUT,line_out_d);                   
					  write(line_out_d, std_logic_vector(check_value.t_midi_data(i+1).token_note));
					  writeline(OUTPUT,line_out_d);
				 else                
					  write(line_out, string'("Failure single"));
					  writeline(OUTPUT,line_out);   
			  
					  write(line_out_d, std_logic_vector(tb_note_1(7 downto 0)));
					  writeline(OUTPUT,line_out_d);                   
					  write(line_out_d, std_logic_vector(check_value.t_midi_data(i+1).token_note));
					  writeline(OUTPUT,line_out_d);
					  
				 end if;
				 							 
				 -- output result in file
				 write(line_out_t, string'("Single note\n"));
				 writeline(output_file,line_out_t);
				 writeline(output_file,line_out);
	
				 write(line_out, string'(""));
				 writeline(OUTPUT,line_out);
	
	
				 -- ignore last token (velocity; "on/off") for equilibrum
		
				 end loop;  -- 4 times midi_token
				 
				 -- read out numbers of notes
				  token_temp(7 downto 0) := test_value.token_number;
				  write(line_out_d, string'("Number of acitve notes"));
				  writeline(OUTPUT,line_out_d);
				  write(line_out_d, std_logic_vector(token_temp));
				  writeline(OUTPUT,line_out_d);
									
				  -- end 1 midi-struct
				  write(line_out, string'(""));
				  writeline(OUTPUT,line_out);
					  
			end if;	-- line "single"	
			
			-- set polyphone notes
			------------------------------------	
			if (test_value.token_cmd = string'("polyp")) then
				 write(line_out_d, string'("polyp"));
				 writeline(OUTPUT,line_out_d);
				 
				 -- asign required token
				 
				 -- execute
				 
				 
				 write(line_out, string'(""));
			writeline(OUTPUT,line_out);                
			end if; -- end line "polyp"
	  
	  end loop; -- check all lines	
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
