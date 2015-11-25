-------------------------------------------
-- polyphone out
-------------------------------------------
-- copyright: baek
--
-- function:
-- 10 notes can be played together	
-- Each note receives his own note-register, included on/off

-------------------------------------------

-- TODO:
-- debug exit in loop

-- Question
-- fsm: if valid = 1 necessair ?     if YES, what is the ELSE  ?
-- Problem with temp_vector ?? why red ? 

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

SIGNAL s_note_valid: std_logic := '0';
SIGNAL s_next_note_valid: std_logic := '0';

-- fsm
TYPE state_fsm IS ( idle, note_exist, note_new);
SIGNAL state: state_fsm;
SIGNAL next_state: state_fsm;

-- register of dds notes            
SIGNAL s_dds_note_register: t_note_array := (  (others => '0'), (others => '0'),
                                                    (others => '0'), (others => '0'),
                                                    (others => '0'), (others => '0'),
                                                    (others => '0'), (others => '0'),
                                                    (others => '0'), (others => '0'));
SIGNAL s_next_dds_note_register: t_note_array:=((others => '0'), (others => '0'),
                                                    (others => '0'), (others => '0'),
                                                    (others => '0'), (others => '0'),
                                                    (others => '0'), (others => '0'),
                                                    (others => '0'), (others => '0'));


-- for logic process
SIGNAL s_current_noteVector: std_logic_vector(8 DOWNTO 0);
SIGNAL s_next_current_noteVector: std_logic_vector(8 DOWNTO 0);
SIGNAL s_current_note: std_logic_vector(7 DOWNTO 0);
SIGNAL s_current_on: std_logic := '0';

SIGNAL s_temp_noteVector: std_logic_vector(8 DOWNTO 0);
SIGNAL s_next_temp_noteVector: std_logic_vector(8 DOWNTO 0);
SIGNAL s_temp_note: std_logic_vector(7 DOWNTO 0);
SIGNAL s_temp_on: std_logic := '0';

-- delet
SIGNAL s_index:		natural range 0 to 9;
SIGNAL s_next_index: natural range 0 to 9;



BEGIN

note_fsm: PROCESS(ALL)
BEGIN

--if( s_note_valid = '1') then

    -- get new note
    s_current_noteVector <=  note_value_i;
    s_current_note <= s_current_noteVector(7 downto 0);
    s_current_on <= s_current_noteVector(8);
    
	 -- get registerd notes
	 for index in 0 to 9 loop
		  s_current_noteVector <= s_dds_note_register(index); -- to debug  ??????????
		  s_temp_noteVector <= s_dds_note_register(0);  -- index replaced!!!!!!!!!!!!!!¨¨
		  s_temp_note <= s_temp_noteVector(7 downto 0);
		  s_temp_on <= s_temp_noteVector(8);
		  
		  case state is									
			 when idle =>
					 -- check if note is in register
					 if(note_valid_i = '1' and s_temp_note = s_current_note) then  
						  next_state <= note_exist;  
					 elsif(note_valid_i = '1'and s_temp_note /= s_current_note) then 
						  next_state <= note_new;
					 -- no new note
					 else
						 next_state <= idle;
					 end if;
						
			 when note_exist =>					
					 -- by similar flag, do nothing
					 if(s_temp_on = s_current_on) then
						  next_state <= idle;
					 -- change note on/off
					 else						 
						 s_dds_note_register(index) <= note_value_i;
						  next_state <= idle;
					 end if;
					 
			 when note_new =>
			       -- new note is on
					 if(s_current_on = '1') then
					 
						  -- finde free place in register
						  for line in 0 to 9 loop
								-- look for note which is off
								if (s_temp_on = '0') then
									 s_dds_note_register(index) <= s_current_noteVector;
									 exit;          -------------------------? exit from loop ?
								end if;
						  end loop;							  
						  next_state <= idle;
						  
					 -- new note is off, do nothing
					 else
						  next_state <= idle;
					 end if;
					 
			 when others =>
					 next_state <= idle;
		  end case;	
	 end loop;
	
END PROCESS;

fsm_ff: PROCESS(ALL)
BEGIN
    if (reset_n = '0') then
        state <= idle;
		  --s_current_noteVector <= (others => '0');
     elsif (clk_12M5'event) and (clk_12M5 = '1') then
        state <= next_state; 
		  --s_current_noteVector <= s_next_current_noteVector; 
     end if;
END PROCESS;


note_array_ff : PROCESS(all) 
BEGIN
	IF reset_n = '0' THEN
      s_dds_note_register <=  ((others => '0'), (others => '0'),
                                                    (others => '0'), (others => '0'),
                                                    (others => '0'), (others => '0'),
                                                    (others => '0'), (others => '0'),
                                                    (others => '0'), (others => '0'));
	ELSIF (clk_12M5'EVENT) AND (clk_12M5 = '1') THEN
		 s_dds_note_register <= s_next_dds_note_register;
	END IF;
END PROCESS;


valid_ff: process(all)
begin
    if (reset_n = '0') then
        s_note_valid <= '0';
    elsif (clk_12M5'event) and (clk_12M5 = '1') then
       s_note_valid <= s_next_note_valid;
    end if;
end process;


--index_ff: PROCESS(ALL)   ----------------donne by loop
--BEGIN
--	if (reset_n = '0') then
--		s_index <= 0;
--	elsif (clk_12M5'event) and (clk_12M5 = '1')then
--		s_index <= s_next_index;
--	end if;
--END PROCESS;
--
--index_cnt: PROCESS(ALL)
--BEGIN
--    if (reset_n = '0') then
--        s_next_index <= 0;
--	elsif (s_index = 9) then
--		s_next_index <= 0;
--	else
--		s_next_index <= s_index + 1;
--   end if;
--END PROCESS;





-- signal assignment
note_o <= s_dds_note_register;

END ARCHITECTURE rtl;
