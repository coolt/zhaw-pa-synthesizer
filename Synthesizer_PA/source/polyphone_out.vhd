-------------------------------------------
-- polyphone out
-------------------------------------------
-- copyright: baek
--
-- function:
-- 10 notes can be played together	
-- Each note receives his own note-register, included on/off

-------------------------------------------

-- Questions:
-- else: in loop: 
--

-- TODO:
-- Optimize loop:  -- Nicht NUR den Input auf "0000" prüfen, sonder, wenn In = '000', dann ob Flag ist off (= '0')

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
	  note_0:     		OUT std_logic_vector(8 downto 0); 
     note_1:     		OUT std_logic_vector(8 downto 0); 
 	  note_2:     		OUT std_logic_vector(8 downto 0); 
 	  note_3:     		OUT std_logic_vector(8 downto 0); 
	  note_4:     		OUT std_logic_vector(8 downto 0); 
 	  note_5:     		OUT std_logic_vector(8 downto 0); 
 	  note_6:     		OUT std_logic_vector(8 downto 0); 
	  note_7:     		OUT std_logic_vector(8 downto 0); 
 	  note_8:     		OUT std_logic_vector(8 downto 0); 
 	  note_9:     		OUT std_logic_vector(8 downto 0) 
	  );
END polyphone_out;


ARCHITECTURE rtl OF polyphone_out IS


-- register of dds notes            
SIGNAL s_dds_note_register: t_note_array := ((others => (others => '0')));                                                    
SIGNAL s_next_dds_note_register: t_note_array:=((others => (others => '0')));


-- for logic process
SIGNAL s_index:		natural range 0 to 9; 
SIGNAL s_next_index: natural range 0 to 9;

SIGNAL s_note_0:     std_logic_vector(8 DOWNTO 0 ) := "000000000";
SIGNAL s_next_note_0:std_logic_vector(8 DOWNTO 0 ):= "000000000";
SIGNAL s_note_1:     std_logic_vector(8 DOWNTO 0 ) := "000000000";
SIGNAL s_next_note_1:std_logic_vector(8 DOWNTO 0 ):= "000000000";
SIGNAL s_note_2:     std_logic_vector(8 DOWNTO 0 ) := "000000000";
SIGNAL s_next_note_2:std_logic_vector(8 DOWNTO 0 ):= "000000000";
SIGNAL s_note_3:     std_logic_vector(8 DOWNTO 0 ) := "000000000";
SIGNAL s_next_note_3:std_logic_vector(8 DOWNTO 0 ):= "000000000";
SIGNAL s_note_4:     std_logic_vector(8 DOWNTO 0 ) := "000000000";
SIGNAL s_next_note_4:std_logic_vector(8 DOWNTO 0 ):= "000000000";
SIGNAL s_note_5:     std_logic_vector(8 DOWNTO 0 ) := "000000000";
SIGNAL s_next_note_5:std_logic_vector(8 DOWNTO 0 ):= "000000000";
SIGNAL s_note_6:     std_logic_vector(8 DOWNTO 0 ) := "000000000";
SIGNAL s_next_note_6:std_logic_vector(8 DOWNTO 0 ):= "000000000";
SIGNAL s_note_7:     std_logic_vector(8 DOWNTO 0 ) := "000000000";
SIGNAL s_next_note_7:std_logic_vector(8 DOWNTO 0 ):= "000000000";
SIGNAL s_note_8:     std_logic_vector(8 DOWNTO 0 ) := "000000000";
SIGNAL s_next_note_8:std_logic_vector(8 DOWNTO 0 ):= "000000000";
SIGNAL s_note_9:     std_logic_vector(8 DOWNTO 0 ) := "000000000";
SIGNAL s_next_note_9:std_logic_vector(8 DOWNTO 0 ):= "000000000";



BEGIN

input_logic: PROCESS(ALL)
BEGIN		
	L1:for index in 0 to 9 loop
		
		-- check if note is in register 
		if(s_dds_note_register(index)(7 downto 0) = note_value_i(7 downto 0) ) then			
			s_next_index <= index;
			exit L1; 			
		-- remember last free place in register
		elsif(s_dds_note_register(index)(8) = '0') then
			s_next_index <= index;
		-- ?
		else
	      s_next_index <= s_index; 				
		end if;
	end loop;
end process;

