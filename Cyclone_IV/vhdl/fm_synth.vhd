--dds
--copyright by bleispiu
--version 0.1
--10.05.2013 19:00 Uhr

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- entity Declaration 
-------------------------------------------
entity fm_synth is
	port (	fm_clk_12M		: in	std_logic;
			fm_reset_n		: in	std_logic;
			fm_bclk			: in	std_logic;
			strobe			: in	std_logic;
			tone_on_i		: in	std_logic;
			N_CUM			: in	natural range 0 to 65000;
			synth_ratio		: in	natural range 0 to 1000;
			synth_depth		: in	natural range 0 to 10;
			data_o			: out	std_logic_vector(15 downto 0)
		  );
end fm_synth;

-- architecture Declaration
-------------------------------------------
architecture rtl of fm_synth is
-- Signals & Constants Declaration
-------------------------------------------
signal	fm_mod_dat			:	std_logic_vector (15 downto 0);
signal	fm_mod_on			:	std_logic;
signal	fm_mod_M			:	natural range 0 to 65000;
signal	fm_car_on			:	std_logic;
signal	fm_car_M			:	natural range 0 to 65000;
signal	fm_data_o			:	std_logic_vector (15 downto 0);


--Components Declaration
------------------------------------------

component dds
	port(	clk_12M			: in	std_logic;
			reset_n			: in	std_logic;
			strobe_i		: in	std_logic;	-- eingang von I2S
			tone_on_i		: in	std_logic;	-- eingang von tone_decoder
			phi_incr_i		: in	natural range 0 to 65000;	-- schrittweite
			dacdat_g_o		: out	std_logic_vector (15 downto 0);
			bclk			: in	std_logic
			);
end component;

component fm_sel
	port ( 	reset_n						:in		std_logic;
			tone_on						:in		std_logic;
			M_fsig						:in		natural range 0 to 65000;
			mod_dat						:in		std_logic_vector (15 downto 0);
			fm_ratio					:in		natural range 0 to 1000;
			fm_depth					:in		natural range 0 to 10;
			mod_on						:out	std_logic;
			mod_M						:out	natural range 0 to 65000;
			car_on						:out	std_logic;
			car_M						:out	natural range 0 to 65000;
			clk						:in std_logic
			);
end component;
	


-- begin architecture
-------------------------------------------
begin

-- port Maps
-------------------------------------------
DDS_Modulator : dds
	port map ( 	tone_on_i				=>		fm_mod_on,
				strobe_i				=>		strobe,
				clk_12M					=>		fm_clk_12M,
				reset_n					=>		fm_reset_n,
				dacdat_g_o				=>		fm_mod_dat,
				phi_incr_i				=>		fm_mod_M,
				bclk					=>		fm_bclk
			  );
			  
DDS_Carrier_INST : dds
	port map ( 	tone_on_i				=>		fm_car_on,
				strobe_i				=>		strobe,
				clk_12M					=>		fm_clk_12M,
				reset_n					=>		fm_reset_n,
				dacdat_g_o				=>		fm_data_o,
				phi_incr_i				=>		fm_car_M,
				bclk					=>		fm_bclk
			   );
			   
FM_SEL_INST : fm_sel
	port map (	reset_n					=>	fm_reset_n,
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

	
-- end architecture
-----------------------------------------			  
end architecture rtl;