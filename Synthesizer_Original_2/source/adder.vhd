-- Adder

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
use work.note_type_pkg.all;

-- Entity Declaration 
-------------------------------------------
ENTITY adder IS
	PORT (clk					: IN std_logic;
			reset_n				: IN std_logic;	
			data_0_i				: IN std_logic_vector(15 downto 0);
			note_0_on_i			: IN std_logic ; 	
			data_1_i				: IN std_logic_vector(15 downto 0);
			note_1_on_i			: IN std_logic ; 
			data_2_i				: IN std_logic_vector(15 downto 0);
			note_2_on_i			: IN std_logic ; 
			data_3_i				: IN std_logic_vector(15 downto 0);
			note_3_on_i			: IN std_logic ; 
			data_4_i				: IN std_logic_vector(15 downto 0);
			note_4_on_i			: IN std_logic ; 
			data_5_i				: IN std_logic_vector(15 downto 0);
			note_5_on_i			: IN std_logic ; 
			data_6_i				: IN std_logic_vector(15 downto 0);
			note_6_on_i			: IN std_logic ; 
			data_7_i				: IN std_logic_vector(15 downto 0);
			note_7_on_i			: IN std_logic ; 
			data_8_i				: IN std_logic_vector(15 downto 0);
			note_8_on_i			: IN std_logic ; 
			data_9_i				: IN std_logic_vector(15 downto 0);
			note_9_on_i			: IN std_logic ; 
			dds_DATA_O			: OUT	std_logic_vector (15 DOWNTO 0)
		  );
END adder;

-- Architecture Declaration
-------------------------------------------
ARCHITECTURE rtl OF adder IS

SIGNAL s_carry: std_logic_vector(16 downto 0);

-- Begin Architecture
-------------------------------------------
BEGIN



wave_addition: PROCESS(all)
BEGIN
	s_carry <= (others => '0');
	
	-- adds only notes which are on
	if (note_0_on_i = '1') then
		s_carry <= '0' & (s_carry(15 downto 0) and data_0_i);
	elsif (note_1_on_i = '1') then
		s_carry <= '0' & (s_carry(15 downto 0) and  data_1_i);
	elsif (note_2_on_i = '1') then
		s_carry <= '0' & (s_carry(15 downto 0) and  data_2_i);
	elsif (note_3_on_i = '1') then
		s_carry <= '0' & (s_carry(15 downto 0) and  data_3_i);	
	elsif (note_4_on_i = '1') then
		s_carry <= '0' & (s_carry(15 downto 0) and data_4_i);
	elsif (note_5_on_i = '1') then
		s_carry <= '0' & (s_carry(15 downto 0) and  data_5_i);
	elsif (note_6_on_i = '1') then
		s_carry <= '0' & (s_carry(15 downto 0) and  data_6_i);
	elsif (note_7_on_i = '1') then
		s_carry <= '0' & (s_carry(15 downto 0) and  data_7_i);
	elsif (note_8_on_i = '1') then
		s_carry <= '0' & (s_carry(15 downto 0) and  data_8_i);	
	elsif (note_9_on_i = '1') then
		s_carry <= '0' & (s_carry(15 downto 0) and  data_9_i);
		
	-- note is off
	else
		s_carry <= (others => '0');
	end if;
	
	-- check overflow (carry out)
	if (s_carry(15) = '1') then
		dds_DATA_O <= (others => '0'); -----------------???
	else 
		-- set added wave as output
		dds_DATA_O <= s_carry(15 downto 0); 
	end if;

END PROCESS;


-- End Architecture
-----------------------------------------			  
END ARCHITECTURE rtl;
