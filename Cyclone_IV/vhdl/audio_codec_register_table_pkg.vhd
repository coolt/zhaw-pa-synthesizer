-------------------------------------------------------------------------------
-- Project     : synthesizer
-- Description : Defines packedge with register values for audio codec WM8731
--               The codec has 11 register to 16 bits
--               The first 7 bits are used to adress the register
--               The following 9 bits are used for audio-configurations
--
-------------------------------------------------------------------------------
--
-- Change History
-- Date     |Name      |Modification
------------|----------|-------------------------------------------------------
-- 26.02.13 | dqtm     | file created for DTP2 Lab4 
-- 24.10.15 | baek     | renamed and recommented
-------------------------------------------------------------------------------
--
--
--
-- Register functions (overview)
-------------------------------------------------------------------------------
-- R0: Left line input channel volume control
-- R1: Right line input channel volume control
-- R2: Left channel headphone volume control
-- R3: Right channel headphone volume control
-- R4: Analog audio path control
-- R5: Digital audio path control
-- R6: Power down control
-- R7: Digital audio interface format
-- R8: Sample rate control
-- R9: Digital interface activation
-- R10: -- 
-- R11: Reset Audio Codec


library ieee;
use ieee.std_logic_1164.all;


package audio_codec_register_table_pkg is

type t_codec_register_array is array(0 to 9) of std_logic_vector(8 downto 0);

-- Adress bits for each register 
-- R0 has address '0',   R1 has address '1', ...
constant C_ADDR_LEFT_LINE_IN        :natural range 0 to 9 := 0;    
constant C_ADDR_RIGHT_LINE_IN       :natural range 0 to 9 := 1;    
constant C_ADDR_LEFT_HP_OUT         :natural range 0 to 9 := 2;    
constant C_ADDR_RIGHT_HP_OUT        :natural range 0 to 9 := 3;   
constant C_ADDR_ANALOG_AP           :natural range 0 to 9 := 4;    
constant C_ADDR_DIGITAL_AP          :natural range 0 to 9 := 5;    
constant C_ADDR_POWER_DOWN          :natural range 0 to 9 := 6;    
constant C_ADDR_DIGITAL_AI          :natural range 0 to 9 := 7;    
constant C_ADDR_SAMPLING            :natural range 0 to 9 := 8;    
constant C_ADDR_DIGITAL_ACTIVATE    :natural range 0 to 9 := 9;    

-- Configuaration bits for registers
-- R0 and R1: input line channel volume control
constant C_LINE_IN_LINVOL_0DB:     std_logic_vector(8 downto 0) := "000010111"; -- Line input volume 0 dB
constant C_LINE_IN_LINVOL_M12DB:   std_logic_vector(8 downto 0) := "000001111"; -- Line input volume -12 dB

-- R2 and R3: headphone volume control
constant C_HP_OUT_HPVOL_0DB:      std_logic_vector(8 downto 0) := "001111001";  -- Headphone volume 0db.
constant C_HP_OUT_HPVOL_M12DB:    std_logic_vector(8 downto 0) := "001111111";  --001101101 -- Headphone volume -12db. 
                                                                  --zweitvorderstes Bit war 0 jetzt 1 um zu testen (mute)
constant C_HP_OUT_HPVOL_P6DB:  std_logic_vector(8 downto 0) := "001111111";     -- Headphone volume +6 dB

-- R4: Analog audio path control
constant C_ANALOG_AP_DACSEL:            std_logic_vector(8 downto 0) := (4 => '1', others => '0'); -- Add DAC signal to output
constant C_ANALOG_AP_BYPASS:            std_logic_vector(8 downto 0) := (3 => '1', others => '0'); -- Bypass switch (loop line in to line out)
constant C_ANALOG_AP_MUTEMIC:           std_logic_vector(8 downto 0) := (1 => '1', others => '0'); -- Microphone mute.

-- R5: Digital audio path control
constant C_DIGITAL_AP_DACMU:            std_logic_vector(8 downto 0) := (3 => '1', others => '0'); -- DAC soft mute
constant C_DIGITAL_AP_DEEMP_DIS:        std_logic_vector(8 downto 0) := (others => '0');           -- De-emphasis Disabled

-- R6: Power down control
constant C_POWER_DOWN_NONE:             std_logic_vector(8 downto 0) := (others => '0');           -- power all blocks

