--dds
--copyright by bleispiu
--version 0.1
--19.04.2013 19:00 Uhr

-- Funktion: Der DDS beinhaltet einen Zähler der je nach Eingang in gewünschten
-- Abständen auf 2048 hochzählt. Aus einer Tabelle werden Werte geholt und 
-- an den Ausgang ausgegeben.
------------------------------------------------ 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.tone_gen_pkg.all;

--entity Declaration
------------------------------------------------
entity dds is
	port(	clk_12M			: in	std_logic;
			reset_n			: in	std_logic;
			strobe_i		: in	std_logic;					-- eingang von I2S
			tone_on_i		: in	std_logic;					-- eingang von tone_decoder
			phi_incr_i		: in	natural range 0 to 65000;	-- schrittweite fuer den Zaehler
			dacdat_g_o		: out	std_logic_vector (15 downto 0);
			bclk			: in	std_logic
			);
	end dds;
	
	
--architecture Declaration
------------------------------------------------
architecture rtl of dds is
--signal & Constants Declaration
------------------------------------------------
signal 		addr 			:		integer range 0 to L-1;
signal 		count			:  		unsigned(N_CUM - 1 downto 0); --15 downto 0		N_CUM --> grösse 16
signal 		count_folge		:      	unsigned(N_CUM - 1 downto 0);
constant 	N_AUDIO			:		natural :=16; 
constant	max_value		:		natural := 2**N_CUM;
constant	N_LUT			:		natural:=6; 



begin
-- process for FLIPFLOPS
------------------------------------------------
flipflop :	process	(clk_12M, reset_n)
begin
if 		(reset_n = '0')						then
		count <= (others => '0');
		
elsif 	(clk_12M'event AND clk_12M = '1')	then
		count	<=	count_folge;
end if;

end process;

	
-- process for LOGIC
-- Dieser process beschreibt die Logic vor den Flipflops der Folgezustand ist der Ist-Zustand plus die
-- Schrittweite phi_incr_i ist ein Vektor von 15 downto 0. maximale grösse 2 hoch 16!!
------------------------------------------------
logic	:	process (strobe_i, count, tone_on_i, bclk, phi_incr_i)
begin

if 		(tone_on_i = '1') then
		if		(strobe_i = '1'  AND bclk='0') then
				count_folge <=	count + phi_incr_i;
		else 	count_folge <= count;
		end if;
else count_folge<= (others => '0');
end if;

end process;
--OUTPUT
------------------------------------------------
addr 		<=	 to_integer(count(N_CUM-1  downto  N_CUM - N_LUT));
dacdat_g_o	<=	 std_logic_vector(to_signed (LUT(addr) , N_AUDIO ));	--10000


--end architecture
------------------------------------------------	
end rtl;	
	