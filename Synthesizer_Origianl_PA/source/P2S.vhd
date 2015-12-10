--P2S
--copyright by herscmic
--version 1.0
--02.04.2013 18.15


--Funktion: Parallel zu Seriell-Wandler.
--			mit eingebautem Multiplexer, 
--			schiebt mit fallenden BCLK , Flipflops laufen aber mit clk_12M!

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


-- Entity Declaration 
-------------------------------------------
ENTITY P2S IS
	PORT (		clk						:IN			std_logic;	--clk_12M
				reset_n					:IN			std_logic;
				BCLK					:IN			std_logic;
				DAC_load				:IN			std_logic;
				WS_dly					:IN			std_logic;
				DACDAT_pl_i				:IN			std_logic_vector(15 downto 0);
				DACDAT_pr_i				:IN			std_logic_vector(15 downto 0);
				DACDAT_s_o				:OUT		std_logic
		  );
END P2S;

-- Architecture Declaration
-------------------------------------------
ARCHITECTURE rtl OF P2S IS
-- Signals & Constants Declaration
-------------------------------------------
SIGNAL 			l_zustand:	 		std_logic_vector (15 DOWNTO 0);
SIGNAL 			l_folgezustand:		std_logic_vector (15 DOWNTO 0);
SIGNAL			r_zustand:			std_logic_vector (15 DOWNTO 0);
SIGNAL 			r_folgezustand:		std_logic_vector (15 DOWNTO 0);

BEGIN

-----------------------Kanal links-------------------------------

--Flipflop Kanal links
flip_flops_l : PROCESS (clk, reset_n, l_zustand, l_folgezustand)
BEGIN
	IF reset_n = '0' THEN
		l_zustand <= (OTHERS => '0');
	ELSIF clk'EVENT AND clk = '1' THEN
		l_zustand <= l_folgezustand;
END IF;
END PROCESS flip_flops_l;


--Eingangslogik Kanal links
einganglog_l: PROCESS (WS_dly, DAC_load, BCLK, l_zustand, DACDAT_pl_i)
BEGIN
	IF DAC_load= '1' THEN
		l_folgezustand <= DACDAT_pl_i;
	--Sicherstellung das mit dem fallenden BCLK geschoben wird
	ELSIF WS_dly ='0' AND BCLK='1' THEN
	--Bits schieben
		l_folgezustand <= l_zustand(14 DOWNTO 0) &'0';
	ELSE l_folgezustand <= l_zustand;
	END IF;
END PROCESS einganglog_l;


---------------------------Kanal rechts---------------------------------------

--Flipflop Kanal rechts
flip_flops_r : PROCESS (clk, reset_n, r_folgezustand)
BEGIN
	IF reset_n = '0' THEN
		r_zustand <= (OTHERS => '0');
	ELSIF clk'EVENT AND clk = '1' THEN
		r_zustand <= r_folgezustand;
END IF;
END PROCESS flip_flops_r;

--Eingangslogik Kanal rechts
einganglogik_r: PROCESS (WS_dly, DAC_load, BCLK, r_zustand, DACDAT_pr_i)
BEGIN
	IF DAC_load = '1' THEN	
		r_folgezustand <= DACDAT_pr_i;
	--Sicherstellung das mit dem fallenden BCLK geschoben wird
	ELSIF WS_dly = '1' AND BCLK='1' THEN
	--Bits schieben
		r_folgezustand <= r_zustand(14 DOWNTO 0) &'0';
	ELSE r_folgezustand <= r_zustand;
	END IF;
END PROCESS einganglogik_r;




--Ausgangslogik Kanal rechts&links (funktioniert als Multiplexer)
ausgangslog_lr: PROCESS (l_zustand, r_zustand, WS_dly)
BEGIN
	IF WS_dly ='0' THEN
		DACDAT_s_o  <= l_zustand(15);
	ELSE DACDAT_s_o <= r_zustand(15);
	END IF;
END PROCESS ausgangslog_lr;


END ARCHITECTURE rtl;