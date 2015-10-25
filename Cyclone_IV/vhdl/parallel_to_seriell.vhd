----------------------------------------------------------
-- Parallel to serial converter
--
-- Converts digital data vector (16 bit) to digital logic
-- because I2S needs single bit
--
-- The signal change_channel manages the distinguition between
-- right and left channel
-- change_channel = '1': right channel is bitwise set
-- change_channel = '0': left channel is bitwise set
----------------------------------------------------------

--			mit eingebautem Multiplexer, 
--			schiebt mit fallenden BCLK , Flipflops laufen aber mit clk_12M!

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity parallel_to_seriell is
	port (		clk						:in			std_logic;	-- system_clk_12M
				reset_n					:in			std_logic;
				BCLK					:in			std_logic;  -- 6 M ?
				DAC_load				:in			std_logic;
				change_channel			:in			std_logic;
				DACDAT_pl_i				:in			std_logic_vector(15 downto 0);
				DACDAT_pr_i				:in			std_logic_vector(15 downto 0);
				DACDAT_s_o				:out		std_logic
		  );
end parallel_to_seriell;


architecture rtl of parallel_to_seriell is

signal 			l_zustand:	 		std_logic_vector (15 downto 0);
signal 			l_folgezustand:		std_logic_vector (15 downto 0);
signal			r_zustand:			std_logic_vector (15 downto 0);
signal 			r_folgezustand:		std_logic_vector (15 downto 0);

begin

----------------------------------------------------------
-- left channel
----------------------------------------------------------
ff_left_channel : process (all)
begin
	if reset_n = '0' then
		l_zustand <= (others => '0');
	elsif clk'event AND clk = '1' then
		l_zustand <= l_folgezustand;
	end if;
end process;

shift_left_channel_data: process (all)
begin
	if DAC_load = '1' then
	    -- stores vector
		l_folgezustand <= DACDAT_pl_i;
	-- shift 1 bit by Blck 
	elsif change_channel = '0' AND BCLK = '1' then
		l_folgezustand <= l_zustand(14 downto 0) &'0';
	else 
		l_folgezustand <= l_zustand;
	end if;
end process;



----------------------------------------------------------
-- right channel
----------------------------------------------------------
ff_right_channel : process (all)
begin
	if reset_n = '0' then
		r_zustand <= (others => '0');
	elsif clk'event AND clk = '1' then
		r_zustand <= r_folgezustand;
	end if;
end process;


shift_right_channel_data: process (all)
begin
	if DAC_load = '1' then	
		r_folgezustand <= DACDAT_pr_i;
	-- shift bitwise by clock BCLK
	elsif change_channel = '1' AND BCLK='1' then
		r_folgezustand <= r_zustand(14 downto 0) &'0';
	else 
		r_folgezustand <= r_zustand;
	end if;
end process;


----------------------------------------------------------
-- Output
----------------------------------------------------------
set_bit_for_I2S: process (all)
begin
	if change_channel = '0' then
	    -- set last bit
		DACDAT_s_o  <= l_zustand(15);
	else 
		DACDAT_s_o <= r_zustand(15);
	end if;
end process;


end architecture rtl;