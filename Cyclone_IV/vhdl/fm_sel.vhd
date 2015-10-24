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


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- entity Declaration 
-------------------------------------------
entity fm_sel is
	port ( 	reset_n						:in		std_logic;
			clk							:in		std_logic;
			tone_on						:in		std_logic;
			M_fsig						:in		natural range 0 to 65000;
			mod_dat						:in		std_logic_vector (15 downto 0);
			fm_ratio					:in		natural range 0 to 1000;
			fm_depth					:in		natural range 0 to 10;
			mod_on						:out	std_logic;
			mod_M						:out	natural range 0 to 65000;
			car_on						:out	std_logic;
			car_M						:out	natural range 0 to 65000
			);
end fm_sel;

-- architecture Declaration
-------------------------------------------
architecture rtl of fm_sel is
-- Signals & Constants Declaration
-------------------------------------------
signal fgain:								natural range 0 to 65000;
signal reg_mod_M, next_reg_mod_M:			std_logic_vector(15 downto 0);
signal vec_M_fsig:							std_logic_vector(15 downto 0);
-- begin architecture
-------------------------------------------
begin

	gain : process(mod_dat, fm_depth)						-- Implementierung der FM-Depth
	begin
		fgain <= to_integer(signed(mod_dat))*fm_depth;
	end process;
	
	addierer : process(M_fsig, fgain)						-- Addition der Signale für den M Wert des Carriers
	begin
		if M_fsig =0 then
		car_M <=0;
		else
		car_M <= M_fsig+fgain;
		end if;
	end process;
	
	
	flipflop: process (next_reg_mod_M, clk, reset_n)		
	begin
			if		reset_n = '0' 	then
			reg_mod_M <= (others => '0');
	elsif 	clk'event AND clk = '1' then
			reg_mod_M <= next_reg_mod_M;
	end if;
	end process;
	
	
	logic_mod : process(vec_M_fsig, fm_ratio) 							-- Schieberegister für FM-Ration Einstellungen
	begin
		
			case fm_ratio is
				when 1 => 	next_reg_mod_M <= 	vec_M_fsig;								-- 1:1
									
				when 2 => 	next_reg_mod_M <= 	'0' & vec_M_fsig(15 downto 1);			-- 2:1	
									
				when 3 => 	next_reg_mod_M <= 	"00" & vec_M_fsig(15 downto 2);			-- 4:1
				
				when 4 =>	next_reg_mod_M <= 	vec_M_fsig(14 downto 0) & '0';			-- 1:2
				
				when others => next_reg_mod_M	<=		vec_M_fsig(13 downto 0) & "00";		--1:4
			end case;	
	end process;
	
		
	mod_on <= tone_on;												-- Signalzuweisungen
	car_on <= tone_on;
	vec_M_fsig <= std_logic_vector(to_signed(M_fsig, 16));
	mod_M <= to_integer(signed(reg_mod_M));
	
	 -- end architecture 
------------------------------------------- 
end rtl;
	
