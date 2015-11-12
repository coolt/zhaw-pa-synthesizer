-------------------------------------------------------------------------------
-- Package  Declaration
-------------------------------------------------------------------------------
--	Debug Signals to track internal signals in the hierarchy
--
-------------------------------------------------------------------------------
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
  
  
 package debug_pkg is
  
	SIGNAL dbg_count		: unsigned(7 downto 0);
 
 
 END debug_pkg;