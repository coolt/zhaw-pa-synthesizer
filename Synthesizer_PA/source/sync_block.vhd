-------------------------------------------
-- synchronisation block
-------------------------------------------
-- copyright: herscmic (1. version)
-- commented: baek (2. version)
--
-- function:
-- synchronize input with 2 flip flops 
-------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY sync_block IS
  PORT( clk			: IN      	std_logic;
		  reset_n		: IN      	std_logic;
		  async_i   : IN      	std_logic;
    	syncd_o   : OUT   	  std_logic
    	);
END sync_block;



ARCHITECTURE rtl OF sync_block IS

SIGNAL 	qreg, next_qreg: 		std_logic_vector(1 DOWNTO 0);



BEGIN
 
flip_flops : PROCESS(clk, reset_n)
  BEGIN	
  	IF reset_n = '0' THEN
		qreg 	<=  (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN	
		qreg   <= next_qreg;
    END IF;
END PROCESS flip_flops;		
  
  
  --------------------------------------------------
  -- CONCURRENT ASSIGNMENTS
  --------------------------------------------------
  next_qreg(1) <= async_i;
  next_qreg(0) <= qreg(1);
  
  -- set output
  syncd_o <= qreg(0);
  

END rtl;