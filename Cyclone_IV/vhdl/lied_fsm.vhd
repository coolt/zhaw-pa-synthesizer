--lied_fsm
--copyright by bruelcor
--version 1.0
--26.04.2013




library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.music_list.all;

-- entity Declaration 
------------------------------------------------
entity lied_fsm is
  port( clk, reset_n	:in			std_logic;
		start			:in			std_logic;
		phi_incr_lied	:out		natural;
		stueck			:in			std_logic_vector(2 downto 0)
		);
end lied_fsm;										


-- architecture Declaration
------------------------------------------------
architecture rtl of lied_fsm is
-- Signals & Constants Declaration
------------------------------------------------
type state is (idle, load_counter, tone_send);

signal	laufvar, next_laufvar		:	unsigned(9 downto 0); 
signal	load_count				:	std_logic;			-- Abwaertszaehler neu laden
signal	tone_end					:	std_logic;			-- Abwaertszaehler bei null
signal	tone_length					:	integer; 			-- Wert, mit welchem der Abwaertszaehler geladen werden soll
signal	folge_zustand				:	state;
signal	zustand						:	state;
signal	takt_ist					:	unsigned(15 downto 0);
signal	takt_folge					:	unsigned(15 downto 0);
signal	count						:	unsigned(19 downto 0); --767500
signal	count_folge					:	unsigned(19 downto 0);
signal	takt_32						:	std_logic;



-- begin architecture
------------------------------------------------
begin



--Zaehler Laufvariable: der Zaehler zählt bei jedem Durchgang des Automaten(load_counter) um 
-- +1 hinauf. Der Wert des Zaehlers entspricht der Laufvariable, mit welcher auf die Lookup Tabelle
-- music_list zugegriffen wird.
------------------------------------------------

--FLIP FLOP process Laufvariable
------------------------------------------------
flipflop: process (clk, reset_n, next_laufvar)
begin 

	if 		reset_n='0'then  
			laufvar <= (others =>'0');
	elsif 	clk'event AND clk='1' then
			laufvar <= next_laufvar;
	end if;
	
end process;

--Zaehler Einangslogik
------------------------------------------------

log: process (laufvar, zustand)

begin
		if zustand = idle then				
		next_laufvar <= (others => '0');
		elsif zustand = load_counter then
			next_laufvar <= laufvar + 1;
		else 
			next_laufvar <= laufvar;
	end if;
end process;

--end Zaehler Laufvariable



--state machine
--Diese state machine koordiniert den Liedablauf. 
--Zustaende: idle, load_counter, tone_send
------------------------------------------------
 
flip_flops : process(clk, reset_n, folge_zustand)
begin
	if		reset_n = '0' 	then
			zustand <= idle;
	elsif 	clk'event AND clk = '1' then
			zustand <= folge_zustand;
	end if;
	
end process;		
  
  
--Input logic state_machine
------------------------------------------------
logic: process ( zustand, tone_length, tone_end, start)
begin
folge_zustand <= zustand; 
 
case zustand is
	--idle Zustand
	when idle =>
		if		start = '0' then
				folge_zustand <= load_counter;
		else 	folge_zustand <= idle;
		end if;
	
	--load_counter Zustand
	when 		load_counter =>
				folge_zustand <= tone_send;
			
	-- tone_send Zustand
	when 		tone_send =>
		if 		tone_length = 0 then
				folge_zustand <= idle;
		elsif 	tone_end = '1' then
				folge_zustand <= load_counter;
		else 	folge_zustand <= tone_send;
		end if;

	when others =>	folge_zustand <= idle;
end case; 
	
end process logic;
	
-- Ausgangslogik state_machine
------------------------------------------------
ausg: process (zustand, laufvar, stueck)

begin
	phi_incr_lied<= 0;
	load_count <= '0';
	case zustand is
		when load_counter =>
		load_count <= '1';
		
		when tone_send =>
			case stueck is
			when "100" => phi_incr_lied <= to_integer(signed(Nachtmusik_hoehe (to_integer(laufvar))));
			when "010" => phi_incr_lied <= to_integer(signed(overture_hoehe (to_integer(laufvar))));
			--when "001" => phi_incr_lied <= to_integer(signed(tom_dooley_hoehe (to_integer(laufvar))));--Möglichkeit tom_dooley
			when "001" => phi_incr_lied <= to_integer(signed(fuer_elise_hoehe (to_integer(laufvar))));
			when others => phi_incr_lied <= 0;
			end case;
		when others =>	load_count <= '0';
	end case;
	
end process;

--end state_machine


-- Counter 01: Dieser Zaehler gibt den Takt an, mit welcher die Musik gespielt wird. 
-- Er gibt dies in einer kleinen Einheit mit 32-tel Noten im Tempo 100 an.
-- Er zahelt bis 767500, setzt dort das signal takt_32 zwei Takte lang auf high, während 
-- wieder bei Null beginnt wird. 


-- process FOR COUNTER 01 
------------------------------------------------
counter_01: process (clk, reset_n)
begin
if 		(reset_n ='0') then
		count <= (others => '0');
elsif 	(clk'event AND clk ='1') then
		count <= count_folge;
end if;

end process;



-- process for LOGIC 01 (Eingangs- Ausgangslogik Counter 01)
------------------------------------------------
logic_01	:	process (count, zustand)
begin
-- Eingangslogik
if (zustand /= idle) then

	if		(count >= 767500) then
			count_folge <= (others => '0');
	
	else	count_folge <= count + 1;
	
	end if;
else	count_folge <= (others => '0'	);
end if;

-- Ausgangslogik
if 		(count = 0 OR count =1) then
		takt_32 <= '1';
else	takt_32 <= '0';
end if;

end process;

-- end COUNTER 01

-- COUNTER 02: Dieser Zaehler wird mit dem jeweiligen Wert aus der music_list
-- geladen und zaehlt dann bis null hinunter.


-- process FOR COUNTER 02 
------------------------------------------------
counter_02	:	process (clk, reset_n, takt_folge)
begin
if 		(reset_n = '0') then
		takt_ist <= (others => '0');
elsif 	(clk'event AND clk = '1') then
		takt_ist <= takt_folge;
end if;

end process;

-- process for LOGIC 02 (Ein- und Ausgangslogik)
------------------------------------------------
logic_02	:	process (tone_length, takt_32, takt_ist, load_count, tone_end)
begin
--Eingangslogik
if 		(load_count = '1') then
		takt_folge <= to_unsigned(tone_length,16 );

elsif 	(takt_32 = '1') then
		takt_folge <= takt_ist - 1;
else	takt_folge <= takt_ist;
end if;

--Ausgangslogik
if 		(takt_ist = 0) then
		tone_end <= '1';
else	tone_end <= '0';
end if;

end process;

-- end COUNTER 02



tone_length_log: process (stueck, laufvar) 
begin
	case stueck is
	when "100" => tone_length <= Nachtmusik_laenge(to_integer(laufvar));
	when "010" => tone_length <= overture_laenge(to_integer(laufvar));
	--when "001" => tone_length <= tom_dooley_laenge(to_integer(laufvar));
	when "001" => tone_length <= fuer_elise_laenge(to_integer(laufvar));
	when others => tone_length <=0;
	end case;
	
end process;
	





	
  
  
 -- end architecture 
------------------------------------------------ 
end rtl;
