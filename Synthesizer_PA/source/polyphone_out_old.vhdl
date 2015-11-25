-------------------------------------------
-- polyphone out
-------------------------------------------
-- copyright: baek
--
-- function:
-- 10 notes can be played together	
-- Each note receives his own note-register, included on/off

-------------------------------------------


-- to do:
-- signal vector (array):  note , next note, note on, ...
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
SIGNAL s_noteVector_array: t_note_array := (  (others => '0'), (others => '0'),
                                                    (others => '0'), (others => '0'),
                                                    (others => '0'), (others => '0'),
                                                    (others => '0'), (others => '0'),
                                                    (others => '0'), (others => '0'));
SIGNAL s_next_noteVector_array: t_note_array:=((others => '0'), (others => '0'),
                                                    (others => '0'), (others => '0'),
                                                    (others => '0'), (others => '0'),
                                                    (others => '0'), (others => '0'),
                                                    (others => '0'), (others => '0'));

SIGNAL s_index:		natural range 0 to 9;
SIGNAL s_next_index: natural range 0 to 9;

-- for logic process
SIGNAL s_current_noteVector: std_logic_vector(8 DOWNTO 0);
SIGNAL s_current_note: std_logic_vector(7 DOWNTO 0);
SIGNAL s_current_on: std_logic := '0';

SIGNAL s_temp_noteVector: std_logic_vector(8 DOWNTO 0);
SIGNAL s_temp_note: std_logic_vector(7 DOWNTO 0);
SIGNAL s_temp_on: std_logic := '0';


-- note register


SIGNAL s_note_1:     std_logic_vector(8 DOWNTO 0 ):= (others => '0');  -- noteVectorarray(0)
SIGNAL s_next_note_1:std_logic_vector(8 DOWNTO 0 ):= (others => '0');   -- nextnoteVectorarray(0)
SIGNAL s_note_1_on:  std_logic := '0';  -- noteVectorarray(0).(8)  => s_note_1(8);
SIGNAL s_next_note_1_on:  std_logic := '0';  -- noteVectorarray(0).(8)
SIGNAL s_note_2:     std_logic_vector(8 DOWNTO 0 ):= (others => '0');
SIGNAL s_next_note_2:std_logic_vector(8 DOWNTO 0 ):= (others => '0');
SIGNAL s_note_2_on:  std_logic := '0';
SIGNAL s_next_note_2_on:  std_logic := '0';

SIGNAL s_note_3:     std_logic_vector(8 DOWNTO 0 ):= (others => '0');
SIGNAL s_next_note_3:std_logic_vector(8 DOWNTO 0 ):= (others => '0');
SIGNAL s_note_3_on:  std_logic := '0';
SIGNAL s_next_note_3_on:  std_logic := '0';


SIGNAL s_note_4:     std_logic_vector(8 DOWNTO 0 ):= (others => '0');
SIGNAL s_next_note_4:std_logic_vector(8 DOWNTO 0 ):= (others => '0');
SIGNAL s_note_4_on:  std_logic := '0';
SIGNAL s_next_note_4_on:  std_logic := '0';

SIGNAL s_note_5:     std_logic_vector(8 DOWNTO 0 ):= (others => '0');
SIGNAL s_next_note_5:std_logic_vector(8 DOWNTO 0 ):= (others => '0');
SIGNAL s_note_5_on:  std_logic := '0';
SIGNAL s_next_note_5_on:  std_logic := '0';

SIGNAL s_note_6:     std_logic_vector(8 DOWNTO 0 ):= (others => '0');
SIGNAL s_next_note_6:std_logic_vector(8 DOWNTO 0 ):= (others => '0');
SIGNAL s_note_6_on:  std_logic := '0';
SIGNAL s_next_note_6_on:  std_logic := '0';

SIGNAL s_note_7:     std_logic_vector(8 DOWNTO 0 ):= (others => '0');
SIGNAL s_next_note_7:std_logic_vector(8 DOWNTO 0 ):= (others => '0');
SIGNAL s_note_7_on:  std_logic := '0';
SIGNAL s_next_note_7_on:  std_logic := '0';

SIGNAL s_note_8:     std_logic_vector(8 DOWNTO 0 ):= (others => '0');
SIGNAL s_next_note_8:std_logic_vector(8 DOWNTO 0 ):= (others => '0');
SIGNAL s_note_8_on:  std_logic := '0';
SIGNAL s_next_note_8_on:  std_logic := '0';

