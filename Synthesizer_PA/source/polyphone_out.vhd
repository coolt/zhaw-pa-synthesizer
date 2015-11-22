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


ENTITY polyphone_out IS
PORT (clk_12M5:  		IN  std_logic;	
	  reset_n:	  		IN	 std_logic;
	  note_valid_i: 	IN  std_logic;
	  note_value_i:	IN  std_logic_vector(8 downto 0);
	  note_1:     		OUT std_logic_vector(8 downto 0); 
	  note_2:     		OUT std_logic_vector(8 downto 0); 
	  note_3:     		OUT std_logic_vector(8 downto 0); 
	  note_4:     		OUT std_logic_vector(8 downto 0); 
	  note_5:     		OUT std_logic_vector(8 downto 0); 
	  note_6:     		OUT std_logic_vector(8 downto 0); 
	  note_7:     		OUT std_logic_vector(8 downto 0); 
	  note_8:     		OUT std_logic_vector(8 downto 0); 
	  note_9:     		OUT std_logic_vector(8 downto 0); 
	  note_10:    		OUT std_logic_vector(8 downto 0) 
	  );
END polyphone_out;


ARCHITECTURE rtl OF polyphone_out IS

SIGNAL note_valid: std_logic := '0';
--SIGNAL s_next_note_valid: std_logic := '0';
SIGNAL s_toggel: std_logic := '0';

-- fsm
TYPE state_fsm IS ( idle, note_exist, note_new);
SIGNAL state: state_fsm;
SIGNAL next_state: state_fsm;

-- array of notes            
type t_noteVector_array is array (1 to 10) of std_logic_vector(8 downto 0) ; 
SIGNAL s_noteVector_array: t_noteVector_array := (  (others => '0'), (others => '0'),
                                                    (others => '0'), (others => '0'),
                                                    (others => '0'), (others => '0'),
                                                    (others => '0'), (others => '0'),
                                                    (others => '0'), (others => '0'));
SIGNAL s_next_noteVector_array: t_noteVector_array:=((others => '0'), (others => '0'),
                                                    (others => '0'), (others => '0'),
                                                    (others => '0'), (others => '0'),
                                                    (others => '0'), (others => '0'),
                                                    (others => '0'), (others => '0'));

SIGNAL s_index:		natural range 1 to 10;
SIGNAL s_next_index: natural range 1 to 10;

-- for logic process
SIGNAL s_current_noteVector: std_logic_vector(8 DOWNTO 0);
SIGNAL s_current_note: std_logic_vector(7 DOWNTO 0);
SIGNAL s_current_on: std_logic := '0';

SIGNAL s_temp_noteVector: std_logic_vector(8 DOWNTO 0);
SIGNAL s_temp_note: std_logic_vector(7 DOWNTO 0);
SIGNAL s_temp_on: std_logic := '0';


-- note register
SIGNAL s_note_1:     std_logic_vector(8 DOWNTO 0 ):= (others => '0');
SIGNAL s_next_note_1:std_logic_vector(8 DOWNTO 0 ):= (others => '0');
SIGNAL s_note_1_on:  std_logic := '0';
SIGNAL s_next_note_1_on:  std_logic := '0';

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

index_ff: PROCESS(ALL)
BEGIN
	if (reset_n = '0') then
		s_index <= 1;
	elsif (clk_12M5'event) and (clk_12M5 = '1')then
		s_index <= s_next_index;
	end if;
END PROCESS;

index_cnt: PROCESS(ALL)
BEGIN
    if (reset_n = '0') then
        s_next_index <= 1;
	elsif (s_index = 10) then
		s_next_index <= 1;
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

if ( note_valid = '1') then -------------- NEW !!!!!!!!!!!!!!!!!!
-- get new note
s_current_noteVector <=  note_value_i;
s_current_note <= s_current_noteVector(7 downto 0);
s_current_on <= s_current_noteVector(8);

-- get registerd notes
for index in 1 to 10 loop

	s_temp_noteVector <= s_noteVector_array(index);
	s_temp_note <= s_temp_noteVector(7 downto 0);
	s_temp_on <= s_temp_noteVector(8);
	
	case state is
	  when idle =>
			-- check if note still exist
			if(note_valid_i = '1' and s_temp_note = s_current_note) then  ---------------
				next_state <= note_exist;  
            elsif(note_valid_i = '1'and s_temp_note /= s_current_note) then ------------ 
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
				for line in 1 to 10 loop
					-- check if note is off
					if (s_temp_on = '0') then
						s_noteVector_array(index) <= s_current_noteVector; -- note_value_i;
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
end if;
	
END PROCESS;



note_ff : PROCESS(all) 
BEGIN
	IF reset_n = '0' THEN
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
		--s_note_1 <= s_next_note_1;
		
--		s_next_note_2 <= s_noteVector_array(2);
--		s_note_2 <= s_next_note_2;
--		
--		s_next_note_3 <= s_noteVector_array(3);
--		s_note_3 <= s_next_note_3;
--		
--		s_next_note_4 <= s_noteVector_array(4);
--		s_note_4 <= s_next_note_4;
--		
--		s_next_note_5 <= s_noteVector_array(5);
--		s_note_5 <= s_next_note_5;
--		
--		s_next_note_6 <= s_noteVector_array(6);
--		s_note_6 <= s_next_note_6;
--		
--		s_next_note_7 <= s_noteVector_array(7);
--		s_note_7 <= s_next_note_7;
--		
--		s_next_note_8 <= s_noteVector_array(8);
--		s_note_8 <= s_next_note_8;
--		
--		s_next_note_9 <= s_noteVector_array(9);
--		s_note_9 <= s_next_note_9;
--		
--		s_next_note_10 <= s_noteVector_array(10);
--		s_note_10 <= s_next_note_10;
	END IF;
END PROCESS;

valid_logic: process(note_valid_i)
begin   
    if (note_valid_i = '1' and s_toggel = '0') then
        note_valid <= '1';
        s_toggel <= '1';
    elsif (note_valid_i = '1' and s_toggel = '1') then
        note_valid <= '0';
        s_toggel <= '0';
    else 
        note_valid <= '0';
    end if;
end process;

--valid_ff: process(all)
--begin
--    --if (reset_n = '0') then
--    --    s_note_valid <= '0';
--   --elsif (clk_12M5'event) and (clk_12M5 = '1') then
--       -- s_note_valid <= s_next_note_valid;
--   --end if;
--end process;



-- signal assignment
note_1 <= s_note_1;
note_2 <= s_note_2;
note_3 <= s_note_3;
note_4 <= s_note_4;
note_5 <= s_note_5;
note_6 <= s_note_6;
note_7 <= s_note_7;
note_8 <= s_note_8;
note_9 <= s_note_9;
note_10 <= s_note_10;

END ARCHITECTURE rtl;
