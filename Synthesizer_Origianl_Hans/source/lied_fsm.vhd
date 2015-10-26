--lied_fsm
--copyright by bruelcor
--version 1.0
--26.04.2013




LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

LIBRARY work;
USE work.music_list.all;

-- Entity Declaration 
------------------------------------------------
ENTITY lied_fsm IS
  PORT( clk, reset_n	:IN			std_logic;
		start			:IN			std_logic;
		phi_incr_lied	:OUT		natural;
		stueck			:IN			std_logic_vector(2 downto 0)
		);
END lied_fsm;										


-- Architecture Declaration
------------------------------------------------
ARCHITECTURE rtl OF lied_fsm IS
-- Signals & Constants Declaration
------------------------------------------------
TYPE state IS (idle, load_counter, tone_send);

SIGNAL	laufvar, next_laufvar		:	unsigned(9 downto 0); 
SIGNAL	load_count				:	std_logic;			-- Abwaertszaehler neu laden
SIGNAL	tone_end					:	std_logic;			-- Abwaertszaehler bei null
SIGNAL	tone_length					:	integer; 			-- Wert, mit welchem der Abwaertszaehler geladen werden soll
SIGNAL	folge_zustand				:	state;
SIGNAL	zustand						:	state;
SIGNAL	takt_ist					:	unsigned(15 downto 0);
SIGNAL	takt_folge					:	unsigned(15 downto 0);
SIGNAL	count						:	unsigned(19 downto 0); --767500
SIGNAL	count_folge					:	unsigned(19 downto 0);
SIGNAL	takt_32						:	std_logic;



-- Begin Architecture
------------------------------------------------
BEGIN



--Zaehler Laufvariable: der Zaehler zählt bei jedem Durchgang des Automaten(load_counter) um 
-- +1 hinauf. Der Wert des Zaehlers entspricht der Laufvariable, mit welcher auf die Lookup Tabelle
-- music_list zugegriffen wird.
------------------------------------------------

--FLIP FLOP PROCESS Laufvariable
------------------------------------------------
flipflop: PROCESS (clk, reset_n, next_laufvar)
BEGIN 

	IF 		reset_n='0'THEN  
			laufvar <= (OTHERS =>'0');
	ELSIF 	clk'EVENT AND clk='1' THEN
			laufvar <= next_laufvar;
	END IF;
	
END PROCESS;

--Zaehler Einangslogik
------------------------------------------------

log: PROCESS (laufvar, zustand)

BEGIN
		IF zustand = idle THEN				
		next_laufvar <= (OTHERS => '0');
		ELSIF zustand = load_counter THEN
			next_laufvar <= laufvar + 1;
		ELSE 
			next_laufvar <= laufvar;
	END IF;
END PROCESS;

--END Zaehler Laufvariable



--state machine
--Diese state machine koordiniert den Liedablauf. 
--Zustaende: idle, load_counter, tone_send
------------------------------------------------
 
flip_flops : PROCESS(clk, reset_n, folge_zustand)
BEGIN
	IF		reset_n = '0' 	THEN
			zustand <= idle;
	ELSIF 	clk'EVENT AND clk = '1' THEN
			zustand <= folge_zustand;
	END IF;
	
END PROCESS;		
  
  
--Input logic state_machine
------------------------------------------------
logic: PROCESS ( zustand, tone_length, tone_end, start)
BEGIN
folge_zustand <= zustand; 
 
CASE zustand IS
	--idle Zustand
	WHEN idle =>
		IF		start = '0' THEN
				folge_zustand <= load_counter;
		ELSE 	folge_zustand <= idle;
		END IF;
	
	--load_counter Zustand
	WHEN 		load_counter =>
				folge_zustand <= tone_send;
			
	-- tone_send Zustand
	WHEN 		tone_send =>
		IF 		tone_length = 0 THEN
				folge_zustand <= idle;
		ELSIF 	tone_end = '1' THEN
				folge_zustand <= load_counter;
		ELSE 	folge_zustand <= tone_send;
		END IF;

	WHEN OTHERS =>	folge_zustand <= idle;
END CASE; 
	
END PROCESS logic;
	
-- Ausgangslogik state_machine
------------------------------------------------
ausg: PROCESS (zustand, laufvar, stueck)

