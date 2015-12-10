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
		   musik_start				:IN			std_logic;  --> key(2) used as midi activ
			N_CUM					:OUT 		natural range 0 to 65000;
			notes_keyboard		:IN 		t_note_array
		  );
END tone_decoder;

-- Architecture Declaration
-------------------------------------------
ARCHITECTURE rtl OF tone_decoder IS

SIGNAL N_CUM_fsm					: 			natural range 0 to 65000;			--Tonhöhe von der Melodybox
SIGNAL N_CUM_taster					:			natural range 0 to 65000;			--Tonhöhe von den Schalter 
SIGNAL N_CUM_keyboard				:			natural range 0 to 65000;			--Tonhöhe von Keyboard

SIGNAL s_stueck						:			std_logic_vector (2 downto 0);		--Stückwahl
SIGNAL s_keyboard_note_on		: std_logic;                        			-- new for keyboard
SIGNAL s_keyboard_note_value	: integer range 0 to 127;   		 				--new for keyboard


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


decoder_1: PROCESS (all) 
BEGIN

N_CUM_taster 	<= 0;
N_CUM_keyboard <= 0; 
s_stueck 		<= "000";

		--Tondekodierung der Schalter:
		IF tone_cmd(13)='0' THEN 
				tone_on_o 		<= '1'; 
				
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
				WHEN OTHERS => 		
									tone_on_o 		<=	'0';
									N_CUM_taster 	<= 	0;
									s_stueck 		<=	"000";
				END CASE;
				
		--Dekodierung für die Stückwahl bei der automatischen Liederabspielung
		ELSE 
				CASE tone_cmd IS
				WHEN "11000000000000" => s_stueck 	<=  "100";
				WHEN "10100000000000" => s_stueck 	<= 	"010";
				WHEN "10010000000000" => s_stueck 	<= 	"001";				
				WHEN OTHERS => 		s_stueck 		<= 	"000";
									tone_on_o 		<=	'0';
									N_CUM_taster 	<=	0;
				END CASE;
		END IF;
		
		------------------------------------------------------------------------------- only for 1 note
		-- Dekodierung Note 0 des Keyboards				                                
		s_keyboard_note_value	 <= to_integer(unsigned(notes_keyboard(0)(7 downto 0)));  
			
		-- decoding the keys:		                 
		CASE s_keyboard_note_value	 IS 		------ new: from 12 to 127 notes 
			WHEN 0 | 24 | 48 | 72 | 96 |120 => 
				N_CUM_keyboard <=to_integer(unsigned(M_DO_C4));
			WHEN 1 | 25 | 49 | 73 | 97 |121=> 
				N_CUM_keyboard <=to_integer(unsigned(M_DOS_C4S));
			WHEN 2 | 26 | 50 | 74 | 98 |122=> 
				N_CUM_keyboard <=to_integer(unsigned(M_RE_D4));
			WHEN 3 | 27 | 51 | 75 | 99 |123=> 
				N_CUM_keyboard <=to_integer(unsigned(M_RES_D4S));
			WHEN 4 | 28 | 52 | 76 | 100 |124=> 
				N_CUM_keyboard <=to_integer(unsigned(M_MI_E4));
			WHEN 5 | 29 | 53 | 77 | 101 |125=> 
				N_CUM_keyboard <=to_integer(unsigned(M_FA_F4));
			WHEN 6 | 30 | 54 | 78 | 102 |126=> 
				N_CUM_keyboard <=to_integer(unsigned(M_FAS_F4S));
			WHEN 7 | 31 | 55 | 79 | 103 |127=> 
				N_CUM_keyboard <=to_integer(unsigned(M_SOL_G4));
			WHEN 8 | 32 | 56 | 80 | 104 => 
				N_CUM_keyboard <=to_integer(unsigned(M_SOLS_G4S));
			WHEN 9 | 33 | 57 | 81 | 105 => 
				N_CUM_keyboard <=to_integer(unsigned(M_LA_A4));
			WHEN 10 | 34 | 58 | 82 | 106 => 
				N_CUM_keyboard <=to_integer(unsigned(M_LAS_A4S));
			WHEN 11 | 35 | 59 | 83 | 107 => 
				N_CUM_keyboard <=to_integer(unsigned(M_SI_B4));
			WHEN 12 | 36 | 60 | 84 | 108 => 
				N_CUM_keyboard <=to_integer(unsigned(H_DO_C5));
			WHEN 13 | 37 | 61 | 85 | 109 => 
				N_CUM_keyboard <=to_integer(unsigned(H_DOS_C5S));
			WHEN 14 | 38 | 62 | 86 | 110 => 
				N_CUM_keyboard <=to_integer(unsigned(H_RE_D5));
			WHEN 15 | 39 | 63 | 87 | 111 => 
				N_CUM_keyboard <=to_integer(unsigned(H_RES_D5S));
			WHEN 16 | 40 | 64 | 88 | 112 => 
				N_CUM_keyboard <=to_integer(unsigned(H_MI_E5));
			WHEN 17 | 41 | 65 | 89 | 113 => 
				N_CUM_keyboard <=to_integer(unsigned(H_FA_F5));
			WHEN 18 | 42 | 66 | 90 | 114 => 
				N_CUM_keyboard <=to_integer(unsigned(H_FAS_F5S));
			WHEN 19 | 43 | 67 | 91 | 115 => 
				N_CUM_keyboard <=to_integer(unsigned(H_SOL_G5));
			WHEN 20 | 44 | 68 | 92 | 116 => 
				N_CUM_keyboard <=to_integer(unsigned(H_SOLS_G5S));
			WHEN 21 | 45 | 69 | 93 | 117 => 
				N_CUM_keyboard <=to_integer(unsigned(H_LA_A5));
			WHEN 22 | 46 | 70 | 94 | 118 => 
				N_CUM_keyboard <=to_integer(unsigned(H_LAS_A5S));
			WHEN 23 | 47 | 71 | 95 | 119 => 
				N_CUM_keyboard <=to_integer(unsigned(H_SI_B5));			
			WHEN OTHERS => 		
				N_CUM_keyboard <= 0;					 		
		END CASE;
END PROCESS;

--Multiplexer, der den Tonhöhenausgang zwischen Melodybox und Schalter umschaltet
mux: PROCESS ( N_CUM_taster, N_CUM_fsm, tone_cmd(13))
	BEGIN
		IF 		tone_cmd(13)='1' THEN
				N_CUM <= N_CUM_fsm;
		ELSIF  (musik_start = '1') THEN
				N_CUM <= N_CUM_keyboard;
		ELSE	
				N_CUM <= N_CUM_taster;
		END IF;
END PROCESS;



END ARCHITECTURE rtl;