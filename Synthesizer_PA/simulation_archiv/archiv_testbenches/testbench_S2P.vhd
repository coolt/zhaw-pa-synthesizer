--Testbench S2P
--copyright by bleispiu
--11.04.13

--version 0
--11.04.2013 17:00 Uhr
LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_1164.STD_LOGIC;
USE ieee.numeric_std.all;

ENTITY	testbench_S2P IS

END 	testbench_S2P;

ARCHITECTURE test OF testbench_S2P IS

        COMPONENT       S2P
                PORT(   
                clk					:IN			std_logic;	--clk_12M
				reset_n				:IN			std_logic;
				BCLK				:IN			std_logic;
				ADCDAT_s_i			:IN			std_logic;
				ADCDAT_pl_o			:OUT		std_logic_vector(15 downto 0);
				ADCDAT_pr_o			:OUT		std_logic_vector(15 downto 0);
				ADCL_shift			:IN 		std_logic;
				ADCR_shift			:IN			std_logic
                    );
                
        END COMPONENT;
        
        					
				TYPE t_senden IS ARRAY (0 to 15) OF std_logic;
                
                SIGNAL t_clk			: std_logic :='0';
                SIGNAL t_reset_n		: std_logic;
				SIGNAL t_BCLK			: std_logic :='0';
				SIGNAL t_ADCDAT_s_i		: std_logic;
                SIGNAL t_ADCDAT_pl_o	: std_logic_vector(15 downto 0); 
				SIGNAL t_ADCDAT_pr_o	: std_logic_vector(15 downto 0);
				SIGNAL t_ADCL_shift		: std_logic;
				SIGNAL t_ADCR_shift		: std_logic;

				CONSTANT BCLK_test		: time := 40ns;
				CONSTANT clk_test		: time := 20ns;
				-- Array zum Senden
				CONSTANT t_senden_r1	: t_senden :=('0','1','1','0','0','1','1','1','1','0','1','1','0','0','1','0');
				CONSTANT t_senden_l1	: t_senden :=('1','1','0','1','0','1','1','0','0','0','0','0','1','1','1','0');
				CONSTANT t_senden_r2	: t_senden :=('1','1','1','0','1','1','1','0','1','0','1','1','0','1','1','0');
				CONSTANT t_senden_l2	: t_senden :=('0','1','0','1','0','0','1','0','0','1','0','0','1','1','0','1');
			
        BEGIN
		
				--Prozess Clock
				Clock: PROCESS (t_clk, t_BCLK)
				BEGIN
					t_clk <= not t_clk AFTER clk_test;
				
					IF t_clk'EVENT AND t_clk ='1' THEN
						t_BCLK <= NOT t_BCLK;
					END IF;
				END PROCESS Clock;
				
				
				--Zuweisung der Eingaenge von Block S2P
                dut1: S2P
                PORT MAP (  clk				=>	t_clk,
							reset_n			=>	t_reset_n,
							BCLK			=>	t_BCLK,
							ADCDAT_s_i		=>	t_ADCDAT_s_i,
							ADCDAT_pl_o		=>	t_ADCDAT_pl_o,
							ADCDAT_pr_o		=>	t_ADCDAT_pr_o,
							ADCL_shift		=>  t_ADCL_shift,				
							ADCR_shift		=>  t_ADCR_shift
								);
                                   
                
				--Testprogramm
				STIMULI: PROCESS
                
				--Start
                BEGIN
										
						t_reset_n <='0';
						
                        WAIT FOR 20*clk_test;
						
                        t_reset_n <='1';
                        
						WAIT FOR 20*clk_test;
						
						t_ADCL_shift <='0';
						t_ADCR_shift <='0';
						t_ADCDAT_s_i <='1';
						
						WAIT FOR 10*clk_test;
						
						
						ASSERT (t_reset_n='1') REPORT "Fehler mit dem Reset-Signal" SEVERITY note;
						ASSERT (t_ADCDAT_s_i ='1') REPORT "t_ADCDAT_s_i ist nicht definiert" SEVERITY failure;

									
						
						
						FOR i IN 0 TO 15 LOOP
							t_ADCR_shift <='1';
							t_ADCDAT_s_i <= t_senden_r1(i);
						
							WAIT FOR 1*BCLK_test;
							ASSERT (t_ADCDAT_s_i = t_senden_r1(i)) REPORT "Die Uebertragung des Codes ist nicht in Ordnung" SEVERITY error;
						
						END LOOP;
						
						
						t_ADCR_shift <='0';
						
						FOR j IN 0 TO 15 LOOP
							t_ADCL_shift <='1';
							t_ADCDAT_s_i <= t_senden_l1(j);
						
							WAIT FOR 1*BCLK_test;
							ASSERT (t_ADCDAT_s_i = t_senden_l1(j)) REPORT "Die Uebertragung des Codes ist nicht in Ordnung" SEVERITY error;
						
						END LOOP;
						
						t_ADCL_shift <= '0';
						
						FOR N IN 0 TO 15 LOOP
							t_ADCR_shift <='1';
							t_ADCDAT_s_i <= t_senden_r2(N);
						
							WAIT FOR 1*BCLK_test;
							ASSERT (t_ADCDAT_s_i = t_senden_r2(N)) REPORT "Die Uebertragung des Codes ist nicht in Ordnung" SEVERITY error;
						
						END LOOP;
						
						
						t_ADCR_shift <='0';
						
						FOR M IN 0 TO 15 LOOP
							t_ADCL_shift <='1';
							t_ADCDAT_s_i <= t_senden_l2(M);
						
							WAIT FOR 1*BCLK_test;
							ASSERT (t_ADCDAT_s_i = t_senden_l2(M)) REPORT "Die Uebertragung des Codes ist nicht in Ordnung" SEVERITY error;
						
						END LOOP;
						
						t_ADCL_shift <='0';
						
						WAIT FOR 50*clk_test;
						
						ASSERT false REPORT "--- ALL TEST PASS ---" SEVERITY failure;
                        
                END PROCESS STIMULI;
       END test;