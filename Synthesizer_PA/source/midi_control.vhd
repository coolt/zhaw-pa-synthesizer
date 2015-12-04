-------------------------------------------
-- midi control
-------------------------------------------
-- copyright: gelk, baek 
-- 
-- concept based on 5 combinatorical logic clouds
-- ----------------------------------------------
-- 1. fsm input logic: detect state
-- 2. logic to enable notes for register
-- 3. logic to enable on/off state of a note
-- 4. logic cloud to detect if the output note has to be valid
-- 5. logic for timing by setting new output

------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
library work;
use work.note_type_pkg.all;


ENTITY midi_control IS
PORT (clk_12M5:       IN	std_logic;
		reset_n:        IN	std_logic;
		rx_data_valid_i:IN	std_logic;
		rx_data_i:      IN  std_logic_vector(7 downto 0);
      note_valid_o:   OUT std_logic;  
		note_out_o:     OUT std_logic_vector(8 downto 0)
		);
END midi_control ;



ARCHITECTURE rtl OF midi_control  IS

-- fsm
TYPE state_midi_byte IS ( idle, single, note_s, velocity_s, polyphonie, note_v, velocity_v);
SIGNAL state: state_midi_byte;
SIGNAL next_state: state_midi_byte;

-- note value
SIGNAL s_current_note:  std_logic_vector(7 downto 0);	
SIGNAL s_next_note:	    std_logic_vector(7 downto 0);	

-- note on/off
SIGNAL s_note_on:       std_logic := '0';
SIGNAL s_next_note_on:  std_logic := '0';

-- note valid 
SIGNAL s_note_valid:    std_logic := '0';
SIGNAL s_next_note_valid:std_logic := '0'; 

SIGNAL s_note_out: std_logic_vector(8 downto 0);   
SIGNAL s_next_note_out: std_logic_vector(8 downto 0);  

BEGIN

fsm_logic: process(all)
begin  
next_state <= state;
    case state is            
        when idle =>
				-- check single note command
            if (rx_data_valid_i = '1') and (rx_data_i(7 downto 5) = "100") then
                next_state <= single;
				-- check polyphonie command	 
            elsif (rx_data_valid_i = '1') and (rx_data_i(7 downto 4) = "1010") then
                next_state <= polyphonie;  
				elsif (rx_data_valid_i = '0') then
                next_state <= idle;
            end if;

        when single =>			
            if (rx_data_valid_i = '1' and rx_data_i(7) = '0') then
                next_state <= note_s;
				elsif (rx_data_valid_i = '0') then
                next_state <= single; 
				else
					next_state <= idle;
            end if;
            
        when note_s =>		
            if (rx_data_valid_i = '1' and rx_data_i(7) = '0') then
                next_state <= velocity_s;
            elsif (rx_data_valid_i = '0') then
                next_state <= note_s;
				else
					next_state <= idle;
            end if;    
 
		when velocity_s =>
				-- check single note command
				if (rx_data_valid_i = '1' and rx_data_i(7 downto 5) = "100") then
                next_state <= single;
				-- check polyphonie command
				elsif (rx_data_valid_i = '1') and (rx_data_i(7 downto 4) = "1010") then
                next_state <= polyphonie; 
				-- normal case 
            elsif (rx_data_valid_i = '0') then
                next_state <= velocity_s;
				else
					next_state <= idle;
            end if; 

	 when polyphonie =>
		if (rx_data_valid_i = '1' and rx_data_i(7) = '0') then
                next_state <= note_v;
				elsif (rx_data_valid_i = '0') then
                next_state <= polyphonie; 
				else
					next_state <= idle;
            end if;
				
		 when note_v =>	 
				if (rx_data_valid_i = '1' and (rx_data_i(7 downto 5) /= "100") and rx_data_i(7 downto 4) /= "1010") then
                next_state <= velocity_v;
            elsif (rx_data_valid_i = '0') then
                next_state <= note_v;
				else
					next_state <= idle;
            end if;  
				
		when velocity_v =>
            -- check single note command
				if (rx_data_valid_i = '1' and rx_data_i(7 downto 5) = "100") then
                next_state <= single;
				-- check polyphonie command
				elsif (rx_data_valid_i = '1') and (rx_data_i(7 downto 4) = "1010") then
                next_state <= polyphonie; 
				-- normal case
				elsif (rx_data_valid_i = '1') then
                next_state <= note_v;
            elsif (rx_data_valid_i = '0') then
                next_state <= velocity_v;
				else
					next_state <= idle;
            end if; 
		
        when others =>
            next_state <= idle;
    end case;
end process;


note_register_logic: process(all)   
begin 
	if (rx_data_valid_i = '1') then 
		  -- single note			                          
		 if (state = single ) then
			  s_next_note <= rx_data_i; 
		 -- polyphonie     
		 elsif (state = polyphonie ) or (state = velocity_v) then 
			  s_next_note <= rx_data_i;  
		 else 
			  s_next_note <= s_current_note;          
		 end if; 
	else
		s_next_note <= s_current_note;          
	end if;
end process;


on_off_logic: process(all)
begin
s_next_note_on <= s_note_on;
	if (rx_data_valid_i = '1') then
	
			-- on/off for single note                        
			if (state = idle or state = velocity_s) and (rx_data_i(7 downto 5) = "100")  then
				s_next_note_on <= rx_data_i(4);
					
			-- on/off for polyphonie  
			elsif (state = note_v) then		
				if(rx_data_i = "00000000") then
						s_next_note_on <= '0';
				else
						s_next_note_on <= '1';
				end if;
			else
				s_next_note_on <= s_note_on;
			end if; 
	else	
		s_next_note_on <= s_note_on;
	end if;
end process;


valid_logic: process(all)
begin    
   if (rx_data_valid_i = '1') and (state = note_s or state = note_v) then 
        s_next_note_valid <= '1';
    else
        s_next_note_valid <= '0';
    end if;   
end process;

output_logic: process(all)   
begin
	if (rx_data_valid_i = '1') then
		-- single mode
		if (state = note_s) then         
			s_next_note_out <= s_note_on & s_current_note; 
		-- polyphonie
		elsif (state = velocity_v) then     
			s_next_note_out <= s_note_on & s_current_note; 
		else
			s_next_note_out <= s_note_out; 
		end if; 
	else
		s_next_note_out <= s_note_out; 
	end if;
end process;



ff: process(all)
begin
   if (reset_n = '0') then
      state <= idle;       
		s_current_note <= (others => '0');
		s_note_on <= '0';
		s_note_valid <= '0';  
		s_note_out <= (others => '0'); 
   elsif (clk_12M5'event) and (clk_12M5 = '1') then
      state <= next_state;
		s_current_note <= s_next_note;
		s_note_on <= s_next_note_on;
		s_note_valid <= s_next_note_valid;
		s_note_out <= s_next_note_out;
   end if;
end process;
--------------------------
-- signal assignment
--------------------------
note_valid_o <= s_note_valid; 
note_out_o <= s_note_out; 


END ARCHITECTURE rtl;
