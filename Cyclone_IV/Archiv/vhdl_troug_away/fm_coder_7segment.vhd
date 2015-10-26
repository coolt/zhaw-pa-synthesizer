--fm_coder_7segment
--copyright by herscmic
--version 0.1
--04.04.2013

--Funktion: Dieser Baustein sorgt beinhaltet einen ZÃƒÂ¤hler, und einen
--7Segment decoder. Der ZÃƒÂ¤hler wird mit zwei Taster angesteuert und 
--kann dadurch entweder aufwÃƒÂ¤rts oder abwÃƒÂ¤rts zÃƒÂ¤hlen. Anhand des momentanen Zustands
--wird dann ein VerhÃƒÂ¤ltinis ausgegeben, welches vom fm-Synthesizer ausgewertet wird. 
--



library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



-- entity Declaration 
-------------------------------------------
entity fm_coder_7segment is
  port(   clk,reset_n								:	in 	     std_logic;
		  count_i     									:	in 	     std_logic_vector(1 downto 0);
		  fm_ratio										:	out	     natural range 0 to 1000;
		  fm_depth		 	 							:	out	     natural range 0 to 10;
		  hex_0, hex_1, hex_2, hex_3, hex_4		:	out 	 std_logic_vector(6 downto 0);
		  hex_m											:  out			std_logic_vector(6 downto 0)
		);
end fm_coder_7segment;										


-- architecture Declaration
-------------------------------------------
architecture rtl of fm_coder_7segment is
-- Signals & Constants Declaration
-------------------------------------------

signal reg_idx_ratio, next_reg_idx_ratio	   	:	unsigned(2 downto 0);
signal reg_idx_depth, next_reg_idx_depth	   	:	unsigned(2 downto 0);
signal delay_count										:  std_logic_vector (1 downto 0);
signal counter_on											:  std_logic_vector (1 downto 0);

-- begin architecture
-------------------------------------------
begin


--ZÃƒÂ¤hler-----------------------------------------------------------------
--der ZÃƒÂ¤hler soll von 0 bis 7 ZÃƒÂ¤hlen, mit cont_i="10" aufwÃƒÂ¤rts gezÃƒÂ¤hlt werden, mit count_i="01" 
--soll abwÃƒÂ¤rts gezÃƒÂ¤hlt werden. Ist der ZÃƒÂ¤hler bei null, kann nur aufwÃƒÂ¤rts gezÃƒÂ¤hlt werden. 

--FLIP FLOP process ZÃƒÂ¤hler
flipflop: process (clk, reset_n)
begin 
	if reset_n='0' then 
		reg_idx_ratio <= "001";
		reg_idx_depth <= "000";
		delay_count <= "00";
		
	elsif clk'event AND clk='1' then
		reg_idx_ratio <= next_reg_idx_ratio;
		reg_idx_depth <= next_reg_idx_depth;
		delay_count <= count_i;
	end if;
	end process;


	
--ZÃƒÂ¤hler Einangslogik

log: process (reg_idx_ratio, counter_on, reg_idx_depth)

begin
	next_reg_idx_depth <= reg_idx_depth;
	next_reg_idx_ratio <= reg_idx_ratio;
	if counter_on(1)='1' then 
		if reg_idx_depth=7 then
		next_reg_idx_depth <="000";
		else
		next_reg_idx_depth <= reg_idx_depth+1;
		end if;
    elsif counter_on(0)='1' then 
		if reg_idx_ratio=5 then
			next_reg_idx_ratio <= "001";
		else next_reg_idx_ratio <= reg_idx_ratio+1;
		end if;
	else 	next_reg_idx_depth <= reg_idx_depth;
			next_reg_idx_ratio <= reg_idx_ratio;
	end if;
	
end process;

-- Zaehler Ausgangslogik

ausgang_log: process ( reg_idx_ratio, reg_idx_depth)
begin 
	

--7-Segmentanzeigen-Ansteuerung
	-- R--
	hex_1 <= "0001000";
	--D--
	hex_3 <= "1000000";
	--
	hex_m	<= "0111111";
	
	case reg_idx_ratio is
		when "001" =>  			hex_2 <= "1111001";
										hex_0 <= "1111001";
		when "010" =>  			hex_2 <= "0100100";
										hex_0 <=	"1111001";
		when "011" =>  			hex_2 <= "0011001";
										hex_0 <= "1111001";
		when "100" =>  			hex_2 <= "1111001";
										hex_0 <= "0100100";
		when others =>  			hex_2 <= "1111001";
										hex_0 <= "0011001";
	end case;
	
	case reg_idx_depth is
		when "000" =>  			hex_4 <= "1000000";
		when "001" =>  			hex_4 <= "1111001";
		when "010" =>  			hex_4 <="0100100";
		when "011" =>  			hex_4 <= "0110000";
		when "100" =>  			hex_4 <= "0011001";
		when "101" =>  			hex_4 <= "0010010";
		when "110" =>  			hex_4 <= "0000011";
		when others =>  	hex_4 <= "1111000";
	end case;
	
	
end process;

		
		
counter_on(0) <= (NOT count_i(0)) AND delay_count(0);	
counter_on(1) <= (NOT count_i(1)) AND delay_count(1);	
fm_ratio <= to_integer( reg_idx_ratio);
fm_depth <= to_integer( reg_idx_depth);

	
  
  
 -- end architecture 
------------------------------------------- 
end rtl;
