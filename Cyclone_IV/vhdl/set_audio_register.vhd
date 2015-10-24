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

	--Statemachine
	--Die States des Automaten sind:
	--idle: Automat in Ruhe
	--start_write: Automat gibt Sendestartsignal
	--send: Sendevorgang
	flip_flops : process(clk, reset_n)
	begin	
		if 		reset_n = '0' then
				zustand<=  idle;
		elsif	clk'event AND clk = '1' then
				zustand <=folge_zustand;
		end if;
	 
	end process;	 
  
  ------------------------------------------------
  --Input logic state_machine
	logic: process (write_done_i, ack_error_i, zustand, last_reg)
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
					folge_zustand<=idle;
			elsif 	write_done_i='0' then 
					folge_zustand<= send;
			end if;
		when others =>
                    folge_zustand <= idle;
	end case; 
    
	end process logic;
	
	-- Ausgangslogik state_machine
	ausg: process (zustand)
	begin
		case zustand is
		when start_write	=>	write_o	<='1';
		when others			=>	write_o	<='0';
		end case;
	end process;
	
--Zähler
--der Zähler soll von 0 bis 9 Zählen( mit jedem signal vom I2S(write_done)
--bei 9 wird last_reg ein signal(high) gegeben und der Zähler beginnt wieder bei 0
--FLIP FLOP process

	flipflop: process (clk, reset_n)
	begin 

		if		reset_n='0' then 
				reg_idx<=0;
		elsif	clk'event AND clk='1' then
				reg_idx<=next_reg_idx;
		end if;
	end process;

	--Zähler Logik
	log: process (reg_idx, write_done_i)
	begin

		if write_done_i='1' then 
			if	reg_idx=9 then 
				next_reg_idx<=0;
				last_reg<='1';
			else
				next_reg_idx <= reg_idx +1;
				last_reg <= '0';	
			end if;
		else 
			next_reg_idx <= reg_idx;
			last_reg <= '0';
		end if;
	end process;

	--process für ack_error Anzeige mit Flipflop
	ack: process(ack_error_i, reset_n, clk)
	begin
		if		reset_n = '0' then
				
		elsif 	clk'event AND clk = '1' then
				if	ack_error_i ='1' then
					
	
				end if;
		end if;
	end process;		


	--Ausgangslogik für write_data_o 
	output: process(reg_idx)
	begin
	--Adresse für I2C
	write_data_o(15 downto 9) <= std_logic_vector(to_unsigned(reg_idx,7));
				write_data_o(8 downto 0)<=C_W8731_ADC_DAC_0DB_8K(reg_idx);
		
	end process;
	
	
	
  
  
 -- end architecture 
------------------------------------------- 
end rtl;
