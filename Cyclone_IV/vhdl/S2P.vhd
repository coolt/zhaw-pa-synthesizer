--S2P
--copyright by herscmic
--version 1.0
--02.04.2013 18.15

--Funktion: Serie zu Parallel Wandler
--			Eingegangene digitale Signale sollen in einen 16-bit Vektor umgewandelt
--			Signale werden mit dem steigenden BCLK abgetastet/geschoben werden

--Libarys
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


-- entity Declaration 
-------------------------------------------
entity S2P is
	port (		clk					:in			std_logic;	--clk_12M
				reset_n				:in			std_logic;
				BCLK				:in			std_logic;
				ADCL_shift			:in 		std_logic;	--links schieben
				ADCR_shift			:in			std_logic;	--rechts schieben
				ADCDAT_s_i			:in			std_logic;	--serieller Eingang
				ADCDAT_pl_o			:out		std_logic_vector(15 downto 0);	--Ausgang links parallel
				ADCDAT_pr_o			:out		std_logic_vector(15 downto 0)	--Ausgang rechts parallel
				
		  );
end S2P;

-- architecture Declaration
-------------------------------------------
architecture rtl of S2P is
-- Signals & Constants Declaration
-------------------------------------------
signal 			l_zustand:	 		std_logic_vector (15 downto 0);
signal 			l_folgezustand:		std_logic_vector (15 downto 0);
signal			r_zustand:			std_logic_vector (15 downto 0);
signal 			r_folgezustand:		std_logic_vector (15 downto 0);

begin
--Flipflop Kanal links
flip_flops_l : process (clk, reset_n)
begin
	if reset_n = '0' then
		l_zustand <= (others => '0');
	elsif clk'event AND clk = '1' then
		l_zustand <= l_folgezustand;
end if;
end process flip_flops_l;


--Eingangslogik Kanal links
einganglog_l: process (l_zustand, BCLK, ADCDAT_s_i, ADCL_shift)
begin
	if BCLK = '0' AND ADCL_shift= '1' then
		l_folgezustand <= l_zustand(14 downto 0) & ADCDAT_s_i ;
	else l_folgezustand <= l_zustand;
	end if;
end process einganglog_l;


--Flipflop rechts
flip_flops_r : process (clk, reset_n)
begin
	if reset_n = '0' then
		r_zustand <= (others => '0');
	elsif clk'event AND clk = '1' then
		r_zustand <= r_folgezustand;
end if;
end process flip_flops_r;


--Eingangslogik rechts
einganglog_r: process (r_zustand, BCLK, ADCDAT_s_i, ADCR_shift)
begin
	if BCLK = '0' AND ADCR_shift= '1' then
		r_folgezustand <=  r_zustand(14 downto 0) & ADCDAT_s_i ;
	else r_folgezustand <= r_zustand;
	end if;
end process einganglog_r;


--Ausgangslogik
ausganglog_rl: process (ADCL_shift, ADCR_shift, l_zustand, r_zustand)
begin 
	if ADCL_shift='0' then
		ADCDAT_pl_o <= l_zustand;
	else ADCDAT_pl_o <= (others => '0');
	end if;
	if ADCR_shift='0' then
		ADCDAT_pr_o <= r_zustand;
	else ADCDAT_pr_o <= (others => '0');
	end if;
end process ausganglog_rl;
--Components Declaration
------------------------------------------

end architecture rtl;