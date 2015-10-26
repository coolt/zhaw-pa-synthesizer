--i2s_master
--copyright by bruelcor

--version 0.1
--02.04.2013 17.09

--version 0.2
--05.04.2013 12.54

--Funktion: I2S Baustein

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

LIBRARY work;
USE work.reg_table_pkg.all;

-- Entity Declaration 
-------------------------------------------
ENTITY i2s_master IS
	PORT (		clk_12M			:IN			std_logic;
				i2s_reset_n		:IN			std_logic;
				INIT_N_i		:IN			std_logic;	
				ADCDAT_s		:IN			std_logic;
				DACDAT_pl		:IN			std_logic_vector(15 downto 0);
				DACDAT_pr		:IN			std_logic_vector(15 downto 0);
				STROBE_O			:OUT		std_logic;	--Port wurde von STROBE-o auf STROBE geändert!
				BCLK			:OUT		std_logic;
				DACDAT_s		:OUT		std_logic;
				ADCDAT_pl		:OUT		std_logic_vector(15 downto 0);
				ADCDAT_pr		:OUT		std_logic_vector(15 downto 0);
				WS				:OUT		std_logic	--??? Habe diesen Port so beschrieben wie auf Diagramm, bei uns: DACLRC_s und ADCLRC_s
		 );												--ist nach mir nicht logisch!!!
END i2s_master;

-- Architecture Declaration
-------------------------------------------
ARCHITECTURE rtl OF i2s_master IS
-- Signals & Constants Declaration
-------------------------------------------
SIGNAL		WS_o:			std_logic;
SIGNAL		s_WS_dly:		std_logic;
SIGNAL		s_BCLK:			std_logic;
SIGNAL		s_DAC_load:		std_logic;		-- Wegen Port jetzt s_Strobe
SIGNAL		s_ADCL_shift:	std_logic;
SIGNAL		s_ADCR_shift:	std_logic;
SIGNAL		ADCDAT_s_i:		std_logic;
SIGNAL		s_DACDAT_s_o:		std_logic;		-- auf diagramm nur DACDAT_s, geht nicht da port schon so heisst
SIGNAL		s_real_strobe:	std_logic;



--Components Declaration
------------------------------------------
COMPONENT FSM_BCLK_COUNT
	PORT(   clk,reset_n						:IN      std_logic;
			init_n     						:IN      std_logic;
			WS, WS_dly			    		:OUT     std_logic;
			BCLK, DAC_load	 				:OUT     std_logic;
			ADCL_shift, ADCR_shift			:OUT 	 std_logic;
			real_strobe						:OUT		std_logic
		);
END COMPONENT;

COMPONENT P2S IS
	PORT( 	clk					:IN			std_logic;	--clk_12M
			reset_n				:IN			std_logic;
			BCLK				:IN			std_logic;
			DAC_load			:IN			std_logic;
			WS_dly				:IN			std_logic;
			DACDAT_pl_i			:IN			std_logic_vector(15 downto 0);
			DACDAT_pr_i			:IN			std_logic_vector(15 downto 0);
			DACDAT_s_o				:OUT		std_logic
		 );
END COMPONENT;

COMPONENT S2P IS
	PORT (	clk					:IN			std_logic;	--clk_12M
			reset_n				:IN			std_logic;
			BCLK				:IN			std_logic;
			ADCL_shift			:IN			std_logic;
			ADCR_shift			:IN			std_logic;
			ADCDAT_s_i			:IN			std_logic;
			ADCDAT_pl_o			:OUT		std_logic_vector(15 downto 0);
			ADCDAT_pr_o			:OUT		std_logic_vector(15 downto 0)
				
		  );
END COMPONENT;

-- Begin Architecture
-------------------------------------------
BEGIN

-- Port Maps
-------------------------------------------
FSM_BCLK_COUNT_INST: FSM_BCLK_COUNT
	PORT MAP (	clk			=>		clk_12M,
				reset_n		=>		i2s_reset_n,
				WS			=>		WS_o,
				WS_dly		=>		s_WS_dly,
				BCLK		=>		s_BCLK,
				DAC_load	=>		s_DAC_load,
				ADCL_shift	=>		s_ADCL_shift,
				ADCR_shift	=>		s_ADCR_shift,
				init_n		=> 	INIT_N_i,
				real_strobe =>		s_real_strobe
			 );

P2S_INST : P2S
	PORT MAP (  clk			=>		clk_12M,
				reset_n		=>		i2s_reset_n,
				BCLK		=>		s_BCLK,
				DAC_load	=>		s_DAC_load,
				WS_dly		=>		s_WS_dly,
				DACDAT_pl_i =>		DACDAT_pl,
				DACDAT_pr_i =>		DACDAT_pr,
				DACDAT_s_o		=>		s_DACDAT_s_o
			  );

S2P_INST : S2P
	PORT MAP (	clk			=>		clk_12M,
				reset_n		=>		i2s_reset_n,
				BCLK		=>		s_BCLK,
				ADCL_shift	=>		s_ADCL_shift,
				ADCR_shift	=>		s_ADCR_shift,
				ADCDAT_s_i	=>		ADCDAT_s,
				ADCDAT_pl_o	=>		ADCDAT_pl,
				ADCDAT_pr_o	=>		ADCDAT_pr
			 );
			 
--Verbindungen Signale-Ausgangssignale
DACDAT_s <= s_DACDAT_s_o;
WS			<= WS_o;
BCLK 		<= s_BCLK;	
STROBE_O	<= s_real_strobe;
 -- End Architecture 
------------------------------------------- 
END rtl;

				