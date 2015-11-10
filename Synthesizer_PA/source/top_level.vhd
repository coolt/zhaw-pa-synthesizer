-------------------------------------------
-- top level synthesizer
-------------------------------------------
-- copyright: bruelcor (1. version)
-- commented: baek (2. version)
--
-- function:
-- midi interface connected to analog/digital infrastructure

-- Bedienung: 
--         SW(17) 	= Codec Control ein/aus 
--			  SW(16) 	= Analog/Digital Loop 
--			  SW(15) 	= I2S ein/aus  
--			  SW(14) 	= Mode Audio Control ('0': Signale von Synthesizer,  
--                                         '1': Digitalloop )

--			  KEY(0) 	= Reset
--			  KEY(1) 	= FM-Ratio aendern
--			  KEY(2) 	= FM-Depth aendern

-------------------------------------------




LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY top_level IS
	PORT (	CLOCK_50				:IN			std_logic;
			KEY						:IN			std_logic_vector(3 DOWNTO 0);		
			GPIO_10            	    :IN			std_logic;
			SW						:IN			std_logic_vector(17 DOWNTO 0);		
			AUD_ADCDAT				:IN			std_logic;							--SD vom Coded DA Wandlung
			AUD_DACDAT				:OUT		std_logic;							--SD zum Codec AD Wandlung
			AUD_BCLK				:OUT		std_logic;							--I2S Bit Clock
			AUD_XCK					:OUT		std_logic;							--Master Clock
			AUD_DACLRCK				:OUT		std_logic;
			AUD_ADCLRCK				:OUT		std_logic;							--WS zum Codec bei AD Wandlung
			I2C_SCLK				:OUT		std_logic;
			I2C_SDAT				:INOUT		std_logic;
			LEDG					:OUT 		std_logic_vector(7 DOWNTO 0)	
		  );
END top_level;


ARCHITECTURE rtl OF top_level IS

-- infrastucture
SIGNAL		tl_clk_12M5:				std_logic;										
SIGNAL		tl_sw_button:			std_logic_vector (17 downto 0);					
SIGNAL		tl_key:					std_logic_vector (2 downto 0);					

-- midi interface
SIGNAL		tl_rx_data_valid:		std_logic;
SIGNAL		tl_rx_data:				std_logic_vector(7 downto 0);
SIGNAL		tl_note_out:			std_logic_vector(24 downto 0); --- connect to tone_generator in
	
			

-- tone generator
SIGNAL		tl_tone_on:				std_logic; 										--fuer fm_synth 
SIGNAL		tl_n_cum:				natural range 0 to 65000;						--Tonhöhe 
SIGNAL		tl_strobe:				std_logic;
SIGNAL		tl_dacdat_g_o:			std_logic_vector(15 downto 0);
SIGNAL		tl_fm_ratio:			natural range 0 to 10;							--Synthesizer Verhältnis						
SIGNAL		tl_fm_depth:			natural range 0 to 10;							--Synthesizer Tiefe

-- audio interface
SIGNAL 		tl_bclk:				std_logic;										--halbierter 12MHz Takt
SIGNAL		tl_write_done:			std_logic;										--Sendebestätigung vom I2C Master
SIGNAL		tl_ack_error:			std_logic;										--Senden fehlgeschlagen von I2C Master
SIGNAL		tl_write:		  		std_logic;
SIGNAL		tl_write_data:			std_logic_vector (15 downto 0);					--I2C Sendedaten
SIGNAL		tl_DACDAT_pl:			std_logic_vector (15 downto 0);					
SIGNAL		tl_DACDAT_pr:			std_logic_vector (15 downto 0);				
SIGNAL		tl_ADCDAT_pl:			std_logic_vector (15 downto 0);
SIGNAL		tl_ADCDAT_pr:			std_logic_vector (15 downto 0);
SIGNAL		tl_WS:					std_logic;
SIGNAL 		tl_digiloop:			std_logic;										--Audioschleife über Digitalloop
SIGNAL		t_audio_mode_i:			std_logic;
										


