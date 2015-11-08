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
	PORT (		clk_12M5			:IN			std_logic;	
				reset_n				:IN			std_logic;
				note_valid			:IN			std_logic;
				note_value			:IN			std_logic_vector(8 downto 0);
				note_out		    :OUT		std_logic_vector(24 downto 0);  
                led                 :OUT        std_logic
		  );
END polyphone_out;


ARCHITECTURE rtl OF polyphone_out IS

SIGNAL	s_note_out:         std_logic_vector( 24 DOWNTO 0 );
SIGNAL	s_next_note_out:    std_logic_vector( 24 DOWNTO 0 );
SIGNAL  s_note_on:          std_logic := '0';

BEGIN

ff : PROCESS(all)
BEGIN
    IF reset_n = '0' THEN
        s_note_out <= ( OTHERS => '0' );       
    ELSIF (clk_12M5'EVENT) AND (clk_12M5 = '1') THEN
        s_note_out <= s_next_note_out;
    END IF;
END PROCESS;


-- note value gives index of vector
set_note_in_vector: PROCESS(all)
BEGIN  
    -- delet default state assignemnet
    
    -- check range of note value (false octave give fals indexes)
    IF (note_valid = '1') AND  (unsigned( note_value ) < note_out'LENGTH)  THEN
        led <= '0';
        -- set on/of state on corresponding value line
        s_note_on <= note_value(8);        
        s_next_note_out( to_integer( unsigned( note_value ))) <= s_note_on;
    else
        led <= '1';
    END IF;
END PROCESS;


-- signal assignment
note_out <= s_note_out;

END ARCHITECTURE rtl;