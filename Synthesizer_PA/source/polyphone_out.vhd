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

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY polyphone_out IS
	PORT (		clk_12M5:  		IN  std_logic;	
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

SIGNAL s_note_1:         std_logic_vector(8 DOWNTO 0 ) := "000000000";
SIGNAL s_next_note_1:    std_logic_vector(8 DOWNTO 0 );
SIGNAL s_note_on:        std_logic := '0';

BEGIN

ff : PROCESS(all)
BEGIN
    IF reset_n = '0' THEN
        --s_note_out <= ( OTHERS => '0' );       
    ELSIF (clk_12M5'EVENT) AND (clk_12M5 = '1') THEN
        --s_note_out <= s_next_note_out;
    END IF;
END PROCESS;





-- signal assignment
note_1 <= s_note_1;

END ARCHITECTURE rtl;
