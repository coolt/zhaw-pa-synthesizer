library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity bluetooth_adapter is
        port(
            clk         : in    std_logic;
            reset_n     : in    std_logic;

            write_i     : in    std_logic;
			   write_data_i: in	std_logic_vector(15 downto 0);
			
			   sda_io		: inout	std_logic;
			   scl_o		: out   std_logic;
			
			   write_done_o: out	std_logic;
			  ack_error_o	: out	std_logic
        );
end entity;


-- begin of Architecture
architecture rtl of bluetooth_adapter  is
begin

end rtl;