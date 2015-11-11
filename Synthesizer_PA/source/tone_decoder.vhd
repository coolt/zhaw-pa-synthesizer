-------------------------------------------
-- tone decoder
-------------------------------------------
-- copyright: herscmic (1. version)
-- commented: baek (2. version)
--
-- function:
-- Midi-Number is decoded for LUT (see tone package) 
--
-- implementation:
-- Entity will be instantiate 10 times in tone generator
-------------------------------------------

-- TO DO:
-- Check typ-change from natural (0 - 128) note to std_logic with on/off
-- To do:
-- extract "ton_on/off" from the 9 bit note vector
-- extract note


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

LIBRARY work;
USE work.tone_gen_pkg.all;



ENTITY tone_decoder IS
PORT (clk_12M5:	IN	std_logic;	
		reset_n:		IN	std_logic;
		note_i:		IN	std_logic_vector(8 downto 0);-- !!!!!!!!!!!baek changed (bevore: natural)
		tone_on_o:	OUT std_logic;			
		N_CUM_o:		OUT natural range 0 to 65000
	  );
END tone_decoder;


ARCHITECTURE rtl OF tone_decoder IS


SIGNAL N_CUM_keyboard:	natural range 0 to 65000;		
SIGNAL s_note_value:  natural range 0 to 127;
SIGNAL s_note_on: std_logic;	



BEGIN

s_note_on 	<= note_i(8);
s_note_value <= to_integer(unsigned(note_i(7 downto 0)));


decoder: PROCESS (all) 
BEGIN

N_CUM_keyboard <= 0; --- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

--Tondekodierung der Tasten:
	IF s_note_on ='1' THEN                     
		CASE s_note_value IS
			WHEN 0 => 
				N_CUM_keyboard <=to_integer(unsigned(M_DO_C4));
			WHEN 1 => 
				N_CUM_keyboard <=to_integer(unsigned(M_DOS_C4S));
			WHEN 2 => 
				N_CUM_keyboard <=to_integer(unsigned(M_RE_D4));
			WHEN 3 => 
				N_CUM_keyboard <=to_integer(unsigned(M_RES_D4S));
			WHEN 4 => 
				N_CUM_keyboard <=to_integer(unsigned(M_MI_E4));
			WHEN 5 => 
				N_CUM_keyboard <=to_integer(unsigned(M_FA_F4));
			WHEN 6 => 
				N_CUM_keyboard <=to_integer(unsigned(M_FAS_F4S));
			WHEN 7 => 
				N_CUM_keyboard <=to_integer(unsigned(M_SOL_G4));
			WHEN 8 => 
				N_CUM_keyboard <=to_integer(unsigned(M_SOLS_G4S));
			WHEN 9 => 
				N_CUM_keyboard <=to_integer(unsigned(M_LA_A4));
			WHEN 10 => 
				N_CUM_keyboard <=to_integer(unsigned(M_LAS_A4S));
			WHEN 11 => 
				N_CUM_keyboard <=to_integer(unsigned(M_SI_B4));
			WHEN 12 => 
				N_CUM_keyboard <=to_integer(unsigned(M_DO_C5));
	
			WHEN OTHERS => 		
			  --- check if valid ?? and is not a note as well
				N_CUM_keyboard 	<= 	0;					  --!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!		
		END CASE;
	ELSE 
		N_CUM_keyboard <=to_integer(unsigned(M_DO_C5));   -- to del !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	END IF;

END PROCESS;


-- Signal assignment
tone_on_o <= note_i(8);
N_CUM_o  <= N_CUM_keyboard;

END ARCHITECTURE rtl;
