-------------------------------------------------------------------------------
-- Project     : fm_sel
-- Description : 
--
--
-------------------------------------------------------------------------------
--
-- Change History
-- Date     |Name      |Modification
------------|----------|-------------------------------------------------------
-- 12.04.13 | bruelcor | erstellt
-------------------------------------------------------------------------------


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

-- Entity Declaration 
-------------------------------------------
ENTITY fm_sel IS
	PORT ( 	reset_n						:IN		std_logic;
			clk							:IN		std_logic;
			tone_on						:IN		std_logic;
			M_fsig						:IN		natural range 0 to 65000;
			mod_dat						:IN		std_logic_vector (15 downto 0);
			fm_ratio					:IN		natural range 0 to 1000;
			fm_depth					:IN		natural range 0 to 10;
			mod_on						:OUT	std_logic;
			mod_M						:OUT	natural range 0 to 65000;
			car_on						:OUT	std_logic;
			car_M						:OUT	natural range 0 to 65000
			);
END fm_sel;

-- Architecture Declaration
-------------------------------------------
ARCHITECTURE rtl OF fm_sel IS
-- Signals & Constants Declaration
-------------------------------------------
SIGNAL fgain:								natural range 0 to 65000;
SIGNAL reg_mod_M, next_reg_mod_M:			std_logic_vector(15 downto 0);
SIGNAL vec_M_fsig:							std_logic_vector(15 downto 0);
-- Begin Architecture
-------------------------------------------
BEGIN

	gain : PROCESS(mod_dat, fm_depth)						-- Implementierung der FM-Depth
	BEGIN
		fgain <= to_integer(signed(mod_dat))*fm_depth;
	END PROCESS;
	
	addierer : PROCESS(M_fsig, fgain)						-- Addition der Signale für den M Wert des Carriers
	BEGIN
		IF M_fsig =0 THEN
		car_M <=0;
		ELSE
		car_M <= M_fsig+fgain;
		END IF;
	END PROCESS;
	
	
	flipflop: PROCESS (next_reg_mod_M, clk, reset_n)		
	BEGIN
			IF		reset_n = '0' 	THEN
			reg_mod_M <= (OTHERS => '0');
	ELSIF 	clk'EVENT AND clk = '1' THEN
			reg_mod_M <= next_reg_mod_M;
	END IF;
	END PROCESS;
	
	
	logic_mod : PROCESS(vec_M_fsig, fm_ratio) 							-- Schieberegister für FM-Ration Einstellungen
	BEGIN
		
			CASE fm_ratio IS
				WHEN 1 => 	next_reg_mod_M <= 	vec_M_fsig;								-- 1:1
									
				WHEN 2 => 	next_reg_mod_M <= 	'0' & vec_M_fsig(15 downto 1);			-- 2:1	
									
				WHEN 3 => 	next_reg_mod_M <= 	"00" & vec_M_fsig(15 downto 2);			-- 4:1
				
				WHEN 4 =>	next_reg_mod_M <= 	vec_M_fsig(14 downto 0) & '0';			-- 1:2
				
				WHEN OTHERS => next_reg_mod_M	<=		vec_M_fsig(13 downto 0) & "00";		--1:4
			END CASE;	
	END PROCESS;
	
		
	mod_on <= tone_on;												-- Signalzuweisungen
	car_on <= tone_on;
	vec_M_fsig <= std_logic_vector(to_signed(M_fsig, 16));
	mod_M <= to_integer(signed(reg_mod_M));
	
	 -- End Architecture 
------------------------------------------- 
END rtl;
	
