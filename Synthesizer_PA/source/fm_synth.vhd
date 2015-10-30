--dds
--copyright by bleispiu
--version 0.1
--10.05.2013 19:00 Uhr

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

-- Entity Declaration 
-------------------------------------------
ENTITY fm_synth IS
	PORT (	fm_clk_12M		: IN	std_logic;
			fm_reset_n		: IN	std_logic;
			fm_bclk			: IN	std_logic;
			strobe			: IN	std_logic;
			tone_on_i		: IN	std_logic;
			N_CUM			: IN	natural range 0 to 65000;
			synth_ratio		: IN	natural range 0 to 1000;
			synth_depth		: IN	natural range 0 to 10;
			data_o			: OUT	std_logic_vector(15 downto 0)
		  );
END fm_synth;

-- Architecture Declaration
-------------------------------------------
ARCHITECTURE rtl OF fm_synth IS
-- Signals & Constants Declaration
-------------------------------------------
SIGNAL	fm_mod_dat			:	std_logic_vector (15 downto 0);
SIGNAL	fm_mod_on			:	std_logic;
SIGNAL	fm_mod_M			:	natural range 0 to 65000;
SIGNAL	fm_car_on			:	std_logic;
SIGNAL	fm_car_M			:	natural range 0 to 65000;
SIGNAL	fm_data_o			:	std_logic_vector (15 downto 0);


--Components Declaration
------------------------------------------

COMPONENT dds
	PORT(	clk_12M			: IN	std_logic;
			reset_n			: IN	std_logic;
			strobe_i		: IN	std_logic;	-- eingang von I2S
			tone_on_i		: IN	std_logic;	-- eingang von tone_decoder
			phi_incr_i		: IN	natural range 0 to 65000;	-- schrittweite
			dacdat_g_o		: OUT	std_logic_vector (15 downto 0);
			bclk			: IN	std_logic
			);
END COMPONENT;

COMPONENT fm_sel
	PORT ( 	reset_n						:IN		std_logic;
			tone_on						:IN		std_logic;
			M_fsig						:IN		natural range 0 to 65000;
			mod_dat						:IN		std_logic_vector (15 downto 0);
			fm_ratio					:IN		natural range 0 to 1000;
			fm_depth					:IN		natural range 0 to 10;
			mod_on						:OUT	std_logic;
			mod_M						:OUT	natural range 0 to 65000;
			car_on						:OUT	std_logic;
			car_M						:OUT	natural range 0 to 65000;
			clk						:IN std_logic
			);
END COMPONENT;
	


-- Begin Architecture
-------------------------------------------
BEGIN

-- Port Maps
-------------------------------------------
DDS_Modulator : dds
	PORT MAP ( 	tone_on_i				=>		fm_mod_on,
				strobe_i				=>		strobe,
				clk_12M					=>		fm_clk_12M,
				reset_n					=>		fm_reset_n,
				dacdat_g_o				=>		fm_mod_dat,
				phi_incr_i				=>		fm_mod_M,
				bclk					=>		fm_bclk
			  );
			  
DDS_Carrier_INST : dds
	PORT MAP ( 	tone_on_i				=>		fm_car_on,
				strobe_i				=>		strobe,
				clk_12M					=>		fm_clk_12M,
				reset_n					=>		fm_reset_n,
				dacdat_g_o				=>		fm_data_o,
				phi_incr_i				=>		fm_car_M,
				bclk					=>		fm_bclk
			   );
			   
FM_SEL_INST : fm_sel
	PORT MAP (	reset_n					=>	fm_reset_n,
				tone_on					=>	tone_on_i,
				M_fsig					=>	N_CUM,
				mod_dat					=>	fm_mod_dat,
				fm_ratio				=>	synth_ratio,
				fm_depth				=>	synth_depth,
				mod_on					=>	fm_mod_on,
				mod_M					=>	fm_mod_m,
				car_on					=>	fm_car_on,
				car_m					=>	fm_car_m,
				clk					=> fm_clk_12M
				);
			  
-- ständige Verbindung
data_o<=fm_data_o;

	
-- End Architecture
-----------------------------------------			  
END ARCHITECTURE rtl;