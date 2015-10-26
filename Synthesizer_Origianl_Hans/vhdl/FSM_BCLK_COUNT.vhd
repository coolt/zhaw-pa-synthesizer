--FSM_BCLK_COUNT
--copyright by herscmic
--version 1.0
--04.04.2013

--Funktion: Dieser Baustein koordiniert denn Digital Loop.
--Er enthält einen Automaten, einen Zähler und einen Clock Halbierer(BCLK-Erzeuger).
--Es laufen alle Flipflops mit dem 12 MHz Clock!



LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;



-- Entity Declaration 
-------------------------------------------
ENTITY FSM_BCLK_COUNT IS
  PORT(   clk,reset_n						:	IN      std_logic;
		  init_n     						:	IN      std_logic;
		  WS, WS_dly			    		:	OUT     std_logic;
		  BCLK, DAC_load 	 				:	OUT     std_logic;
		  ADCL_shift, ADCR_shift			:	OUT 	std_logic;
		  real_strobe						:	OUT		std_logic
		);
END FSM_BCLK_COUNT;										


-- Architecture Declaration
-------------------------------------------
ARCHITECTURE rtl OF FSM_BCLK_COUNT IS
-- Signals & Constants Declaration
-------------------------------------------

TYPE state IS (hold_R, load_dac, shift_adc_L, hold_L, shift_adc_R);

SIGNAL s_WS, next_s_WS				:	std_logic;
SIGNAL folge_zustand				:	state;
SIGNAL zustand						:	state;
SIGNAL reg_idx, next_reg_idx	   	:	natural;
SIGNAL s_bclk						:	std_logic;

-- Begin Architecture
-------------------------------------------
BEGIN

--Erzeugung eines Clockhalbierers
--das Signal s_bclk soll mit der Hälfte der 12 MHz Frequenz laufen
halffreq: PROCESS (clk, reset_n, init_n)
BEGIN
	
	IF reset_n = '0'THEN
			s_bclk <= '0';
	ELSIF clk'EVENT AND clk = '1' THEN
			s_bclk <= NOT s_bclk;
	END IF;
	
END PROCESS;



--Zähler-----------------------------------------------------------------
--der Zähler soll von 0 bis 383 Zählen( mit jedem fallenden Signal s_bclk)
--bei 383 beginnt der Zähler wieder bei 0

--FLIP FLOP PROCESS Zähler
flipflop: PROCESS (clk, reset_n)
BEGIN 
	IF reset_n='0' THEN 
		reg_idx <= 0;
	ELSIF clk'EVENT AND clk='1' THEN
		reg_idx<=next_reg_idx;
	END IF;
END PROCESS;

--Zähler Einangslogik

log: PROCESS (reg_idx, s_bclk, init_n)

BEGIN
	IF init_n= '0' THEN
		next_reg_idx <= 382;
	ELSIF s_bclk = '1' THEN
		IF reg_idx =383 THEN
			next_reg_idx <= 0;
		ELSE next_reg_idx <= reg_idx+1;
		END IF;
	ELSE 
		next_reg_idx <= reg_idx;
	END IF;
END PROCESS;

--Erzeugung des WS- Signals:
-- Das s_WS Signal ist entscheidend, ob man sich auf dem linken oder
-- rechten Lautsprecherkanal befindet. 

make_s_WS: PROCESS (next_s_WS, clk, reset_n)
BEGIN
	IF reset_n='0' THEN 
		s_WS <= '0';
	ELSIF clk'EVENT AND clk='1' THEN
		s_WS<= next_s_WS;
	END IF;
END PROCESS; 

ws_logik: PROCESS (init_n, s_bclk, s_WS, reg_idx)
BEGIN
	IF reg_idx = 382 AND s_bclk ='1' AND init_n= '1' THEN
			next_s_WS <= NOT s_WS;
	ELSIF init_n= '0' THEN
			next_s_WS <= '1';
	ELSE next_s_WS <= s_WS;
	END IF;
END PROCESS;

--state machine
-- Diese statemachine koordiniert den ganzen Vorgang. Sie wechselt ihre Zustände
-- in erster Linie an Hand des Zählerstandes. 
--Zustände: hold_R, load_dac, shift_adc_L, hold_L, shift_adc_R
 
  flip_flops : PROCESS(clk, reset_n, folge_zustand)
  BEGIN	
	IF reset_n = '0' THEN
		zustand <=  hold_R;
	 ELSIF clk'EVENT AND clk = '1' THEN
		 zustand <=folge_zustand;
		END IF;
	
  END PROCESS;		
  
  
  --------------------------------------------------
  --Input logic state_machine
  logic: PROCESS ( zustand, reg_idx, s_WS, s_bclk, init_n)
  BEGIN
 folge_zustand <= zustand; 
 
 
  CASE zustand IS
  
  --hold_R Zustand
	WHEN hold_R =>
		IF reg_idx = 382 AND s_bclk = '1' THEN
			folge_zustand <= load_dac;
		ELSE folge_zustand <= zustand;
		END IF;
	
	--load_dac Zustand
	WHEN load_dac =>
		IF init_n = '0' THEN
			folge_zustand <= hold_R;
		ELSIF s_bclk = '1' THEN
			folge_zustand <= shift_adc_L;
		ELSE 
			folge_zustand <= load_dac;
		END IF;
			
	-- shift_adc_L Zustand
	WHEN shift_adc_L =>
		IF init_n = '0' THEN
			folge_zustand <= hold_R;
		ELSIF reg_idx = 15 AND s_bclk = '1' THEN
			folge_zustand <= hold_L;
		ELSE folge_zustand <= shift_adc_L;
		END IF;
	
	--hold_L Zustand
	WHEN hold_L =>
		IF init_n = '0' THEN
			folge_zustand <= hold_R;
		ELSIF reg_idx = 383 AND s_bclk = '1' AND s_WS='1' THEN
			folge_zustand <= shift_adc_R;
		ELSE folge_zustand <= hold_L;
		END IF ;
	
	--shift_adc_R Zustand
	WHEN shift_adc_R =>
		IF init_n = '0' THEN
			folge_zustand <= hold_R;
		ELSIF reg_idx = 15 AND s_bclk = '1' THEN
			folge_zustand <= hold_R;
		ELSE folge_zustand <= shift_adc_R;
		END IF;
	WHEN OTHERS =>
		folge_zustand <= hold_R;
	END CASE; 
	END PROCESS logic;
	
	-- Ausgangslogik state_machine
	ausg: PROCESS (zustand)
	BEGIN
	--Alle Signale auf 0 setzen
	DAC_load 		<= '0';
	ADCL_shift 		<= '0';
	ADCR_shift		<= '0';
	real_strobe		<= '0';    	
	WS_dly			<= '1';
	
	CASE zustand IS
	WHEN shift_adc_L =>
		ADCL_shift 	<= '1';
		WS_dly	   	<= '0';
	WHEN hold_L =>
		WS_dly 		<='0';
	WHEN shift_adc_R =>
		ADCR_shift 	<='1';
	WHEN load_dac =>
		DAC_load 	<='1';
		real_strobe <='1';				
	WHEN OTHERS =>
		WS_dly 		<='1';
	END CASE;
	
	
END PROCESS;
	
-- ständige Verbindungen
BCLK 	<= s_bclk;
WS 		<= s_WS;

	
  
  
 -- End Architecture 
------------------------------------------- 
END rtl;
