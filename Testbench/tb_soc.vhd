--------------------------------------------------------------------
--  _____       ______  _____                                     --
-- |_   _|     |  ____|/ ____|                                    --
--   | |  _ __ | |__  | (___    Institute of Embedded Systems     --
--   | | | '_ \|  __|  \___ \   Zürcher Hochschule für Angewandte --
--  _| |_| | | | |____ ____) |  Wissenschaften                    --
-- |_____|_| |_|______|_____/   8401 Winterthur, Switzerland      --
--------------------------------------------------------------------
--
-- Project     : Pacman
--
-- File Name   : ram_tb.vhd
-- Description : 
--
-- Features:     
--
--------------------------------------------------------------------
-- Change History
-- Date     |Name      |Modification
------------|----------|--------------------------------------------
-- 10.09.11 | gelk     | file created
--------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.all;
use std.textio.all;
use work.std_logic_textio.all;




entity tb_soc is
end;

architecture struct of tb_soc is

--------------------------------------------------------------------
-- component declaration
--------------------------------------------------------------------
COMPONENT ram_64k_def
  port(
		address		: IN STD_LOGIC_VECTOR (14 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		byteena		: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
		q			: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
 );
END COMPONENT;

--------------------------------------------------------------------
-- signal instantiation
--------------------------------------------------------------------
 
  signal address_sig : STD_LOGIC_VECTOR (14 DOWNTO 0);
  signal clock_sig	 : STD_LOGIC  := '1';
  signal data_sig	 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  signal wren_sig	 : STD_LOGIC ;
  signal byteena_sig : STD_LOGIC_VECTOR (1 DOWNTO 0);
  signal q_sig	 : STD_LOGIC_VECTOR (15 DOWNTO 0);
  
  SIGNAL clk_halfp 	: time := 10 ns;
  SIGNAL clk_period : time := 20 ns;
  SIGNAL lincnt			: integer := 0;

  BEGIN
--------------------------------------------------------------------
-- component instantiation
--------------------------------------------------------------------

    ram64k_inst : ram_64k_def 
	PORT MAP (
			address	 => address_sig,
			clock	 => clock_sig,
			data	 => data_sig,
			wren	 => wren_sig,
			byteena  => byteena_sig,
			q	 => q_sig
	);
    
 readcmd: process
        -- This process loops through a file and reads one line
        -- at a time, parsing the line to get the values and
        -- expected result.

        file cmdfile: TEXT;       -- Define the file 'handle'
		file outfile: TEXT;       -- Define the file 'handle'
        variable line_in,line_out: Line; -- Line buffers
        variable good: boolean;   -- Status of the read operations
       -- variable ltgt_ti: string(1 to 4) := (others => ' ');
		VARIABLE cmd_ti: string(1 to 6);
		VARIABLE addr_ti: std_logic_vector(15 downto 0) :=(OTHERS => '0');
		VARIABLE data_ti: std_logic_vector(15 downto 0):=(OTHERS => '0');
		VARIABLE byte_en_ti: std_logic_vector(3 downto 0):=(OTHERS => '0');
		VARIABLE pass_cnt: integer range 0 to 20000;
		VARIABLE fail_cnt: integer range 0 to 20000;

		
		begin

        -------------------------------------
		-- Open the Input and output files
		-------------------------------------
        FILE_OPEN(cmdfile,"../simulation/testcase.dat",READ_MODE);
		FILE_OPEN(outfile,"../testbench/results/testcase_1_results.dat",WRITE_MODE);
		
		-------------------------------------
		-- Reset the circuit
		-------------------------------------
			address_sig 				<= (OTHERS => '0');
			data_sig   			<= (OTHERS => '0');
			wren_sig       			<= '0';
			
			--wait until rising_edge(clock);  -- Setze Reset nach der fallenden Taktflanke
            wait for 4 * clk_halfp;   -- Give the circuit time to stabilize
			
		-------------------------------------
		-- Start the loop
		-------------------------------------
			
			
		loop
		
		--------------------------------------------------------------------------
		-- Check for end of test file and print out results at the end
		--------------------------------------------------------------------------
		
            if endfile(cmdfile) then  -- Check EOF
				IF fail_cnt = 0 THEN
					write(line_out, string'("Number of Passes: "));
					write(line_out, pass_cnt);
					writeline(outfile,line_out);     -- write the message
					--writeline(OUTPUT,line_out);     -- write the message
					assert false
                    report "=== CONGRATULATIONS ALL TESTS PASS ===="
                    severity FAILURE;
				ELSE
					assert false
                    report "=== ERRORS IN MEMORY TEST ===="
                    severity FAILURE;
				END IF;
					
                exit;
            end if;
			
		--------------------------------------------------------------------------
		-- Read all the argumnents and check if arguments are o.k.
		--------------------------------------------------------------------------

            readline(cmdfile,line_in);     -- Read a line from the file
			lincnt <= lincnt + 1;

		
            next when line_in'length = 0;  -- Skip empty lines
			

            read(line_in,cmd_ti,good);     -- Read the command
				assert good
                report "Text I/O read error cmd_ti"
                severity ERROR;
				
			hread(line_in,addr_ti,good);     -- Read 
				assert good
                report "Text I/O read error bus_d"
                severity ERROR;

            hread(line_in,data_ti,good);     -- Read 
				assert good
                report "Text I/O read error char_ram_data"
                severity ERROR;
			
			hread(line_in,byte_en_ti,good);     -- Read 
				assert good
                report "Text I/O read error byte_en"
                severity ERROR;			
		
			-------------------------------------
			-- Read RAM
			-------------------------------------
			IF cmd_ti = string'("rd_ram") THEN		
			address_sig <= addr_ti(14 downto 0);
				WAIT FOR clk_period; -- wait for on clok period until read data are ready
				WAIT FOR clk_period; -- wait for on clok period until read data are ready
				IF data_ti = q_sig THEN
				pass_cnt := pass_cnt + 1;
				write(line_out, string'("RAM read test passes at Adress: "));
				hwrite(line_out, addr_ti);
				--writeline(OUTPUT,line_out);     -- write the message
				writeline(outfile,line_out);     -- write the message
				ELSE
				fail_cnt := fail_cnt + 1;
				write(line_out, string'("Error: At RAM Adress: "));
				hwrite(line_out, addr_ti);
				write(line_out, string'(", RAM Data is: "));
				hwrite(line_out, q_sig);
				write(line_out, string'(", RAM Data should be: "));
				hwrite(line_out, data_ti);
				--writeline(OUTPUT,line_out);     -- write the message
				writeline(outfile,line_out);     -- write the message
				--assert false
                		--report "RAM Compare"
                		--severity FAILURE;
				END IF;
		
		  	-------------------------------------
			-- Write RAM
			-------------------------------------
			ELSIF cmd_ti = string'("wr_ram") THEN
				byteena_sig		<= (OTHERS => '0');
				byteena_sig		<= byte_en_ti(1 downto 0);
				address_sig 		<= (OTHERS => '0');
				address_sig			<= addr_ti(14 downto 0);
				data_sig		<= (OTHERS => '0');
				data_sig		<= data_ti(15 downto 0);
				wren_sig			<= '1';
				WAIT FOR clk_period; -- wait for one clock perid
				wren_sig			<= '0';
				write(line_out, string'("RAM written at Adress: "));
				hwrite(line_out, addr_ti);
				--writeline(OUTPUT,line_out);     -- write the message
				writeline(outfile,line_out);     -- write the message
			ELSE
			assert false
                report "Unknown Command"
                severity FAILURE;
			END IF;
			
			
		
        end loop;
        wait;
    end process;
	
	  
clkgen 	: PROCESS
BEGIN
      WAIT FOR 1*clk_halfp;
      clock_sig <= '1';
      WAIT FOR 1*clk_halfp;
	  clock_sig <= '0';
    END PROCESS clkgen;
   
END struct; 
