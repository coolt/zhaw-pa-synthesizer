-------------------------------------------
-- Testbench code:  testbench_einfach_schaltung.vhd
-- History:             04.Feb.2014 - 1st version (dqtm)
-- Function:            testbench for lab1-DTP2
-------------------------------------------

-- Library & Use Statements
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library modelsim_lib;
use modelsim_lib.util.all;

-- Entity Declaration 
entity testbench_einfach_schaltung is

end testbench_einfach_schaltung;


-- Architecture Declaration   
architecture struct of testbench_einfach_schaltung is

  -- Component Declaration
  component einfach_schaltung
    port (
      clock     : in  std_logic;
      reset_n   : in  std_logic;
      enable    : in  std_logic;
      value     : in  std_logic_vector(7 downto 0);
      trigger   : out std_logic
      );
  end component einfach_schaltung;

  -- Signals & Constants Declaration    
  signal t_clock     : std_logic;
  signal t_reset_n   : std_logic;
  signal t_enable_i  : std_logic;
  signal t_value_i   : std_logic_vector(7 downto 0);
  signal t_trigger_o : std_logic;
  signal t_count_dbg : unsigned(7 downto 0);

  constant clk_halfp : time := 0.5 us;

-- Begin Architecture   
begin
  -------------------------------------------
  -- Instantiation DUT (Device under Test)
  -------------------------------------------
  dut : einfach_schaltung
    port map(
      clock     => t_clock,
      reset_n   => t_reset_n,
      enable    => t_enable_i,
      value     => t_value_i,
      trigger   => t_trigger_o);

  -------------------------------------------
  -- Connect the debug signals
  -------------------------------------------
--  
-- Syntax of modelsim_lib/init_signal_spy
-- init_signal_spy(src_object, dest_object, verbose)
--
  init_signal_spy("dut/count","t_count_dbg",0);
  
  ------------------------------------------- 
  -- Clock Generation Process (with wait)
  -------------------------------------------
  clock_gen : process
  begin
    t_clock <= '0';
    wait for clk_halfp;
    t_clock <= '1';
    wait for clk_halfp;
  end process clock_gen;

  -------------------------------------------
  -- Stimuli and Check Process (with wait & assert)
  -------------------------------------------
  stimuli : process
  begin
    -- initialize all inputs and 
    -- activate reset_n to initialize the DUT
    t_reset_n  <= '0';
    t_enable_i <= '0';
    t_value_i  <= "00001010";
    wait for 10*clk_halfp;

    -- release reset_n and wait for 2 clock-periods
    wait until t_clock = '0';
    t_reset_n <= '1';
    wait for 2*clk_halfp;

    -- check if the counter starts with 0
    assert(t_count_dbg = to_unsigned(0, 8)) report "TEST_1: counter didn't start with 0" severity error;
    t_enable_i <= '1';

    -- check if the counter increments by 1 per clock
    wait for 2*clk_halfp;
    assert (t_count_dbg = to_unsigned(1, 8)) report "TEST_2: counter didn't increment by one" severity error;

    -- check if the trigger signal is active when the counter reaches 10
    wait until t_count_dbg = to_unsigned(10, 8);
    assert (t_trigger_o = '1') report "TEST_3: no trigger signal" severity error;
    wait for 3*clk_halfp;

    -- check if the trigger signal is reset again afterwards
    assert (t_trigger_o = '0') report "TEST_4: didn't release trigger signal" severity error;

    -- stop simulation
    wait for 10*clk_halfp;
    assert false report "Test programm beendet" severity failure;
  end process stimuli;


-- End Architecture 
end struct;







