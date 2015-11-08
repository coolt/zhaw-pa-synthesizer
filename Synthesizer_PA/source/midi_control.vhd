-------------------------------------------
-- midi control
-------------------------------------------
-- copyright: gelk, baek 
-- 
-- function
-- state machine detect if note is on/off 
-- state machine is able to recieve multiple notes (polyphone)

------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;



ENTITY midi_control IS
PORT (	clk_12M5:       IN	std_logic;	
		reset_n:        IN	std_logic;
		rx_data_valid:  IN	std_logic;
		rx_data:        IN  std_logic_vector(7 downto 0);
        note_valid:     OUT std_logic;  
		note_out:       OUT std_logic_vector(8 downto 0)
		  );
END midi_control ;



ARCHITECTURE rtl OF midi_control  IS

-- fsm
TYPE state_midi_byte IS ( idle, status, note);
SIGNAL	state		: state_midi_byte;
SIGNAL	next_state	: state_midi_byte;

-- note value
SIGNAL enable_note_register: std_logic;
SIGNAL s_current_note:	    std_logic_vector(7 downto 0) ;	
SIGNAL s_next_note:	        std_logic_vector(7 downto 0) ;	

-- note on/off
SIGNAL enable_note_on:  std_logic;
SIGNAL s_note_on:       std_logic := '0';
SIGNAL s_next_note_on:  std_logic := '0';

-- note valid 
SIGNAL s_note_valid:      std_logic := '0';   



BEGIN

ff: process(all)
begin
    if (reset_n = '0') then
        state <= idle;
        rx_data_valid <= '0';
        rx_data <= (others => '0');
     elsif (clk_12M5'event) and (clk_12M5 = '1') then
        state <= next_state;  
        s_current_note <= s_next_note;  
     end if;
end process;



fsm: process(all)
begin    
    case state is
        when idle =>
            -- status-byte detect note is comming
            if (rx_data_valid = '1') and (rx_data(7 downto 5) = "100") then
                next_state <= status;
            -- note-byte
            elsif (rx_data_valid = '1') and (rx_data(7) = '0') then
                next_state <= note;         
            else     
                next_state <= idle;
            end if;
   
        when status =>
            if (rx_data_valid = '1') then
                next_state <= note;
            else
                next_state <= state;
            end if;
            
        when note =>
            if (rx_data_valid = '1') then
                next_state <= idle;
            else
                next_state <= state;
            end if;
        
        when others =>
            next_state <= idle;
    end case;
end process;



note_value_logic: process(all)
begin
     -- new value
    if (rx_data_valid = '1') and ((state = status) or rx_data(7) = '0') then
            enable_note_register <= '1';
    -- old value
    else
        next_state <= state;
    end if;     
end process;

note_value_register: process(all)
begin
    if (enable_note_register = '1') then
        s_next_note <= rx_data;
    else
        s_next_note <= s_current_note;
    end if;
end process;



note_on_logic: process(all)
begin
    -- set note on/off 
    if (rx_data_valid = '1') and (state = idle) and (rx_data(7 downto 5) = "100")  then
        enable_note_on <= rx_data(4);
        
    -- set note off by polyphonie
    elsif (state = note) and (rx_data = "00000000") then
        enable_note_on <= '0';         --- note löschen ??????????????? 
    else
        enable_note_on <= '0';
    end if;
end process;

note_on_register: process(all)
begin
    if (enable_note_on = '1') then
        s_next_note_on <= rx_data(4);
    else
        s_next_note_on <= s_next_note;
    end if;
end process;




note_valid_logic: process(all)
begin    
    if (rx_data_valid = '1') and (state = note) then
        s_note_valid <= '1';
    else
        s_note_valid <= '0';
    end if;
end process;


--------------------------
-- signal assignment
--------------------------

note_valid <= s_note_valid;
note_out <= (s_note_on & s_note);  


END ARCHITECTURE rtl;
