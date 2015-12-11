-------------------------------------------
-- dds
-------------------------------------------
-- copyright: bleispiu (1. version)
-- commented: baek (2. version)
--
-- function:
-- A dds bases on a counter witch steps can be changed. 
-- count max is 2048. 
-- the steps gives the indexes in the LUT of notes. 
-- The notes are set to the output
------------------------------------------------ 

-- TO DO:
-- output assignment: LUT(addr), LUT ist nicht definiert (oder in package tone ?)
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

LIBRARY work;
USE work.tone_gen_pkg.all;


ENTITY dds IS
PORT(	clk_12M: 	IN	std_logic;
		reset_n: 	IN	std_logic;
		tone_on_i: 	IN	std_logic;		                        --- delet not connected signal strobe			
		phi_incr_i: IN	natural range 0 to 65000;	
		dacdat_l_o: OUT std_logic_vector (15 downto 0);
		dacdat_r_o: OUT std_logic_vector (15 downto 0)
		);
END dds;
	

ARCHITECTURE rtl OF dds IS

SIGNAL addr:		integer range 0 to (L-1);
SIGNAL count:  	unsigned((N_CUM-1) downto 0); 
SIGNAL count_folge: unsigned((N_CUM-1) downto 0);
CONSTANT N_AUDIO:	natural:= 16; 
CONSTANT	max_value: natural:= 2**N_CUM;
CONSTANT	N_LUT:	natural:= 6; 



BEGIN

flipflop:	PROCESS	(clk_12M, reset_n)
BEGIN
    IF (reset_n = '0') THEN
		count <= (OTHERS => '0');
		
    ELSIF (clk_12M'EVENT AND clk_12M = '1')THEN
		count	<=	count_folge;
    END IF;
END PROCESS;

	
-- PROCESS for LOGIC
-- next is current + phi_incr_i 
-- phi_incr_i is a vekcor(15 downto 0) with a max = 2^16
------------------------------------------------
logic	:	PROCESS (all)
BEGIN
    IF (tone_on_i = '1') THEN
		-- IF	(strobe_i = '1'  AND bclk='0') THEN   !!!!!!!!!!!!!neues Signal einbauen
		count_folge <=	count + phi_incr_i;
    ELSE 
        count_folge <= count;
    END IF;
END PROCESS;

-- assign values 
------------------------------------------------
addr 		<=	to_integer(count(N_CUM-1  downto  (N_CUM-N_LUT)));
dacdat_r_o	<=	 std_logic_vector(to_signed (LUT(addr), N_AUDIO ));	  
dacdat_l_o <=	 std_logic_vector(to_signed (LUT(addr), N_AUDIO ));
END rtl;	
	
