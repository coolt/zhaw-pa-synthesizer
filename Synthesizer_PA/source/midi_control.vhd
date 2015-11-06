------------------------------------------
-- Midi Controller
------------------------------------------
-- 3 Midi-states are decoded
-- Note on
-- Note off
-- Polyphonie
------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;



ENTITY midi_control IS
	PORT (	clk_12M5						:IN			std_logic;	
			reset_n					:IN			std_logic;
			rx_data_valid			:IN			std_logic;
			rx_data 				:IN  		std_logic_vector(7 downto 0);   
			note_an					:OUT		std_logic;
			note_aus				:OUT		std_logic;
			polyphonie_status		:OUT 		std_logic;
			note_value				:OUT 		natural range 0 to 300
		  );
END midi_control ;


ARCHITECTURE rtl OF midi_control  IS


-- defines for state bits
constant NOTE_ON: 		std_logic_vector(3 downto 0):= "1000";

-- typ state

SIGNAL s_rx_valid					:			std_logic := '0';
SIGNAL s_note_an					:			std_logic := '0';	
SIGNAL s_note_aus					:			std_logic := '0';	
SIGNAL s_polyphonie_status			:			std_logic := '0';	



BEGIN

--decoder: PROCESS (tone_cmd) 
--BEGIN
--tone_on_o 		<= 	'1';
--N_CUM_taster 	<= 	0;
--s_stueck 		<= 	"000";
--
----Tondekodierung der Schalter:
--IF tone_cmd(13)='0' THEN 
--		CASE tone_cmd IS
--		WHEN "00000000000001" => N_CUM_taster <=to_integer(unsigned(M_DO_C4));
--		WHEN "00000000000010" => N_CUM_taster <=to_integer(unsigned(M_DOS_C4S));
--		WHEN "00000000000100" => N_CUM_taster <=to_integer(unsigned(M_RE_D4));
--		WHEN "00000000001000" => N_CUM_taster <=to_integer(unsigned(M_RES_D4S));
--		WHEN "00000000010000" => N_CUM_taster <=to_integer(unsigned(M_MI_E4));
--		WHEN "00000000100000" => N_CUM_taster <=to_integer(unsigned(M_FA_F4));
--		WHEN "00000001000000" => N_CUM_taster <=to_integer(unsigned(M_FAS_F4S));
--		WHEN "00000010000000" => N_CUM_taster <=to_integer(unsigned(M_SOL_G4));
--		WHEN "00000100000000" => N_CUM_taster <=to_integer(unsigned(M_SOLS_G4S));
--		WHEN "00001000000000" => N_CUM_taster <=to_integer(unsigned(M_LA_A4));
--		WHEN "00010000000000" => N_CUM_taster <=to_integer(unsigned(M_LAS_A4S));
--		WHEN "00100000000000" => N_CUM_taster <=to_integer(unsigned(M_SI_B4));
--		WHEN "01000000000000" => N_CUM_taster <=to_integer(unsigned(M_DO_C5));
--
--		WHEN OTHERS => 		tone_on_o 		<=	'0';
--							N_CUM_taster 	<= 	0;
--							s_stueck 		<=	"000";
--	END CASE;
----Dekodierung für die Stückwahl bei der automatischen Liederabspielung
--ELSE CASE tone_cmd IS
--		WHEN "11000000000000" => s_stueck 	<=  "100";
--		WHEN "10100000000000" => s_stueck 	<= 	"010";
--		WHEN "10010000000000" => s_stueck 	<= 	"001";
--		
--		WHEN OTHERS => 		s_stueck 		<= 	"000";
--							tone_on_o 		<=	'0';
--							N_CUM_taster 	<=	0;
--	END CASE;
--END IF;
--
--END PROCESS;
--
----Multiplexer, der den Tonhöhenausgang zwischen Melodybox und Schalter umschaltet
--mux: PROCESS ( N_CUM_taster, N_CUM_fsm, tone_cmd(13))
--	BEGIN
--		IF 		tone_cmd(13)='1' THEN
--				N_CUM <= N_CUM_fsm;
--		ELSE	N_CUM <= N_CUM_taster;
--		END IF;
--END PROCESS;



END ARCHITECTURE rtl;