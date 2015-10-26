----------------------------------------------------------------------
-- Filename: Flanken_Det.vhd
-- Projektgruppe Weiss
-- Letzte Aenderung: 12.03.11
-- Funktionsbeschrieb:
-- - Diese Schaltung gibt einen Tick nach jeder NEGATIVEN Flanke aus!
----------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Flanken_Det IS
  PORT(
    	clk,serial_in,reset_n		: IN    std_logic;
    	edge        			: OUT   std_logic);
END Flanken_Det;

ARCHITECTURE rtl OF Flanken_Det IS
	SIGNAL q1,q2 : std_logic;
BEGIN
  dff : PROCESS(clk, reset_n)
  BEGIN
  	IF (reset_n = '0') THEN
		edge  <= '0';
		q1	  <= '0';
		q2    <= '0';
    ELSIF (clk'EVENT AND clk = '1') THEN
		q1 <= serial_in;
      	q2 <= q1;
		edge <= NOT q1 AND q2; -- schaut auf die negativen Flanken
    END IF;
  END PROCESS dff;
END rtl;
