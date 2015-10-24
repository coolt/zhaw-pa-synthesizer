--FSM_BCLK_COUNT
--copyright by herscmic
--version 1.0
--04.04.2013

--Funktion: Dieser Baustein koordiniert denn Digital Loop.
--Er enthält einen Automaten, einen Zähler und einen Clock Halbierer(BCLK-Erzeuger).
--Es laufen alle Flipflops mit dem 12 MHz Clock!



library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



-- entity Declaration 
-------------------------------------------
entity FSM_BCLK_COUNT is
  port(   clk,reset_n						:	in      std_logic;
		  init_n     						:	in      std_logic;
		  WS, WS_dly			    		:	out     std_logic;
		  BCLK, DAC_load 	 				:	out     std_logic;
		  ADCL_shift, ADCR_shift			:	out 	std_logic;
		  real_strobe						:	out		std_logic
		);
end FSM_BCLK_COUNT;										


-- architecture Declaration
-------------------------------------------
architecture rtl of FSM_BCLK_COUNT is
-- Signals & Constants Declaration
-------------------------------------------

type state is (hold_R, load_dac, shift_adc_L, hold_L, shift_adc_R);

signal s_WS, next_s_WS				:	std_logic;
signal folge_zustand				:	state;
signal zustand						:	state;
signal reg_idx, next_reg_idx	   	:	natural;
signal s_bclk						:	std_logic;

-- begin architecture
-------------------------------------------
begin

--Erzeugung eines Clockhalbierers
--das signal s_bclk soll mit der Hälfte der 12 MHz Frequenz laufen
halffreq: process (clk, reset_n, init_n)
begin
	
	if reset_n = '0'then
			s_bclk <= '0';
	elsif clk'event AND clk = '1' then
			s_bclk <= NOT s_bclk;
	end if;
	
end process;



--Zähler-----------------------------------------------------------------
--der Zähler soll von 0 bis 383 Zählen( mit jedem fallenden signal s_bclk)
--bei 383 beginnt der Zähler wieder bei 0

--FLIP FLOP process Zähler
flipflop: process (clk, reset_n)
begin 
	if reset_n='0' then 
		reg_idx <= 0;
	elsif clk'event AND clk='1' then
		reg_idx<=next_reg_idx;
	end if;
end process;

--Zähler Einangslogik

log: process (reg_idx, s_bclk, init_n)

begin
	if init_n= '0' then
		next_reg_idx <= 382;
	elsif s_bclk = '1' then
		if reg_idx =383 then
			next_reg_idx <= 0;
		else next_reg_idx <= reg_idx+1;
		end if;
	else 
		next_reg_idx <= reg_idx;
	end if;
end process;

--Erzeugung des WS- Signals:
-- Das s_WS signal ist entscheidend, ob man sich auf dem linken oder
-- rechten Lautsprecherkanal befindet. 

make_s_WS: process (next_s_WS, clk, reset_n)
begin
	if reset_n='0' then 
		s_WS <= '0';
	elsif clk'event AND clk='1' then
		s_WS<= next_s_WS;
	end if;
end process; 

ws_logik: process (init_n, s_bclk, s_WS, reg_idx)
begin
	if reg_idx = 382 AND s_bclk ='1' AND init_n= '1' then
			next_s_WS <= NOT s_WS;
	elsif init_n= '0' then
			next_s_WS <= '1';
	else next_s_WS <= s_WS;
	end if;
end process;

--state machine
-- Diese statemachine koordiniert den ganzen Vorgang. Sie wechselt ihre Zustände
-- in erster Linie an Hand des Zählerstandes. 
--Zustände: hold_R, load_dac, shift_adc_L, hold_L, shift_adc_R
 
  flip_flops : process(clk, reset_n, folge_zustand)
  begin	
	if reset_n = '0' then
		zustand <=  hold_R;
	 elsif clk'event AND clk = '1' then
		 zustand <=folge_zustand;
		end if;
	
  end process;		
  
  
  --------------------------------------------------
  --Input logic state_machine
  logic: process ( zustand, reg_idx, s_WS, s_bclk, init_n)
  begin
 folge_zustand <= zustand; 
 
 
  case zustand is
  
  --hold_R Zustand
	when hold_R =>
		if reg_idx = 382 AND s_bclk = '1' then
			folge_zustand <= load_dac;
		else folge_zustand <= zustand;
		end if;
	
	--load_dac Zustand
	when load_dac =>
		if init_n = '0' then
			folge_zustand <= hold_R;
		elsif s_bclk = '1' then
			folge_zustand <= shift_adc_L;
		else 
			folge_zustand <= load_dac;
		end if;
			
	-- shift_adc_L Zustand
	when shift_adc_L =>
		if init_n = '0' then
			folge_zustand <= hold_R;
		elsif reg_idx = 15 AND s_bclk = '1' then
			folge_zustand <= hold_L;
		else folge_zustand <= shift_adc_L;
		end if;
	
	--hold_L Zustand
	when hold_L =>
		if init_n = '0' then
			folge_zustand <= hold_R;
		elsif reg_idx = 383 AND s_bclk = '1' AND s_WS='1' then
			folge_zustand <= shift_adc_R;
		else folge_zustand <= hold_L;
		end if ;
	
	--shift_adc_R Zustand
	when shift_adc_R =>
		if init_n = '0' then
			folge_zustand <= hold_R;
		elsif reg_idx = 15 AND s_bclk = '1' then
			folge_zustand <= hold_R;
		else folge_zustand <= shift_adc_R;
		end if;
	when others =>
		folge_zustand <= hold_R;
	end case; 
	end process logic;
	
	-- Ausgangslogik state_machine
	ausg: process (zustand)
	begin
	--Alle Signale auf 0 setzen
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
	
-- ständige Verbindungen
BCLK 	<= s_bclk;
WS 		<= s_WS;

	
  
  
 -- end architecture 
------------------------------------------- 
end rtl;
