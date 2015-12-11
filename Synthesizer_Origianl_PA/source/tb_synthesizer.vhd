-------------------------------------------
-- testbench synthesizer
-------------------------------------------
-- copyright: baek 
--
-- function:
--------------------------------------------------------------------



library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.all;
use std.textio.all;
use work.std_logic_textio.all; 
use work.note_type_pkg.all;


entity tb_synthesizer is
end;

	architecture struct of tb_synthesizer is

--------------------------------------------------------------------
-- device under test
--------------------------------------------------------------------
COMPONENT top_level IS
PORT(CLOCK_50				:IN			std_logic;
	KEY						:IN			std_logic_vector(3 DOWNTO 0);		--Taster
	SW						:IN			std_logic_vector(17 DOWNTO 0);		--Schalter
	AUD_ADCDAT				:IN			std_logic;							--SD vom Coded DA Wandlung
	AUD_DACDAT				:OUT		std_logic;							--SD zum Codec AD Wandlung
	AUD_BCLK				:OUT		std_logic;							--I2S Bit Clock
	AUD_XCK					:OUT		std_logic;							--Master Clock
	AUD_DACLRCK				:OUT		std_logic;
	AUD_ADCLRCK				:OUT		std_logic;							--WS zum Codec bei AD Wandlung
	I2C_SCLK				:OUT		std_logic;
	I2C_SDAT				:INOUT		std_logic;
	LEDG					:OUT 		std_logic_vector(7 DOWNTO 0);		--Led-Leuchten grün
	HEX0, HEX3, HEX2		:OUT 		std_logic_vector (6 DOWNTO 0);		--Siebensegmentanzeigen
	HEX4, HEX5, HEX1		:OUT 		std_logic_vector (6 DOWNTO 0);		--Siebensegmentanzeigen
	GPIO_25:			IN	std_logic
	  ); 
END COMPONENT;


	
--------------------------------------------------------------------
-- declarations
-------------------------------------------------------------------- 
	-- FPGA clk: 50 MHz
  CONSTANT FPGA_CLK_PERIOD: time   := 4*83333 ps;
  CONSTANT FPGA_CLK_HALFPERIOD: time := 4*41667 ps;
 
  -- system clk: 12.5 MHz
  CONSTANT SYS_CLK_PERIOD: time   := 83333 ps;
  CONSTANT SYS_CLK_HALFPERIOD: time := 41667 ps;
  
  -- midi clk: 31.25 kHz
  CONSTANT MIDI_CLK_PERIOD: time   := 32 us;  
  CONSTANT MIDI_CLK_HALFPERIOD: time:= 16 us;
  
  -- type t_note_array is array (0 to 9) of std_logic_vector(8 downto 0);
  SIGNAL tb_note: t_note_array := ((others => (others => '0')));  
  
  -- signals testbench DUT
  SIGNAL tb_clk_50M			: STD_LOGIC := '0';
  SIGNAL tb_key	    : std_logic_vector(3 DOWNTO 0);
  SIGNAL tb_switch    : std_logic_vector(17 DOWNTO 0);	
  SIGNAL tb_adc_dat	    : STD_LOGIC := '0';
  SIGNAL tb_dac_dat	    : STD_LOGIC := '0';
  SIGNAL tb_i2s_bit_clk	    : STD_LOGIC := '0';
  SIGNAL tb_x_clk	        : STD_LOGIC := '0';
  SIGNAL tb_dac_clk	: STD_LOGIC := '0';
  SIGNAL tb_adc_clk	: STD_LOGIC := '0';
  SIGNAL tb_i2c_clk	: STD_LOGIC := '0';
  SIGNAL tb_i2c_data	: STD_LOGIC := '0';
  
  SIGNAL tb_led_g		 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL tb_hex_0, tb_hex_3, tb_hex_2		 : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL tb_hex_4, tb_hex_5, tb_hex_1		 : STD_LOGIC_VECTOR (6 DOWNTO 0);
  
  SIGNAL tb_serial_in	: STD_LOGIC := '0';

	-- file handling
	----------------------------------------------------------------

	-- array of input values
	CONSTANT NUMBR_INPUTLINES: natural := 12;
	CONSTANT NUMBR_TESTS: natural := 6;
    
	type t_input_array is array( 0 to (NUMBR_INPUTLINES-1))  of t_token_line;
	signal token_array : t_input_array;
	
	
  -- array of (expected) output values   
  signal s_note_out_array: t_note_array;
  
  	 
  file input_file: TEXT;       
  file output_file: TEXT;    

  SIGNAL s_read_input_finished: std_logic := '0'; 
  signal s_bit_tmp: std_logic;

  
