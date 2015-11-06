-------------------------------------------
-- audio_control
-------------------------------------------
-- copyright: herscmic (1. version)
-- commented: baek (2. version)
--
-- function:
-- dublicate audio data for right and left chanel
-------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;



ENTITY audio_control IS
 PORT (  ADCDAT_pl_i   :IN  std_logic_vector (15 DOWNTO 0);
   ADCDAT_pr_i   :IN  std_logic_vector (15 DOWNTO 0);
   DACDAT_pl_o   :OUT std_logic_vector (15 DOWNTO 0);
   DACDAT_pr_o   :OUT std_logic_vector (15 DOWNTO 0);
   AUDIO_MODE   :IN  std_logic;
   dds_DATA_I   :IN  std_logic_vector (15 DOWNTO 0)  
    );
END audio_control;


ARCHITECTURE rtl OF audio_control IS


BEGIN
verbindung: PROCESS( ADCDAT_pl_i, ADCDAT_pr_i, AUDIO_MODE, dds_DATA_I)

BEGIN 
 IF AUDIO_MODE='1' THEN
  DACDAT_pl_o <= ADCDAT_pl_i;
  DACDAT_pr_o <= ADCDAT_pr_i;
 ELSE 
  DACDAT_pl_o <= dds_DATA_I;
  DACDAT_pr_o <= dds_DATA_I;
 END IF;
END PROCESS verbindung; 
  

END ARCHITECTURE rtl;