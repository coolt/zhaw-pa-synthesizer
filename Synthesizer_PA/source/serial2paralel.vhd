-------------------------------------------
-- serial to parallel converter
-------------------------------------------
-- copyright: herscmic (1. version)
-- commented: baek (2. version)
--
-- function:
-- Serial bits stored in 16 bit vector		
-- bits shifted by rising edge of BCLK abgetastet
-------------------------------------------

-- Libarys
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY seriel2paralel IS
	PORT (		clk					:IN			std_logic;	--clk_12M
				reset_n				:IN			std_logic;
				BCLK				:IN			std_logic;
				ADCL_shift			:IN 		std_logic;	--links schieben
				ADCR_shift			:IN			std_logic;	--rechts schieben
				ADCDAT_s_i			:IN			std_logic;	--serieller Eingang
				ADCDAT_pl_o			:OUT		std_logic_vector(15 downto 0);	--Ausgang links parallel
				ADCDAT_pr_o			:OUT		std_logic_vector(15 downto 0)	--Ausgang rechts parallel				
		  );
END seriel2paralel;


ARCHITECTURE rtl OF seriel2paralel IS

SIGNAL 			l_zustand:	 		std_logic_vector (15 DOWNTO 0);
SIGNAL 			l_folgezustand:		std_logic_vector (15 DOWNTO 0);
SIGNAL			r_zustand:			std_logic_vector (15 DOWNTO 0);
SIGNAL 			r_folgezustand:		std_logic_vector (15 DOWNTO 0);

BEGIN
--Flipflop Kanal links
flip_flops_l : PROCESS (clk, reset_n)
BEGIN
	IF reset_n = '0' THEN
		l_zustand <= (OTHERS => '0');
	ELSIF clk'EVENT AND clk = '1' THEN
		l_zustand <= l_folgezustand;
END IF;
END PROCESS flip_flops_l;


--Eingangslogik Kanal links
einganglog_l: PROCESS (l_zustand, BCLK, ADCDAT_s_i, ADCL_shift)
BEGIN
	IF BCLK = '0' AND ADCL_shift= '1' THEN
		l_folgezustand <= l_zustand(14 DOWNTO 0) & ADCDAT_s_i ;
	ELSE l_folgezustand <= l_zustand;
	END IF;
END PROCESS einganglog_l;


--Flipflop rechts
flip_flops_r : PROCESS (clk, reset_n)
BEGIN
	IF reset_n = '0' THEN
		r_zustand <= (OTHERS => '0');
	ELSIF clk'EVENT AND clk = '1' THEN
		r_zustand <= r_folgezustand;
END IF;
END PROCESS flip_flops_r;


--Eingangslogik rechts
einganglog_r: PROCESS (r_zustand, BCLK, ADCDAT_s_i, ADCR_shift)
BEGIN
	IF BCLK = '0' AND ADCR_shift= '1' THEN
		r_folgezustand <=  r_zustand(14 DOWNTO 0) & ADCDAT_s_i ;
	ELSE r_folgezustand <= r_zustand;
	END IF;
END PROCESS einganglog_r;


--Ausgangslogik
ausganglog_rl: PROCESS (ADCL_shift, ADCR_shift, l_zustand, r_zustand)
BEGIN 
	IF ADCL_shift='0' THEN
		ADCDAT_pl_o <= l_zustand;
	ELSE ADCDAT_pl_o <= (OTHERS => '0');
	END IF;
	IF ADCR_shift='0' THEN
		ADCDAT_pr_o <= r_zustand;
	ELSE ADCDAT_pr_o <= (OTHERS => '0');
	END IF;
END PROCESS ausganglog_rl;


END ARCHITECTURE rtl;