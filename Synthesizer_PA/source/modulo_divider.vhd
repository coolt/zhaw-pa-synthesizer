-------------------------------------------
-- modulo divider
-------------------------------------------
-- copyright: dqtm (1. version)
-- commented: baek (2. version)
--
-- function:
-- modulo divider with generic width. Output MSB with 50% duty cycle.
-- Can be used for clock-divider when no exact ratio required.
-------------------------------------------


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY modulo_divider IS
GENERIC (width		: positive  := 5 );
  PORT( clk	: IN    std_logic;
    	   clk_div     : OUT   std_logic
    	);
END modulo_divider;



ARCHITECTURE rtl OF modulo_divider IS

signal count, next_count: unsigned(width-1 downto 0);	 

BEGIN

comb_logic: PROCESS(count)
BEGIN	
	-- increment	
	next_count <= count + 1 ;
END PROCESS comb_logic;   
  

flip_flops : PROCESS(clk)
BEGIN	  	
    IF rising_edge(clk) THEN
		count <= next_count ;
    END IF;
END PROCESS flip_flops;		
  
  
  
  -- CONCURRENT ASSIGNMENTS
  --------------------------------------------------
  -- take MSB and convert for output data-type
  clk_div <= std_logic(count(width-1));
  
END rtl;

