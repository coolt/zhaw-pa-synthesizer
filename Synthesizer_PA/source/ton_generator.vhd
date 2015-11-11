-------------------------------------------
-- ton generator
-------------------------------------------
-- copyright: baek
--
-- function:
-- receiving max. 10 diverse notes (polyphonie)
-- each notes value is decoded and given to the dds
-- the dds generates a fm synthese with sidebands
--
----------------------------------------------------------------------

LIBRARY		ieee;
USE			ieee.std_logic_1164.all;
USE			ieee.numeric_std.all;

ENTITY ton_generator IS
PORT(   clk_12M5_i:   IN std_logic; 
        reset_n_i:    IN std_logic;        
        note_1_o:     IN std_logic_vector(8 downto 0); 
		  note_2_o:     IN std_logic_vector(8 downto 0); 
		  note_3_o:     IN std_logic_vector(8 downto 0); 
		  note_4_o:     IN std_logic_vector(8 downto 0); 
		  note_5_o:     IN std_logic_vector(8 downto 0); 
		  note_6_o:     IN std_logic_vector(8 downto 0); 
		  note_7_o:     IN std_logic_vector(8 downto 0); 
		  note_8_o:     IN std_logic_vector(8 downto 0); 
		  note_9_o:     IN std_logic_vector(8 downto 0); 
		  note_10_o:    IN std_logic_vector(8 downto 0);
		  dacdat_l_o:   OUT std_logic_vector(15 downto 0);
		  dacdat_r_o:   OUT std_logic_vector(15 downto 0)
        );
END;


ARCHITECTURE rtl OF ton_generator IS

COMPONENT tone_decoder IS
PORT (	clk_12M5					:IN				std_logic;	
			reset_n						:IN				std_logic;
			note_on					   	:IN				std_logic;
			note_midi                   :IN             natural range 0 to 128;
			tone_on						:OUT			std_logic;
			N_CUM					    :OUT 			natural range 0 to 65000
		);
	
COMPONENT dds IS
PORT(	clk_12M			: IN	std_logic;
			reset_n			: IN	std_logic;
			strobe_i		: IN	std_logic;					-- eingang von I2S
			bclk			: IN	std_logic
			tone_on_i		: IN	std_logic;					-- eingang von tone_decoder
			phi_incr_i		: IN	natural range 0 to 65000;	-- schrittweite fuer den Zaehler
			dacdat_g_o		: OUT	std_logic_vector (15 downto 0);			
			);
	END dds;




-- connect tone decoder with dds
SIGNAL s_clk_12M5, s_reset_n:		std_logic;

-- tone generator
--SIGNAL		tl_tone_on:				std_logic; 						--fuer fm_synth 
SIGNAL		tl_n_cum:				natural range 0 to 65000;		--Tonhöhe 
SIGNAL		tl_strobe:				std_logic;
--SIGNAL		tl_dacdat_g_o:			std_logic_vector(15 downto 0);



BEGIN

inst_1	: tone_decoder
PORT MAP(	clk_12M5				=>		clk_12M5_i,
				reset_n				=>		reset_n_i ,
				note_on          => s_note_on,
				note_midi		=>		tl_note_value,
				tone_on			=>		tl_tone_on,
				N_CUM				=>		tl_n_cum
		);

inst_2: dds 
PORT Map(	clk_12M				=>	clk_12M5_i,
			reset_n				=>	reset_n_i,
			strobe_i			=>					-- eingang von I2S
			bclk			=>	
			tone_on_i				=>					-- eingang von tone_decoder
			phi_incr_i			=>		-- schrittweite fuer den Zaehler
			dacdat_g_o				=>				
			);	

        
 END rtl;
