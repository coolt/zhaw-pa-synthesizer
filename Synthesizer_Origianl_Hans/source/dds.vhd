--dds
--copyright by bleispiu
--version 0.1
--19.04.2013 19:00 Uhr

-- Funktion: Der DDS beinhaltet einen Zähler der je nach Eingang in gewünschten
-- Abständen auf 2048 hochzählt. Aus einer Tabelle werden Werte geholt und 
-- an den Ausgang ausgegeben.
------------------------------------------------ 

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

LIBRARY work;
USE work.tone_gen_pkg.all;

--Entity Declaration
------------------------------------------------
ENTITY dds IS
	PORT(	clk_12M			: IN	std_logic;
			reset_n			: IN	std_logic;
			strobe_i		: IN	std_logic;					-- eingang von I2S
			tone_on_i		: IN	std_logic;					-- eingang von tone_decoder
			phi_incr_i		: IN	natural range 0 to 65000;	-- schrittweite fuer den Zaehler
			dacdat_g_o		: OUT	std_logic_vector (15 downto 0);
			bclk			: IN	std_logic
			);
	END dds;
	
	
--Architecture Declaration
------------------------------------------------
ARCHITECTURE rtl OF dds IS
--Signal & Constants Declaration
------------------------------------------------
SIGNAL 		addr 			:		integer range 0 to L-1;
SIGNAL 		count			:  		unsigned(N_CUM - 1 downto 0); --15 downto 0		N_CUM --> grösse 16
SIGNAL 		count_folge		:      	unsigned(N_CUM - 1 downto 0);
CONSTANT 	N_AUDIO			:		natural :=16; 
CONSTANT	max_value		:		natural := 2**N_CUM;
CONSTANT	N_LUT			:		natural:=6; 



BEGIN
-- PROCESS for FLIPFLOPS
------------------------------------------------
flipflop :	PROCESS	(clk_12M, reset_n)
BEGIN
IF 		(reset_n = '0')						THEN
		count <= (OTHERS => '0');
		
ELSIF 	(clk_12M'EVENT AND clk_12M = '1')	THEN
		count	<=	count_folge;
END IF;

END PROCESS;

	
-- PROCESS for LOGIC
-- Dieser Process beschreibt die Logic vor den Flipflops der Folgezustand ist der Ist-Zustand plus die
-- Schrittweite phi_incr_i ist ein Vektor von 15 downto 0. maximale grösse 2 hoch 16!!
------------------------------------------------
logic	:	PROCESS (strobe_i, count, tone_on_i, bclk, phi_incr_i)
BEGIN

IF 		(tone_on_i = '1') THEN
		IF		(strobe_i = '1'  AND bclk='0') THEN
				count_folge <=	count + phi_incr_i;
		ELSE 	count_folge <= count;
		END IF;
ELSE count_folge<= (OTHERS => '0');
END IF;

END PROCESS;
--OUTPUT
------------------------------------------------
addr 		<=	 to_integer(count(N_CUM-1  downto  N_CUM - N_LUT));
dacdat_g_o	<=	 std_logic_vector(to_signed (LUT(addr) , N_AUDIO ));	--10000


--End Architecture
------------------------------------------------	
END rtl;	
	