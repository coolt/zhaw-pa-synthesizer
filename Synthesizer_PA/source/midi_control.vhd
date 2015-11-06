-------------------------------------------
-- midi control
-------------------------------------------
-- copyright: herscmic (1. version)
-- commented: baek (2. version)
--
-- function:
-- Receive 1 Byte of midi-data
-- 3 Midi-states are decoded
-- Note on
-- Note off
-- Polyphonie
------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;



ENTITY midi_control IS
	PORT (	clk_12M5				:IN			std_logic;	
			reset_n					:IN			std_logic;
			rx_data_valid			:IN			std_logic;
			rx_data 				:IN  		std_logic_vector(7 downto 0);  
			note_on				    :OUT		std_logic;
			polyphonie_status		:OUT 		std_logic;
			note_value				:OUT 		natural range 0 to 128
		  );
END midi_control ;



ARCHITECTURE rtl OF midi_control  IS


constant STATUS_NOTE_ON: 		std_logic_vector(3 downto 0):= "1000";

-- typ state

SIGNAL s_rx_valid					:			std_logic := '0';
SIGNAL s_note_on					:			std_logic := '0';	
SIGNAL s_polyphonie_status			:			std_logic := '0';	



BEGIN





END ARCHITECTURE rtl;
