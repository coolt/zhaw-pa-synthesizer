--P2S Testbench
--Autor bleispiu
--Datum 10.4.13

--versin 0

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY	testbench_P2S IS

END 	testbench_P2S;

ARCHITECTURE test OF testbench_P2S IS

        COMPONENT       P2S
			PORT (		clk					:IN			std_logic;	--clk_12M
						reset_n				:IN			std_logic;
						BCLK				:IN			std_logic;
						DAC_load			:IN			std_logic;
						WS_dly				:IN			std_logic;
						DACDAT_pl_i			:IN			std_logic_vector(15 downto 0);
						DACDAT_pr_i			:IN			std_logic_vector(15 downto 0);
						DACDAT_s_o			:OUT		std_logic
		  );
                
        END COMPONENT;
        
                        
                SIGNAL t_clk		 	 : std_logic :='0';
                SIGNAL t_reset_n		 : std_logic;
				SIGNAL t_BCLK			 : std_logic := '0';
				SIGNAL t_DAC_load		 : std_logic;
				SIGNAL t_WS_dly			 : std_logic;
				SIGNAL t_DACDAT_pl_i	 : std_logic_vector(15 downto 0);
				SIGNAL t_DACDAT_pr_i	 : std_logic_vector(15 downto 0);
				SIGNAL t_DACDAT_s_o		 : std_logic;
                CONSTANT clk_test		 : time :=20ns;
				CONSTANT BCLK_test		 : time :=40ns;
				-- Vektoren zum Senden
				CONSTANT t_senden_r1	 : std_logic_vector(15 downto 0) :=("0000000000000001");--("1100010011100001");
				CONSTANT t_senden_l1	 : std_logic_vector(15 downto 0) :=("1001111110101101");
				CONSTANT t_senden_r2	 : std_logic_vector(15 downto 0) :=("0100000001101010");
				CONSTANT t_senden_l2	 : std_logic_vector(15 downto 0) :=("1001010011111101");

			
        BEGIN
        
                --Prozess Clock
				Clock: PROCESS (t_clk, t_BCLK)
				BEGIN
					t_clk <= not t_clk AFTER clk_test;
				
					IF t_clk'EVENT AND t_clk ='1' THEN
						t_BCLK <= NOT t_BCLK;
					END IF;
				END PROCESS Clock;
				
                --Zuweisung der Eingaenge von Block P2S
                dut: P2S
                PORT MAP (	clk  			=>		t_clk,
							reset_n			=>		t_reset_n,
							BCLK			=>		t_BCLK,
							DAC_load		=>		t_DAC_load,
							WS_dly			=>		t_WS_dly,
							DACDAT_pl_i		=>		t_DACDAT_pl_i,
							DACDAT_pr_i		=>		t_DACDAT_pr_i,
							DACDAT_s_o		=>		t_DACDAT_s_o
                            );
                
				--Testprogramm
                STIMULI: PROCESS
                
                BEGIN
                        t_WS_dly<='0';
						t_reset_n <='0';
                        WAIT FOR 2*clk_test;
                        
                        t_reset_n <='1';
                        WAIT FOR 2*clk_test;
						ASSERT (t_reset_n='1') REPORT "Die Signale wurden nicht richtig zurueck gesetzt." SEVERITY note;

						
						t_DACDAT_pl_i <= t_senden_l1;
						t_DACDAT_pr_i <= t_senden_r1;
                        t_DAC_load <= '1';
						WAIT FOR 2*clk_test;

						
						t_DAC_load <= '0';
						t_WS_dly <= '1';
						
						FOR i IN 0 TO 15 LOOP
							ASSERT (t_DACDAT_s_o = t_senden_r1(i)) REPORT "Die Uebertragung verlaeuft nicht richtig, evt. Eingang kontrollieren." SEVERITY note;
							WAIT FOR 5*clk_test;
						END LOOP;
						
						WAIT FOR 20*clk_test;
						
						ASSERT (t_DACDAT_s_o ='0') REPORT "Es wurde nicht der gesammte Vektor in der Zeit uebermittelt, evt ein Problem mit dem Senden, oder der Initialisierung des zusendenden Vektors" SEVERITY error;
						
						t_WS_dly <= '0';
						WAIT FOR 75*clk_test;
						
						ASSERT (t_DACDAT_s_o ='0') REPORT "Es wurde nicht der gesammte Vektor in der Zeit uebermittelt, evt ein Problem mit dem Senden, oder der Initialisierung des zusendenden Vektors" SEVERITY error;

						t_DACDAT_pl_i <= t_senden_l2;
						t_DACDAT_pr_i <= t_senden_r2;
						t_DAC_load <= '1';
						WAIT FOR 2*clk_test;

						
						t_DAC_load <= '0';
						t_WS_dly <= '1';
						
						WAIT FOR 75*clk_test;
						
						ASSERT (t_DACDAT_s_o ='0') REPORT "Es wurde nicht der gesammte Vektor in der Zeit uebermittelt, evt ein Problem mit dem Senden, oder der Initialisierung des zusendenden Vektors" SEVERITY error;
						
						t_WS_dly <= '0';
						
						WAIT FOR 75*clk_test;
						
						ASSERT (t_DACDAT_s_o ='0') REPORT "Es wurde nicht der gesammte Vektor in der Zeit uebermittelt, evt ein Problem mit dem Senden, oder der Initialisierung des zusendenden Vektors" SEVERITY error;

						
						
						ASSERT false REPORT "--- ALL TEST PASS ---" SEVERITY failure; 
                        
                END PROCESS STIMULI;
        END test;