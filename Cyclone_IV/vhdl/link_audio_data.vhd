--------------------------------------------------
-- Link audio data
-- Link audio data from dds to audio codec port
--------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity link_audio_data is
	port ( 	DACDAT_pl_o			:out	std_logic_vector (15 downto 0);
			DACDAT_pr_o			:out	std_logic_vector (15 downto 0);
			dds_DATA_I			:in		std_logic_vector (15 downto 0)			
		  );
end link_audio_data;


architecture rtl of link_audio_data is

begin

link_data: process( all)
begin 	
    DACDAT_pl_o <= dds_DATA_I;
    DACDAT_pr_o <= dds_DATA_I;
end process;	
		

end architecture rtl;