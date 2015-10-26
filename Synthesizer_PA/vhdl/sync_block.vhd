--sync_block
--copyright by herscmic
--version 0.1
--08.03.2013 17.31

--Funktion: Der sync_block soll jedes eingehende
--Signal synchronisieren, damit undefinierte Zustände
--vermieden werden. Dies wird durch das Nacheinanderschalten von 
--zwei Filipflops realisiert. 

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


-- Entity Declaration 
-------------------------------------------
ENTITY sync_block IS
  PORT( clk				: IN      	std_logic;
		reset_n			: IN      	std_logic;
		async_i       	: IN      	std_logic;
    	syncd_o     	: OUT   	std_logic
    	);
END sync_block;


-- Architecture Declaration
-------------------------------------------
ARCHITECTURE rtl OF sync_block IS
-- Signals & Constants Declaration
-------------------------------------------
SIGNAL 	qreg, next_qreg: 		std_logic_vector(1 DOWNTO 0);


-- Begin Architecture
-------------------------------------------
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
  -- Permanente Verbindungen
  next_qreg(1) <= async_i;
  next_qreg(0) <= qreg(1);
  
  --Ausgang zuweisen
  syncd_o <= qreg(0);
  
  
 -- End Architecture 
------------------------------------------- 
END rtl;