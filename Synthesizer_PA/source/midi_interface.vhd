-------------------------------------------
-- midi interface
-------------------------------------------
-- copyright: baek
--
-- function:
-- rtl of midi signal 
-- includes uart_top, midi_control and polyphone_out
--
-- aim:
-- 10 notes can be given parallel out (polyphonie)
-- eache note-vector includes on/off bit which is the MSB
--
----------------------------------------------------------------------


-- TO DO:
-- check if signal note_vector is used

LIBRARY		ieee;
USE			ieee.std_logic_1164.all;
USE			ieee.numeric_std.all;

ENTITY midi_interface IS
PORT(   clk_12M5_i:   IN std_logic; 
        reset_n_i:    IN std_logic;
        serial_i:     IN std_logic; 
        note_1_o:     OUT std_logic_vector(8 downto 0); 
		  note_2_o:     OUT std_logic_vector(8 downto 0); 
		  note_3_o:     OUT std_logic_vector(8 downto 0); 
		  note_4_o:     OUT std_logic_vector(8 downto 0); 
		  note_5_o:     OUT std_logic_vector(8 downto 0); 
		  note_6_o:     OUT std_logic_vector(8 downto 0); 
		  note_7_o:     OUT std_logic_vector(8 downto 0); 
		  note_8_o:     OUT std_logic_vector(8 downto 0); 
		  note_9_o:     OUT std_logic_vector(8 downto 0); 
		  note_10_o:    OUT std_logic_vector(8 downto 0) 
        );
END midi_interface;


ARCHITECTURE rtl OF midi_interface IS

COMPONENT uart_top IS
PORT(   serial_in:  IN std_logic;
        clk_12M5:   IN std_logic;
        reset_n:    IN std_logic;
        rx_data:    OUT std_logic_vector(7 DOWNTO 0);
        rx_data_valid: OUT std_logic
        );
END COMPONENT;
	
COMPONENT midi_control IS
PORT (clk_12M5:       	IN	std_logic;	
		reset_n:        	IN	std_logic;
		rx_data_valid_i:  IN	std_logic;
		rx_data_i:        IN  std_logic_vector(7 downto 0);
      note_valid_o:     OUT std_logic;  
		note_out_o:     	OUT std_logic_vector(8 downto 0)
		);
END Component;
	
COMPONENT polyphone_out IS
PORT (	clk_12M5:  		IN  std_logic;	
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
END Component;

-- split note vecotr
SIGNAL s_note_vector: 	std_logic_vector(8 downto 0);

-- connect uart top with midi control
SIGNAL s_data_valid:		std_logic;
SIGNAL s_midi_byte:	   std_logic_vector(7 downto 0);

-- connect midi control with polyphone out
SIGNAL s_note_valid:		std_logic;
SIGNAL s_note_byte:	   std_logic_vector(8 downto 0);


BEGIN

i_uart_top: uart_top
PORT MAP(serial_in      => serial_i,
        clk_12M5        => clk_12M5_i, 
        reset_n	      => reset_n_i,	
        rx_data         => s_midi_byte,							
        rx_data_valid   => s_data_valid 
        );
	
i_midi_control: midi_control 
PORT MAP(clk_12M5	      => clk_12M5_i, 
        reset_n	      => reset_n_i,	
        rx_data_valid_i => s_data_valid, 
		  rx_data_i       => s_midi_byte,	
        note_valid_o    => s_note_valid,
		  note_out_o      => s_note_byte
        );
       
	
i_polyphone_out: polyphone_out
PORT MAP(clk_12M5		=> clk_12M5_i,
        reset_n		=> reset_n_i,	
		  note_valid_i	=> s_note_valid,
		  note_value_i	=> s_note_byte,
        note_1			=> note_1_o,
		  note_2			=> note_2_o,
		  note_3			=> note_3_o,
		  note_4			=> note_4_o,
		  note_5			=> note_5_o,
		  note_6			=> note_6_o,
		  note_7			=> note_7_o,
		  note_8			=> note_8_o,
		  note_9			=> note_9_o,
		  note_10		=> note_10_o
      );
        
 END rtl;