BEGIN


i_TOP_LEVEL: top_level
PORT MAP(CLOCK_50	        => tb_clk_50M,
			KEY		        => tb_key,		
			SW		        => tb_switch,			
			AUD_ADCDAT		=> tb_adc_dat,						
			AUD_DACDAT		=> tb_dac_dat,							
			AUD_BCLK		=> tb_i2s_bit_clk,						
			AUD_XCK			=> tb_x_clk,								
			AUD_ADCLRCK		=> tb_adc_clk,						
			I2C_SCLK		=> tb_i2c_clk,
			I2C_SDAT		=> tb_i2c_data,
			LEDG			=> tb_led_g, 	
			HEX0            => tb_hex_0,
			HEX3            => tb_hex_3,
			HEX2            => tb_hex_2,
			HEX4            => tb_hex_4,
			HEX5            => tb_hex_5, 
			HEX1            => tb_hex_1,	
			GPIO_25			=> tb_serial_in
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
--			write(line_out, string'(""));
--			writeline(OUTPUT,line_out);	
            
			-- output console read line numbers      
--			write(line_out, string'("Number of read lines from file:"));
--			writeline(OUTPUT,line_out);
--			write(line_out, line_cnt);
--			writeline(OUTPUT,line_out);
			
			-- output end
			write(line_out, string'("Finished read whole file"));
--			writeline(OUTPUT,line_out);
			
			-- set flag to pass to other process
			s_read_input_finished <= '1';
            
			-- include space after read feedback
--			write(line_out, string'("-----------------------------"));
--			writeline(OUTPUT,line_out);
--			write(line_out, string'(""));
--			writeline(OUTPUT,line_out);	
--			write(line_out, string'(""));
--			writeline(OUTPUT,line_out);	
            
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
--			if (not good) then
--				write(line_out, string'("Error reading token 'type'."));
--				writeline(OUTPUT,line_out);				
--			else 
--				write(line_out, token_cmd);
--				writeline(OUTPUT,line_out);
--			end if;	
			
			-- read 4 times note and attribut	
			for i in 0 to 3 loop
				hread(line_in, token_note, good); 
				token_array(line_nr).t_midi_data(i).token_note <= token_note;  
--				if (not good) then
--					write(line_out, string'("Error reading note. Value is"));
--					writeline(OUTPUT,line_out);	
--					write(line_out, std_logic_vector(token_note));
--					writeline(OUTPUT,line_out);
--				else 
--					write(line_out, string'("Read note:"));
--					writeline(OUTPUT,line_out);	
--					write(line_out, std_logic_vector(token_note));
--					writeline(OUTPUT,line_out);
--				end if; 
				hread(line_in, token_attribut, good);
				token_array(line_nr).t_midi_data(i).token_attribut <= token_attribut; 
--				if (not good) then
--					write(line_out, string'("Error reading attribut. Value is"));
--					writeline(OUTPUT,line_out);	
--					write(line_out, std_logic_vector(token_attribut));
--					writeline(OUTPUT,line_out);
--				else 
--					write(line_out, string'("Read attribut:"));
--					writeline(OUTPUT,line_out);	
--					write(line_out, std_logic_vector(token_attribut));
--					writeline(OUTPUT,line_out);
--				end if;	
			end loop; -- 4 times struct midi_data
			
			-- read number of notes
			hread(line_in, token_number, good);
			token_array(line_nr).token_number <= token_number;	
--			if (not good) then
--				write(line_out, string'("Error note number. Value is"));
--				writeline(OUTPUT,line_out);	
--				write(line_out, std_logic_vector(token_number));
--				writeline(OUTPUT,line_out);
--			else 
--				write(line_out, string'("Read note number:"));
--				writeline(OUTPUT,line_out);	
--				write(line_out, std_logic_vector(token_number));
--				writeline(OUTPUT,line_out);
--			end if;	
--			write(line_out, string'(""));
--			writeline(OUTPUT,line_out);
			-- read all token (= 1 line)	
				
		end loop; -- read all lines (= 1 array)	
		
    end loop; -- searching end of line		
	end loop;
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
 

	begin
		
		-- process coordination
		wait until (s_read_input_finished <= '1');

		-- initialisation DUT
		tb_key(0)    <= '0'; 
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
--			write(line_out_d, string'("Test auf Zeile:"));
--			writeline(OUTPUT,line_out_d);
--			write(line_out_d, line_nmbr);
--			writeline(OUTPUT,line_out_d);
	
			-- reset 
			------------------------------------	    
			if (test_value.token_cmd = string'("reset")) then
				 write(line_out_d, string'("reset"));
				 writeline(OUTPUT,line_out_d);
				 
				 -- execute 
				 tb_key(0)  <= '0';
				 wait for MIDI_CLK_PERIOD; 
				 tb_key(0)  <= '1';
				 wait for 30 * SYS_CLK_PERIOD;   		
												 
				 
			end if; -- line "reset"
			
					  
			-- single notes
			if (test_value.token_cmd = string'("singl")) then	
--				 write(line_out_d, string'("Mode is singl"));
--				 writeline(OUTPUT,line_out_d);
			
				 -- execute (only) 3 times pair of midi-note (note /attribut)
				 -- (because first token (note = 0x55) has to be ignored)
				 for i in 0 to 2 loop 
							  
					  -- read note on/off
					  token_temp := test_value.t_midi_data(i).token_attribut;
					  if (token_temp(4) = '1') then 
--						  write(line_out_d, string'("note on :"));  ---------------neu
					  else
--						  write(line_out_d, string'("note off: "));
--						  writeline(OUTPUT,line_out_d);
						  --write(line_out_d, std_logic_vector(token_temp)); ----------------------
						  --writeline(OUTPUT,line_out_d); --------------------------------------
					 end if;
					  
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
					  --write(line_out_d, string'("note value")); --------------------------------
					  --writeline(OUTPUT,line_out_d);       --------------------------------------
--					  write(line_out_d, std_logic_vector(token_temp));
--					  writeline(OUTPUT,line_out_d);
				  
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
					  token_temp := DUMMY_VELOCITY;
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
					
				 end loop;  -- 4 times midi_token
					  
			end if;	-- line "single"	
			
			-- set polyphone notes
			------------------------------------	
			if (test_value.token_cmd = string'("polyp")) then
--				 write(line_out_d, string'("polyp"));
--				 writeline(OUTPUT,line_out_d);
				 
				 
				-- send polyphonie status bite
				token_temp := POLYPHONIE;
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
				 
				-- loop (note/velocity) 4 times
				for i in 0 to 3 loop 
				
					-- send note i
					token_temp := test_value.t_midi_data(i).token_note;
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
					
					-- send velocity i
					token_temp := test_value.t_midi_data(i).token_attribut;
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
				
				end loop;  -- 4 times (note/velocity)
				               
			end if; -- end line "polyp"
	  
	  end loop; -- check all lines	
	wait;
end process;



-------------------------------------
-- Clock for testbench
-------------------------------------
clock: PROCESS
BEGIN
	  WAIT FOR 1 * FPGA_CLK_HALFPERIOD;
      tb_clk_50M <= '1';
      WAIT FOR 1 * FPGA_CLK_HALFPERIOD;
	  tb_clk_50M <= '0';
END PROCESS;



END struct;
