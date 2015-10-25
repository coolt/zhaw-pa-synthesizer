--------------------------------------------------
--
-- I2S master
-- Transmit 16 bit audio data to audio codec
--
--------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.audio_codec_register_table_pkg.all;


entity i2s_master is
	port (		clk_12M			:in			std_logic;
				i2s_reset_n		:in			std_logic;	
				--ADCDAT_s		:in			std_logic;
				DACDAT_pl		:in			std_logic_vector(15 downto 0);
				DACDAT_pr		:in			std_logic_vector(15 downto 0);
				STROBE_O			:out		std_logic;	--port wurde von STROBE-o auf STROBE geändert!
				BCLK			:out		std_logic;
				DACDAT_s		:out		std_logic;
				--ADCDAT_pl		:out		std_logic_vector(15 downto 0);
				--ADCDAT_pr		:out		std_logic_vector(15 downto 0);
				WS				:out		std_logic	--??? Habe diesen port so beschrieben wie auf Diagramm, bei uns: DACLRC_s und ADCLRC_s
		 );												--ist nach mir nicht logisch!!!
end i2s_master;


architecture rtl of i2s_master is

signal		WS_o:			std_logic;
signal		s_WS_dly:		std_logic;
signal		s_BCLK:			std_logic;
signal		s_DAC_load:		std_logic;		-- Wegen port jetzt s_Strobe
signal		s_ADCL_shift:	std_logic;
signal		s_ADCR_shift:	std_logic;
signal		ADCDAT_s_i:		std_logic;
signal		s_DACDAT_s_o:		std_logic;		-- auf diagramm nur DACDAT_s, geht nicht da port schon so heisst
signal		s_real_strobe:	std_logic;


--------------------------------------------------
-- Components declaration
--------------------------------------------------

component fsm_I2S
	port(   clk,reset_n						:in      std_logic;
			WS, change_channel			    		:out     std_logic;
			BCLK, DAC_load	 				:out     std_logic;
			ADCL_shift, ADCR_shift			:out 	 std_logic;
			real_strobe						:out		std_logic
		);
end component;

component parallel_to_seriell is
	port( 	clk					:in			std_logic;	--clk_12M
			reset_n				:in			std_logic;
			BCLK				:in			std_logic;
			DAC_load			:in			std_logic;
			change_channel	    :in			std_logic;
			DACDAT_pl_i			:in			std_logic_vector(15 downto 0);
			DACDAT_pr_i			:in			std_logic_vector(15 downto 0);
			DACDAT_s_o			:out		std_logic
		 );
end component;




begin
--------------------------------------------------
-- instanciation of components
--------------------------------------------------

inst_0: fsm_I2S
	port map (	clk			=>		clk_12M,
				reset_n		=>		i2s_reset_n,
				WS			=>		WS_o,
				change_channel		=>		s_WS_dly,
				BCLK		=>		s_BCLK,
				DAC_load	=>		s_DAC_load,
				ADCL_shift	=>		s_ADCL_shift,
				ADCR_shift	=>		s_ADCR_shift,
				real_strobe =>		s_real_strobe
			 );

inst_1: parallel_to_seriell
	port map (  clk			=>		clk_12M,
				reset_n		=>		i2s_reset_n,
				BCLK		=>		s_BCLK,
				DAC_load	=>		s_DAC_load,
				change_channel	=>		s_WS_dly,
				DACDAT_pl_i =>		DACDAT_pl,
				DACDAT_pr_i =>		DACDAT_pr,
				DACDAT_s_o		=>		s_DACDAT_s_o
			  );


			 
--------------------------------------------------
-- Assign signals
--------------------------------------------------

DACDAT_s <= s_DACDAT_s_o;
WS			<= WS_o;
BCLK 		<= s_BCLK;	
STROBE_O	<= s_real_strobe;

end rtl;

				