-------------------------------------------
-- Block code:  einfach_schaltung.vhd
-- History:     04.Feb.2014 - 1st version (dqtm)
-- Function:    simple 1-DFF circuit for lab1-DTP2
-------------------------------------------

-- Library & Use Statements
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

LIBRARY work;
USE work.debug_pkg.all;


-- Entity Declaration 
entity einfach_schaltung is
  port (
    -- Input Signals
    clock   : in  std_logic;
    reset_n : in  std_logic;
    enable  : in  std_logic;
    value   : in  std_logic_vector(7 downto 0);

    -- Output Signals
    trigger  : out std_logic
    );
end einfach_schaltung;


-- Architecture Declaration
architecture rtl of einfach_schaltung is

  -- Signals & Constants Declaration
  signal count, next_count : unsigned(7 downto 0);

-- Begin Architecture
begin
  -------------------------------------------
  -- Process for combinatorial logic
  -------------------------------------------
  comb_logic : process(enable, count, value)
  begin
    -- count up if enables
    if enable = '1' then
      next_count <= count + 1;
    else
      next_count <= count;
    end if;

    -- if the counter reaches the value,
    -- trigger signal and reset
    if count >= unsigned(value) then
      next_count <= (others=>'0');
      trigger <= '1';
    else
      trigger <= '0';
    end if;
  end process comb_logic;


  ------------------------------------------- 
  -- Process for registers (flip-flops)
  -------------------------------------------
  flip_flops : process(clock, reset_n)
  begin
    if reset_n = '0' then
      count <= (others=>'0');
    elsif RISING_EDGE(clock) then
      count <= next_count;
    end if;
  end process flip_flops;

  ------------------------------------------- 
  -- Link the debug signals to the output
  -------------------------------------------

  -- Link all the debug signals to "global" signals (declared in debug_pkg)
  --pragma translate_off
  dbg_count <= count;
  --pragma translate_on
  

  -- End Architecture  
end rtl;



 
    