-- R7: Digital audio interface format
constant C_DIGITAL_AI_IWL_16:           std_logic_vector(8 downto 0) := (others => '0');           -- 16 bit data.
constant C_DIGITAL_AI_FORMAT_I2S:       std_logic_vector(8 downto 0) := (1 => '1', others => '0'); -- I2S format

-- R8: Sample rate control
constant C_SAMPLING_SR_1:               std_logic_vector(8 downto 0) := (3 => '1', others => '0');	-- sample rate control bit 1
constant C_SAMPLING_SR_0:               std_logic_vector(8 downto 0) := (2 => '1', others => '0');	-- sample rate control bit 0

-- R9: Digital Interface Activation
constant C_DIGITAL_ACTIVATE_ACTIVE:     std_logic_vector(8 downto 0) := (0 => '1', others => '0'); -- Activate interface (1=act)



-- Register set for selected modes

-- C_W8731_ANALOG_BYPASS =====================================================
-- analog bypass (loop line in  -> line out via FPGA)
-- input gain -12dB / 0dB / +6dB
-- output gain -12dB / 0dB / +6dB
-- dac muted, no sidetone
-- adc sampling 8kHz
-- interface in I2S mode, 16 bit quantisation
constant C_W8731_ANALOG_BYPASS : t_codec_register_array := (
    C_ADDR_LEFT_LINE_IN        =>  "000000000" or C_LINE_IN_LINVOL_M12DB,
    C_ADDR_RIGHT_LINE_IN       =>  "000000000" or C_LINE_IN_LINVOL_M12DB,
    C_ADDR_LEFT_HP_OUT         =>  "000000000" or C_HP_OUT_HPVOL_M12DB,
    C_ADDR_RIGHT_HP_OUT        =>  "000000000" or C_HP_OUT_HPVOL_M12DB,
    C_ADDR_ANALOG_AP           =>  "000000000" or C_ANALOG_AP_MUTEMIC or C_ANALOG_AP_BYPASS, 
    C_ADDR_DIGITAL_AP          =>  "000000000" or C_DIGITAL_AP_DACMU or C_DIGITAL_AP_DEEMP_DIS,
    C_ADDR_POWER_DOWN          =>  "000000000" or C_POWER_DOWN_NONE,
    C_ADDR_DIGITAL_AI          =>  "000000000" or C_DIGITAL_AI_IWL_16 or C_DIGITAL_AI_FORMAT_I2S,
    C_ADDR_SAMPLING            =>  "000000000" or C_SAMPLING_SR_0 or C_SAMPLING_SR_1, -- 8kHz with mclk=12.288MHz
    C_ADDR_DIGITAL_ACTIVATE    =>  "000000000" or C_DIGITAL_ACTIVATE_ACTIVE );

    
-- C_W8731_ADC_DAC_0DB_8K =====================================================
-- input gain -12dB / 0dB / +6dB
-- output gain -12dB / 0dB / +6dB
-- dac enabled, no sidetone
-- adc/dac sampling 8kHz
-- interface in I2S mode, 16 bit quantisation
constant C_W8731_ADC_DAC_0DB_8K: t_codec_register_array := (
    C_ADDR_LEFT_LINE_IN        =>  "000000000" or C_LINE_IN_LINVOL_M12DB,
    C_ADDR_RIGHT_LINE_IN       =>  "000000000" or C_LINE_IN_LINVOL_M12DB,
    C_ADDR_LEFT_HP_OUT         =>  "000000000" or C_HP_OUT_HPVOL_M12DB,
    C_ADDR_RIGHT_HP_OUT        =>  "000000000" or C_HP_OUT_HPVOL_M12DB,
    C_ADDR_ANALOG_AP           =>  "000000000" or C_ANALOG_AP_MUTEMIC or C_ANALOG_AP_DACSEL, 
    C_ADDR_DIGITAL_AP          =>  "000000000" or C_DIGITAL_AP_DEEMP_DIS,
    C_ADDR_POWER_DOWN          =>  "000000000" or C_POWER_DOWN_NONE,
    C_ADDR_DIGITAL_AI          =>  "000000000" or C_DIGITAL_AI_IWL_16 or C_DIGITAL_AI_FORMAT_I2S,
    C_ADDR_SAMPLING            =>  "000000000" or C_SAMPLING_SR_0 or C_SAMPLING_SR_1, -- 8kHz with mclk=12.288MHz
    C_ADDR_DIGITAL_ACTIVATE    =>  "000000000" or C_DIGITAL_ACTIVATE_ACTIVE );

 
end package;
