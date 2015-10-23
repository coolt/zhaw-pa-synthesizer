-------------------------------------------------------------------------------
-- Project     : audio_top
-- Description : Constants and LUT for tone generation with DDS
--
--
-------------------------------------------------------------------------------
--
-- Change History
-- Date     |Name      |Modification
------------|----------|-------------------------------------------------------
-- 12.04.13 | dqtm     | file created for DTP2 Milestone-2
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Package  Declaration
-------------------------------------------------------------------------------
-- Include in Design of Block dds.vhd and tone_decoder.vhd :
--   use work.tone_gen_pkg.all;
-------------------------------------------------------------------------------
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

package tone_gen_pkg is

    -------------------------------------------------------------------------------
	-- Constant Declaration
	-------------------------------------------------------------------------------
    constant N_CUM:					natural :=16; 			-- number of bits in phase cumulator phicum_reg
    constant N_LUT:					natural :=6;  			-- number of bits in LUT address
    constant L: 					natural := 2**N_LUT; 	-- length of LUT
    constant N_RESOL:				natural := 11;			-- Attention: 1 bit reserved for sign
	-------------------------------------------------------------------------------
	-- Type Declaration
	-------------------------------------------------------------------------------
    subtype t_audio_range is integer range -(2**(N_RESOL-1)) to (2**(N_RESOL-1))-1;  -- range : [-2^10; +(2^10)-1]

	type t_lut_rom is array (0 to L-1) of t_audio_range;

	constant LUT : t_lut_rom :=(
    0, 100, 200, 297, 392, 483, 569, 650, 724, 792, 851, 903, 946, 980, 1004, 1019, 1023,
	1019, 1004, 980, 946, 903, 851, 792, 724, 650, 569, 483, 392, 297, 200, 100, 0, -100,
	-200, -297, -392, -483, -569, -650, -724, -792, -851, -903, -946, -980, -1004, -1019,
	-1024, -1019, -1004, -980, -946, -903, -851, -792, -724, -650, -569, -483, -392, -297, -200, -100 );

    -------------------------------------------------------------------------------
	-- More Constant Declarations (Phase increment values for tones in 3 octaves of piano)
	-------------------------------------------------------------------------------
    -- PLAIN TONES MID-OCTAVE (C4 until C5)
    constant M_DO_C4: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(2143,N_CUM)); -- DO-C4  tone ~261.63Hz
    constant M_RE_D4: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(2406,N_CUM)); -- RE_D4  tone ~293.66Hz
    constant M_MI_E4: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(2700,N_CUM)); -- MI_E4  tone ~329.63Hz
    constant M_FA_F4: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(2861,N_CUM)); -- FA_F4  tone ~349.23Hz
    constant M_SOL_G4: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(3211,N_CUM)); -- SOL_G4 tone ~392.00Hz
    constant M_LA_A4: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(3604,N_CUM)); -- LA_A4  tone ~440.00Hz
    constant M_SI_B4: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(4046,N_CUM)); -- SI_B4  tone ~493.88Hz
    constant M_DO_C5: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(4286,N_CUM)); -- DO_C5  tone ~523.25Hz
    -- HARP TONES MID-OCTAVE
    constant M_DOS_C4S: 	std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(2271,N_CUM)); -- DOS_C4S  tone ~277.18Hz
    constant M_RES_D4S: 	std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(2549,N_CUM)); -- RES_D4S  tone ~311.13Hz
    constant M_FAS_F4S: 	std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(3031,N_CUM)); -- FAS_F4S  tone ~369.99Hz
    constant M_SOLS_G4S: 	std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(3402,N_CUM)); -- SOLS_G4S tone ~415.30Hz
    constant M_LAS_A4S: 	std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(3819,N_CUM)); -- LAS_A4S  tone ~466.16Hz
    -------------------------------------------------------------------------------
	-------------------------------------------------------------------------------
     --PLAIN TONES HIGH-OCTAVE (C5 until C6)
	constant H_DO_C5: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(2143*2,N_CUM)); -- DO-C5  tone ~2*261.63Hz
    constant H_RE_D5: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(2406*2,N_CUM)); -- RE_D5  tone ~2*293.66Hz
    constant H_MI_E5: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(2700*2,N_CUM)); -- MI_E5  tone ~2*329.63Hz
    constant H_FA_F5: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(2861*2,N_CUM)); -- FA_F5  tone ~2*349.23Hz
    constant H_SOL_G5: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(3211*2,N_CUM)); -- SOL_G5 tone ~2*392.00Hz
    constant H_LA_A5: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(3604*2,N_CUM)); -- LA_A5  tone ~2*440.00Hz
    constant H_SI_B5: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(4046*2,N_CUM)); -- SI_B5  tone ~2*493.88Hz
    constant H_DO_C6: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(4286*2,N_CUM)); -- DO_C6  tone ~2*523.25Hz
    -- SHARP TONES HIGH-OCTAVE
    constant H_DOS_C5S: 	std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(2271*2,N_CUM)); -- DOS_C5S  tone ~2*277.18Hz
    constant H_RES_D5S: 	std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(2549*2,N_CUM)); -- RES_D5S  tone ~2*311.13Hz
    constant H_FAS_F5S: 	std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(3031*2,N_CUM)); -- FAS_F5S  tone ~2*369.99Hz
    constant H_SOLS_G5S: 	std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(3402*2,N_CUM)); -- SOLS_G5S tone ~2*415.30Hz
    constant H_LAS_A5S: 	std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(3819*2,N_CUM)); -- LAS_A5S  tone ~2*466.16Hz
    -------------------------------------------------------------------------------
    -------------------------------------------------------------------------------
     -- PLAIN TONES LOW-OCTAVE (C3 until C4)
	constant L_DO_C3: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(2144/2,N_CUM)); -- DO-C3  tone ~0,5*261.63Hz
    constant L_RE_D3: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(2406/2,N_CUM)); -- RE_D3  tone ~0,5*293.66Hz
    constant L_MI_E3: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(2700/2,N_CUM)); -- MI_E3  tone ~0,5*329.63Hz
    constant L_FA_F3: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(2860/2,N_CUM)); -- FA_F3  tone ~0,5*349.23Hz
    constant L_SOL_G3: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(3212/2,N_CUM)); -- SOL_G3 tone ~0,5*392.00Hz
    constant L_LA_A3: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(3604/2,N_CUM)); -- LA_A3  tone ~0,5*440.00Hz
    constant L_SI_B3: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(4046/2,N_CUM)); -- SI_B3  tone ~0,5*493.88Hz
    constant L_DO_C4: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(4286/2,N_CUM)); -- DO_C4  tone ~0,5*523.25Hz
    -- SHARP TONES LOW-OCTAVE
    constant L_DOS_C3S: 	std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(2270/2,N_CUM)); -- DOS_C3S  tone ~0,5*277.18Hz
    constant L_RES_D3S: 	std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(2548/2,N_CUM)); -- RES_D3S  tone ~0,5*311.13Hz
    constant L_FAS_F3S: 	std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(3030/2,N_CUM)); -- FAS_F3S  tone ~0,5*369.99Hz
    constant L_SOLS_G3S: 	std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(3402/2,N_CUM)); -- SOLS_G3S tone ~0,5*415.30Hz
    constant L_LAS_A3S: 	std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(3818/2,N_CUM)); -- LAS_A3S  tone ~0,5*466.16Hz
    -------------------------------------------------------------------------------
	-------------------------------------------------------------------------------

end package;
