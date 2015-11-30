-------------------------------------------
-- polyphone out
-------------------------------------------
-- copyright: baek
--
-- function:
-- 10 notes can be played together	
-- Each note receives his own note-register, included on/off

-------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
library work;
use work.note_type_pkg.all;


ENTITY polyphone_out IS
PORT (clk_12M5:  		IN  std_logic;	
	  reset_n:	  		IN	 std_logic;
	  note_valid_i: 	IN  std_logic;
	  note_value_i:	IN  std_logic_vector(8 downto 0);
     note_o: out t_note_array 
	  );
END polyphone_out;


ARCHITECTURE rtl OF polyphone_out IS

-- fsm
TYPE state_fsm IS ( idle, note_exist, note_new);
SIGNAL state: state_fsm;
SIGNAL next_state: state_fsm;

-- register of dds notes            
SIGNAL s_dds_note_register: t_note_array := ((others => (others => '0')));                                                    
SIGNAL s_next_dds_note_register: t_note_array:=((others => (others => '0')));


-- for logic process
SIGNAL s_index:		natural range 0 to 9; 
SIGNAL s_next_index: natural range 0 to 9;
SIGNAL s_note_exist: std_logic := '0';
SIGNAL s_next_note_exist: std_logic := '0';
SIGNAL s_new_note: std_logic := '0';
SIGNAL s_next_new_note: std_logic := '0';


BEGIN

note_input_logic: PROCESS(ALL)
variable temp_note_exist: std_logic := '0';

BEGIN
s_next_index <= s_index;
s_next_new_note <= s_new_note;		
s_next_note_exist	<= s_note_exist;
		
	-- new note arrived
	if(note_valid_i = '1') then
	
		-- check if note is in register
		L2:for index in 0 to 9 loop	
	    -- 0000 nich input , sonder flag 
			if(s_dds_note_register(index)(7 downto 0) = note_value_i(7 downto 0) and (note_value_i(7 downto 0) /= "00000000")) then   
			    s_next_index <= index;	
				-- set local flag
				temp_note_exist := '1'; 
				exit L2;
			else
				temp_note_exist := '0';
			end if;
		end loop;
		
		if (temp_note_exist = '1') then
			s_next_note_exist <= '1';
			s_next_new_note <= '0';
		else
			s_next_note_exist <= '0';
			s_next_new_note <= '1';
		end if;
	end if; 
	
	-- idee: s_temp_note_exist <= temp_note_exist ;
	
end process;


fsm_states: PROCESS(ALL)
BEGIN		  
		  case state is									
			 when idle =>
					 -- check if note is in register
					 if(s_note_exist = '1') then  
						  next_state <= note_exist;  					  
					 elsif(s_new_note = '1') then 
						  next_state <= note_new;
					 -- no new note
					 else
						 next_state <= idle;
					 end if;
					 
			 when note_new =>			       
						  next_state <= idle;
						
			 when note_exist =>
						  next_state <= idle;						  
					 
			 when others =>
					 next_state <= idle;
		  end case;		
END PROCESS;




note_register_logic:process(all)

begin	
s_next_dds_note_register <= s_dds_note_register;

	-- new note is on   
	if(s_new_note = '1' and note_value_i(8) = '1') then		    
   
	-- finde free place in register
	L1: for line in 0 to 9 loop
		-- look for note which is off
		if (s_dds_note_register(line)(8) = '0') then
			s_next_dds_note_register(line) <= note_value_i;		
			exit L1;   
		end if;
   end loop;	
	end if; 

   -- on/off not similar: change on/off     
	if(s_note_exist = '1' and (s_dds_note_register(s_index)(8) /= note_value_i(8))) then           
		s_next_dds_note_register(s_index) <= note_value_i;
	end if;	
end process;


fsm_ff: PROCESS(ALL)
BEGIN
    if (reset_n = '0') then
        state <= idle;
		  s_note_exist <= '0';
		  s_new_note <= '0';
     elsif (clk_12M5'event) and (clk_12M5 = '1') then
        state <= next_state; 
		  s_note_exist <= s_next_note_exist;
		  s_new_note <=  s_next_new_note;
		end if;
END PROCESS;


note_array_ff : PROCESS(all) 
BEGIN
	IF reset_n = '0' THEN
      s_dds_note_register <=  ((others => (others => '0')));
	ELSIF (clk_12M5'EVENT) AND (clk_12M5 = '1') THEN
		 s_dds_note_register <= s_next_dds_note_register;
	END IF;
END PROCESS;


index_ff: PROCESS(ALL)   
BEGIN
	if (reset_n = '0') then
		s_index <= 0;
	elsif (clk_12M5'event) and (clk_12M5 = '1')then
		s_index <= s_next_index;
	end if;
END PROCESS;


-- signal assignment
note_o <= s_dds_note_register;

END ARCHITECTURE rtl;
