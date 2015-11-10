-- Testbench SSD
-- designed by bleispiu
-- version 0.1
-- 22.05.2013

-- Funktion: DDS-Block mit assert testen

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

--Entity Declaration
---------------------------------------------
ENTITY testbench_dds IS

END testbench_dds;

-- Architecture Declaration
---------------------------------------------
ARCHITECTURE test OF testbench_dds IS

--Components Declaration
---------------------------------------------
COMPONENT dds
	PORT(	clk_12M			: IN	std_logic;
			reset_n			: IN	std_logic;
			strobe_i		: IN	std_logic;					
			tone_on_i		: IN	std_logic;					
			phi_incr_i		: IN	natural range 0 to 65000;	-- schrittweite fuer den Zaehler
			dacdat_g_o		: OUT	std_logic_vector (15 downto 0);
			bclk			: IN	std_logic
		);
END COMPONENT;

--Signal & Constants Declaration
---------------------------------------------

	SIGNAL		t_clk_12M		: std_logic :='0';
	SIGNAL		t_reset_n		: std_logic;
	SIGNAL		t_strobe_i		: std_logic;					
	SIGNAL		t_tone_on_i		: std_logic;					
	SIGNAL		t_phi_incr_i	: natural range 0 to 65000;
	SIGNAL		t_bclk			: std_logic;					-- schrittweite fuer den Zaehler
	SIGNAL		t_dacdat_g_o	: std_logic_vector (15 downto 0);
	CONSTANT	clk_test		: time	:= 20 ns;
	
			
	
BEGIN

--Clock
---------------------------------------------
	t_clk_12M <= NOT t_clk_12M AFTER clk_test;

--Port Map dds
---------------------------------------------
	dut:	dds
	PORT MAP	(	clk_12M		=>	t_clk_12M,
					reset_n		=>	t_reset_n,
					strobe_i	=>	t_strobe_i,
					tone_on_i	=>	t_tone_on_i,
					phi_incr_i	=>	t_phi_incr_i,
					bclk		=>	t_bclk,
					dacdat_g_o	=>	t_dacdat_g_o
				);

---------------------------------------------				
	STIMULI:	PROCESS
	
	BEGIN
		WAIT FOR 2*clk_test;
			t_reset_n <='0';
		WAIT FOR 10*clk_test;
			t_reset_n <='1';	--reset_n High
		WAIT FOR 4*clk_test;
			
			
			t_phi_incr_i <=2;	--Schrittweite: =2
			
		WAIT FOR 20*clk_test;
			t_tone_on_i <= '1';
		WAIT FOR 2*clk_test;
		
		WAIT FOR 10*clk_test;
			t_bclk <= '1';
		WAIT FOR 2*clk_test;
			t_strobe_i <='1';
		WAIT FOR 20*clk_test;
			t_bclk <= '0';
		WAIT FOR 1510*clk_test;
		
		ASSERT (t_dacdat_g_o = "0000000001100100") REPORT "Zaehler zaehlt nicht hoch, evtuell etwas mit der Clock nicht korrekt." SEVERITY error; --Code (binaer '0064?)
		WAIT FOR 10*clk_test;
		ASSERT (t_tone_i_on = '1') REPORT "Ton kann nicht geladen werden, da tone_on_i nicht High ist.!!!" SEVERITY failure;
		
		WAIT FOR 8500*clk_test;
		
		--zweiter Durchgang
			t_phi_incr_i <=10;	--Schrittweite: =10
		WAIT FOR 10*clk_test;
		t_tone_on_i <= '0';
		t_strobe_i <= '0';
		
		ASSERT (t_phi_incr_i =10) REPORT "Die Schrittweite ist /=10, vielleicht falsch zugewiesen!!" SEVERITY note;
		
		
		WAIT FOR 5*clk_test;
			t_tone_on_i <= '1';
		WAIT FOR 5*clk_test;
			t_bclk <= '1';
		WAIT FOR 5*clk_test;
			t_strobe_i <='1';
		
		WAIT FOR 1000*clk_test;
			t_bclk <= '0';
		WAIT FOR 30000*clk_test;
		
		
		-- dritter Druchgang
			t_phi_incr_i <=20;	--Schrittweite: =20
		WAIT FOR 10*clk_test;
		t_tone_on_i <= '0';
		t_strobe_i <= '0';
		
		ASSERT (t_phi_incr_i =10) REPORT "Die Schrittweite ist /=20, vielleicht falsch zugewiesen!!" SEVERITY note;
		
		WAIT FOR 5*clk_test;
			t_tone_on_i <= '1';
		WAIT FOR 5*clk_test;
			t_bclk <= '1';
		WAIT FOR 5*clk_test;
			t_strobe_i <='1';
		
		WAIT FOR 1000*clk_test;
			t_bclk <= '0';
		WAIT FOR 30000*clk_test;
		
		ASSERT false REPORT "--- ALL TESTS PASS ---" SEVERITY failure;		

			
	END PROCESS;
	
END test;