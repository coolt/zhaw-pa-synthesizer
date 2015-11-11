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
-- implementation:
-- the entities tone decoder and dds are instantieted 10 times
----------------------------------------------------------------------


-- TODO:
-- How connect multiple dac_dat to 1 output port ?

LIBRARY		ieee;
USE			ieee.std_logic_1164.all;
USE			ieee.numeric_std.all;

ENTITY tone_generator IS
PORT(clk_12M5_i:   IN std_logic; 
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


ARCHITECTURE rtl OF tone_generator IS

COMPONENT tone_decoder IS ------------nur der erste tone dekoder hat instanz(für Note 1)
PORT (clk_12M5:	IN	std_logic;	
		reset_n:		IN	std_logic;
		note_i:		IN	std_logic_vector(8 downto 0); 
		tone_on_o:	OUT std_logic;			
		N_CUM_o:		OUT natural range 0 to 65000
		);
END COMPONENT;

	
COMPONENT dds IS ------------------------nur der erste dds (für note 1)
PORT(	clk_12M: 	IN	std_logic;
		reset_n: 	IN	std_logic;
		tone_on_i: 	IN	std_logic;					
		phi_incr_i: IN	natural range 0 to 65000;	
		dacdat_l_o: OUT std_logic_vector (15 downto 0);
		dacdat_r_o: OUT std_logic_vector (15 downto 0)
		);
END COMPONENT;



--connect tone decoter - dds
SIGNAL s_tone_on:	std_logic;
SIGNAL s_n_cum: 	natural range 0 to 65000;		

-- connect dds dac to 1 output

BEGIN

-----------------only first tone decoder / dds is implemented
i_1th_decoder: tone_decoder
PORT MAP(
		clk_12M5		=>	clk_12M5_i,
		reset_n		=>	reset_n_i,
		note_i		=>	note_1_o,   -- first note
		tone_on_o	=>	s_tone_on,
		N_CUM_o		=>	s_n_cum
		);
		
i_1th_dds: dds 
PORT Map(
		clk_12M		=>	clk_12M5_i,
		reset_n		=>	reset_n_i,
		tone_on_i	=> s_tone_on,			
		phi_incr_i	=> s_n_cum,
		dacdat_l_o	=> dacdat_l_o,
		dacdat_r_o	=> dacdat_r_o
		);	



        
 END rtl;
