-------------------------------------------
-- midi interface
-------------------------------------------
-- copyright: baek
--
-- function:
-- rtl of midi signal processing
-- includes uart_top, midi_control and polyphone_out
--
----------------------------------------------------------------------

LIBRARY		ieee;
USE			ieee.std_logic_1164.all;
USE			ieee.numeric_std.all;

ENTITY midi_interface IS
PORT(   clk_12M5:   IN std_logic; 
        reset_n:    IN std_logic;
        midi_in:    IN std_logic; 
        note_out:   OUT std_logic_vector(24 downto 0); 
        led_out_of_range: OUT std_logic
        );
END midi_interface;


ARCHITECTURE rtl OF midi_interface IS

COMPONENT uart_top
PORT(   serial_in:  IN std_logic;
        clk_12M5:   IN std_logic;
        reset_n:    IN std_logic;
        rx_data:    OUT std_logic_vector(7 DOWNTO 0);
        rx_data_valid: OUT std_logic
        );
END COMPONENT;
	
COMPONENT midi_control IS
PORT (	clk_12M5:       IN	std_logic;	
		reset_n:        IN	std_logic;
		rx_data_valid:  IN	std_logic;
		rx_data:        IN  std_logic_vector(7 downto 0);
        note_valid:     OUT std_logic;  
		note_out:       OUT std_logic_vector(8 downto 0)
		);
END Component;
	
COMPONENT polyphone_out IS
PORT (	clk_12M5		:IN			std_logic;	
        reset_n			:IN			std_logic;
        note_valid		:IN			std_logic;
        note_value		:IN			std_logic_vector(8 downto 0);
        note_out	    :OUT		std_logic_vector(24 downto 0);  
        led             :OUT        std_logic
      );
END Component;

SIGNAL s_serial_in, s_clk_12M5, s_reset_n: std_logic;
SIGNAL s_data_valid:	std_logic;
SIGNAL s_midi_byte:	    std_logic_vector(7 downto 0);
SIGNAL s_note_valid:    std_logic;
SIGNAL s_note_out:      std_logic_vector(8 downto 0);

BEGIN

i_1: uart_top
PORT MAP(serial_in      => midi_in,
        clk_12M5        => clk_12M5, 
        reset_n	        => s_reset_n,	
        rx_data         => s_midi_byte,							
        rx_data_valid   => s_data_valid 
        );
	
i_2: midi_control 
PORT MAP(clk_12M5	    => s_clk_12M5, 
        reset_n	        => s_reset_n,	
        rx_data_valid   => s_data_valid 
		rx_data         => s_midi_byte,	
        note_valid      => s_note_valid,
		note_out        => s_note_out
        );
       
	
i_3: polyphone_out IS
PORT (	clk_12M5	=> s_clk_12M5,
        reset_n		=> s_reset_n,	
        note_valid	=> s_note_valid,
        note_value	=> s_note_out,
        note_out	=> note_out,            -- port interface
        led         => led_out_of_range     -- port interface
      );
        
 END rtl;
