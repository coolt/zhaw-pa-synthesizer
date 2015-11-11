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
SIGNAL		tl_clk_12M5:			std_logic;										
SIGNAL		tl_sw_sync:			std_logic_vector (17 downto 0);					
SIGNAL		tl_key_sync:					std_logic_vector (2 downto 0);					

-- midi interface - tone generator
SIGNAL		tl_note_1:				std_logic_vector(8 downto 0);
SIGNAL		tl_note_2:				std_logic_vector(8 downto 0);
SIGNAL		tl_note_3:				std_logic_vector(8 downto 0);
SIGNAL		tl_note_4:				std_logic_vector(8 downto 0);
SIGNAL		tl_note_5:				std_logic_vector(8 downto 0);
SIGNAL		tl_note_6:				std_logic_vector(8 downto 0);
SIGNAL		tl_note_7:				std_logic_vector(8 downto 0);
SIGNAL		tl_note_8:				std_logic_vector(8 downto 0);
SIGNAL		tl_note_9:				std_logic_vector(8 downto 0);
SIGNAL		tl_note_10:				std_logic_vector(8 downto 0);	
			

-- tone generator -- audio interface
SIGNAL		tl_DACDAT_pl:			std_logic_vector (15 downto 0);					
SIGNAL		tl_DACDAT_pr:			std_logic_vector (15 downto 0);	


-- audio interface intern
SIGNAL		tl_write_done:			std_logic;										--Sendebestätigung vom I2C Master
SIGNAL		tl_ack_error:			std_logic;										--Senden fehlgeschlagen von I2C Master
SIGNAL		tl_write:		  		std_logic;
SIGNAL		tl_write_data:			std_logic_vector (15 downto 0);					--I2C Sendedaten

-- audio interface -- infrastructure
SIGNAL 		tl_digiloop:			std_logic;										--Audioschleife über Digitalloop
SIGNAL		t_audio_mode_i:			std_logic;

-- audio interface -- codec [!!!!!! kein signal!!!!]										
SIGNAL 		tl_bclk:				std_logic;										--halbierter 12MHz Takt
SIGNAL		tl_WS:					std_logic;
SIGNAL		tl_ADCDAT_pl:			std_logic_vector (15 downto 0);
SIGNAL		tl_ADCDAT_pr:			std_logic_vector (15 downto 0);


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
PORT(   clk_12M5_i:   IN std_logic; 
        reset_n_i:    IN std_logic;
        serial_i:     IN std_logic; 
        note_1_o:     OUT std_logic_vector(8 downto 0); 
		  note_2_o:     OUT std_logic_vector(8 downto 0); 
		  note_3_o:     OUT std_logic_vector(8 downto 0); 
		  note_4_o:     OUT std_logic_vector(8 downto 0); 
		  note_5_o:     OUT std_logic_vector(8 downto 0); 
		  note_6_o:     OUT std_logic_vector(8 downto 0); 
		  note_7_o:     OUT std_logic_vector(8 downto 0); 
		  note_8_o:     OUT std_logic_vector(8 downto 0); 
		  note_9_o:     OUT std_logic_vector(8 downto 0); 
		  note_10_o:    OUT std_logic_vector(8 downto 0) 
		  );
END COMPONENT;


COMPONENT tone_generator
PORT(clk_12M5_i:   IN std_logic; 
        reset_n_i:    IN std_logic;
        serial_i:     IN std_logic; 
        note_1_o:     IN std_logic_vector(8 downto 0); 
		  note_2_o:     IN std_logic_vector(8 downto 0); 
		  note_3_o:     IN std_logic_vector(8 downto 0); 
		  note_4_o:     IN std_logic_vector(8 downto 0); 
		  note_5_o:     IN std_logic_vector(8 downto 0); 
		  note_6_o:     IN std_logic_vector(8 downto 0); 
		  note_7_o:     IN std_logic_vector(8 downto 0); 
		  note_8_o:     IN std_logic_vector(8 downto 0); 
		  note_9_o:     IN std_logic_vector(8 downto 0); 
		  note_10_o:    IN std_logic_vector(8 downto 0);
		  dacdat_l_o:   OUT std_logic_vector(15 downto 0);
		  dacdat_r_o:   OUT std_logic_vector(15 downto 0)   
        );
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




