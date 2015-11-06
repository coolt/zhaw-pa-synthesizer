--tone_decoder


--Funktion: 
--			- er dekodiert Midisignal. Das heisst, er wandelt die jeweiligen
--			  Eingangssignale der Schalter in Tonhöhen um. 

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

LIBRARY work;
USE work.tone_gen_pkg.all;



ENTITY tone_decoder IS
	PORT (	clk_12M5						:IN			std_logic;	
			reset_n					:IN			std_logic;
			note_on             : IN        std_logic := '0';
			note_midi				:IN			natural range 0 to 128;
			tone_on				:OUT		std_logic;			
			N_CUM					:OUT 		natural range 0 to 65000
		  );
END tone_decoder;


ARCHITECTURE rtl OF tone_decoder IS


SIGNAL N_CUM_keyboard				:			natural range 0 to 65000;			--Tonhöhe von Keyboard





BEGIN

decoder: PROCESS (note_midi) 
BEGIN
tone_on 		<= 	'1';
N_CUM_keyboard 	<= 	0;


--Tondekodierung der Tasten:
IF note_on ='1' THEN                     
		CASE note_midi IS
		WHEN 0 => N_CUM_keyboard <=to_integer(unsigned(M_DO_C4));
		WHEN 1 => N_CUM_keyboard <=to_integer(unsigned(M_DOS_C4S));
		WHEN 2 => N_CUM_keyboard <=to_integer(unsigned(M_RE_D4));
		WHEN 3 => N_CUM_keyboard <=to_integer(unsigned(M_RES_D4S));
		WHEN 4 => N_CUM_keyboard <=to_integer(unsigned(M_MI_E4));
		WHEN 5 => N_CUM_keyboard <=to_integer(unsigned(M_FA_F4));
		WHEN 6 => N_CUM_keyboard <=to_integer(unsigned(M_FAS_F4S));
		WHEN 7 => N_CUM_keyboard <=to_integer(unsigned(M_SOL_G4));
		WHEN 8 => N_CUM_keyboard <=to_integer(unsigned(M_SOLS_G4S));
		WHEN 9 => N_CUM_keyboard <=to_integer(unsigned(M_LA_A4));
		WHEN 10 => N_CUM_keyboard <=to_integer(unsigned(M_LAS_A4S));
		WHEN 11 => N_CUM_keyboard <=to_integer(unsigned(M_SI_B4));
		WHEN 12 => N_CUM_keyboard <=to_integer(unsigned(M_DO_C5));

		WHEN OTHERS => 		tone_on 		<=	'0';
							N_CUM_keyboard 	<= 	0;
							
	END CASE;
ELSE 
   N_CUM_keyboard <=to_integer(unsigned(M_DO_C5));   -- to del !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
END IF;

END PROCESS;

--Multiplexer, der den Tonhöhenausgang zwischen Melodybox und Schalter umschaltet
--mux: PROCESS ( N_CUM_keyboard, N_CUM_fsm, note_on)
--	BEGIN
--		IF 		note_on ='1' THEN
--				N_CUM <= N_CUM_fsm;
--		ELSE	N_CUM <= N_CUM_keyboard;
--		END IF;
--END PROCESS;



-- Signal assignment

N_CUM <= N_CUM_keyboard;

END ARCHITECTURE rtl;
