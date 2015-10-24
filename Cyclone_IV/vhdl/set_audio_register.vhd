--------------------------------------------------
-- Codec Control
--
-- Configure Audio Codec by setting Register
-- Communication trough I2C-Protocol
-- Send configurations to I2C-Master to transmit
--
-- Register-Settings defined in work.reg_table_pkg


--------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.audio_codec_register_table_pkg.all;



entity set_audio_register is
  port( clk								:in     	std_logic;
		reset_n							:in     	std_logic;
		write_done_i 			    	:in     	std_logic;
		ack_error_i				     	:in     	std_logic;
		write_o     				    :out    	std_logic;
		write_data_o  					:out		std_logic_vector (15 downto 0)		
		);
end set_audio_register;										




architecture rtl of set_audio_register is

type state is (idle, start_write, send);

signal folge_zustand			: 		state;
signal zustand					:		state;
signal last_reg					: 		std_logic;
signal reg_idx, next_reg_idx	:		natural;



begin

		 
  
--------------------------------------------------
-- FSM: Controll write in I2C
--------------------------------------------------
    ff_fsm : process(all)
	begin	
		if 		reset_n = '0' then
				zustand <=  idle;
		elsif	clk'event AND clk = '1' then
				zustand <= folge_zustand;
		end if;	 
	end process;
    
    -- input logic
	controll_set_register: process (all)
	begin
        folge_zustand <= zustand; 
        
        case zustand is     
            when idle =>		
               folge_zustand <= start_write;
        
            when start_write =>	
                folge_zustand <= send;
                
            when send =>
                if 		write_done_i ='1' AND last_reg='0' then
                        folge_zustand <= start_write;
                elsif 	ack_error_i='1' then
                        folge_zustand <= idle;
                elsif 	write_done_i='1' AND last_reg='1' then
                        folge_zustand <=idle;
                elsif 	write_done_i='0' then 
                        folge_zustand <= send;
                end if;
            when others =>
                 folge_zustand <= idle;
        end case;    
	end process;
	
	-- output-logic
	set_output: process (all)
	begin
		case zustand is
                when start_write	=>	write_o	<='1';
                when others			=>	write_o	<='0';
		end case;
	end process;

--------------------------------------------------	
-- counter:
-- Counts the I2S write_dones from 0 to 9.
-- By 9: set last_reg = '1' and restart counting
--------------------------------------------------	

	ff_counter: process (all)
	begin 
		if		reset_n = '0' then 
				reg_idx <= 0;
		elsif	clk'event AND clk='1' then
				reg_idx <= next_reg_idx;
		end if;
	end process;

	count_write_done: process (all)
	begin
		if write_done_i = '1' then 
			if	reg_idx = 9 then 
				next_reg_idx <= 0;
				last_reg <= '1';
			else
				next_reg_idx <= reg_idx + 1;
				last_reg <= '0';	
			end if;
		else 
			next_reg_idx <= reg_idx;
			last_reg <= '0';
		end if;
	end process;


--	set_acknowledge_to_led: process(ack_error_i, reset_n, clk)
--	begin
--		if		reset_n = '0' then
--				ack_error_i = '0';                           -- !!!!!!!!!!noting there, new insert
--		elsif 	clk'event AND clk = '1' then
--			    if	ack_error_i ='1' then
--			    --- ??????????????????????
--				end if;
--		end if;
--	end process;		


 
	write_data: process(all)
	begin
	    -- write address
        write_data_o(15 downto 9) <= std_logic_vector(to_unsigned(reg_idx,7));
        -- write data
		write_data_o(8 downto 0)  <= C_W8731_ADC_DAC_0DB_8K(reg_idx);		
	end process;
	
	
end rtl;