BEGIN

inst_1 : infrastructure_block						
	PORT MAP ( 	s_reset_n			=> 		KEY(0),
				clk_50M				=>		CLOCK_50,
				button				=>		SW,
				key_in				=>		KEY(3 DOWNTO 1),
				clk_12M				=>		tl_clk_12M5,
				button_sync			=>		tl_sw_sync,
				key_sync			=>		tl_key_sync
				);


inst_2: midi_interface
PORT MAP(clk_12M5_i     =>  tl_clk_12M5,
        reset_n_i       =>  tl_key_sync(0),
        serial_i        =>  GPIO_10, 
        note_1_o        =>  tl_note_1,
		  note_2_o      =>  tl_note_2,
		  note_3_o      =>  tl_note_3,
		  note_4_o      =>  tl_note_4,
		  note_5_o      =>  tl_note_5, 
		  note_6_o      =>  tl_note_6,
		  note_7_o      =>  tl_note_7,
		  note_8_o      =>  tl_note_8,
		  note_9_o      =>  tl_note_9, 
		  note_10_o     =>  tl_note_10
		  ); 
		  

inst_3: tone_generator
PORT MAP(clk_12M5_i      =>  tl_clk_12M5,
        reset_n_i       =>  tl_key_sync(0),
        note_1_o        =>  tl_note_1,
		  note_2_o      =>  tl_note_2,
		  note_3_o      =>  tl_note_3,
		  note_4_o      =>  tl_note_4, 
		  note_5_o      =>  tl_note_5,
		  note_6_o      =>  tl_note_6,
		  note_7_o      =>  tl_note_7,
		  note_8_o      =>  tl_note_8, 
		  note_9_o      =>  tl_note_9,
		  note_10_o     =>  tl_note_10,
		  dacdat_l_o    =>  tl_DACDAT_pl,
		  dacdat_r_o    =>  tl_DACDAT_pr
		  );              


	  
-- blocks audio interface
inst_4 : set_register
	PORT MAP ( 	write_done_i    	=> 		tl_write_done,						
				ack_error_i 	   	=> 		tl_ack_error,
				write_o				=>		tl_write,
				write_data_o	  	=>		tl_write_data,
				event_ctrl_i		=>		tl_sw_sync(17),
				clk					=>		tl_clk_12M5,
				reset_n				=>		tl_key_sync(0),
				LED_out				=>		LEDG(0),
				audio_mode_i		=>		tl_sw_sync(16)
			  );
			  
inst_5 : i2c_master
	PORT MAP ( 	write_i				=>		tl_write,							
				write_data_i		=>		tl_write_data,
				sda_io				=>		I2C_SDAT,
				scl_o			    =>		I2C_SCLK,
				write_done_o		=>		tl_write_done,
				ack_error_o			=>		tl_ack_error,
				clk					=>		tl_clk_12M5,
				reset_n				=>		tl_key_sync(0)
			   );
			  
inst_6 : i2s_master
	PORT MAP (	clk_12M				=>		tl_clk_12M5,
				i2s_reset_n			=>		tl_key_sync(0),,
				INIT_N_i			=>		tl_sw_sync(15),
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
				AUDIO_MODE			=>		tl_sw_sync(14),
				dds_DATA_I			=>		tl_dacdat_g_o
				
				);
				


-- signal assignment
AUD_ADCLRCK <= 	tl_WS;
AUD_DACLRCK	<= 	tl_WS;
AUD_XCK		<=	tl_clk_12M5;
AUD_BCLK	<=	tl_bclk;

	
			  
END ARCHITECTURE rtl;
