library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY top_synthesizer is
port (
		CLOCK_50 : 	in std_logic;
		KEY_0 : 		in std_logic; 	   -- reset      
		GPIO_26 :   in std_logic;	   -- RX  (TX in Modul)
		GPIO_27 :   out std_logic;    -- TX  (RX in Modul)
		GPIO_28 :   inout std_logic;	-- IART CTS	
		GPIO_29 :   inout std_logic   -- UART RTS					
  );
end top_synthesizer; 


----------------------------------------------------------------------------------
-- Architecture 
----------------------------------------------------------------------------------
architecture behavioral of top_synthesizer is

--------------------------------------------
-- Signals and Constants
--------------------------------------------


begin

--------------------------------------------
-- Clocked Process
--------------------------------------------
	clk: process (all)
	begin
		if (KEY_1 = '0') then
			-- 
		elsif (rising_edge(CLOCK_50)) then
		   --
			
		end if;
	end process;


	counter: process (all)
	begin
		if (KEY_0 = '0') then
			--
		elsif(rising_edge(CLOCK_50)) then
		   --cnt <= next_cnt;   			
		end if;
	end process;
	

	
--------------------------------------------
-- input
-------------------------------------------- 
	counter_input: process (all)	
	begin			
			-- next_cnt <= cnt + 1; 
	end process;

	
--------------------------------------------
-- Test Metastable State Machine Logic
-------------------------------------------- 	
	fsm_input: process (all)		
	begin 	
--	  case state is
--	  	 when s0 => 
--			 if(pulse ='1') then
--				 next_state <= s1;
--			 else
--				 next_state <= s0;
--			 end if;  
--			
--		 when s1 =>    
--			 if(pulse ='1') then
--				 next_state <= s0;
--			 else
--				 next_state <= s1;
--			 end if;
--			 
--		 when others => 
--				next_state <= unstable;
--				
--	  end case;		
end process;	

--------------------------------------------
-- Synchronisation 
--------------------------------------------
	synchro: process (all)
	begin		
			-- pulse <= pulse_sync2;		
			--pulse <= pulse_async;
	end process;
	

--------------------------------------------
-- Output Process
--------------------------------------------

	decode_cnt_max: process (all)
	begin
--		if (cnt = 15) then
--			pulse_async <= '1';
--		else 
--			pulse_async <= '0';
--		end if;
	end process;	

	
	fsm_output: process (all)
	
	begin
	
	-- Default Values
--	LEDR_0   <= '0';
--	LEDR_1   <= '0';
--	LEDG_7   <= '0';  
--	GPIO_0_0 <= '0';
--	
--		case state is
--			when s0 =>   
--					LEDR_0  <= '1'; 
--			when s1 =>   
--					LEDR_1  <= '1'; 
--					GPIO_0_0 <= '1';
--			when unstable => 
--			      LEDG_7  <= '1';
--			when others =>   
--					LEDG_7 <= '1';		 
--		end case;			
	end process;	
	
   -- Set Output	
	--GPIO_0_1 <= pulse_async;
	
end behavioral;
