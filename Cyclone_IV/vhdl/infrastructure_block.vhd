----------------------------------------------------------------
-- Synchronisation
--Funktion: Dieser Baustein soll den pll und den sync_block
--verbinden. Am Schluss erstellt dieser Block einen 12MHz signal und
--synchronisiert alle Eingangsignale

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity infrastructure_block is
  port(   s_reset_n					:in    	std_logic;
			clk_50M          			:in    	std_logic;
			button						:in 	std_logic_vector(17 downto 0);
			key_in						:in		std_logic_vector(2 downto 0);
    	    clk_12M                     :out   	std_logic;
		    button_sync					:out 	std_logic_vector(17 downto 0);
			key_sync					:out	std_logic_vector(2 downto 0)
    	);
end infrastructure_block;


-- architecture Declaration
-------------------------------------------
architecture rtl of infrastructure_block is
-- Signals & Constants Declaration
-------------------------------------------
signal 	s_clk_12M		: 		std_logic;
signal  s_reset			:  		std_logic; 

--Components Declaration


--- Takt----------------------------------------------------------------------------
component modulo_divider
generic (width		: positive  := 5 );
  port( clk	: in    std_logic;
    	   clk_div     : out   std_logic
    	);
end component;


component sync_block
port ( 	async_i		: in std_logic;
		reset_n		: in std_logic;
		clk			: in std_logic;
		syncd_o		: out std_logic);
end component;		

		


-- begin architecture
-------------------------------------------
begin

 -- port MAPS
 ------------------------------------------
 
 -------------TAKt: Teilung durch 4--------------------------------------
 divider_inst : modulo_divider
generic map (width =>	4)
port map (  clk 			=> 		clk_50M,
			clk_div	 		=>	 	s_clk_12M);
			
		
 sync_inst0: sync_block
 port map ( async_i 		=> 		button(0),
			reset_n			=> 		s_reset_n,
			clk			  	=> 		s_clk_12M,
			syncd_o			=> 		button_sync(0));
		
sync_inst1: sync_block
 port map ( async_i 	=> 		button(1),
			reset_n		=> 		s_reset_n,
        	clk   		=> 		s_clk_12M,
			syncd_o		=> 		button_sync(1));
			
sync_inst2: sync_block
 port map ( async_i 	=> 		button(2),
			reset_n		=> 		s_reset_n,
        	clk   		=> 		s_clk_12M,
			syncd_o		=> 		button_sync(2));
			
sync_inst3: sync_block
 port map ( async_i 		=> 		button(3),
			reset_n			=> 		s_reset_n,
			clk			  	=> 		s_clk_12M,
			syncd_o			=> 		button_sync(3));
		
sync_inst4: sync_block
 port map ( async_i 	=> 		button(4),
			reset_n		=> 		s_reset_n,
        	clk   		=> 		s_clk_12M,
			syncd_o		=> 		button_sync(4));
			
sync_inst5: sync_block
 port map ( async_i 	=> 		button(5),
			reset_n		=> 		s_reset_n,
        	clk   		=> 		s_clk_12M,
			syncd_o		=> 		button_sync(5));

sync_inst6: sync_block
 port map ( async_i 		=> 		button(6),
			reset_n			=> 		s_reset_n,
			clk			  	=> 		s_clk_12M,
			syncd_o			=> 		button_sync(6));
		
sync_inst7: sync_block
 port map ( async_i 	=> 		button(7),
			reset_n		=> 		s_reset_n,
        	clk   		=> 		s_clk_12M,
			syncd_o		=> 		button_sync(7));
			
sync_inst8: sync_block
 port map ( async_i 	=> 		button(8),
			reset_n		=> 		s_reset_n,
        	clk   		=> 		s_clk_12M,
			syncd_o		=> 		button_sync(8));
			
sync_inst9: sync_block
 port map ( async_i 		=> 		button(9),
			reset_n			=> 		s_reset_n,
			clk			  	=> 		s_clk_12M,
			syncd_o			=> 		button_sync(9));
		
sync_inst10: sync_block
 port map ( async_i 	=> 		button(10),
			reset_n		=> 		s_reset_n,
        	clk   		=> 		s_clk_12M,
			syncd_o		=> 		button_sync(10));
			
sync_inst11: sync_block
 port map ( async_i 	=> 		button(11),
			reset_n		=> 		s_reset_n,
        	clk   		=> 		s_clk_12M,
			syncd_o		=> 		button_sync(11));

sync_inst12: sync_block
 port map ( async_i 		=> 		button(12),
			reset_n			=> 		s_reset_n,
			clk			  	=> 		s_clk_12M,
			syncd_o			=> 		button_sync(12));
		
sync_inst13: sync_block
 port map ( async_i 	=> 		button(13),
			reset_n		=> 		s_reset_n,
        	clk   		=> 		s_clk_12M,
			syncd_o		=> 		button_sync(13));
			
sync_inst14: sync_block
 port map ( async_i 	=> 		button(14),
			reset_n		=> 		s_reset_n,
        	clk   		=> 		s_clk_12M,
			syncd_o		=> 		button_sync(14));
			
sync_inst15: sync_block
 port map ( async_i 		=> 		button(15),
			reset_n			=> 		s_reset_n,
			clk			  	=> 		s_clk_12M,
			syncd_o			=> 		button_sync(15));
		
sync_inst16: sync_block
 port map ( async_i 	=> 		button(16),
			reset_n		=> 		s_reset_n,
        	clk   		=> 		s_clk_12M,
			syncd_o		=> 		button_sync(16));
			
sync_inst17: sync_block
 port map ( async_i 	=> 		button(17),
			reset_n		=> 		s_reset_n,
        	clk   		=> 		s_clk_12M,
			syncd_o		=> 		button_sync(17));
			
sync_inst18: sync_block
 port map ( async_i 	=> 		key_in(0),
			reset_n		=> 		s_reset_n,
        	clk   		=> 		s_clk_12M,
			syncd_o		=> 		key_sync(0));
			
sync_inst19: sync_block
 port map ( async_i 	=> 		key_in(1),
			reset_n		=> 		s_reset_n,
        	clk   		=> 		s_clk_12M,
			syncd_o		=> 		key_sync(1));
			
sync_inst20: sync_block
 port map ( async_i 	=> 		key_in(2),
			reset_n		=> 		s_reset_n,
        	clk   		=> 		s_clk_12M,
			syncd_o		=> 		key_sync(2));
  
  -- Permanent connections
  -----------------------------------------
  
  clk_12M <= s_clk_12M; 
  s_reset <= NOT s_reset_n;
  
 -- end architecture 
------------------------------------------- 
end rtl;