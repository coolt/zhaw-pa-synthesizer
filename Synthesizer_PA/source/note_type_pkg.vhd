-------------------------------------------
-- Notes types
--
-- copyright: baek
-------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
package note_type_pkg is

-- testbench
  CONSTANT NOTE_ON:  std_logic_vector(7 downto 0) := "10010000";
  CONSTANT NOTE_OFF: std_logic_vector(7 downto 0) := "10000000";
  CONSTANT POLYPHONIE: std_logic_vector(7 downto 0) := "10100000";

  
-- array with token structure  (input file)	

    -- token structure: 
	-- | command | 4 x midi_data (note + attribut) |  numbers_of_notes_out |
    
    -- define midi_data
    type t_midi_data is record                      
        token_note : std_logic_vector(7 downto 0);                    
        token_attribut : std_logic_vector(7 downto 0);
    end record;
    type t_midi_data_array is array (0 to 3) of t_midi_data;

    -- define token structure
    type t_token_line is record
        token_cmd : string(1 to 5);
        t_midi_data : t_midi_data_array;
        token_number : std_logic_vector(7 downto 0);
    end record;


        
-- array with note structure (input/output)     
type t_note_array is array (0 to 9) of std_logic_vector(8 downto 0);




 
end;
