-------------------------------------------
-- polyphone out
-------------------------------------------
-- copyright: baek
--
-- function:
-- 24 notes can be detected seperatly	
-- each note has his line (note 0 = line 0)
-- the note-value gives the index in the vector
-- line on/of means this note on/off
--
-- if note value is out of range, alarm-led is set
--
-------------------------------------------


-- To Do:
-- complte note register (only 2 notes yet)
--

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

-- note register
SIGNAL s_note_1:     std_logic_vector(8 DOWNTO 0 ) := "000000000";
SIGNAL s_next_note_1:std_logic_vector(8 DOWNTO 0 );
SIGNAL s_note_1_on:  std_logic := '0';

SIGNAL s_note_2:     std_logic_vector(8 DOWNTO 0 ) := "000000000";
SIGNAL s_next_note_2:std_logic_vector(8 DOWNTO 0 );
SIGNAL s_note_2_on:  std_logic := '0';

-- index counter
SIGNAL s_index:		natural range 0 to 9;
SIGNAL s_next_index:natural range 0 to 9;

BEGIN

register_index: PROCESS(ALL)
BEGIN
	if (reset_n = '0') then
		s_index <= 0;
	elsif (clk_12M5'event) and (clk_12M5 = '1')then
		s_index <= s_next_index;
	end if;
END PROCESS;


count_up_index: PROCESS(ALL)
BEGIN
    if (reset_n = '0') then
        s_next_index <= 0;
	elsif (s_index = 9) then
		s_next_index <= 0;
	else
		s_next_index <= s_index + 1;
   end if;
END PROCESS;



logic_new_note: PROCESS(ALL)
BEGIN


END PROCESS;


note_register : PROCESS(all)
BEGIN
	IF reset_n = '0' THEN
		s_note_1 <= ( OTHERS => '0' );   
		s_note_2 <= ( OTHERS => '0' );  
		-- complete for all notes 
	ELSIF (clk_12M5'EVENT) AND (clk_12M5 = '1') THEN
		s_note_1 <= s_next_note_1;
		s_note_1 <= s_next_note_1;
		-- complete for all notes 
	END IF;
END PROCESS;





-- signal assignment
note_1 <= s_note_1;

END ARCHITECTURE rtl;
