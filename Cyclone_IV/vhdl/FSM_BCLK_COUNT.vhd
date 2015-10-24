--------------------------------------------------
-- FSM to control the digital loop
-- 
-- components: 
-- 1. clock-divider generates bclk-Clock
-- 2. counter for setting register index
-- 3. FSM to set state
--------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity FSM_BCLK_COUNT is
  port(   clk,reset_n						:	in      std_logic;
		  WS, WS_dly			    		:	out     std_logic;
		  BCLK, DAC_load 	 				:	out     std_logic;
		  ADCL_shift, ADCR_shift			:	out 	std_logic;
		  real_strobe						:	out		std_logic
		);
end FSM_BCLK_COUNT;										



architecture rtl of FSM_BCLK_COUNT is

type state is (hold_R, load_dac, shift_adc_L, hold_L, shift_adc_R);

signal s_WS, next_s_WS				:	std_logic;
signal folge_zustand				:	state;
signal zustand						:	state;
signal reg_idx, next_reg_idx	   	:	natural;
signal s_bclk						:	std_logic;


begin
--------------------------------------------------
-- Component declaration
--------------------------------------------------

clk_half_freq: process (all)
    begin	
        if reset_n = '0'then
                s_bclk <= '0';
        elsif clk'event AND clk = '1' then
                s_bclk <= NOT s_bclk;
        end if;	
    end process;


--------------------------------------------------
-- counter for index: 
-- Counts up register-index by each falling edges from signal bclk
-- Reset register-index if value 383 is reached
--------------------------------------------------

ff_register_index: process (all)
begin 
	if reset_n = '0' then 
		reg_idx <= 0;
	elsif clk'event AND clk='1' then
		reg_idx <= next_reg_idx;
	end if;
end process;


input_count_register_index: process (all)
begin
	if s_bclk = '1' then
		if reg_idx = 383 then
			next_reg_idx <= 0;
		else 
            next_reg_idx <= reg_idx + 1;
        end if;
	else 
		next_reg_idx <= reg_idx;
	end if;
end process;


--------------------------------------------------
-- Generate signal WS
-- Signal WS destinguish between right and left side of audio out
--------------------------------------------------
ff_ws_channel: process (all)
begin
	if reset_n= '0' then 
		s_WS <= '0';
	elsif clk'event AND clk = '1' then
		s_WS <= next_s_WS;
	end if;
end process; 

ws_logik: process (all)
begin
	if reg_idx = 382 AND s_bclk ='1' then
		next_s_WS <= NOT s_WS;
	else 
        next_s_WS <= s_WS;
	end if;
end process;

--------------------------------------------------
-- fsm: 
-- next state changes if a certain count-value is reached
--
--------------------------------------------------
  ff_fsm : process(all)
  begin	
	if reset_n = '0' then
		zustand <=  hold_R;
	 elsif clk'event AND clk = '1' then
		 zustand <=folge_zustand;
		end if;	
  end process;		
  

  fsm_logic: process (all)
  begin
    folge_zustand <= zustand; 
    
    case zustand is
  
	when hold_R =>
		if reg_idx = 382 AND s_bclk = '1' then
			folge_zustand <= load_dac;
		else 
            folge_zustand <= zustand;
		end if;
	
	when load_dac =>
		if s_bclk = '1' then
			folge_zustand <= shift_adc_L;
		else 
			folge_zustand <= load_dac;
		end if;
			
	when shift_adc_L =>
		if reg_idx = 15 AND s_bclk = '1' then
			folge_zustand <= hold_L;
		else 
            folge_zustand <= shift_adc_L;
		end if;
	
	when hold_L =>
		if reg_idx = 383 AND s_bclk = '1' AND s_WS = '1' then
			folge_zustand <= shift_adc_R;
		else 
            folge_zustand <= hold_L;
		end if ;
	
	when shift_adc_R =>
		if reg_idx = 15 AND s_bclk = '1' then
			folge_zustand <= hold_R;
		else 
            folge_zustand <= shift_adc_R;
		end if;
	when others =>
		folge_zustand <= hold_R;
	end case; 
	end process;
	
	fsm_output: process (all)
	begin	
        DAC_load 		<= '0';
        ADCL_shift 		<= '0';
        ADCR_shift		<= '0';
        real_strobe		<= '0';    	
        WS_dly			<= '1';        
	case zustand is
        when shift_adc_L =>
            ADCL_shift 	<= '1';
            WS_dly	   	<= '0';
        when hold_L =>
            WS_dly 		<='0';
        when shift_adc_R =>
            ADCR_shift 	<='1';
        when load_dac =>
            DAC_load 	<='1';
            real_strobe <='1';				
        when others =>
            WS_dly 		<='1';
    end case;	
end process;
	
--------------------------------------------------
-- Assign signals
--------------------------------------------------
BCLK 	<= s_bclk;
WS 		<= s_WS;

end rtl;
