-------------------------------------------------------------------------------
--  _____       ______  _____                                                 -
-- |_   _|     |  ____|/ ____|                                                -
--   | |  _ __ | |__  | (___    Institute of Embedded Systems                 -
--   | | | '_ \|  __|  \___ \   Zuercher Hochschule Winterthur                -
--  _| |_| | | | |____ ____) |  (University of Applied Sciences)              -
-- |_____|_| |_|______|_____/   8401 Winterthur, Switzerland                  -             
-------------------------------------------------------------------------------
--
-- Project     : HDMI_TEA
-- Description : clk_divider.vhd
--
-- $LastChangedDate$
-- $Rev$
-- $Author$
-------------------------------------------------------------------------------
-- Change History
-- Date     |Name      |Modification
------------|----------|-------------------------------------------------------
-- 21.05.15 | scln     | file created
-------------------------------------------------------------------------------


-------------------------------------------------------------------------------
-- Package / Component Declaration
-------------------------------------------------------------------------------
-- Include in Design:
--   use work.mitm_pkg.all;
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------------------------------
-- Architecture
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use work.pkg_avalon_if.all;


entity clk_divider is
		PORT(
			clk_100M		: in    std_logic;
			reset_n			: in    std_logic;
			clk_out			: OUT   std_logic
		);
end entity;


-- begin of Architecture
architecture rtl of clk_divider is

-------------------------------------------------------------------------------
-- Constant declaration
-------------------------------------------------------------------------------


---------------------------------------------------------------------------------
---- Components
---------------------------------------------------------------------------------


---------------------------------------------------------------------------------
---- Signal declaration
---------------------------------------------------------------------------------
SIGNAL  counter			: std_logic_vector(15 DOWNTO 0) := (OTHERS => '0');      -- connects in and out scl (troughout)
SIGNAL  next_counter	: std_logic_vector(15 DOWNTO 0) := (OTHERS => '0');      -- change value belong output I2C-Slave


BEGIN
---------------------------------------------------------------------------------
---- Components initiation
---------------------------------------------------------------------------------
gen_clk: PROCESS (clk_100M, reset_n)
BEGIN
	
	IF reset_n = '0' THEN
		counter <= (OTHERS => '0');
	ELSIF rising_edge(clk_100M) THEN
		counter <= next_counter;
	END IF;

END PROCESS gen_clk;

log_proc: PROCESS (counter)
BEGIN
	
	next_counter <= std_logic_vector(unsigned(counter) + 1);
	
END PROCESS log_proc;
---------------------------------------------------------------------------------
---- Signal initiation                                          
---------------------------------------------------------------------------------

--clk_out <= counter(15);	-- 100 M / 2**9 = 1.525k
--clk_out <= counter(14);	-- 100 M / 2**9 = 3.05k
--clk_out <= counter(13);	-- 100 M / 2**9 = 6.1k
--clk_out <= counter(12);	-- 100 M / 2**9 = 12.2k
--clk_out <= counter(11);	-- 100 M / 2**9 = 24.414k
--clk_out <= counter(10);	-- 100 M / 2**9 = 48.828k
--clk_out <= counter(9);	-- 100 M / 2**9 = 97.656k
--clk_out <= counter(8);	-- 100 M / 2**9 = 195.3125k
--clk_out <= counter(7);	-- 100 M / 2**8 = 390.625k
clk_out <= counter(6);	-- 100 M / 2**7 = 781.25k
--clk_out <= counter(5);	-- 100 M / 2**6 = 1.56M
--clk_out <= counter(4);	-- 100 M / 2**5 = 3.125M
--clk_out <= counter(3);	-- 100 M / 2**4 = 6.25M
--clk_out <= counter(2);	-- 100 M / 2**3 = 12.5M
--clk_out <= counter(1);	-- 100 M / 2**2 = 25M
--clk_out <= counter(0);	-- 100 M / 2**1 = 50M
--clk_out <= clk_100M;	-- 100 M
	
end architecture;

