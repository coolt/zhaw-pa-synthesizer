--P2S
--copyright by herscmic
--version 1.0
--02.04.2013 18.15


--Funktion: Parallel zu Seriell-Wandler.
--			mit eingebautem Multiplexer, 
--			schiebt mit fallenden BCLK , Flipflops laufen aber mit clk_12M!

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


-- entity Declaration 
-------------------------------------------
entity P2S is
	port (		clk						:in			std_logic;	--clk_12M
				reset_n					:in			std_logic;
				BCLK					:in			std_logic;
				DAC_load				:in			std_logic;
				change_channel			:in			std_logic;
				DACDAT_pl_i				:in			std_logic_vector(15 downto 0);
				DACDAT_pr_i				:in			std_logic_vector(15 downto 0);
				DACDAT_s_o				:out		std_logic
		  );
end P2S;

-- architecture Declaration
-------------------------------------------
architecture rtl of P2S is
-- Signals & Constants Declaration
-------------------------------------------
signal 			l_zustand:	 		std_logic_vector (15 downto 0);
signal 			l_folgezustand:		std_logic_vector (15 downto 0);
signal			r_zustand:			std_logic_vector (15 downto 0);
signal 			r_folgezustand:		std_logic_vector (15 downto 0);

begin

-----------------------Kanal links-------------------------------

--Flipflop Kanal links
flip_flops_l : process (clk, reset_n, l_zustand, l_folgezustand)
begin
	if reset_n = '0' then
		l_zustand <= (others => '0');
	elsif clk'event AND clk = '1' then
		l_zustand <= l_folgezustand;
end if;
end process flip_flops_l;


--Eingangslogik Kanal links
einganglog_l: process (all)
begin
	if DAC_load= '1' then
		l_folgezustand <= DACDAT_pl_i;
	--Sicherstellung das mit dem fallenden BCLK geschoben wird
	elsif change_channel ='0' AND BCLK='1' then
	--Bits schieben
		l_folgezustand <= l_zustand(14 downto 0) &'0';
	else l_folgezustand <= l_zustand;
	end if;
end process einganglog_l;


---------------------------Kanal rechts---------------------------------------

--Flipflop Kanal rechts
flip_flops_r : process (clk, reset_n, r_folgezustand)
begin
	if reset_n = '0' then
		r_zustand <= (others => '0');
	elsif clk'event AND clk = '1' then
		r_zustand <= r_folgezustand;
end if;
end process flip_flops_r;

--Eingangslogik Kanal rechts
einganglogik_r: process (all)
begin
	if DAC_load = '1' then	
		r_folgezustand <= DACDAT_pr_i;
	--Sicherstellung das mit dem fallenden BCLK geschoben wird
	elsif change_channel = '1' AND BCLK='1' then
	--Bits schieben
		r_folgezustand <= r_zustand(14 downto 0) &'0';
	else r_folgezustand <= r_zustand;
	end if;
end process einganglogik_r;




--Ausgangslogik Kanal rechts&links (funktioniert als Multiplexer)
ausgangslog_lr: process (all)
begin
	if change_channel ='0' then
		DACDAT_s_o  <= l_zustand(15);
	else DACDAT_s_o <= r_zustand(15);
	end if;
end process ausgangslog_lr;


end architecture rtl;