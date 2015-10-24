--tone_decoder
--copyright by herscmic
--version 0.1
--20.04.2013 14.27

--version 0.2
--05.06.2013 20:46

--Funktion: Der tone_decoder hat zwei Funktionen:
-- 			- er bindet die Melodybox und ist der Koordinator zwischen automatischer
--			  Melodieerzeugung und manueller Tonerzeugung.
--			- er dekodiert die manuelle Tonerzeugung. Das heisst, er wandelt die jeweiligen
--			  Eingangssignale der Schalter in Tonhöhen um. 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.tone_gen_pkg.all;


-- entity Declaration 
-------------------------------------------
entity tone_decoder is
	port (	clk						:in			std_logic;	--clk_12M
			reset_n					:in			std_logic;
			tone_cmd				:in			std_logic_vector(13 downto 0);
			tone_on_o				:out		std_logic;
			musik_start				:in			std_logic;
			N_CUM					:out 		natural range 0 to 65000
		  );
end tone_decoder;

-- architecture Declaration
-------------------------------------------
architecture rtl of tone_decoder is

signal N_CUM_fsm					: 			natural range 0 to 65000;			--Tonhöhe von der Melodybox
signal N_CUM_taster					:			natural range 0 to 65000;			--Tonhöhe von den Schalter 
signal s_stueck						:			std_logic_vector (2 downto 0);		--Stückwahl

component lied_fsm
port ( 	clk, reset_n				:in			std_logic;
		start						:in			std_logic;
		stueck						:in			std_logic_vector(2 downto 0);
		phi_incr_lied				:out		natural
		);
end component;							
-------------------------------------------


begin

inst_lied_fsm: lied_fsm
port map( 	clk					=>  clk,
			reset_n				=> 	reset_n,	
			start				=>	musik_start,
			stueck				=> 	s_stueck,
			phi_incr_lied		=> 	N_CUM_fsm			
		);


decoder: process (tone_cmd) 
begin
tone_on_o 		<= 	'1';
N_CUM_taster 	<= 	0;
s_stueck 		<= 	"000";

--Tondekodierung der Schalter:
if tone_cmd(13)='0' then 
		case tone_cmd is
		when "00000000000001" => N_CUM_taster <=to_integer(unsigned(M_DO_C4));
		when "00000000000010" => N_CUM_taster <=to_integer(unsigned(M_DOS_C4S));
		when "00000000000100" => N_CUM_taster <=to_integer(unsigned(M_RE_D4));
		when "00000000001000" => N_CUM_taster <=to_integer(unsigned(M_RES_D4S));
		when "00000000010000" => N_CUM_taster <=to_integer(unsigned(M_MI_E4));
		when "00000000100000" => N_CUM_taster <=to_integer(unsigned(M_FA_F4));
		when "00000001000000" => N_CUM_taster <=to_integer(unsigned(M_FAS_F4S));
		when "00000010000000" => N_CUM_taster <=to_integer(unsigned(M_SOL_G4));
		when "00000100000000" => N_CUM_taster <=to_integer(unsigned(M_SOLS_G4S));
		when "00001000000000" => N_CUM_taster <=to_integer(unsigned(M_LA_A4));
		when "00010000000000" => N_CUM_taster <=to_integer(unsigned(M_LAS_A4S));
		when "00100000000000" => N_CUM_taster <=to_integer(unsigned(M_SI_B4));
		when "01000000000000" => N_CUM_taster <=to_integer(unsigned(M_DO_C5));

		when others => 		tone_on_o 		<=	'0';
							N_CUM_taster 	<= 	0;
							s_stueck 		<=	"000";
	end case;
--Dekodierung für die Stückwahl bei der automatischen Liederabspielung
else case tone_cmd is
		when "11000000000000" => s_stueck 	<=  "100";
		when "10100000000000" => s_stueck 	<= 	"010";
		when "10010000000000" => s_stueck 	<= 	"001";
		
		when others => 		s_stueck 		<= 	"000";
							tone_on_o 		<=	'0';
							N_CUM_taster 	<=	0;
	end case;
end if;

end process;

--Multiplexer, der den Tonhöhenausgang zwischen Melodybox und Schalter umschaltet
mux: process ( N_CUM_taster, N_CUM_fsm, tone_cmd(13))
	begin
		if 		tone_cmd(13)='1' then
				N_CUM <= N_CUM_fsm;
		else	N_CUM <= N_CUM_taster;
		end if;
end process;



end architecture rtl;