--sync_block
--copyright by herscmic
--version 0.1
--08.03.2013 17.31

--Funktion: Der sync_block soll jedes eingehende
--signal synchronisieren, damit undefinierte Zustände
--vermieden werden. Dies wird durch das Nacheinanderschalten von 
--zwei Filipflops realisiert. 

------------------COPY PASTE von infra_block
-- sync_inst0: sync_block
 -- port map ( async_i 		=> 		button(0),
			-- reset_n			=> 		s_reset_n,
			-- clk			  	=> 		s_clk_12M,
			-- syncd_o			=> 		button_sync(0));
		
-- sync_inst1: sync_block
 -- port map ( async_i 	=> 		button(1),
			-- reset_n		=> 		s_reset_n,
        	-- clk   		=> 		s_clk_12M,
			-- syncd_o		=> 		button_sync(1));
			
-- sync_inst2: sync_block
 -- port map ( async_i 	=> 		button(2),
			-- reset_n		=> 		s_reset_n,
        	-- clk   		=> 		s_clk_12M,
			-- syncd_o		=> 		button_sync(2));
			
-- sync_inst3: sync_block
 -- port map ( async_i 		=> 		button(3),
			-- reset_n			=> 		s_reset_n,
			-- clk			  	=> 		s_clk_12M,
			-- syncd_o			=> 		button_sync(3));
		
-- sync_inst4: sync_block
 -- port map ( async_i 	=> 		button(4),
			-- reset_n		=> 		s_reset_n,
        	-- clk   		=> 		s_clk_12M,
			-- syncd_o		=> 		button_sync(4));
			
-- sync_inst5: sync_block
 -- port map ( async_i 	=> 		button(5),
			-- reset_n		=> 		s_reset_n,
        	-- clk   		=> 		s_clk_12M,
			-- syncd_o		=> 		button_sync(5));

-- sync_inst6: sync_block
 -- port map ( async_i 		=> 		button(6),
			-- reset_n			=> 		s_reset_n,
			-- clk			  	=> 		s_clk_12M,
			-- syncd_o			=> 		button_sync(6));
		
-- sync_inst7: sync_block
 -- port map ( async_i 	=> 		button(7),
			-- reset_n		=> 		s_reset_n,
        	-- clk   		=> 		s_clk_12M,
			-- syncd_o		=> 		button_sync(7));
			
-- sync_inst8: sync_block
 -- port map ( async_i 	=> 		button(8),
			-- reset_n		=> 		s_reset_n,
        	-- clk   		=> 		s_clk_12M,
			-- syncd_o		=> 		button_sync(8));
			
-- sync_inst9: sync_block
 -- port map ( async_i 		=> 		button(9),
			-- reset_n			=> 		s_reset_n,
			-- clk			  	=> 		s_clk_12M,
			-- syncd_o			=> 		button_sync(9));
		
-- sync_inst10: sync_block
 -- port map ( async_i 	=> 		button(10),
			-- reset_n		=> 		s_reset_n,
        	-- clk   		=> 		s_clk_12M,
			-- syncd_o		=> 		button_sync(10));
			
-- sync_inst11: sync_block
 -- port map ( async_i 	=> 		button(11),
			-- reset_n		=> 		s_reset_n,
        	-- clk   		=> 		s_clk_12M,
			-- syncd_o		=> 		button_sync(11));

-- sync_inst12: sync_block
 -- port map ( async_i 		=> 		button(12),
			-- reset_n			=> 		s_reset_n,
			-- clk			  	=> 		s_clk_12M,
			-- syncd_o			=> 		button_sync(12));
		
-- sync_inst13: sync_block
 -- port map ( async_i 	=> 		button(13),
			-- reset_n		=> 		s_reset_n,
        	-- clk   		=> 		s_clk_12M,
			-- syncd_o		=> 		button_sync(13));
			
-- sync_inst14: sync_block
 -- port map ( async_i 	=> 		button(14),
			-- reset_n		=> 		s_reset_n,
        	-- clk   		=> 		s_clk_12M,
			-- syncd_o		=> 		button_sync(14));
			
-- sync_inst15: sync_block
 -- port map ( async_i 		=> 		button(15),
			-- reset_n			=> 		s_reset_n,
			-- clk			  	=> 		s_clk_12M,
			-- syncd_o			=> 		button_sync(15));
		
-- sync_inst16: sync_block
 -- port map ( async_i 	=> 		button(16),
			-- reset_n		=> 		s_reset_n,
        	-- clk   		=> 		s_clk_12M,
			-- syncd_o		=> 		button_sync(16));
			
-- sync_inst17: sync_block
 -- port map ( async_i 	=> 		button(17),
			-- reset_n		=> 		s_reset_n,
        	-- clk   		=> 		s_clk_12M,
			-- syncd_o		=> 		button_sync(17));
			
-- sync_inst18: sync_block
 -- port map ( async_i 	=> 		key_in(0),
			-- reset_n		=> 		s_reset_n,
        	-- clk   		=> 		s_clk_12M,
			-- syncd_o		=> 		key_sync(0));
			
-- sync_inst19: sync_block
 -- port map ( async_i 	=> 		key_in(1),
			-- reset_n		=> 		s_reset_n,
        	-- clk   		=> 		s_clk_12M,
			-- syncd_o		=> 		key_sync(1));
			
-- sync_inst20: sync_block
 -- port map ( async_i 	=> 		key_in(2),
			-- reset_n		=> 		s_reset_n,
        	-- clk   		=> 		s_clk_12M,
			-- syncd_o		=> 		key_sync(2));
			--------------------------

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