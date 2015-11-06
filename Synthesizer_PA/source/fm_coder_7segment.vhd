-------------------------------------------
-- fm 7 segment encoder
-------------------------------------------
-- copyright: herscmic (1. version)
-- commented: baek (2. version)
--
-- function:
-- Dieser Baustein sorgt beinhaltet einen ZÃƒÂ¤hler, und einen
--7Segment decoder. Der ZÃƒÂ¤hler wird mit zwei Taster angesteuert und 
--kann dadurch entweder aufwÃƒÂ¤rts oder abwÃƒÂ¤rts zÃƒÂ¤hlen. Anhand des momentanen Zustands
--wird dann ein VerhÃƒÂ¤ltinis ausgegeben, welches vom fm-Synthesizer ausgewertet wird. 
--



LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;



ENTITY fm_coder_7segment IS
  PORT(   clk,reset_n								:	IN 	     std_logic;
		  count_i     									:	IN 	     std_logic_vector(1 DOWNTO 0);
		  fm_ratio										:	OUT	     natural range 0 to 1000;
		  fm_depth		 	 							:	OUT	     natural range 0 to 10;
		  hex_0, hex_1, hex_2, hex_3, hex_4		:	OUT 	 std_logic_vector(6 DOWNTO 0);
		  hex_m											:  OUT			std_logic_vector(6 DOWNTO 0)
		);
END fm_coder_7segment;										


ARCHITECTURE rtl OF fm_coder_7segment IS


SIGNAL reg_idx_ratio, next_reg_idx_ratio	   	:	unsigned(2 DOWNTO 0);
SIGNAL reg_idx_depth, next_reg_idx_depth	   	:	unsigned(2 DOWNTO 0);
SIGNAL delay_count										:  std_logic_vector (1 DOWNTO 0);
SIGNAL counter_on											:  std_logic_vector (1 DOWNTO 0);



BEGIN
--ZÃƒÂ¤hler-----------------------------------------------------------------
--der ZÃƒÂ¤hler soll von 0 bis 7 ZÃƒÂ¤hlen, mit cont_i="10" aufwÃƒÂ¤rts gezÃƒÂ¤hlt werden, mit count_i="01" 
--soll abwÃƒÂ¤rts gezÃƒÂ¤hlt werden. Ist der ZÃƒÂ¤hler bei null, kann nur aufwÃƒÂ¤rts gezÃƒÂ¤hlt werden. 

--FLIP FLOP PROCESS ZÃƒÂ¤hler
flipflop: PROCESS (clk, reset_n)
BEGIN 
	IF reset_n='0' THEN 
		reg_idx_ratio <= "001";
		reg_idx_depth <= "000";
		delay_count <= "00";
		
	ELSIF clk'EVENT AND clk='1' THEN
		reg_idx_ratio <= next_reg_idx_ratio;
		reg_idx_depth <= next_reg_idx_depth;
		delay_count <= count_i;
	END IF;
	END PROCESS;


	
--ZÃƒÂ¤hler Einangslogik
log: PROCESS (reg_idx_ratio, counter_on, reg_idx_depth)

BEGIN
	next_reg_idx_depth <= reg_idx_depth;
	next_reg_idx_ratio <= reg_idx_ratio;
	IF counter_on(1)='1' THEN 
		IF reg_idx_depth=7 THEN
		next_reg_idx_depth <="000";
		ELSE
		next_reg_idx_depth <= reg_idx_depth+1;
		END IF;
    ELSIF counter_on(0)='1' THEN 
		IF reg_idx_ratio=5 THEN
			next_reg_idx_ratio <= "001";
		ELSE next_reg_idx_ratio <= reg_idx_ratio+1;
		END IF;
	ELSE 	next_reg_idx_depth <= reg_idx_depth;
			next_reg_idx_ratio <= reg_idx_ratio;
	END IF;
	
END PROCESS;

-- Zaehler Ausgangslogik
ausgang_log: PROCESS ( reg_idx_ratio, reg_idx_depth)
BEGIN 
	

--7-Segmentanzeigen-Ansteuerung
	-- R--
	hex_1 <= "0001000";
	--D--
	hex_3 <= "1000000";
	--
	hex_m	<= "0111111";
	
	CASE reg_idx_ratio IS
		WHEN "001" =>  			hex_2 <= "1111001";
										hex_0 <= "1111001";
		WHEN "010" =>  			hex_2 <= "0100100";
										hex_0 <=	"1111001";
		WHEN "011" =>  			hex_2 <= "0011001";
										hex_0 <= "1111001";
		WHEN "100" =>  			hex_2 <= "1111001";
										hex_0 <= "0100100";
		WHEN OTHERS =>  			hex_2 <= "1111001";
										hex_0 <= "0011001";
	END CASE;
	
	CASE reg_idx_depth IS
		WHEN "000" =>  			hex_4 <= "1000000";
		WHEN "001" =>  			hex_4 <= "1111001";
		WHEN "010" =>  			hex_4 <="0100100";
		WHEN "011" =>  			hex_4 <= "0110000";
		WHEN "100" =>  			hex_4 <= "0011001";
		WHEN "101" =>  			hex_4 <= "0010010";
		WHEN "110" =>  			hex_4 <= "0000011";
		WHEN OTHERS =>  	hex_4 <= "1111000";
	END CASE;	
END PROCESS;

		
-- signal assignment
counter_on(0) <= (NOT count_i(0)) AND delay_count(0);	
counter_on(1) <= (NOT count_i(1)) AND delay_count(1);	
fm_ratio <= to_integer( reg_idx_ratio);
fm_depth <= to_integer( reg_idx_depth);

	
END rtl;