SIGNAL s_note_9:     std_logic_vector(8 DOWNTO 0 ):= (others => '0');
SIGNAL s_next_note_9:std_logic_vector(8 DOWNTO 0 ):= (others => '0');
SIGNAL s_note_9_on:  std_logic := '0';
SIGNAL s_next_note_9_on:  std_logic := '0';

SIGNAL s_note_10:     std_logic_vector(8 DOWNTO 0 ):= (others => '0');
SIGNAL s_next_note_10:std_logic_vector(8 DOWNTO 0 ):= (others => '0');
SIGNAL s_note_10_on:  std_logic := '0';
SIGNAL s_next_note_10_on:  std_logic := '0';



BEGIN

---------------------TEST----------------------------------------------------------
--s_note_1 <= s_noteVector_array(0);   ----------------- TEST of TYP------------------
--s_note_1_on <= s_note_1(8);



index_ff: PROCESS(ALL)
BEGIN
	if (reset_n = '0') then
		s_index <= 0;
	elsif (clk_12M5'event) and (clk_12M5 = '1')then
		s_index <= s_next_index;
	end if;
END PROCESS;

index_cnt: PROCESS(ALL)
BEGIN
    if (reset_n = '0') then
        s_next_index <= 0;
	elsif (s_index = 9) then
		s_next_index <= 0;
	else
		s_next_index <= s_index + 1;
   end if;
END PROCESS;

fsm_ff: PROCESS(ALL)
BEGIN
    if (reset_n = '0') then
        state <= idle;
     elsif (clk_12M5'event) and (clk_12M5 = '1') then
        state <= next_state;  
     end if;
END PROCESS;


note_fsm: PROCESS(ALL)
BEGIN


    -- get new note
    s_current_noteVector <=  note_value_i;
    s_current_note <= s_current_noteVector(7 downto 0);
    s_current_on <= s_current_noteVector(8);
    
    -- get registerd notes
    for index in 0 to 9 loop
    
        s_temp_noteVector <= s_noteVector_array(index);
        s_temp_note <= s_temp_noteVector(7 downto 0);
        s_temp_on <= s_temp_noteVector(8);
        
        case state is									--if ( s_note_valid = '1') then
          when idle =>
                -- check if note still exist
                if(note_valid_i = '1' and s_temp_note = s_current_note) then  
                    next_state <= note_exist;  
                elsif(note_valid_i = '1'and s_temp_note /= s_current_note) then 
                    next_state <= note_new;    
                else
                   next_state <= idle;
                end if;
                  
          when note_exist =>
                if(s_temp_on = s_current_on) then
                    next_state <= idle;
                else
                   -- change note on/off
                   s_noteVector_array(index) <= note_value_i;
                    next_state <= idle;
                end if;
                
          when note_new =>
                if(s_current_on = '1') then
                
                    -- finde free place in array
                    for line in 0 to 9 loop
                        -- check if note is off
                        if (s_temp_on = '0') then
                            s_noteVector_array(index) <= s_current_noteVector;
                            exit;
                        end if;
                    end loop;	
                    
                    next_state <= idle;
                else
                    next_state <= idle;
                end if;
                
          when others =>
                next_state <= idle;
        end case;	
    end loop;
	
END PROCESS;



note_ff : PROCESS(all) 
BEGIN
	IF reset_n = '0' THEN
        -- REDESIGN WITH VECTORS
		s_note_1 <= ( OTHERS => '0' );   
		s_note_2 <= ( OTHERS => '0' );  
		s_note_3 <= ( OTHERS => '0' );   
		s_note_4 <= ( OTHERS => '0' );  
		s_note_5 <= ( OTHERS => '0' );   
		s_note_6 <= ( OTHERS => '0' );  
		s_note_7 <= ( OTHERS => '0' );   
		s_note_8 <= ( OTHERS => '0' );  
		s_note_9 <= ( OTHERS => '0' );   
		s_note_10 <= ( OTHERS => '0' );  
	ELSIF (clk_12M5'EVENT) AND (clk_12M5 = '1') THEN
		s_next_noteVector_array <= s_noteVector_array;
        
        -- REDESIGN WITH VECTORS
		--s_note_1 <= s_next_note_1;
		
--		s_next_note_2 <= s_noteVector_array(2);
--		s_note_2 <= s_next_note_2;
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



-- signal assignment
note_o(0) <= s_note_1;
note_o(1) <= s_note_2;
note_o(2) <= s_note_3;
note_o(3) <= s_note_4;
note_o(4) <= s_note_5;
note_o(5) <= s_note_6;
note_o(6) <= s_note_7;
note_o(7) <= s_note_8;
note_o(8) <= s_note_9;
note_o(9) <= s_note_10;

END ARCHITECTURE rtl;