register_logic: process(all)
begin
s_next_note_0 <= s_note_0;
s_next_note_1 <= s_note_1;
s_next_note_2 <= s_note_2;
s_next_note_3 <= s_note_3;
s_next_note_4 <= s_note_4;
s_next_note_5 <= s_note_5;
s_next_note_6 <= s_note_6;
s_next_note_7 <= s_note_7;
s_next_note_8 <= s_note_8;
s_next_note_9 <= s_note_9;

	-- change note in register, if on/off has changed
	-- or set new note, if note is on
	case s_index is 
		when 0 =>
		     
				if s_note_0(8) /= note_value_i(8) then
					s_next_note_0 <= note_value_i;
				else
					s_next_note_0 <= s_note_0;
				end if;
		when 1 =>
				if s_note_1(8) /= note_value_i(8) then
					s_next_note_1 <= note_value_i;
				else
					s_next_note_1 <= s_note_1;
				end if; 
		when 2 =>
				if s_note_2(8) /= note_value_i(8) then
					s_next_note_2 <= note_value_i;
				else
					s_next_note_2 <= s_note_2;
				end if; 
		when 3 =>
				if s_note_3(8) /= note_value_i(8) then
					s_next_note_3 <= note_value_i;
				else
					s_next_note_3 <= s_note_3;
				end if; 
		when 4 =>
				if s_note_4(8) /= note_value_i(8) then
					s_next_note_4 <= note_value_i;
				else
					s_next_note_4 <= s_note_4;
				end if;
		when 5 =>
				if s_note_5(8) /= note_value_i(8) then
					s_next_note_5 <= note_value_i;
				else
					s_next_note_5 <= s_note_5;
				end if; 
		when 6 =>
				if s_note_6(8) /= note_value_i(8) then
					s_next_note_6 <= note_value_i;
				else
					s_next_note_6 <= s_note_6;
				end if; 
		when 7 =>
				if s_note_7(8) /= note_value_i(8) then
					s_next_note_7 <= note_value_i;
				else
					s_next_note_7 <= s_note_7;
				end if; 
		when 8 =>
				if s_note_8(8) /= note_value_i(8) then
					s_next_note_8 <= note_value_i;
				else
					s_next_note_8 <= s_note_8;
				end if; 
		when 9 =>
				if s_note_9(8) /= note_value_i(8) then
					s_next_note_9 <= note_value_i;
				else
					s_next_note_9 <= s_note_9;
				end if; 

		-- ?
		when others =>
				s_next_note_0 <= s_note_0;
	end case;
end process;


ff: PROCESS(ALL)   
BEGIN
	if (reset_n = '0') then
		s_dds_note_register <=  ((others => (others => '0')));
		s_index <= 0;
		s_note_0 <= ( OTHERS => '0' );
		s_note_1 <= ( OTHERS => '0' );   
 		s_note_2 <= ( OTHERS => '0' );  
		s_note_3 <= ( OTHERS => '0' );   
		s_note_4 <= ( OTHERS => '0' );  
		s_note_5 <= ( OTHERS => '0' );   
		s_note_6 <= ( OTHERS => '0' );  
		s_note_7 <= ( OTHERS => '0' );   
		s_note_8 <= ( OTHERS => '0' );  
		s_note_9 <= ( OTHERS => '0' );   
  
	elsif (clk_12M5'event) and (clk_12M5 = '1')then
		--s_dds_note_register <= s_next_dds_note_register;
		s_dds_note_register(0) <= s_next_note_0; 
		s_dds_note_register(1) <= s_next_note_1;
		s_dds_note_register(2) <= s_next_note_2;
		s_dds_note_register(3) <= s_next_note_3;
		s_dds_note_register(4) <= s_next_note_4; 
		s_dds_note_register(5) <= s_next_note_5;
		s_dds_note_register(6) <= s_next_note_6;
		s_dds_note_register(7) <= s_next_note_7;
		s_dds_note_register(8) <= s_next_note_8; 
		s_dds_note_register(9) <= s_next_note_9;
		s_index <= s_next_index;
		s_note_0 <= s_next_note_0;
		s_note_1 <= s_next_note_1;
		s_note_2 <= s_next_note_2;
		s_note_3 <= s_next_note_3;
		s_note_4 <= s_next_note_4;
		s_note_5 <= s_next_note_5;
		s_note_6 <= s_next_note_6;
		s_note_7 <= s_next_note_7;
		s_note_8 <= s_next_note_8;
		s_note_9 <= s_next_note_9;		
	end if;
END PROCESS;


-- signal assignment
--note_o <= s_dds_note_register;
note_0 <= s_note_0;
note_1 <= s_note_1;
note_2 <= s_note_2;
note_3 <= s_note_3;
note_4 <= s_note_4;
note_5 <= s_note_5;
note_6 <= s_note_6;
note_7 <= s_note_7;
note_8 <= s_note_8;
note_9 <= s_note_9;


END ARCHITECTURE rtl;