BEGIN
	phi_incr_lied<= 0;
	load_count <= '0';
	CASE zustand IS
		WHEN load_counter =>
		load_count <= '1';
		
		WHEN tone_send =>
			CASE stueck IS
			WHEN "100" => phi_incr_lied <= to_integer(signed(Nachtmusik_hoehe (to_integer(laufvar))));
			WHEN "010" => phi_incr_lied <= to_integer(signed(overture_hoehe (to_integer(laufvar))));
			--WHEN "001" => phi_incr_lied <= to_integer(signed(tom_dooley_hoehe (to_integer(laufvar))));--Möglichkeit tom_dooley
			WHEN "001" => phi_incr_lied <= to_integer(signed(fuer_elise_hoehe (to_integer(laufvar))));
			WHEN OTHERS => phi_incr_lied <= 0;
			END CASE;
		WHEN OTHERS =>	load_count <= '0';
	END CASE;
	
END PROCESS;

--END state_machine


-- Counter 01: Dieser Zaehler gibt den Takt an, mit welcher die Musik gespielt wird. 
-- Er gibt dies in einer kleinen Einheit mit 32-tel Noten im Tempo 100 an.
-- Er zahelt bis 767500, setzt dort das Signal takt_32 zwei Takte lang auf high, während 
-- wieder bei Null beginnt wird. 


-- PROCESS FOR COUNTER 01 
------------------------------------------------
counter_01: PROCESS (clk, reset_n)
BEGIN
IF 		(reset_n ='0') THEN
		count <= (OTHERS => '0');
ELSIF 	(clk'EVENT AND clk ='1') THEN
		count <= count_folge;
END IF;

END PROCESS;



-- PROCESS for LOGIC 01 (Eingangs- Ausgangslogik Counter 01)
------------------------------------------------
logic_01	:	PROCESS (count, zustand)
BEGIN
-- Eingangslogik
IF (zustand /= idle) THEN

	IF		(count >= 767500) THEN
			count_folge <= (OTHERS => '0');
	
	ELSE	count_folge <= count + 1;
	
	END IF;
ELSE	count_folge <= (OTHERS => '0'	);
END IF;

-- Ausgangslogik
IF 		(count = 0 OR count =1) THEN
		takt_32 <= '1';
ELSE	takt_32 <= '0';
END IF;

END PROCESS;

-- End COUNTER 01

-- COUNTER 02: Dieser Zaehler wird mit dem jeweiligen Wert aus der music_list
-- geladen und zaehlt dann bis null hinunter.


-- PROCESS FOR COUNTER 02 
------------------------------------------------
counter_02	:	PROCESS (clk, reset_n, takt_folge)
BEGIN
IF 		(reset_n = '0') THEN
		takt_ist <= (OTHERS => '0');
ELSIF 	(clk'EVENT AND clk = '1') THEN
		takt_ist <= takt_folge;
END IF;

END PROCESS;

-- PROCESS for LOGIC 02 (Ein- und Ausgangslogik)
------------------------------------------------
logic_02	:	PROCESS (tone_length, takt_32, takt_ist, load_count, tone_end)
BEGIN
--Eingangslogik
IF 		(load_count = '1') THEN
		takt_folge <= to_unsigned(tone_length,16 );

ELSIF 	(takt_32 = '1') THEN
		takt_folge <= takt_ist - 1;
ELSE	takt_folge <= takt_ist;
END IF;

--Ausgangslogik
IF 		(takt_ist = 0) THEN
		tone_end <= '1';
ELSE	tone_end <= '0';
END IF;

END PROCESS;

-- END COUNTER 02



tone_length_log: PROCESS (stueck, laufvar) 
BEGIN
	CASE stueck IS
	WHEN "100" => tone_length <= Nachtmusik_laenge(to_integer(laufvar));
	WHEN "010" => tone_length <= overture_laenge(to_integer(laufvar));
	--WHEN "001" => tone_length <= tom_dooley_laenge(to_integer(laufvar));
	WHEN "001" => tone_length <= fuer_elise_laenge(to_integer(laufvar));
	WHEN OTHERS => tone_length <=0;
	END CASE;
	
END PROCESS;
	





	
  
  
 -- End Architecture 
------------------------------------------------ 
END rtl;