--Components Declaration
------------------------------------------
COMPONENT infrastructure_block
	PORT(   s_reset_n						:IN    			std_logic;
			clk_50M          				:IN    			std_logic;
			button							:IN 			std_logic_vector(17 DOWNTO 0);
			key_in							:IN				std_logic_vector(2 DOWNTO 0);
    	    clk_12M                    	 	:OUT   			std_logic;
		    button_sync						:OUT 			std_logic_vector(17 DOWNTO 0);
			key_sync						:OUT			std_logic_vector(2 DOWNTO 0)
			);
END COMPONENT;



COMPONENT midi_interface
PORT(   clk_12M5:   IN std_logic; 
        reset_n:    IN std_logic;
        midi_in:    IN std_logic; 
        note_out:   OUT std_logic_vector(24 downto 0); 
        led_out_of_range: OUT std_logic
END COMPONENT;

-- blocks audio interface
COMPONENT set_register
	PORT (	clk,reset_n	 			 		:IN      		std_logic;
			write_done_i, ack_error_i   	:IN      		std_logic;
			write_o     					:OUT   			std_logic;
			write_data_o				 	:OUT			std_logic_vector (15 downto 0);
			event_ctrl_i			     	:IN 			std_logic;
			LED_out							:OUT 			std_logic;
			audio_mode_i					:IN 			std_logic
    	  );
END COMPONENT;
COMPONENT i2c_master
	PORT (	clk         				 	:IN    			std_logic;
			reset_n     				 	:IN   			std_logic;
			write_i     				 	:IN     		std_logic;
			write_data_i					:IN				std_logic_vector(15 downto 0);
			sda_io							:INOUT			std_logic;
			scl_o							:OUT   			std_logic;
			write_done_o			    	:OUT			std_logic;
			ack_error_o						:OUT			std_logic
          );
END COMPONENT;
COMPONENT i2s_master
	PORT (	clk_12M							:IN				std_logic;
			i2s_reset_n						:IN				std_logic;
			INIT_N_i						:IN				std_logic;	
			ADCDAT_s						:IN				std_logic;
			DACDAT_pl						:IN				std_logic_vector(15 downto 0);
			DACDAT_pr						:IN				std_logic_vector(15 downto 0);
			STROBE_O						:OUT			std_logic;	
			BCLK							:OUT			std_logic;
			DACDAT_s						:OUT			std_logic;
			ADCDAT_pl						:OUT			std_logic_vector(15 downto 0);
			ADCDAT_pr						:OUT			std_logic_vector(15 downto 0);
			WS								:OUT			std_logic			
		 );					
END COMPONENT;
COMPONENT set_chanel
	PORT (	ADCDAT_pl_i				        :IN 			std_logic_vector (15 DOWNTO 0);
			ADCDAT_pr_i						:IN 			std_logic_vector (15 DOWNTO 0);
			DACDAT_pl_o						:OUT			std_logic_vector (15 DOWNTO 0);
			DACDAT_pr_o						:OUT			std_logic_vector (15 DOWNTO 0);
			AUDIO_MODE						:IN				std_logic;
			dds_DATA_I						:IN				std_logic_vector (15 DOWNTO 0)
		 );
END COMPONENT;

-- blocks tone generator
COMPONENT tone_decoder
	PORT (	clk_12M5					:IN				std_logic;	
			reset_n						:IN				std_logic;
			note_on					   	:IN				std_logic;
			note_midi                   :IN             natural range 0 to 128;
			tone_on						:OUT			std_logic;
			N_CUM					    :OUT 			natural range 0 to 65000
		);
END COMPONENT;
COMPONENT fm_synth
PORT (		fm_clk_12M					    :IN				std_logic;
			fm_reset_n						:IN				std_logic;
			fm_bclk							:IN				std_logic;
			strobe							:IN				std_logic;
			tone_on_i						:IN				std_logic;
			N_CUM						    :IN				natural range 0 to 65000;
			synth_ratio						:IN				natural range 0 to 1000;
			synth_depth						:IN				natural range 0 to 10;
			data_o							:OUT			 std_logic_vector(15 downto 0)
		  );
END COMPONENT;



BEGIN

inst_5 : infrastructure_block						
	PORT MAP ( 	s_reset_n			=> 		KEY(0),
				clk_50M				=>		CLOCK_50,
				button				=>		SW,
				key_in				=>		KEY(3 DOWNTO 1),
				clk_12M				=>		tl_clk_12M5,
				button_sync			=>		tl_sw_button,
				key_sync			=>		tl_key
				);

inst_1: uart_top 
	PORT MAP(	serial_in           => 
			clk_12M5 				=> tl_clk_12M5,    
			reset_n					=> KEY(0),
			rx_data					=> tl_rx_data,
			rx_data_valid			=> tl_rx_data_valid
			);


inst_2: midi_interface
PORT MAP(	clk_12M5	            => tl_clk_12M5,
			reset_n					=> KEY(0),
			midi_in                 => GPIO_10,
            note_out                =>  OUT std_logic_vector(24 downto 0); 
            led_out_of_range        => LEDG(1)
		  ); 
		  
	  

inst_3 : set_register
	PORT MAP ( 	write_done_i    	=> 		tl_write_done,						
				ack_error_i 	   	=> 		tl_ack_error,
				write_o				=>		tl_write,
				write_data_o	  	=>		tl_write_data,
				event_ctrl_i		=>		tl_sw_button(17),
				clk					=>		tl_clk_12M5,
				reset_n				=>		KEY(0),
				LED_out				=>		LEDG(0),
				audio_mode_i		=>		tl_sw_button(16)
			  );
			  
inst_4 : i2c_master
	PORT MAP ( 	write_i				=>		tl_write,							
				write_data_i		=>		tl_write_data,
				sda_io				=>		I2C_SDAT,
				scl_o			    =>		I2C_SCLK,
				write_done_o		=>		tl_write_done,
				ack_error_o			=>		tl_ack_error,
				clk					=>		tl_clk_12M5,
				reset_n				=>		KEY(0)
			   );
			  


inst_6 : i2s_master
	PORT MAP (	clk_12M				=>		tl_clk_12M5,
				i2s_reset_n			=>		KEY(0),
				INIT_N_i			=>		tl_sw_button(15),
				ADCDAT_s			=>		AUD_ADCDAT,
				DACDAT_pl			=>		tl_DACDAT_pl,
				DACDAT_pr			=>		tl_DACDAT_pr,
				STROBE_O			=> 		tl_strobe,
				BCLK				=>		tl_bclk,
				DACDAT_s			=>		AUD_DACDAT,
				ADCDAT_pl			=>		tl_ADCDAT_pl,
				ADCDAT_pr			=>		tl_ADCDAT_pr,
				WS					=>		tl_WS
				);
				
inst_7 : set_chanel
	PORT MAP (	ADCDAT_pl_i			=>		tl_ADCDAT_pl,
				ADCDAT_pr_i			=>		tl_ADCDAT_pr,
				DACDAT_pl_o			=>		tl_DACDAT_pl,
				DACDAT_pr_o			=>		tl_DACDAT_pr,
				AUDIO_MODE			=>		tl_sw_button(14),
				dds_DATA_I			=>		tl_dacdat_g_o
				
				);
				
inst_8	: tone_decoder
	PORT MAP(	clk_12M5					=>		tl_clk_12M5,
				reset_n				=>		KEY(0),
				note_on          => tl_note_on,--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!¨¨
				note_midi		=>		tl_note_value, -- !!!!!!!!!!!!!!!!!!!!!!!!
				tone_on			=>		tl_tone_on,
				N_CUM				=>		tl_n_cum
		);



	
inst_10: fm_synth
	PORT MAP(	fm_clk_12M	 		=> 		tl_clk_12M5,	
				fm_reset_n			=> 		KEY(0),		
				fm_bclk				=> 		tl_bclk,
				strobe				=> 		tl_strobe, 
				tone_on_i			=> 		tl_tone_on,
				N_CUM				=> 		tl_n_cum,
				synth_ratio			=> 		tl_fm_ratio,
				synth_depth			=> 		tl_fm_depth,
				data_o				=> 		tl_dacdat_g_o
		  );


-- signal assignment
AUD_ADCLRCK <= 	tl_WS;
AUD_DACLRCK	<= 	tl_WS;
AUD_XCK		<=	tl_clk_12M5;
AUD_BCLK	<=	tl_bclk;

	
			  
END ARCHITECTURE rtl;