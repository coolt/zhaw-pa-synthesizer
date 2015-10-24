-------------------------------------------
-- Block code:  modulo_divider.vhd
-- History: 	14.Nov.2012 - 1st version (dqtm)
--                 <date> - <changes>  (<author>)
--
-- Function: modulo divider with generic width. Output MSB with 50% duty cycle.
--		Can be used for clock-divider when no exact ratio required.
-------------------------------------------

-- library & use Statements
-------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


-- entity Declaration 
-------------------------------------------
entity modulo_divider is
generic (width		: positive  := 5 );
  port( clk	: in    std_logic;
    	   clk_div     : out   std_logic
    	);
end modulo_divider;


-- architecture Declaration?
-------------------------------------------
architecture rtl of modulo_divider is
-- Signals & Constants Declaration?
-------------------------------------------
signal count, next_count: unsigned(width-1 downto 0);	 


-- begin architecture
-------------------------------------------
begin

  --------------------------------------------------
  -- process FOR COMBINATORIAL LOGIC
  --------------------------------------------------
  comb_logic: process(count)
  begin	
	-- increment	
	next_count <= count + 1 ;
  end process comb_logic;   
  
  --------------------------------------------------
  -- process FOR REGISTERS
  --------------------------------------------------
  flip_flops : process(clk)
  begin	
  	
    if rising_edge(clk) then
		count <= next_count ;
    end if;
  end process flip_flops;		
  
  
  --------------------------------------------------
  -- CONCURRENT ASSIGNMENTS
  --------------------------------------------------
  -- take MSB and convert for output data-type
  clk_div <= std_logic(count(width-1));
  
  
 -- end architecture 
------------------------------------------- 
end rtl;

