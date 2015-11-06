-------------------------------------------
-- Detektor for falling edge
-------------------------------------------
-- copyright: wii (1. version)
-- commented: baek (2. version)
--
-- function:
----------------------------------------------------------------------
-- Idle = '1'
-- Startbit = '0'
-- Endbit = '1'
----------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY Flanken_Det IS
  PORT(
    	clk_12M5  : IN    std_logic;
        serial_in : IN    std_logic;
        reset_n   : IN    std_logic;
    	edge      : OUT   std_logic
    	);
END Flanken_Det;



ARCHITECTURE rtl OF Flanken_Det IS

	SIGNAL q1 : std_logic  := '0';
	SIGNAL q2 : std_logic  := '0';
	
BEGIN

detect_falling_edge : PROCESS(clk_12M5, reset_n)
  BEGIN
  	IF (reset_n = '0') THEN
		edge  <= '0';
		q1	  <= '0';
		q2    <= '0';
    ELSIF (clk_12M5'EVENT AND clk_12M5 = '1') THEN
		q1 <= serial_in;
      	q2 <= q1;
      	-- falling edge: q1 = 0, q2 = 1
		edge <= (NOT q1) AND q2;  
    END IF;
END PROCESS;

END rtl;
