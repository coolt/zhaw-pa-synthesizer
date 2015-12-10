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

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

LIBRARY work;
USE work.tone_gen_pkg.all;
use work.note_type_pkg.all;

-- Entity Declaration 
-------------------------------------------
ENTITY tone_decoder IS
	PORT (	clk						:IN			std_logic;	--clk_12M
			reset_n					:IN			std_logic;
			tone_cmd				:IN			std_logic_vector(13 DOWNTO 0);
			tone_on_o				:OUT		std_logic;
		   musik_start				:IN			std_logic;
			N_CUM					:OUT 		natural range 0 to 65000;
			notes_keyboard		:IN 		t_note_array
		  );
END tone_decoder;

-- Architecture Declaration
-------------------------------------------
ARCHITECTURE rtl OF tone_decoder IS

SIGNAL N_CUM_fsm					: 			natural range 0 to 65000;			--Tonhöhe von der Melodybox
SIGNAL N_CUM_taster					:			natural range 0 to 65000;			--Tonhöhe von den Schalter 
SIGNAL s_stueck						:			std_logic_vector (2 downto 0);		--Stückwahl

COMPONENT lied_fsm
PORT ( 	clk, reset_n				:IN			std_logic;
		start						:IN			std_logic;
		stueck						:IN			std_logic_vector(2 downto 0);
		phi_incr_lied				:OUT		natural
		);
END COMPONENT;							
-------------------------------------------


BEGIN

inst_lied_fsm: lied_fsm
PORT MAP( 	clk					=>  clk,
			reset_n				=> 	reset_n,	
			start				=>	musik_start,
			stueck				=> 	s_stueck,
			phi_incr_lied		=> 	N_CUM_fsm			
		);


decoder: PROCESS (tone_cmd) 
BEGIN
tone_on_o 		<= 	'1';
N_CUM_taster 	<= 	0;
s_stueck 		<= 	"000";

--Tondekodierung der Schalter:
IF tone_cmd(13)='0' THEN 
		CASE tone_cmd IS
		WHEN "00000000000001" => N_CUM_taster <=to_integer(unsigned(M_DO_C4));
		WHEN "00000000000010" => N_CUM_taster <=to_integer(unsigned(M_DOS_C4S));
		WHEN "00000000000100" => N_CUM_taster <=to_integer(unsigned(M_RE_D4));
		WHEN "00000000001000" => N_CUM_taster <=to_integer(unsigned(M_RES_D4S));
		WHEN "00000000010000" => N_CUM_taster <=to_integer(unsigned(M_MI_E4));
		WHEN "00000000100000" => N_CUM_taster <=to_integer(unsigned(M_FA_F4));
		WHEN "00000001000000" => N_CUM_taster <=to_integer(unsigned(M_FAS_F4S));
		WHEN "00000010000000" => N_CUM_taster <=to_integer(unsigned(M_SOL_G4));
		WHEN "00000100000000" => N_CUM_taster <=to_integer(unsigned(M_SOLS_G4S));
		WHEN "00001000000000" => N_CUM_taster <=to_integer(unsigned(M_LA_A4));
		WHEN "00010000000000" => N_CUM_taster <=to_integer(unsigned(M_LAS_A4S));
		WHEN "00100000000000" => N_CUM_taster <=to_integer(unsigned(M_SI_B4));
		WHEN "01000000000000" => N_CUM_taster <=to_integer(unsigned(M_DO_C5));

		WHEN OTHERS => 		tone_on_o 		<=	'0';
							N_CUM_taster 	<= 	0;
							s_stueck 		<=	"000";
	END CASE;
--Dekodierung für die Stückwahl bei der automatischen Liederabspielung
ELSE CASE tone_cmd IS
		WHEN "11000000000000" => s_stueck 	<=  "100";
		WHEN "10100000000000" => s_stueck 	<= 	"010";
		WHEN "10010000000000" => s_stueck 	<= 	"001";
		
		WHEN OTHERS => 		s_stueck 		<= 	"000";
							tone_on_o 		<=	'0';
							N_CUM_taster 	<=	0;
	END CASE;
END IF;


-- Tondekodierung der Noten des Keyboard
--IF (midi_active = '1') THEN
--	N_CUM_taster <=to_integer(unsigned(M_DO_C4));
--ELSE 
--	N_CUM_taster <=0;
---------------------------------------------------------------------------------------------
--END IF;
--
END PROCESS;

--Multiplexer, der den Tonhöhenausgang zwischen Melodybox und Schalter umschaltet
mux: PROCESS ( N_CUM_taster, N_CUM_fsm, tone_cmd(13))
	BEGIN
		IF 		tone_cmd(13)='1' THEN
				N_CUM <= N_CUM_fsm;
		ELSE	N_CUM <= N_CUM_taster;
		END IF;
END PROCESS;



END ARCHITECTURE rtl;