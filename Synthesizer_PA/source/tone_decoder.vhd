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
		note_i:		IN	std_logic_vector(8 downto 0); -- before: (13 downto 0)
		tone_on_o:	OUT std_logic;			
		N_CUM_o:		OUT natural range 0 to 65000
	  );
END tone_decoder;


ARCHITECTURE rtl OF tone_decoder IS


SIGNAL N_CUM_keyboard:	natural range 0 to 65000;	-- before: N_CUM_taster
SIGNAL s_note_on: std_logic;                        -- before: tone_cmd(13)
SIGNAL s_note_value: integer range 0 to 127;   		 --new



BEGIN



decoder: PROCESS (all) 
BEGIN
s_note_on 	<= note_i(8);                                  -- before: tone_cmd(13)
s_note_value <= to_integer(unsigned(note_i(7 downto 0)));  -- new: more readable

-- tone_on_o 		<= '1';     										-- before there (produce multiple driver)
N_CUM_keyboard <= 0; 												

-- decoding of the keys:
	IF s_note_on ='1' THEN                     
		CASE s_note_value IS 							---------------- new: more then 12 notes, 127 notes implemented!!
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
				N_CUM_keyboard 	<= 	0;					 		
		END CASE;
	ELSE 
		N_CUM_keyboard <= 0;
	END IF;

END PROCESS;


-- Signal assignment
tone_on_o <= s_note_on;
N_CUM_o  <= N_CUM_keyboard;

END ARCHITECTURE rtl;
