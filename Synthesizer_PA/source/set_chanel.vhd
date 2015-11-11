-------------------------------------------
-- set_channel
-------------------------------------------
-- copyright: herscmic (1. version): audio_control
-- commented: baek (2. version)
--
-- function:
-- dublicate audio data for right and left chanel
-------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;



ENTITY set_chanel IS
 PORT (  ADCDAT_pl_i   :IN  std_logic_vector (15 DOWNTO 0);
   ADCDAT_pr_i   :IN  std_logic_vector (15 DOWNTO 0);
   DACDAT_pl_o   :OUT std_logic_vector (15 DOWNTO 0);
   DACDAT_pr_o   :OUT std_logic_vector (15 DOWNTO 0);
   AUDIO_MODE    :IN  std_logic;
   dacdat_gl_i   :IN  std_logic_vector (15 DOWNTO 0); 
	dacdat_gr_i   :IN  std_logic_vector (15 DOWNTO 0) 
    );
END set_chanel;


ARCHITECTURE rtl OF set_chanel IS


BEGIN
verbindung: PROCESS(all)

BEGIN 
 IF AUDIO_MODE='1' THEN
  DACDAT_pl_o <= ADCDAT_pl_i;
  DACDAT_pr_o <= ADCDAT_pr_i;
 ELSE 
  DACDAT_pl_o <= dacdat_gl_i;
  DACDAT_pr_o <= dacdat_gr_i;
 END IF;
END PROCESS verbindung; 
  

END ARCHITECTURE rtl;