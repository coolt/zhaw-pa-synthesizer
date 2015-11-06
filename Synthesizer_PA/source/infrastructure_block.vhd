--infrastructure_block
--copyright by herscmic
--version 0.1
--08.03.2013 17.31

--Funktion: Dieser Baustein soll den pll und den sync_block
--verbinden. Am Schluss erstellt dieser Block einen 12MHz Signal und
--synchronisiert alle Eingangsignale

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


-- Entity Declaration 
-------------------------------------------
ENTITY infrastructure_block IS
  PORT(   	s_reset_n					:IN    	std_logic;
			clk_50M          			:IN    	std_logic;
			button						:IN 	std_logic_vector(17 DOWNTO 0);
			key_in						:IN		std_logic_vector(2 DOWNTO 0);
    	    clk_12M                     :OUT   	std_logic;
		    button_sync					:OUT 	std_logic_vector(17 DOWNTO 0);
			key_sync					:OUT	std_logic_vector(2 DOWNTO 0)
    	);
END infrastructure_block;


-- Architecture Declaration
-------------------------------------------
ARCHITECTURE rtl OF infrastructure_block IS
-- Signals & Constants Declaration
-------------------------------------------
SIGNAL 	s_clk_12M		: 		std_logic;
SIGNAL  s_reset			:  		std_logic; 

--Components Declaration



COMPONENT modulo_divider
GENERIC (width		: positive  := 5 );
  PORT( clk	: IN    std_logic;
    	   clk_div     : OUT   std_logic
    	);
END COMPONENT;

COMPONENT sync_block
PORT ( 	async_i		: IN std_logic;
		reset_n		: IN std_logic;
		clk			: IN std_logic;
		syncd_o		: OUT std_logic);
END COMPONENT;		

		


-- Begin Architecture
-------------------------------------------
BEGIN

 -- PORT MAPS
 ------------------------------------------
  
 divider_inst : modulo_divider
Generic MAP (width =>	4)
PORT MAP (  clk 			=> 		clk_50M,
			clk_div	 		=>	 	s_clk_12M);
			
		
 sync_inst0: sync_block
 PORT MAP ( async_i 		=> 		button(0),
			reset_n			=> 		s_reset_n,
			clk			  	=> 		s_clk_12M,
			syncd_o			=> 		button_sync(0));
		
sync_inst1: sync_block
 PORT MAP ( async_i 	=> 		button(1),
			reset_n		=> 		s_reset_n,
        	clk   		=> 		s_clk_12M,
			syncd_o		=> 		button_sync(1));
			
sync_inst2: sync_block
 PORT MAP ( async_i 	=> 		button(2),
			reset_n		=> 		s_reset_n,
        	clk   		=> 		s_clk_12M,
			syncd_o		=> 		button_sync(2));
			
sync_inst3: sync_block
 PORT MAP ( async_i 		=> 		button(3),
			reset_n			=> 		s_reset_n,
			clk			  	=> 		s_clk_12M,
			syncd_o			=> 		button_sync(3));
		
sync_inst4: sync_block
 PORT MAP ( async_i 	=> 		button(4),
			reset_n		=> 		s_reset_n,
        	clk   		=> 		s_clk_12M,
			syncd_o		=> 		button_sync(4));
			
sync_inst5: sync_block
 PORT MAP ( async_i 	=> 		button(5),
			reset_n		=> 		s_reset_n,
        	clk   		=> 		s_clk_12M,
			syncd_o		=> 		button_sync(5));

sync_inst6: sync_block
 PORT MAP ( async_i 		=> 		button(6),
			reset_n			=> 		s_reset_n,
			clk			  	=> 		s_clk_12M,
			syncd_o			=> 		button_sync(6));
		
sync_inst7: sync_block
 PORT MAP ( async_i 	=> 		button(7),
			reset_n		=> 		s_reset_n,
        	clk   		=> 		s_clk_12M,
			syncd_o		=> 		button_sync(7));
			
sync_inst8: sync_block
 PORT MAP ( async_i 	=> 		button(8),
			reset_n		=> 		s_reset_n,
        	clk   		=> 		s_clk_12M,
			syncd_o		=> 		button_sync(8));
			
sync_inst9: sync_block
 PORT MAP ( async_i 		=> 		button(9),
			reset_n			=> 		s_reset_n,
			clk			  	=> 		s_clk_12M,
			syncd_o			=> 		button_sync(9));
		
sync_inst10: sync_block
 PORT MAP ( async_i 	=> 		button(10),
			reset_n		=> 		s_reset_n,
        	clk   		=> 		s_clk_12M,
			syncd_o		=> 		button_sync(10));
			
sync_inst11: sync_block
 PORT MAP ( async_i 	=> 		button(11),
			reset_n		=> 		s_reset_n,
        	clk   		=> 		s_clk_12M,
			syncd_o		=> 		button_sync(11));

sync_inst12: sync_block
 PORT MAP ( async_i 		=> 		button(12),
			reset_n			=> 		s_reset_n,
			clk			  	=> 		s_clk_12M,
			syncd_o			=> 		button_sync(12));
		
sync_inst13: sync_block
 PORT MAP ( async_i 	=> 		button(13),
			reset_n		=> 		s_reset_n,
        	clk   		=> 		s_clk_12M,
			syncd_o		=> 		button_sync(13));
			
sync_inst14: sync_block
 PORT MAP ( async_i 	=> 		button(14),
			reset_n		=> 		s_reset_n,
        	clk   		=> 		s_clk_12M,
			syncd_o		=> 		button_sync(14));
			
sync_inst15: sync_block
 PORT MAP ( async_i 		=> 		button(15),
			reset_n			=> 		s_reset_n,
			clk			  	=> 		s_clk_12M,
			syncd_o			=> 		button_sync(15));
		
sync_inst16: sync_block
 PORT MAP ( async_i 	=> 		button(16),
			reset_n		=> 		s_reset_n,
        	clk   		=> 		s_clk_12M,
			syncd_o		=> 		button_sync(16));
			
sync_inst17: sync_block
 PORT MAP ( async_i 	=> 		button(17),
			reset_n		=> 		s_reset_n,
        	clk   		=> 		s_clk_12M,
			syncd_o		=> 		button_sync(17));
			
sync_inst18: sync_block
 PORT MAP ( async_i 	=> 		key_in(0),
			reset_n		=> 		s_reset_n,
        	clk   		=> 		s_clk_12M,
			syncd_o		=> 		key_sync(0));
			
sync_inst19: sync_block
 PORT MAP ( async_i 	=> 		key_in(1),
			reset_n		=> 		s_reset_n,
        	clk   		=> 		s_clk_12M,
			syncd_o		=> 		key_sync(1));
			
sync_inst20: sync_block
 PORT MAP ( async_i 	=> 		key_in(2),
			reset_n		=> 		s_reset_n,
        	clk   		=> 		s_clk_12M,
			syncd_o		=> 		key_sync(2));
  
  -- Permanent connections
  -----------------------------------------
  
  clk_12M <= s_clk_12M; 
  s_reset <= NOT s_reset_n;
  
 -- End Architecture 
------------------------------------------- 
END rtl;