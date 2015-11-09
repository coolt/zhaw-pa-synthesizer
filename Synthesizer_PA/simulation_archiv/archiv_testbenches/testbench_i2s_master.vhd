--Testbench i2s_master
--copyright by bleispiu

--11.04.13

--version 0
--11.04.2013 14:00 Uhr 
LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY	testbench_i2s_master IS 

END 	testbench_i2s_master;

ARCHITECTURE test OF testbench_i2s_master IS 

        COMPONENT       i2s_master 
                PORT(   
                        clk_12M			:IN			std_logic;
						i2s_reset_n		:IN			std_logic;
						INIT_N_i		:IN			std_logic;	
						ADCDAT_s		:IN			std_logic;
						DACDAT_pl		:IN			std_logic_vector(15 downto 0);
						DACDAT_pr		:IN			std_logic_vector(15 downto 0);
						--STROBE			:OUT		std_logic;	
						BCLK			:OUT		std_logic;
						DACDAT_s		:OUT		std_logic;
						ADCDAT_pl		:OUT		std_logic_vector(15 downto 0);
						ADCDAT_pr		:OUT		std_logic_vector(15 downto 0);
						WS				:OUT		std_logic
                    );
                
        END COMPONENT;
        
        	
                
                SIGNAL t_clk_12M			: std_logic :='0';
                SIGNAL t_i2s_reset_n		: std_logic;
				SIGNAL t_INIT_N_i			: std_logic;
				SIGNAL t_ADCDAT_s	 		: std_logic;
				SIGNAL t_DACDAT_pl			: std_logic_vector(15 downto 0);
				SIGNAL t_BCLK				: std_logic;
				SIGNAL t_DACDAT_pr			: std_logic_vector(15 downto 0);
                --SIGNAL t_STROBE				: std_logic; 
				SIGNAL t_DACDAT_s			: std_logic;
				SIGNAL t_datalinks			: std_logic_vector(15 downto 0)  ;
				SIGNAL t_datarechts			: std_logic_vector(15 downto 0)  ;
				SIGNAL t_WS					: std_logic;
				CONSTANT clk_test			: time:=20ns;
				
			
        BEGIN
        
                t_clk_12M <= not t_clk_12M AFTER clk_test;
				
                dut1: i2s_master		
                PORT MAP (  clk_12M			=>	t_clk_12M,
							i2s_reset_n		=>	t_i2s_reset_n,
							INIT_N_i		=>	t_INIT_N_i,
							ADCDAT_s		=>	t_ADCDAT_s,
							DACDAT_pl		=>	t_DACDAT_pl,
							DACDAT_pr		=>	t_DACDAT_pr,
							--STROBE			=>	t_STROBE,
							BCLK			=>	t_BCLK,
							DACDAT_s		=>	t_DACDAT_s,
							ADCDAT_pl		=>	t_DACDAT_pl,
							ADCDAT_pr		=>	t_DACDAT_pr,
							WS				=>	t_WS	
							);
							
                                   
                STIMULI: PROCESS
                
                BEGIN
						WAIT FOR 2*clk_test;
						
						t_i2s_reset_n <='0';
						t_INIT_N_i <='0';
                        WAIT FOR 2*clk_test;
						
                        t_i2s_reset_n <='1';
                        WAIT FOR 2*clk_test;
                        
                        
                        t_INIT_N_i <='1';
                       
						WAIT until falling_edge(t_WS);
						wait until falling_edge(t_BCLK);
						t_datarechts <= "1100010011101001";
						for i in 15 downto 0 loop
							t_ADCDAT_s <= t_datarechts(i);
							wait until falling_edge(t_BCLK);
						end loop;
						
						WAIT until rising_edge(t_WS);
						wait until falling_edge(t_BCLK);
						t_datalinks <= "1110010100110100";
						for i in 15 downto 0 loop
							t_ADCDAT_s <= t_datalinks(i);
							wait until falling_edge(t_BCLK);
						end loop;
						
						WAIT until rising_edge(t_WS);
						WAIT until falling_edge (t_WS);
					
						
						WAIT;
                        
                END PROCESS STIMULI;
       END test;