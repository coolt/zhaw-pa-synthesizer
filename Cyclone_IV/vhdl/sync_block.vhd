--sync_block
--copyright by herscmic
--version 0.1
--08.03.2013 17.31

--Funktion: Der sync_block soll jedes eingehende
--signal synchronisieren, damit undefinierte Zustände
--vermieden werden. Dies wird durch das Nacheinanderschalten von 
--zwei Filipflops realisiert. 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


-- entity Declaration 
-------------------------------------------
entity sync_block is
  port( clk				: in      	std_logic;
		reset_n			: in      	std_logic;
		async_i       	: in      	std_logic;
    	syncd_o     	: out   	std_logic
    	);
end sync_block;


-- architecture Declaration
-------------------------------------------
architecture rtl of sync_block is
-- Signals & Constants Declaration
-------------------------------------------
signal 	qreg, next_qreg: 		std_logic_vector(1 downto 0);


-- begin architecture
-------------------------------------------
begin

 
  flip_flops : process(clk, reset_n)
  begin	
  	if reset_n = '0' then
		qreg 	<=  (others => '0');
    elsif clk'event AND clk = '1' then	
		qreg   <= next_qreg;
    end if;
  end process flip_flops;		
  
  
  --------------------------------------------------
  -- CONCURRENT ASSIGNMENTS
  --------------------------------------------------
  -- Permanente Verbindungen
  next_qreg(1) <= async_i;
  next_qreg(0) <= qreg(1);
  
  --Ausgang zuweisen
  syncd_o <= qreg(0);
  
  
 -- end architecture 
------------------------------------------- 
end rtl;