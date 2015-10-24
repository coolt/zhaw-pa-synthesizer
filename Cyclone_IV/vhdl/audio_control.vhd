--audio_control
--copyright by herscmic
--version 0.1
--05.04.2013

--Funktion: Verbindet momentan nur die Links und rechts Vektoren wenn AUDIO_MODE=1

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


-- entity Declaration 
-------------------------------------------
entity audio_control is
	port ( 	ADCDAT_pl_i			:in 	std_logic_vector (15 downto 0);
			ADCDAT_pr_i			:in 	std_logic_vector (15 downto 0);
			DACDAT_pl_o			:out	std_logic_vector (15 downto 0);
			DACDAT_pr_o			:out	std_logic_vector (15 downto 0);
			--AUDIO_MODE			:in		std_logic;
			dds_DATA_I			:in		std_logic_vector (15 downto 0)
			
		  );
end audio_control;

-- architecture Declaration
-------------------------------------------
architecture rtl of audio_control is
-- Signals & Constants Declaration
-------------------------------------------

begin
verbindung: process( ADCDAT_pl_i, ADCDAT_pr_i, dds_DATA_I)

begin 
	
		DACDAT_pl_o <= ADCDAT_pl_i;
		DACDAT_pr_o <= ADCDAT_pr_i;
	
end process verbindung;	
		

--Components Declaration
------------------------------------------
end architecture rtl;