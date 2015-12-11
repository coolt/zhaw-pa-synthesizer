-- Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 14.0.0 Build 200 06/17/2014 SJ Full Version"

-- DATE "12/11/2015 16:40:31"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for QuestaSim (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	top_level IS
    PORT (
	CLOCK_50 : IN std_logic;
	KEY : IN std_logic_vector(3 DOWNTO 0);
	SW : IN std_logic_vector(17 DOWNTO 0);
	AUD_ADCDAT : IN std_logic;
	AUD_DACDAT : OUT std_logic;
	AUD_BCLK : OUT std_logic;
	AUD_XCK : OUT std_logic;
	AUD_DACLRCK : OUT std_logic;
	AUD_ADCLRCK : OUT std_logic;
	I2C_SCLK : OUT std_logic;
	I2C_SDAT : INOUT std_logic;
	LEDG : OUT std_logic_vector(7 DOWNTO 0);
	HEX0 : OUT std_logic_vector(6 DOWNTO 0);
	HEX3 : OUT std_logic_vector(6 DOWNTO 0);
	HEX2 : OUT std_logic_vector(6 DOWNTO 0);
	HEX4 : OUT std_logic_vector(6 DOWNTO 0);
	HEX5 : OUT std_logic_vector(6 DOWNTO 0);
	HEX1 : OUT std_logic_vector(6 DOWNTO 0);
	GPIO_10 : IN std_logic
	);
END top_level;

-- Design Ports Information
-- KEY[3]	=>  Location: PIN_F25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- AUD_DACDAT	=>  Location: PIN_AB3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- AUD_BCLK	=>  Location: PIN_AC3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- AUD_XCK	=>  Location: PIN_Y14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- AUD_DACLRCK	=>  Location: PIN_AA4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- AUD_ADCLRCK	=>  Location: PIN_AA3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- I2C_SCLK	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[0]	=>  Location: PIN_J16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[1]	=>  Location: PIN_E12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[2]	=>  Location: PIN_AF4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[3]	=>  Location: PIN_AC19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[4]	=>  Location: PIN_U23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[5]	=>  Location: PIN_J19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[6]	=>  Location: PIN_AE14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[7]	=>  Location: PIN_H12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[0]	=>  Location: PIN_E7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[1]	=>  Location: PIN_V26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[2]	=>  Location: PIN_D6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[3]	=>  Location: PIN_G9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[4]	=>  Location: PIN_D7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[5]	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[6]	=>  Location: PIN_C5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[0]	=>  Location: PIN_G4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[1]	=>  Location: PIN_G10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[2]	=>  Location: PIN_U5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[3]	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[4]	=>  Location: PIN_W26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[5]	=>  Location: PIN_AA8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[6]	=>  Location: PIN_G13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[0]	=>  Location: PIN_E4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[1]	=>  Location: PIN_AC18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[2]	=>  Location: PIN_E5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[3]	=>  Location: PIN_C3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[4]	=>  Location: PIN_D4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[5]	=>  Location: PIN_A3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[6]	=>  Location: PIN_B3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[0]	=>  Location: PIN_A4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[1]	=>  Location: PIN_G8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[2]	=>  Location: PIN_H8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[3]	=>  Location: PIN_B4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[4]	=>  Location: PIN_F7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[5]	=>  Location: PIN_E8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[6]	=>  Location: PIN_C4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[0]	=>  Location: PIN_AF15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[1]	=>  Location: PIN_D23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[2]	=>  Location: PIN_H19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[3]	=>  Location: PIN_AB17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[4]	=>  Location: PIN_W4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[5]	=>  Location: PIN_AH25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[6]	=>  Location: PIN_Y3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[0]	=>  Location: PIN_AF22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[1]	=>  Location: PIN_R5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[2]	=>  Location: PIN_U8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[3]	=>  Location: PIN_AG17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[4]	=>  Location: PIN_AD18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[5]	=>  Location: PIN_D11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[6]	=>  Location: PIN_E24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_AE22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[2]	=>  Location: PIN_AB10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[3]	=>  Location: PIN_AB24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[4]	=>  Location: PIN_J13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[5]	=>  Location: PIN_J6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[6]	=>  Location: PIN_F10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[7]	=>  Location: PIN_U1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[8]	=>  Location: PIN_AE18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[9]	=>  Location: PIN_Y15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[10]	=>  Location: PIN_AH22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[11]	=>  Location: PIN_C10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[12]	=>  Location: PIN_C24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[13]	=>  Location: PIN_F14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- GPIO_10	=>  Location: PIN_V25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[2]	=>  Location: PIN_L1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- I2C_SDAT	=>  Location: PIN_AF17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[0]	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK_50	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[14]	=>  Location: PIN_AD1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[15]	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[1]	=>  Location: PIN_G7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[17]	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- AUD_ADCDAT	=>  Location: PIN_AC1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[16]	=>  Location: PIN_E17,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF top_level IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL ww_KEY : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_SW : std_logic_vector(17 DOWNTO 0);
SIGNAL ww_AUD_ADCDAT : std_logic;
SIGNAL ww_AUD_DACDAT : std_logic;
SIGNAL ww_AUD_BCLK : std_logic;
SIGNAL ww_AUD_XCK : std_logic;
SIGNAL ww_AUD_DACLRCK : std_logic;
SIGNAL ww_AUD_ADCLRCK : std_logic;
SIGNAL ww_I2C_SCLK : std_logic;
SIGNAL ww_LEDG : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_HEX0 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX3 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX2 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX4 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX5 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_GPIO_10 : std_logic;
SIGNAL \KEY[0]~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \CLOCK_50~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \KEY[3]~input_o\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \SW[2]~input_o\ : std_logic;
SIGNAL \SW[3]~input_o\ : std_logic;
SIGNAL \SW[4]~input_o\ : std_logic;
SIGNAL \SW[5]~input_o\ : std_logic;
SIGNAL \SW[6]~input_o\ : std_logic;
SIGNAL \SW[7]~input_o\ : std_logic;
SIGNAL \SW[8]~input_o\ : std_logic;
SIGNAL \SW[9]~input_o\ : std_logic;
SIGNAL \SW[10]~input_o\ : std_logic;
SIGNAL \SW[11]~input_o\ : std_logic;
SIGNAL \SW[12]~input_o\ : std_logic;
SIGNAL \SW[13]~input_o\ : std_logic;
SIGNAL \GPIO_10~input_o\ : std_logic;
SIGNAL \KEY[2]~input_o\ : std_logic;
SIGNAL \I2C_SDAT~output_o\ : std_logic;
SIGNAL \AUD_DACDAT~output_o\ : std_logic;
SIGNAL \AUD_BCLK~output_o\ : std_logic;
SIGNAL \AUD_XCK~output_o\ : std_logic;
SIGNAL \AUD_DACLRCK~output_o\ : std_logic;
SIGNAL \AUD_ADCLRCK~output_o\ : std_logic;
SIGNAL \I2C_SCLK~output_o\ : std_logic;
SIGNAL \LEDG[0]~output_o\ : std_logic;
SIGNAL \LEDG[1]~output_o\ : std_logic;
SIGNAL \LEDG[2]~output_o\ : std_logic;
SIGNAL \LEDG[3]~output_o\ : std_logic;
SIGNAL \LEDG[4]~output_o\ : std_logic;
SIGNAL \LEDG[5]~output_o\ : std_logic;
SIGNAL \LEDG[6]~output_o\ : std_logic;
SIGNAL \LEDG[7]~output_o\ : std_logic;
SIGNAL \HEX0[0]~output_o\ : std_logic;
SIGNAL \HEX0[1]~output_o\ : std_logic;
SIGNAL \HEX0[2]~output_o\ : std_logic;
SIGNAL \HEX0[3]~output_o\ : std_logic;
SIGNAL \HEX0[4]~output_o\ : std_logic;
SIGNAL \HEX0[5]~output_o\ : std_logic;
SIGNAL \HEX0[6]~output_o\ : std_logic;
SIGNAL \HEX3[0]~output_o\ : std_logic;
SIGNAL \HEX3[1]~output_o\ : std_logic;
SIGNAL \HEX3[2]~output_o\ : std_logic;
SIGNAL \HEX3[3]~output_o\ : std_logic;
SIGNAL \HEX3[4]~output_o\ : std_logic;
SIGNAL \HEX3[5]~output_o\ : std_logic;
SIGNAL \HEX3[6]~output_o\ : std_logic;
SIGNAL \HEX2[0]~output_o\ : std_logic;
SIGNAL \HEX2[1]~output_o\ : std_logic;
SIGNAL \HEX2[2]~output_o\ : std_logic;
SIGNAL \HEX2[3]~output_o\ : std_logic;
SIGNAL \HEX2[4]~output_o\ : std_logic;
SIGNAL \HEX2[5]~output_o\ : std_logic;
SIGNAL \HEX2[6]~output_o\ : std_logic;
SIGNAL \HEX4[0]~output_o\ : std_logic;
SIGNAL \HEX4[1]~output_o\ : std_logic;
SIGNAL \HEX4[2]~output_o\ : std_logic;
SIGNAL \HEX4[3]~output_o\ : std_logic;
SIGNAL \HEX4[4]~output_o\ : std_logic;
SIGNAL \HEX4[5]~output_o\ : std_logic;
SIGNAL \HEX4[6]~output_o\ : std_logic;
SIGNAL \HEX5[0]~output_o\ : std_logic;
SIGNAL \HEX5[1]~output_o\ : std_logic;
SIGNAL \HEX5[2]~output_o\ : std_logic;
SIGNAL \HEX5[3]~output_o\ : std_logic;
SIGNAL \HEX5[4]~output_o\ : std_logic;
SIGNAL \HEX5[5]~output_o\ : std_logic;
SIGNAL \HEX5[6]~output_o\ : std_logic;
SIGNAL \HEX1[0]~output_o\ : std_logic;
SIGNAL \HEX1[1]~output_o\ : std_logic;
SIGNAL \HEX1[2]~output_o\ : std_logic;
SIGNAL \HEX1[3]~output_o\ : std_logic;
SIGNAL \HEX1[4]~output_o\ : std_logic;
SIGNAL \HEX1[5]~output_o\ : std_logic;
SIGNAL \HEX1[6]~output_o\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \CLOCK_50~inputclkctrl_outclk\ : std_logic;
SIGNAL \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[0]~3_combout\ : std_logic;
SIGNAL \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[1]~2_combout\ : std_logic;
SIGNAL \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[2]~1_combout\ : std_logic;
SIGNAL \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~0_combout\ : std_logic;
SIGNAL \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~feeder_combout\ : std_logic;
SIGNAL \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_bclk~0_combout\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \KEY[0]~inputclkctrl_outclk\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_bclk~q\ : std_logic;
SIGNAL \I2C_MASTER_INST|clk_divider[1]~4_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|clk_divider[1]~5\ : std_logic;
SIGNAL \I2C_MASTER_INST|clk_divider[2]~6_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|clk_divider[2]~7\ : std_logic;
SIGNAL \I2C_MASTER_INST|clk_divider[3]~8_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|clk_divider[3]~9\ : std_logic;
SIGNAL \I2C_MASTER_INST|clk_divider[4]~10_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Equal3~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Equal2~0_combout\ : std_logic;
SIGNAL \I2C_SDAT~input_o\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector30~3_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|next_ack_error~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector28~0_combout\ : std_logic;
SIGNAL \SW[17]~input_o\ : std_logic;
SIGNAL \INFRASTRUCTURE_BLOCK_INST|sync_inst17|qreg[1]~feeder_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|next_ack_error~1_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|ack_error~q\ : std_logic;
SIGNAL \I2C_MASTER_INST|next_write_done~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|write_done~q\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Selector2~0_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|zustand.send~q\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~0_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~1\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~2_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|next_reg_idx~1_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~3\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~4_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~5\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~6_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|next_reg_idx~0_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~7\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~8_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~9\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~10_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~11\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~12_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~13\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~14_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~15\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~16_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~17\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~18_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~19\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~20_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~21\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~22_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~23\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~24_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Equal0~6_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~25\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~26_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~27\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~28_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~29\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~30_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~31\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~32_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Equal0~5_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Equal0~7_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Equal0~8_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~33\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~34_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~35\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~36_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~37\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~38_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~39\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~40_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Equal0~3_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~41\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~42_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~43\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~44_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~45\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~46_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~47\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~48_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~49\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~50_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~51\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~52_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~53\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~54_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~55\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~56_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Equal0~1_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Equal0~2_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~57\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~58_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~59\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Add0~60_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Equal0~0_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Equal0~4_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Equal0~9_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Selector0~0_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Selector0~1_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|zustand.idle~q\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Selector1~0_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Selector1~1_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|zustand.start_write~q\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector30~1_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector28~1_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector31~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector28~2_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|fsm_state.S_WAIT_FOR_NEXT_BYTE~q\ : std_logic;
SIGNAL \I2C_MASTER_INST|fsm_state.S_START~feeder_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|fsm_state.S_START~q\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector0~2_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector29~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|fsm_state.S_SEND_BYTE~q\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector37~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|bit_count[2]~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector36~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector35~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Equal0~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector30~4_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|fsm_state.S_ACK_BYTE~q\ : std_logic;
SIGNAL \I2C_MASTER_INST|next_scl~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|ack~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|ack~q\ : std_logic;
SIGNAL \I2C_MASTER_INST|byte_count[0]~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|byte_count[0]~1_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Add0~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector31~1_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector31~2_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|fsm_state.S_WAIT_FOR_STOP~q\ : std_logic;
SIGNAL \I2C_MASTER_INST|fsm_state.S_STOP~feeder_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|fsm_state.S_STOP~q\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector25~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|fsm_state.S_IDLE~q\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector30~2_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector26~2_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector26~3_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector26~4_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|fsm_state.S_WAIT_FOR_START~q\ : std_logic;
SIGNAL \SW[16]~input_o\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector20~3_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Mux3~0_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Equal0~10_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector21~2_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|Mux4~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector24~1_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector0~6_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector20~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector23~1_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector24~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector24~2_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector23~2_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector23~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector23~3_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector23~4_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector22~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|data[23]~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|data[23]~1_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector21~1_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector21~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector21~3_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector20~2_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector20~1_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector20~4_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector19~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector18~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector17~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector16~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector15~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector14~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector13~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector12~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector11~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector10~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector9~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector8~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector7~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector6~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector5~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector4~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector3~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector2~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector1~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector0~4_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector0~3_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector0~5_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector0~8_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|Selector0~7_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|sda~q\ : std_logic;
SIGNAL \SW[15]~input_o\ : std_logic;
SIGNAL \INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg[1]~feeder_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector4~0_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[0]~31_combout\ : std_logic;
SIGNAL \~GND~combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[0]~32\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[1]~33_combout\ : std_logic;
SIGNAL \INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg[0]~_wirecell_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|folge_zustand~0_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[1]~34\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[2]~37_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[2]~38\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[3]~39_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[3]~40\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[4]~41_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[4]~42\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~43_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~44\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[6]~45_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[6]~46\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[7]~47_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[7]~48\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[8]~49_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[8]~50\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[9]~51_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[9]~52\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[10]~53_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[10]~54\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[11]~55_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[11]~56\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[12]~57_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[12]~58\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[13]~59_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[13]~60\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[14]~61_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[14]~62\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[15]~63_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[15]~64\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[16]~65_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[16]~66\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[17]~67_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[17]~68\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[18]~69_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[18]~70\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[19]~71_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[19]~72\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[20]~73_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~3_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~0_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~2_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~1_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~4_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[20]~74\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[21]~75_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[21]~76\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[22]~77_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[22]~78\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[23]~79_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[23]~80\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[24]~81_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~5_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[24]~82\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[25]~83_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[25]~84\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[26]~85_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[26]~86\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[27]~87_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[27]~88\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[28]~89_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[28]~90\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[29]~91_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[29]~92\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[30]~93_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~6_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~7_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ws_logik~0_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~35_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~36_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~11_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ws_logik~1_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector4~3_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|next_s_WS~0_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_WS~q\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector4~1_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector4~2_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~9_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~8_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~10_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector4~4_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.shift_adc_R~q\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector0~0_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector0~1_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector0~2_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.hold_R~q\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector1~0_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.load_dac~q\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector2~0_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector2~1_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.shift_adc_L~q\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector3~0_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector3~1_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.hold_L~q\ : std_logic;
SIGNAL \AUD_ADCDAT~input_o\ : std_logic;
SIGNAL \I2S_MASTER_INST|S2P_INST|l_zustand[0]~feeder_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|S2P_INST|einganglog_l~0_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|S2P_INST|l_zustand[1]~feeder_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|S2P_INST|l_zustand[2]~feeder_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|S2P_INST|l_zustand[3]~feeder_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|S2P_INST|l_zustand[4]~feeder_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|S2P_INST|l_zustand[5]~feeder_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|S2P_INST|l_zustand[6]~feeder_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|S2P_INST|l_zustand[7]~feeder_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|S2P_INST|l_zustand[8]~feeder_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|S2P_INST|l_zustand[9]~feeder_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|S2P_INST|l_zustand[10]~feeder_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|S2P_INST|l_zustand[11]~feeder_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|S2P_INST|l_zustand[12]~feeder_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|S2P_INST|l_zustand[13]~feeder_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|S2P_INST|l_zustand[15]~feeder_combout\ : std_logic;
SIGNAL \SW[14]~input_o\ : std_logic;
SIGNAL \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg[1]~feeder_combout\ : std_logic;
SIGNAL \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg[0]~feeder_combout\ : std_logic;
SIGNAL \AUDIO_CONTROL_INST|DACDAT_pl_o[15]~0_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|P2S_INST|l_folgezustand[14]~1_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|P2S_INST|l_folgezustand[13]~2_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|P2S_INST|l_folgezustand[12]~3_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|P2S_INST|l_folgezustand[11]~4_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|P2S_INST|l_folgezustand[10]~5_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|P2S_INST|l_folgezustand[9]~6_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|P2S_INST|l_folgezustand[8]~7_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|P2S_INST|l_folgezustand[7]~8_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|P2S_INST|l_folgezustand[6]~9_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|P2S_INST|l_folgezustand[5]~10_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|P2S_INST|l_folgezustand[4]~11_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|P2S_INST|l_folgezustand[3]~12_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|P2S_INST|l_folgezustand[2]~13_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|P2S_INST|l_folgezustand[1]~14_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|P2S_INST|l_folgezustand[0]~15_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|P2S_INST|l_folgezustand[15]~0_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|S2P_INST|r_zustand[0]~feeder_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|S2P_INST|einganglog_r~0_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|S2P_INST|r_zustand[1]~feeder_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|S2P_INST|r_zustand[2]~feeder_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|S2P_INST|r_zustand[3]~feeder_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|S2P_INST|r_zustand[4]~feeder_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|S2P_INST|r_zustand[5]~feeder_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|S2P_INST|r_zustand[6]~feeder_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|S2P_INST|r_zustand[7]~feeder_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|S2P_INST|r_zustand[8]~feeder_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|S2P_INST|r_zustand[9]~feeder_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|S2P_INST|r_zustand[10]~feeder_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|S2P_INST|r_zustand[11]~feeder_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|S2P_INST|r_zustand[12]~feeder_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|S2P_INST|r_zustand[13]~feeder_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|S2P_INST|r_zustand[14]~feeder_combout\ : std_logic;
SIGNAL \AUDIO_CONTROL_INST|DACDAT_pr_o[15]~0_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|P2S_INST|r_folgezustand[14]~1_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|P2S_INST|r_folgezustand[13]~2_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|P2S_INST|r_folgezustand[12]~3_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|P2S_INST|r_folgezustand[11]~4_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|P2S_INST|r_folgezustand[10]~5_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|P2S_INST|r_folgezustand[9]~6_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|P2S_INST|r_folgezustand[8]~7_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|P2S_INST|r_folgezustand[7]~8_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|P2S_INST|r_folgezustand[6]~9_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|P2S_INST|r_folgezustand[5]~10_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|P2S_INST|r_folgezustand[4]~11_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|P2S_INST|r_folgezustand[3]~12_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|P2S_INST|r_folgezustand[2]~13_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|P2S_INST|r_folgezustand[1]~14_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|P2S_INST|r_folgezustand[0]~15_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|P2S_INST|r_folgezustand[15]~0_combout\ : std_logic;
SIGNAL \I2S_MASTER_INST|P2S_INST|DACDAT_s_o~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|next_scl~1_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|next_scl~2_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|scl~q\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|LED_out~0_combout\ : std_logic;
SIGNAL \CODECCONTROLLER_INST|LED_out~q\ : std_logic;
SIGNAL \FM_CODER_7SEGMENT_INST|next_reg_idx_ratio~0_combout\ : std_logic;
SIGNAL \KEY[1]~input_o\ : std_logic;
SIGNAL \INFRASTRUCTURE_BLOCK_INST|sync_inst19|qreg[1]~feeder_combout\ : std_logic;
SIGNAL \INFRASTRUCTURE_BLOCK_INST|sync_inst19|qreg[0]~feeder_combout\ : std_logic;
SIGNAL \FM_CODER_7SEGMENT_INST|delay_count[1]~feeder_combout\ : std_logic;
SIGNAL \INFRASTRUCTURE_BLOCK_INST|sync_inst18|qreg[1]~feeder_combout\ : std_logic;
SIGNAL \INFRASTRUCTURE_BLOCK_INST|sync_inst18|qreg[0]~feeder_combout\ : std_logic;
SIGNAL \FM_CODER_7SEGMENT_INST|reg_idx_ratio[2]~0_combout\ : std_logic;
SIGNAL \FM_CODER_7SEGMENT_INST|next_reg_idx_ratio~1_combout\ : std_logic;
SIGNAL \FM_CODER_7SEGMENT_INST|next_reg_idx_ratio~2_combout\ : std_logic;
SIGNAL \FM_CODER_7SEGMENT_INST|Mux11~0_combout\ : std_logic;
SIGNAL \FM_CODER_7SEGMENT_INST|Mux7~0_combout\ : std_logic;
SIGNAL \FM_CODER_7SEGMENT_INST|Mux6~0_combout\ : std_logic;
SIGNAL \FM_CODER_7SEGMENT_INST|Mux5~0_combout\ : std_logic;
SIGNAL \FM_CODER_7SEGMENT_INST|Mux1~0_combout\ : std_logic;
SIGNAL \FM_CODER_7SEGMENT_INST|Mux5~1_combout\ : std_logic;
SIGNAL \FM_CODER_7SEGMENT_INST|reg_idx_depth[0]~1_combout\ : std_logic;
SIGNAL \FM_CODER_7SEGMENT_INST|Mux17~1_combout\ : std_logic;
SIGNAL \FM_CODER_7SEGMENT_INST|reg_idx_depth[2]~0_combout\ : std_logic;
SIGNAL \FM_CODER_7SEGMENT_INST|Mux18~0_combout\ : std_logic;
SIGNAL \FM_CODER_7SEGMENT_INST|Mux17~0_combout\ : std_logic;
SIGNAL \FM_CODER_7SEGMENT_INST|Mux16~0_combout\ : std_logic;
SIGNAL \FM_CODER_7SEGMENT_INST|Mux15~0_combout\ : std_logic;
SIGNAL \FM_CODER_7SEGMENT_INST|Mux14~0_combout\ : std_logic;
SIGNAL \FM_CODER_7SEGMENT_INST|Mux13~0_combout\ : std_logic;
SIGNAL \FM_CODER_7SEGMENT_INST|Mux12~0_combout\ : std_logic;
SIGNAL \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \I2C_MASTER_INST|clk_divider\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \I2C_MASTER_INST|byte_count\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \I2S_MASTER_INST|P2S_INST|l_zustand\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \INFRASTRUCTURE_BLOCK_INST|sync_inst16|qreg\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \I2C_MASTER_INST|bit_count\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \INFRASTRUCTURE_BLOCK_INST|sync_inst17|qreg\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \INFRASTRUCTURE_BLOCK_INST|divider_inst|count\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \INFRASTRUCTURE_BLOCK_INST|sync_inst19|qreg\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \I2C_MASTER_INST|data\ : std_logic_vector(23 DOWNTO 0);
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\ : std_logic_vector(30 DOWNTO 0);
SIGNAL \I2S_MASTER_INST|S2P_INST|r_zustand\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \I2C_MASTER_INST|clk_edge_mask\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \I2S_MASTER_INST|P2S_INST|r_zustand\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \FM_CODER_7SEGMENT_INST|reg_idx_ratio\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \FM_CODER_7SEGMENT_INST|reg_idx_depth\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \I2C_MASTER_INST|clk_mask\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \I2S_MASTER_INST|S2P_INST|l_zustand\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \FM_CODER_7SEGMENT_INST|delay_count\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \INFRASTRUCTURE_BLOCK_INST|sync_inst18|qreg\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \CODECCONTROLLER_INST|reg_idx\ : std_logic_vector(30 DOWNTO 0);
SIGNAL \FM_CODER_7SEGMENT_INST|counter_on\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \I2C_MASTER_INST|ALT_INV_sda~q\ : std_logic;
SIGNAL \I2C_MASTER_INST|ALT_INV_fsm_state.S_SEND_BYTE~q\ : std_logic;
SIGNAL \I2C_MASTER_INST|ALT_INV_fsm_state.S_STOP~q\ : std_logic;
SIGNAL \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ALT_INV_zustand.load_dac~q\ : std_logic;
SIGNAL \FM_CODER_7SEGMENT_INST|ALT_INV_Mux5~1_combout\ : std_logic;
SIGNAL \FM_CODER_7SEGMENT_INST|ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \FM_CODER_7SEGMENT_INST|ALT_INV_Mux5~0_combout\ : std_logic;
SIGNAL \FM_CODER_7SEGMENT_INST|ALT_INV_Mux6~0_combout\ : std_logic;
SIGNAL \FM_CODER_7SEGMENT_INST|ALT_INV_Mux11~0_combout\ : std_logic;
SIGNAL \I2C_MASTER_INST|ALT_INV_scl~q\ : std_logic;

BEGIN

ww_CLOCK_50 <= CLOCK_50;
ww_KEY <= KEY;
ww_SW <= SW;
ww_AUD_ADCDAT <= AUD_ADCDAT;
AUD_DACDAT <= ww_AUD_DACDAT;
AUD_BCLK <= ww_AUD_BCLK;
AUD_XCK <= ww_AUD_XCK;
AUD_DACLRCK <= ww_AUD_DACLRCK;
AUD_ADCLRCK <= ww_AUD_ADCLRCK;
I2C_SCLK <= ww_I2C_SCLK;
LEDG <= ww_LEDG;
HEX0 <= ww_HEX0;
HEX3 <= ww_HEX3;
HEX2 <= ww_HEX2;
HEX4 <= ww_HEX4;
HEX5 <= ww_HEX5;
HEX1 <= ww_HEX1;
ww_GPIO_10 <= GPIO_10;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\KEY[0]~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \KEY[0]~input_o\);

\INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \INFRASTRUCTURE_BLOCK_INST|divider_inst|count\(3));

\CLOCK_50~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLOCK_50~input_o\);
\I2C_MASTER_INST|ALT_INV_sda~q\ <= NOT \I2C_MASTER_INST|sda~q\;
\I2C_MASTER_INST|ALT_INV_fsm_state.S_SEND_BYTE~q\ <= NOT \I2C_MASTER_INST|fsm_state.S_SEND_BYTE~q\;
\I2C_MASTER_INST|ALT_INV_fsm_state.S_STOP~q\ <= NOT \I2C_MASTER_INST|fsm_state.S_STOP~q\;
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ALT_INV_zustand.load_dac~q\ <= NOT \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.load_dac~q\;
\FM_CODER_7SEGMENT_INST|ALT_INV_Mux5~1_combout\ <= NOT \FM_CODER_7SEGMENT_INST|Mux5~1_combout\;
\FM_CODER_7SEGMENT_INST|ALT_INV_Mux1~0_combout\ <= NOT \FM_CODER_7SEGMENT_INST|Mux1~0_combout\;
\FM_CODER_7SEGMENT_INST|ALT_INV_Mux5~0_combout\ <= NOT \FM_CODER_7SEGMENT_INST|Mux5~0_combout\;
\FM_CODER_7SEGMENT_INST|ALT_INV_Mux6~0_combout\ <= NOT \FM_CODER_7SEGMENT_INST|Mux6~0_combout\;
\FM_CODER_7SEGMENT_INST|ALT_INV_Mux11~0_combout\ <= NOT \FM_CODER_7SEGMENT_INST|Mux11~0_combout\;
\I2C_MASTER_INST|ALT_INV_scl~q\ <= NOT \I2C_MASTER_INST|scl~q\;

-- Location: IOOBUF_X67_Y0_N2
\I2C_SDAT~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => \I2C_MASTER_INST|ALT_INV_sda~q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \I2C_SDAT~output_o\);

-- Location: IOOBUF_X0_Y21_N23
\AUD_DACDAT~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \I2S_MASTER_INST|P2S_INST|DACDAT_s_o~0_combout\,
	devoe => ww_devoe,
	o => \AUD_DACDAT~output_o\);

-- Location: IOOBUF_X0_Y23_N23
\AUD_BCLK~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_bclk~q\,
	devoe => ww_devoe,
	o => \AUD_BCLK~output_o\);

-- Location: IOOBUF_X56_Y0_N9
\AUD_XCK~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count\(3),
	devoe => ww_devoe,
	o => \AUD_XCK~output_o\);

-- Location: IOOBUF_X0_Y19_N2
\AUD_DACLRCK~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_WS~q\,
	devoe => ww_devoe,
	o => \AUD_DACLRCK~output_o\);

-- Location: IOOBUF_X0_Y19_N9
\AUD_ADCLRCK~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_WS~q\,
	devoe => ww_devoe,
	o => \AUD_ADCLRCK~output_o\);

-- Location: IOOBUF_X67_Y73_N2
\I2C_SCLK~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \I2C_MASTER_INST|ALT_INV_scl~q\,
	devoe => ww_devoe,
	o => \I2C_SCLK~output_o\);

-- Location: IOOBUF_X65_Y73_N16
\LEDG[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \CODECCONTROLLER_INST|LED_out~q\,
	devoe => ww_devoe,
	o => \LEDG[0]~output_o\);

-- Location: IOOBUF_X33_Y73_N2
\LEDG[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDG[1]~output_o\);

-- Location: IOOBUF_X1_Y0_N2
\LEDG[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDG[2]~output_o\);

-- Location: IOOBUF_X94_Y0_N9
\LEDG[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDG[3]~output_o\);

-- Location: IOOBUF_X115_Y22_N2
\LEDG[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDG[4]~output_o\);

-- Location: IOOBUF_X72_Y73_N9
\LEDG[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDG[5]~output_o\);

-- Location: IOOBUF_X49_Y0_N23
\LEDG[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDG[6]~output_o\);

-- Location: IOOBUF_X25_Y73_N23
\LEDG[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDG[7]~output_o\);

-- Location: IOOBUF_X13_Y73_N9
\HEX0[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \FM_CODER_7SEGMENT_INST|ALT_INV_Mux11~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[0]~output_o\);

-- Location: IOOBUF_X115_Y23_N9
\HEX0[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX0[1]~output_o\);

-- Location: IOOBUF_X13_Y73_N16
\HEX0[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \FM_CODER_7SEGMENT_INST|Mux11~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[2]~output_o\);

-- Location: IOOBUF_X13_Y73_N23
\HEX0[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \FM_CODER_7SEGMENT_INST|ALT_INV_Mux11~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[3]~output_o\);

-- Location: IOOBUF_X13_Y73_N2
\HEX0[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \FM_CODER_7SEGMENT_INST|ALT_INV_Mux11~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[4]~output_o\);

-- Location: IOOBUF_X5_Y73_N23
\HEX0[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \FM_CODER_7SEGMENT_INST|Mux7~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[5]~output_o\);

-- Location: IOOBUF_X3_Y73_N9
\HEX0[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \FM_CODER_7SEGMENT_INST|ALT_INV_Mux6~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[6]~output_o\);

-- Location: IOOBUF_X0_Y63_N16
\HEX3[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX3[0]~output_o\);

-- Location: IOOBUF_X20_Y73_N9
\HEX3[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX3[1]~output_o\);

-- Location: IOOBUF_X0_Y24_N2
\HEX3[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX3[2]~output_o\);

-- Location: IOOBUF_X20_Y73_N16
\HEX3[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX3[3]~output_o\);

-- Location: IOOBUF_X115_Y19_N2
\HEX3[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX3[4]~output_o\);

-- Location: IOOBUF_X18_Y0_N16
\HEX3[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX3[5]~output_o\);

-- Location: IOOBUF_X38_Y73_N16
\HEX3[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX3[6]~output_o\);

-- Location: IOOBUF_X1_Y73_N9
\HEX2[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \FM_CODER_7SEGMENT_INST|ALT_INV_Mux5~0_combout\,
	devoe => ww_devoe,
	o => \HEX2[0]~output_o\);

-- Location: IOOBUF_X87_Y0_N16
\HEX2[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX2[1]~output_o\);

-- Location: IOOBUF_X1_Y73_N16
\HEX2[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \FM_CODER_7SEGMENT_INST|Mux5~0_combout\,
	devoe => ww_devoe,
	o => \HEX2[2]~output_o\);

-- Location: IOOBUF_X1_Y73_N23
\HEX2[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \FM_CODER_7SEGMENT_INST|ALT_INV_Mux5~0_combout\,
	devoe => ww_devoe,
	o => \HEX2[3]~output_o\);

-- Location: IOOBUF_X1_Y73_N2
\HEX2[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \FM_CODER_7SEGMENT_INST|ALT_INV_Mux5~0_combout\,
	devoe => ww_devoe,
	o => \HEX2[4]~output_o\);

-- Location: IOOBUF_X5_Y73_N9
\HEX2[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \FM_CODER_7SEGMENT_INST|ALT_INV_Mux1~0_combout\,
	devoe => ww_devoe,
	o => \HEX2[5]~output_o\);

-- Location: IOOBUF_X5_Y73_N2
\HEX2[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \FM_CODER_7SEGMENT_INST|ALT_INV_Mux5~1_combout\,
	devoe => ww_devoe,
	o => \HEX2[6]~output_o\);

-- Location: IOOBUF_X7_Y73_N16
\HEX4[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \FM_CODER_7SEGMENT_INST|Mux18~0_combout\,
	devoe => ww_devoe,
	o => \HEX4[0]~output_o\);

-- Location: IOOBUF_X11_Y73_N16
\HEX4[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \FM_CODER_7SEGMENT_INST|Mux17~0_combout\,
	devoe => ww_devoe,
	o => \HEX4[1]~output_o\);

-- Location: IOOBUF_X11_Y73_N23
\HEX4[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \FM_CODER_7SEGMENT_INST|Mux16~0_combout\,
	devoe => ww_devoe,
	o => \HEX4[2]~output_o\);

-- Location: IOOBUF_X7_Y73_N23
\HEX4[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \FM_CODER_7SEGMENT_INST|Mux15~0_combout\,
	devoe => ww_devoe,
	o => \HEX4[3]~output_o\);

-- Location: IOOBUF_X9_Y73_N9
\HEX4[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \FM_CODER_7SEGMENT_INST|Mux14~0_combout\,
	devoe => ww_devoe,
	o => \HEX4[4]~output_o\);

-- Location: IOOBUF_X11_Y73_N2
\HEX4[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \FM_CODER_7SEGMENT_INST|Mux13~0_combout\,
	devoe => ww_devoe,
	o => \HEX4[5]~output_o\);

-- Location: IOOBUF_X3_Y73_N23
\HEX4[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \FM_CODER_7SEGMENT_INST|Mux12~0_combout\,
	devoe => ww_devoe,
	o => \HEX4[6]~output_o\);

-- Location: IOOBUF_X60_Y0_N2
\HEX5[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX5[0]~output_o\);

-- Location: IOOBUF_X100_Y73_N16
\HEX5[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX5[1]~output_o\);

-- Location: IOOBUF_X72_Y73_N2
\HEX5[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX5[2]~output_o\);

-- Location: IOOBUF_X89_Y0_N16
\HEX5[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX5[3]~output_o\);

-- Location: IOOBUF_X0_Y14_N9
\HEX5[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX5[4]~output_o\);

-- Location: IOOBUF_X91_Y0_N16
\HEX5[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX5[5]~output_o\);

-- Location: IOOBUF_X0_Y24_N16
\HEX5[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX5[6]~output_o\);

-- Location: IOOBUF_X96_Y0_N2
\HEX1[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX1[0]~output_o\);

-- Location: IOOBUF_X0_Y32_N23
\HEX1[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX1[1]~output_o\);

-- Location: IOOBUF_X0_Y18_N23
\HEX1[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX1[2]~output_o\);

-- Location: IOOBUF_X62_Y0_N23
\HEX1[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX1[3]~output_o\);

-- Location: IOOBUF_X85_Y0_N9
\HEX1[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX1[4]~output_o\);

-- Location: IOOBUF_X23_Y73_N9
\HEX1[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX1[5]~output_o\);

-- Location: IOOBUF_X85_Y73_N23
\HEX1[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX1[6]~output_o\);

-- Location: IOIBUF_X0_Y36_N8
\CLOCK_50~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

-- Location: CLKCTRL_G2
\CLOCK_50~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLOCK_50~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLOCK_50~inputclkctrl_outclk\);

-- Location: LCCOMB_X58_Y1_N28
\INFRASTRUCTURE_BLOCK_INST|divider_inst|count[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[0]~3_combout\ = !\INFRASTRUCTURE_BLOCK_INST|divider_inst|count\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count\(0),
	combout => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[0]~3_combout\);

-- Location: FF_X58_Y1_N29
\INFRASTRUCTURE_BLOCK_INST|divider_inst|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count\(0));

-- Location: LCCOMB_X58_Y1_N30
\INFRASTRUCTURE_BLOCK_INST|divider_inst|count[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[1]~2_combout\ = \INFRASTRUCTURE_BLOCK_INST|divider_inst|count\(1) $ (\INFRASTRUCTURE_BLOCK_INST|divider_inst|count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count\(1),
	datad => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count\(0),
	combout => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[1]~2_combout\);

-- Location: FF_X58_Y1_N31
\INFRASTRUCTURE_BLOCK_INST|divider_inst|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count\(1));

-- Location: LCCOMB_X58_Y1_N16
\INFRASTRUCTURE_BLOCK_INST|divider_inst|count[2]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[2]~1_combout\ = \INFRASTRUCTURE_BLOCK_INST|divider_inst|count\(2) $ (((\INFRASTRUCTURE_BLOCK_INST|divider_inst|count\(1) & \INFRASTRUCTURE_BLOCK_INST|divider_inst|count\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count\(1),
	datac => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count\(2),
	datad => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count\(0),
	combout => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[2]~1_combout\);

-- Location: FF_X58_Y1_N17
\INFRASTRUCTURE_BLOCK_INST|divider_inst|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count\(2));

-- Location: LCCOMB_X58_Y1_N24
\INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~0_combout\ = \INFRASTRUCTURE_BLOCK_INST|divider_inst|count\(3) $ (((\INFRASTRUCTURE_BLOCK_INST|divider_inst|count\(0) & (\INFRASTRUCTURE_BLOCK_INST|divider_inst|count\(1) & 
-- \INFRASTRUCTURE_BLOCK_INST|divider_inst|count\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count\(3),
	datab => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count\(0),
	datac => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count\(1),
	datad => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count\(2),
	combout => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~0_combout\);

-- Location: LCCOMB_X58_Y1_N18
\INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~feeder_combout\ = \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~0_combout\,
	combout => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~feeder_combout\);

-- Location: FF_X58_Y1_N19
\INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count\(3));

-- Location: CLKCTRL_G19
\INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\);

-- Location: LCCOMB_X9_Y20_N6
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_bclk~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_bclk~0_combout\ = !\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_bclk~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_bclk~q\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_bclk~0_combout\);

-- Location: IOIBUF_X0_Y36_N15
\KEY[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(0),
	o => \KEY[0]~input_o\);

-- Location: CLKCTRL_G4
\KEY[0]~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \KEY[0]~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \KEY[0]~inputclkctrl_outclk\);

-- Location: FF_X9_Y20_N7
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_bclk\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_bclk~0_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_bclk~q\);

-- Location: LCCOMB_X17_Y23_N6
\I2C_MASTER_INST|clk_divider[1]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|clk_divider[1]~4_combout\ = (\I2C_MASTER_INST|clk_divider\(1) & (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_bclk~q\ $ (VCC))) # (!\I2C_MASTER_INST|clk_divider\(1) & (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_bclk~q\ & VCC))
-- \I2C_MASTER_INST|clk_divider[1]~5\ = CARRY((\I2C_MASTER_INST|clk_divider\(1) & \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_bclk~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|clk_divider\(1),
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_bclk~q\,
	datad => VCC,
	combout => \I2C_MASTER_INST|clk_divider[1]~4_combout\,
	cout => \I2C_MASTER_INST|clk_divider[1]~5\);

-- Location: FF_X17_Y23_N7
\I2C_MASTER_INST|clk_divider[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|clk_divider[1]~4_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|clk_divider\(1));

-- Location: LCCOMB_X17_Y23_N8
\I2C_MASTER_INST|clk_divider[2]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|clk_divider[2]~6_combout\ = (\I2C_MASTER_INST|clk_divider\(2) & (!\I2C_MASTER_INST|clk_divider[1]~5\)) # (!\I2C_MASTER_INST|clk_divider\(2) & ((\I2C_MASTER_INST|clk_divider[1]~5\) # (GND)))
-- \I2C_MASTER_INST|clk_divider[2]~7\ = CARRY((!\I2C_MASTER_INST|clk_divider[1]~5\) # (!\I2C_MASTER_INST|clk_divider\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \I2C_MASTER_INST|clk_divider\(2),
	datad => VCC,
	cin => \I2C_MASTER_INST|clk_divider[1]~5\,
	combout => \I2C_MASTER_INST|clk_divider[2]~6_combout\,
	cout => \I2C_MASTER_INST|clk_divider[2]~7\);

-- Location: FF_X17_Y23_N9
\I2C_MASTER_INST|clk_divider[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|clk_divider[2]~6_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|clk_divider\(2));

-- Location: LCCOMB_X17_Y23_N10
\I2C_MASTER_INST|clk_divider[3]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|clk_divider[3]~8_combout\ = (\I2C_MASTER_INST|clk_divider\(3) & (\I2C_MASTER_INST|clk_divider[2]~7\ $ (GND))) # (!\I2C_MASTER_INST|clk_divider\(3) & (!\I2C_MASTER_INST|clk_divider[2]~7\ & VCC))
-- \I2C_MASTER_INST|clk_divider[3]~9\ = CARRY((\I2C_MASTER_INST|clk_divider\(3) & !\I2C_MASTER_INST|clk_divider[2]~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|clk_divider\(3),
	datad => VCC,
	cin => \I2C_MASTER_INST|clk_divider[2]~7\,
	combout => \I2C_MASTER_INST|clk_divider[3]~8_combout\,
	cout => \I2C_MASTER_INST|clk_divider[3]~9\);

-- Location: FF_X17_Y23_N11
\I2C_MASTER_INST|clk_divider[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|clk_divider[3]~8_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|clk_divider\(3));

-- Location: FF_X68_Y43_N21
\I2C_MASTER_INST|clk_mask[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	asdata => \I2C_MASTER_INST|clk_divider\(3),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|clk_mask\(0));

-- Location: FF_X68_Y43_N7
\I2C_MASTER_INST|clk_edge_mask[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	asdata => \I2C_MASTER_INST|clk_mask\(0),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|clk_edge_mask\(0));

-- Location: LCCOMB_X17_Y23_N12
\I2C_MASTER_INST|clk_divider[4]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|clk_divider[4]~10_combout\ = \I2C_MASTER_INST|clk_divider[3]~9\ $ (\I2C_MASTER_INST|clk_divider\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \I2C_MASTER_INST|clk_divider\(4),
	cin => \I2C_MASTER_INST|clk_divider[3]~9\,
	combout => \I2C_MASTER_INST|clk_divider[4]~10_combout\);

-- Location: FF_X17_Y23_N13
\I2C_MASTER_INST|clk_divider[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|clk_divider[4]~10_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|clk_divider\(4));

-- Location: FF_X68_Y43_N25
\I2C_MASTER_INST|clk_mask[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	asdata => \I2C_MASTER_INST|clk_divider\(4),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|clk_mask\(1));

-- Location: LCCOMB_X68_Y43_N8
\I2C_MASTER_INST|Equal3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Equal3~0_combout\ = (\I2C_MASTER_INST|clk_mask\(1) & ((\I2C_MASTER_INST|clk_mask\(0) $ (\I2C_MASTER_INST|clk_divider\(3))) # (!\I2C_MASTER_INST|clk_divider\(4)))) # (!\I2C_MASTER_INST|clk_mask\(1) & ((\I2C_MASTER_INST|clk_divider\(4)) # 
-- (\I2C_MASTER_INST|clk_mask\(0) $ (\I2C_MASTER_INST|clk_divider\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111110110111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|clk_mask\(1),
	datab => \I2C_MASTER_INST|clk_mask\(0),
	datac => \I2C_MASTER_INST|clk_divider\(3),
	datad => \I2C_MASTER_INST|clk_divider\(4),
	combout => \I2C_MASTER_INST|Equal3~0_combout\);

-- Location: FF_X68_Y43_N9
\I2C_MASTER_INST|clk_edge_mask[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|Equal3~0_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|clk_edge_mask\(2));

-- Location: FF_X68_Y43_N17
\I2C_MASTER_INST|clk_edge_mask[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	asdata => \I2C_MASTER_INST|clk_mask\(1),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|clk_edge_mask\(1));

-- Location: LCCOMB_X68_Y43_N24
\I2C_MASTER_INST|Equal2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Equal2~0_combout\ = (\I2C_MASTER_INST|clk_edge_mask\(0) & (\I2C_MASTER_INST|clk_edge_mask\(2) & !\I2C_MASTER_INST|clk_edge_mask\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|clk_edge_mask\(0),
	datab => \I2C_MASTER_INST|clk_edge_mask\(2),
	datad => \I2C_MASTER_INST|clk_edge_mask\(1),
	combout => \I2C_MASTER_INST|Equal2~0_combout\);

-- Location: IOIBUF_X67_Y0_N1
\I2C_SDAT~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => I2C_SDAT,
	o => \I2C_SDAT~input_o\);

-- Location: LCCOMB_X68_Y43_N22
\I2C_MASTER_INST|Selector30~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector30~3_combout\ = (\I2C_MASTER_INST|fsm_state.S_ACK_BYTE~q\ & ((\I2C_MASTER_INST|clk_edge_mask\(0)) # ((\I2C_MASTER_INST|clk_edge_mask\(1)) # (!\I2C_MASTER_INST|clk_edge_mask\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|clk_edge_mask\(0),
	datab => \I2C_MASTER_INST|clk_edge_mask\(2),
	datac => \I2C_MASTER_INST|fsm_state.S_ACK_BYTE~q\,
	datad => \I2C_MASTER_INST|clk_edge_mask\(1),
	combout => \I2C_MASTER_INST|Selector30~3_combout\);

-- Location: LCCOMB_X68_Y43_N4
\I2C_MASTER_INST|next_ack_error~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|next_ack_error~0_combout\ = (!\I2C_MASTER_INST|clk_edge_mask\(0) & (\I2C_MASTER_INST|clk_edge_mask\(2) & (\I2C_MASTER_INST|fsm_state.S_ACK_BYTE~q\ & !\I2C_MASTER_INST|clk_edge_mask\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|clk_edge_mask\(0),
	datab => \I2C_MASTER_INST|clk_edge_mask\(2),
	datac => \I2C_MASTER_INST|fsm_state.S_ACK_BYTE~q\,
	datad => \I2C_MASTER_INST|clk_edge_mask\(1),
	combout => \I2C_MASTER_INST|next_ack_error~0_combout\);

-- Location: LCCOMB_X69_Y43_N26
\I2C_MASTER_INST|Selector28~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector28~0_combout\ = (((!\I2C_MASTER_INST|Equal0~0_combout\ & \I2C_MASTER_INST|fsm_state.S_SEND_BYTE~q\)) # (!\I2C_MASTER_INST|Equal2~0_combout\)) # (!\I2C_MASTER_INST|fsm_state.S_IDLE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|Equal0~0_combout\,
	datab => \I2C_MASTER_INST|fsm_state.S_SEND_BYTE~q\,
	datac => \I2C_MASTER_INST|fsm_state.S_IDLE~q\,
	datad => \I2C_MASTER_INST|Equal2~0_combout\,
	combout => \I2C_MASTER_INST|Selector28~0_combout\);

-- Location: IOIBUF_X69_Y73_N15
\SW[17]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(17),
	o => \SW[17]~input_o\);

-- Location: LCCOMB_X69_Y42_N14
\INFRASTRUCTURE_BLOCK_INST|sync_inst17|qreg[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \INFRASTRUCTURE_BLOCK_INST|sync_inst17|qreg[1]~feeder_combout\ = \SW[17]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SW[17]~input_o\,
	combout => \INFRASTRUCTURE_BLOCK_INST|sync_inst17|qreg[1]~feeder_combout\);

-- Location: FF_X69_Y42_N15
\INFRASTRUCTURE_BLOCK_INST|sync_inst17|qreg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \INFRASTRUCTURE_BLOCK_INST|sync_inst17|qreg[1]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INFRASTRUCTURE_BLOCK_INST|sync_inst17|qreg\(1));

-- Location: FF_X68_Y42_N17
\INFRASTRUCTURE_BLOCK_INST|sync_inst17|qreg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	asdata => \INFRASTRUCTURE_BLOCK_INST|sync_inst17|qreg\(1),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INFRASTRUCTURE_BLOCK_INST|sync_inst17|qreg\(0));

-- Location: LCCOMB_X66_Y43_N24
\I2C_MASTER_INST|next_ack_error~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|next_ack_error~1_combout\ = (\I2C_MASTER_INST|next_ack_error~0_combout\ & ((\I2C_MASTER_INST|ack~q\) # (\I2C_SDAT~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|ack~q\,
	datac => \I2C_SDAT~input_o\,
	datad => \I2C_MASTER_INST|next_ack_error~0_combout\,
	combout => \I2C_MASTER_INST|next_ack_error~1_combout\);

-- Location: FF_X66_Y43_N25
\I2C_MASTER_INST|ack_error\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|next_ack_error~1_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|ack_error~q\);

-- Location: LCCOMB_X69_Y42_N8
\I2C_MASTER_INST|next_write_done~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|next_write_done~0_combout\ = (\I2C_MASTER_INST|clk_edge_mask\(2) & (!\I2C_MASTER_INST|clk_edge_mask\(1) & (\I2C_MASTER_INST|clk_edge_mask\(0) & !\I2C_MASTER_INST|ack_error~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|clk_edge_mask\(2),
	datab => \I2C_MASTER_INST|clk_edge_mask\(1),
	datac => \I2C_MASTER_INST|clk_edge_mask\(0),
	datad => \I2C_MASTER_INST|ack_error~q\,
	combout => \I2C_MASTER_INST|next_write_done~0_combout\);

-- Location: FF_X69_Y42_N9
\I2C_MASTER_INST|write_done\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|next_write_done~0_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sclr => \I2C_MASTER_INST|ALT_INV_fsm_state.S_STOP~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|write_done~q\);

-- Location: LCCOMB_X69_Y42_N18
\CODECCONTROLLER_INST|Selector2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Selector2~0_combout\ = (\CODECCONTROLLER_INST|zustand.start_write~q\) # ((!\I2C_MASTER_INST|ack_error~q\ & (!\I2C_MASTER_INST|write_done~q\ & \CODECCONTROLLER_INST|zustand.send~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|ack_error~q\,
	datab => \I2C_MASTER_INST|write_done~q\,
	datac => \CODECCONTROLLER_INST|zustand.send~q\,
	datad => \CODECCONTROLLER_INST|zustand.start_write~q\,
	combout => \CODECCONTROLLER_INST|Selector2~0_combout\);

-- Location: FF_X69_Y42_N19
\CODECCONTROLLER_INST|zustand.send\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \CODECCONTROLLER_INST|Selector2~0_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CODECCONTROLLER_INST|zustand.send~q\);

-- Location: LCCOMB_X70_Y42_N2
\CODECCONTROLLER_INST|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Add0~0_combout\ = \CODECCONTROLLER_INST|reg_idx\(0) $ (VCC)
-- \CODECCONTROLLER_INST|Add0~1\ = CARRY(\CODECCONTROLLER_INST|reg_idx\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CODECCONTROLLER_INST|reg_idx\(0),
	datad => VCC,
	combout => \CODECCONTROLLER_INST|Add0~0_combout\,
	cout => \CODECCONTROLLER_INST|Add0~1\);

-- Location: FF_X70_Y42_N3
\CODECCONTROLLER_INST|reg_idx[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \CODECCONTROLLER_INST|Add0~0_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CODECCONTROLLER_INST|reg_idx\(0));

-- Location: LCCOMB_X70_Y42_N4
\CODECCONTROLLER_INST|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Add0~2_combout\ = (\CODECCONTROLLER_INST|reg_idx\(1) & (!\CODECCONTROLLER_INST|Add0~1\)) # (!\CODECCONTROLLER_INST|reg_idx\(1) & ((\CODECCONTROLLER_INST|Add0~1\) # (GND)))
-- \CODECCONTROLLER_INST|Add0~3\ = CARRY((!\CODECCONTROLLER_INST|Add0~1\) # (!\CODECCONTROLLER_INST|reg_idx\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CODECCONTROLLER_INST|reg_idx\(1),
	datad => VCC,
	cin => \CODECCONTROLLER_INST|Add0~1\,
	combout => \CODECCONTROLLER_INST|Add0~2_combout\,
	cout => \CODECCONTROLLER_INST|Add0~3\);

-- Location: LCCOMB_X69_Y42_N6
\CODECCONTROLLER_INST|next_reg_idx~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|next_reg_idx~1_combout\ = (\CODECCONTROLLER_INST|Add0~2_combout\ & !\CODECCONTROLLER_INST|Equal0~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CODECCONTROLLER_INST|Add0~2_combout\,
	datad => \CODECCONTROLLER_INST|Equal0~9_combout\,
	combout => \CODECCONTROLLER_INST|next_reg_idx~1_combout\);

-- Location: FF_X70_Y42_N5
\CODECCONTROLLER_INST|reg_idx[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	asdata => \CODECCONTROLLER_INST|next_reg_idx~1_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => VCC,
	ena => \I2C_MASTER_INST|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CODECCONTROLLER_INST|reg_idx\(1));

-- Location: LCCOMB_X70_Y42_N6
\CODECCONTROLLER_INST|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Add0~4_combout\ = (\CODECCONTROLLER_INST|reg_idx\(2) & (\CODECCONTROLLER_INST|Add0~3\ $ (GND))) # (!\CODECCONTROLLER_INST|reg_idx\(2) & (!\CODECCONTROLLER_INST|Add0~3\ & VCC))
-- \CODECCONTROLLER_INST|Add0~5\ = CARRY((\CODECCONTROLLER_INST|reg_idx\(2) & !\CODECCONTROLLER_INST|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CODECCONTROLLER_INST|reg_idx\(2),
	datad => VCC,
	cin => \CODECCONTROLLER_INST|Add0~3\,
	combout => \CODECCONTROLLER_INST|Add0~4_combout\,
	cout => \CODECCONTROLLER_INST|Add0~5\);

-- Location: FF_X70_Y42_N7
\CODECCONTROLLER_INST|reg_idx[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \CODECCONTROLLER_INST|Add0~4_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CODECCONTROLLER_INST|reg_idx\(2));

-- Location: LCCOMB_X70_Y42_N8
\CODECCONTROLLER_INST|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Add0~6_combout\ = (\CODECCONTROLLER_INST|reg_idx\(3) & (!\CODECCONTROLLER_INST|Add0~5\)) # (!\CODECCONTROLLER_INST|reg_idx\(3) & ((\CODECCONTROLLER_INST|Add0~5\) # (GND)))
-- \CODECCONTROLLER_INST|Add0~7\ = CARRY((!\CODECCONTROLLER_INST|Add0~5\) # (!\CODECCONTROLLER_INST|reg_idx\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CODECCONTROLLER_INST|reg_idx\(3),
	datad => VCC,
	cin => \CODECCONTROLLER_INST|Add0~5\,
	combout => \CODECCONTROLLER_INST|Add0~6_combout\,
	cout => \CODECCONTROLLER_INST|Add0~7\);

-- Location: LCCOMB_X70_Y42_N0
\CODECCONTROLLER_INST|next_reg_idx~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|next_reg_idx~0_combout\ = (\CODECCONTROLLER_INST|Add0~6_combout\ & !\CODECCONTROLLER_INST|Equal0~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CODECCONTROLLER_INST|Add0~6_combout\,
	datad => \CODECCONTROLLER_INST|Equal0~9_combout\,
	combout => \CODECCONTROLLER_INST|next_reg_idx~0_combout\);

-- Location: FF_X70_Y42_N1
\CODECCONTROLLER_INST|reg_idx[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \CODECCONTROLLER_INST|next_reg_idx~0_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CODECCONTROLLER_INST|reg_idx\(3));

-- Location: LCCOMB_X70_Y42_N10
\CODECCONTROLLER_INST|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Add0~8_combout\ = (\CODECCONTROLLER_INST|reg_idx\(4) & (\CODECCONTROLLER_INST|Add0~7\ $ (GND))) # (!\CODECCONTROLLER_INST|reg_idx\(4) & (!\CODECCONTROLLER_INST|Add0~7\ & VCC))
-- \CODECCONTROLLER_INST|Add0~9\ = CARRY((\CODECCONTROLLER_INST|reg_idx\(4) & !\CODECCONTROLLER_INST|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CODECCONTROLLER_INST|reg_idx\(4),
	datad => VCC,
	cin => \CODECCONTROLLER_INST|Add0~7\,
	combout => \CODECCONTROLLER_INST|Add0~8_combout\,
	cout => \CODECCONTROLLER_INST|Add0~9\);

-- Location: FF_X70_Y42_N11
\CODECCONTROLLER_INST|reg_idx[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \CODECCONTROLLER_INST|Add0~8_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CODECCONTROLLER_INST|reg_idx\(4));

-- Location: LCCOMB_X70_Y42_N12
\CODECCONTROLLER_INST|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Add0~10_combout\ = (\CODECCONTROLLER_INST|reg_idx\(5) & (!\CODECCONTROLLER_INST|Add0~9\)) # (!\CODECCONTROLLER_INST|reg_idx\(5) & ((\CODECCONTROLLER_INST|Add0~9\) # (GND)))
-- \CODECCONTROLLER_INST|Add0~11\ = CARRY((!\CODECCONTROLLER_INST|Add0~9\) # (!\CODECCONTROLLER_INST|reg_idx\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CODECCONTROLLER_INST|reg_idx\(5),
	datad => VCC,
	cin => \CODECCONTROLLER_INST|Add0~9\,
	combout => \CODECCONTROLLER_INST|Add0~10_combout\,
	cout => \CODECCONTROLLER_INST|Add0~11\);

-- Location: FF_X70_Y42_N13
\CODECCONTROLLER_INST|reg_idx[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \CODECCONTROLLER_INST|Add0~10_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CODECCONTROLLER_INST|reg_idx\(5));

-- Location: LCCOMB_X70_Y42_N14
\CODECCONTROLLER_INST|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Add0~12_combout\ = (\CODECCONTROLLER_INST|reg_idx\(6) & (\CODECCONTROLLER_INST|Add0~11\ $ (GND))) # (!\CODECCONTROLLER_INST|reg_idx\(6) & (!\CODECCONTROLLER_INST|Add0~11\ & VCC))
-- \CODECCONTROLLER_INST|Add0~13\ = CARRY((\CODECCONTROLLER_INST|reg_idx\(6) & !\CODECCONTROLLER_INST|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CODECCONTROLLER_INST|reg_idx\(6),
	datad => VCC,
	cin => \CODECCONTROLLER_INST|Add0~11\,
	combout => \CODECCONTROLLER_INST|Add0~12_combout\,
	cout => \CODECCONTROLLER_INST|Add0~13\);

-- Location: FF_X70_Y42_N15
\CODECCONTROLLER_INST|reg_idx[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \CODECCONTROLLER_INST|Add0~12_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CODECCONTROLLER_INST|reg_idx\(6));

-- Location: LCCOMB_X70_Y42_N16
\CODECCONTROLLER_INST|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Add0~14_combout\ = (\CODECCONTROLLER_INST|reg_idx\(7) & (!\CODECCONTROLLER_INST|Add0~13\)) # (!\CODECCONTROLLER_INST|reg_idx\(7) & ((\CODECCONTROLLER_INST|Add0~13\) # (GND)))
-- \CODECCONTROLLER_INST|Add0~15\ = CARRY((!\CODECCONTROLLER_INST|Add0~13\) # (!\CODECCONTROLLER_INST|reg_idx\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CODECCONTROLLER_INST|reg_idx\(7),
	datad => VCC,
	cin => \CODECCONTROLLER_INST|Add0~13\,
	combout => \CODECCONTROLLER_INST|Add0~14_combout\,
	cout => \CODECCONTROLLER_INST|Add0~15\);

-- Location: FF_X70_Y42_N17
\CODECCONTROLLER_INST|reg_idx[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \CODECCONTROLLER_INST|Add0~14_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CODECCONTROLLER_INST|reg_idx\(7));

-- Location: LCCOMB_X70_Y42_N18
\CODECCONTROLLER_INST|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Add0~16_combout\ = (\CODECCONTROLLER_INST|reg_idx\(8) & (\CODECCONTROLLER_INST|Add0~15\ $ (GND))) # (!\CODECCONTROLLER_INST|reg_idx\(8) & (!\CODECCONTROLLER_INST|Add0~15\ & VCC))
-- \CODECCONTROLLER_INST|Add0~17\ = CARRY((\CODECCONTROLLER_INST|reg_idx\(8) & !\CODECCONTROLLER_INST|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CODECCONTROLLER_INST|reg_idx\(8),
	datad => VCC,
	cin => \CODECCONTROLLER_INST|Add0~15\,
	combout => \CODECCONTROLLER_INST|Add0~16_combout\,
	cout => \CODECCONTROLLER_INST|Add0~17\);

-- Location: FF_X70_Y42_N19
\CODECCONTROLLER_INST|reg_idx[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \CODECCONTROLLER_INST|Add0~16_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CODECCONTROLLER_INST|reg_idx\(8));

-- Location: LCCOMB_X70_Y42_N20
\CODECCONTROLLER_INST|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Add0~18_combout\ = (\CODECCONTROLLER_INST|reg_idx\(9) & (!\CODECCONTROLLER_INST|Add0~17\)) # (!\CODECCONTROLLER_INST|reg_idx\(9) & ((\CODECCONTROLLER_INST|Add0~17\) # (GND)))
-- \CODECCONTROLLER_INST|Add0~19\ = CARRY((!\CODECCONTROLLER_INST|Add0~17\) # (!\CODECCONTROLLER_INST|reg_idx\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CODECCONTROLLER_INST|reg_idx\(9),
	datad => VCC,
	cin => \CODECCONTROLLER_INST|Add0~17\,
	combout => \CODECCONTROLLER_INST|Add0~18_combout\,
	cout => \CODECCONTROLLER_INST|Add0~19\);

-- Location: FF_X70_Y42_N21
\CODECCONTROLLER_INST|reg_idx[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \CODECCONTROLLER_INST|Add0~18_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CODECCONTROLLER_INST|reg_idx\(9));

-- Location: LCCOMB_X70_Y42_N22
\CODECCONTROLLER_INST|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Add0~20_combout\ = (\CODECCONTROLLER_INST|reg_idx\(10) & (\CODECCONTROLLER_INST|Add0~19\ $ (GND))) # (!\CODECCONTROLLER_INST|reg_idx\(10) & (!\CODECCONTROLLER_INST|Add0~19\ & VCC))
-- \CODECCONTROLLER_INST|Add0~21\ = CARRY((\CODECCONTROLLER_INST|reg_idx\(10) & !\CODECCONTROLLER_INST|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CODECCONTROLLER_INST|reg_idx\(10),
	datad => VCC,
	cin => \CODECCONTROLLER_INST|Add0~19\,
	combout => \CODECCONTROLLER_INST|Add0~20_combout\,
	cout => \CODECCONTROLLER_INST|Add0~21\);

-- Location: FF_X70_Y42_N23
\CODECCONTROLLER_INST|reg_idx[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \CODECCONTROLLER_INST|Add0~20_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CODECCONTROLLER_INST|reg_idx\(10));

-- Location: LCCOMB_X70_Y42_N24
\CODECCONTROLLER_INST|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Add0~22_combout\ = (\CODECCONTROLLER_INST|reg_idx\(11) & (!\CODECCONTROLLER_INST|Add0~21\)) # (!\CODECCONTROLLER_INST|reg_idx\(11) & ((\CODECCONTROLLER_INST|Add0~21\) # (GND)))
-- \CODECCONTROLLER_INST|Add0~23\ = CARRY((!\CODECCONTROLLER_INST|Add0~21\) # (!\CODECCONTROLLER_INST|reg_idx\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CODECCONTROLLER_INST|reg_idx\(11),
	datad => VCC,
	cin => \CODECCONTROLLER_INST|Add0~21\,
	combout => \CODECCONTROLLER_INST|Add0~22_combout\,
	cout => \CODECCONTROLLER_INST|Add0~23\);

-- Location: FF_X70_Y42_N25
\CODECCONTROLLER_INST|reg_idx[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \CODECCONTROLLER_INST|Add0~22_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CODECCONTROLLER_INST|reg_idx\(11));

-- Location: LCCOMB_X70_Y42_N26
\CODECCONTROLLER_INST|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Add0~24_combout\ = (\CODECCONTROLLER_INST|reg_idx\(12) & (\CODECCONTROLLER_INST|Add0~23\ $ (GND))) # (!\CODECCONTROLLER_INST|reg_idx\(12) & (!\CODECCONTROLLER_INST|Add0~23\ & VCC))
-- \CODECCONTROLLER_INST|Add0~25\ = CARRY((\CODECCONTROLLER_INST|reg_idx\(12) & !\CODECCONTROLLER_INST|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CODECCONTROLLER_INST|reg_idx\(12),
	datad => VCC,
	cin => \CODECCONTROLLER_INST|Add0~23\,
	combout => \CODECCONTROLLER_INST|Add0~24_combout\,
	cout => \CODECCONTROLLER_INST|Add0~25\);

-- Location: FF_X70_Y42_N27
\CODECCONTROLLER_INST|reg_idx[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \CODECCONTROLLER_INST|Add0~24_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CODECCONTROLLER_INST|reg_idx\(12));

-- Location: LCCOMB_X69_Y42_N30
\CODECCONTROLLER_INST|Equal0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Equal0~6_combout\ = (!\CODECCONTROLLER_INST|reg_idx\(11) & (!\CODECCONTROLLER_INST|reg_idx\(10) & (!\CODECCONTROLLER_INST|reg_idx\(9) & !\CODECCONTROLLER_INST|reg_idx\(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CODECCONTROLLER_INST|reg_idx\(11),
	datab => \CODECCONTROLLER_INST|reg_idx\(10),
	datac => \CODECCONTROLLER_INST|reg_idx\(9),
	datad => \CODECCONTROLLER_INST|reg_idx\(12),
	combout => \CODECCONTROLLER_INST|Equal0~6_combout\);

-- Location: LCCOMB_X70_Y42_N28
\CODECCONTROLLER_INST|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Add0~26_combout\ = (\CODECCONTROLLER_INST|reg_idx\(13) & (!\CODECCONTROLLER_INST|Add0~25\)) # (!\CODECCONTROLLER_INST|reg_idx\(13) & ((\CODECCONTROLLER_INST|Add0~25\) # (GND)))
-- \CODECCONTROLLER_INST|Add0~27\ = CARRY((!\CODECCONTROLLER_INST|Add0~25\) # (!\CODECCONTROLLER_INST|reg_idx\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CODECCONTROLLER_INST|reg_idx\(13),
	datad => VCC,
	cin => \CODECCONTROLLER_INST|Add0~25\,
	combout => \CODECCONTROLLER_INST|Add0~26_combout\,
	cout => \CODECCONTROLLER_INST|Add0~27\);

-- Location: FF_X70_Y42_N29
\CODECCONTROLLER_INST|reg_idx[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \CODECCONTROLLER_INST|Add0~26_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CODECCONTROLLER_INST|reg_idx\(13));

-- Location: LCCOMB_X70_Y42_N30
\CODECCONTROLLER_INST|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Add0~28_combout\ = (\CODECCONTROLLER_INST|reg_idx\(14) & (\CODECCONTROLLER_INST|Add0~27\ $ (GND))) # (!\CODECCONTROLLER_INST|reg_idx\(14) & (!\CODECCONTROLLER_INST|Add0~27\ & VCC))
-- \CODECCONTROLLER_INST|Add0~29\ = CARRY((\CODECCONTROLLER_INST|reg_idx\(14) & !\CODECCONTROLLER_INST|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CODECCONTROLLER_INST|reg_idx\(14),
	datad => VCC,
	cin => \CODECCONTROLLER_INST|Add0~27\,
	combout => \CODECCONTROLLER_INST|Add0~28_combout\,
	cout => \CODECCONTROLLER_INST|Add0~29\);

-- Location: FF_X70_Y42_N31
\CODECCONTROLLER_INST|reg_idx[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \CODECCONTROLLER_INST|Add0~28_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CODECCONTROLLER_INST|reg_idx\(14));

-- Location: LCCOMB_X70_Y41_N0
\CODECCONTROLLER_INST|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Add0~30_combout\ = (\CODECCONTROLLER_INST|reg_idx\(15) & (!\CODECCONTROLLER_INST|Add0~29\)) # (!\CODECCONTROLLER_INST|reg_idx\(15) & ((\CODECCONTROLLER_INST|Add0~29\) # (GND)))
-- \CODECCONTROLLER_INST|Add0~31\ = CARRY((!\CODECCONTROLLER_INST|Add0~29\) # (!\CODECCONTROLLER_INST|reg_idx\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CODECCONTROLLER_INST|reg_idx\(15),
	datad => VCC,
	cin => \CODECCONTROLLER_INST|Add0~29\,
	combout => \CODECCONTROLLER_INST|Add0~30_combout\,
	cout => \CODECCONTROLLER_INST|Add0~31\);

-- Location: FF_X70_Y41_N1
\CODECCONTROLLER_INST|reg_idx[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \CODECCONTROLLER_INST|Add0~30_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CODECCONTROLLER_INST|reg_idx\(15));

-- Location: LCCOMB_X70_Y41_N2
\CODECCONTROLLER_INST|Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Add0~32_combout\ = (\CODECCONTROLLER_INST|reg_idx\(16) & (\CODECCONTROLLER_INST|Add0~31\ $ (GND))) # (!\CODECCONTROLLER_INST|reg_idx\(16) & (!\CODECCONTROLLER_INST|Add0~31\ & VCC))
-- \CODECCONTROLLER_INST|Add0~33\ = CARRY((\CODECCONTROLLER_INST|reg_idx\(16) & !\CODECCONTROLLER_INST|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CODECCONTROLLER_INST|reg_idx\(16),
	datad => VCC,
	cin => \CODECCONTROLLER_INST|Add0~31\,
	combout => \CODECCONTROLLER_INST|Add0~32_combout\,
	cout => \CODECCONTROLLER_INST|Add0~33\);

-- Location: FF_X70_Y41_N3
\CODECCONTROLLER_INST|reg_idx[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \CODECCONTROLLER_INST|Add0~32_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CODECCONTROLLER_INST|reg_idx\(16));

-- Location: LCCOMB_X69_Y42_N28
\CODECCONTROLLER_INST|Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Equal0~5_combout\ = (!\CODECCONTROLLER_INST|reg_idx\(15) & (!\CODECCONTROLLER_INST|reg_idx\(16) & (!\CODECCONTROLLER_INST|reg_idx\(14) & !\CODECCONTROLLER_INST|reg_idx\(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CODECCONTROLLER_INST|reg_idx\(15),
	datab => \CODECCONTROLLER_INST|reg_idx\(16),
	datac => \CODECCONTROLLER_INST|reg_idx\(14),
	datad => \CODECCONTROLLER_INST|reg_idx\(13),
	combout => \CODECCONTROLLER_INST|Equal0~5_combout\);

-- Location: LCCOMB_X69_Y42_N16
\CODECCONTROLLER_INST|Equal0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Equal0~7_combout\ = (!\CODECCONTROLLER_INST|reg_idx\(7) & (!\CODECCONTROLLER_INST|reg_idx\(5) & (!\CODECCONTROLLER_INST|reg_idx\(6) & !\CODECCONTROLLER_INST|reg_idx\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CODECCONTROLLER_INST|reg_idx\(7),
	datab => \CODECCONTROLLER_INST|reg_idx\(5),
	datac => \CODECCONTROLLER_INST|reg_idx\(6),
	datad => \CODECCONTROLLER_INST|reg_idx\(8),
	combout => \CODECCONTROLLER_INST|Equal0~7_combout\);

-- Location: LCCOMB_X69_Y42_N22
\CODECCONTROLLER_INST|Equal0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Equal0~8_combout\ = (!\CODECCONTROLLER_INST|reg_idx\(2) & (!\CODECCONTROLLER_INST|reg_idx\(1) & (!\CODECCONTROLLER_INST|reg_idx\(4) & \CODECCONTROLLER_INST|Equal0~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CODECCONTROLLER_INST|reg_idx\(2),
	datab => \CODECCONTROLLER_INST|reg_idx\(1),
	datac => \CODECCONTROLLER_INST|reg_idx\(4),
	datad => \CODECCONTROLLER_INST|Equal0~7_combout\,
	combout => \CODECCONTROLLER_INST|Equal0~8_combout\);

-- Location: LCCOMB_X70_Y41_N4
\CODECCONTROLLER_INST|Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Add0~34_combout\ = (\CODECCONTROLLER_INST|reg_idx\(17) & (!\CODECCONTROLLER_INST|Add0~33\)) # (!\CODECCONTROLLER_INST|reg_idx\(17) & ((\CODECCONTROLLER_INST|Add0~33\) # (GND)))
-- \CODECCONTROLLER_INST|Add0~35\ = CARRY((!\CODECCONTROLLER_INST|Add0~33\) # (!\CODECCONTROLLER_INST|reg_idx\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CODECCONTROLLER_INST|reg_idx\(17),
	datad => VCC,
	cin => \CODECCONTROLLER_INST|Add0~33\,
	combout => \CODECCONTROLLER_INST|Add0~34_combout\,
	cout => \CODECCONTROLLER_INST|Add0~35\);

-- Location: FF_X70_Y41_N5
\CODECCONTROLLER_INST|reg_idx[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \CODECCONTROLLER_INST|Add0~34_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CODECCONTROLLER_INST|reg_idx\(17));

-- Location: LCCOMB_X70_Y41_N6
\CODECCONTROLLER_INST|Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Add0~36_combout\ = (\CODECCONTROLLER_INST|reg_idx\(18) & (\CODECCONTROLLER_INST|Add0~35\ $ (GND))) # (!\CODECCONTROLLER_INST|reg_idx\(18) & (!\CODECCONTROLLER_INST|Add0~35\ & VCC))
-- \CODECCONTROLLER_INST|Add0~37\ = CARRY((\CODECCONTROLLER_INST|reg_idx\(18) & !\CODECCONTROLLER_INST|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CODECCONTROLLER_INST|reg_idx\(18),
	datad => VCC,
	cin => \CODECCONTROLLER_INST|Add0~35\,
	combout => \CODECCONTROLLER_INST|Add0~36_combout\,
	cout => \CODECCONTROLLER_INST|Add0~37\);

-- Location: FF_X70_Y41_N7
\CODECCONTROLLER_INST|reg_idx[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \CODECCONTROLLER_INST|Add0~36_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CODECCONTROLLER_INST|reg_idx\(18));

-- Location: LCCOMB_X70_Y41_N8
\CODECCONTROLLER_INST|Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Add0~38_combout\ = (\CODECCONTROLLER_INST|reg_idx\(19) & (!\CODECCONTROLLER_INST|Add0~37\)) # (!\CODECCONTROLLER_INST|reg_idx\(19) & ((\CODECCONTROLLER_INST|Add0~37\) # (GND)))
-- \CODECCONTROLLER_INST|Add0~39\ = CARRY((!\CODECCONTROLLER_INST|Add0~37\) # (!\CODECCONTROLLER_INST|reg_idx\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CODECCONTROLLER_INST|reg_idx\(19),
	datad => VCC,
	cin => \CODECCONTROLLER_INST|Add0~37\,
	combout => \CODECCONTROLLER_INST|Add0~38_combout\,
	cout => \CODECCONTROLLER_INST|Add0~39\);

-- Location: FF_X70_Y41_N9
\CODECCONTROLLER_INST|reg_idx[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \CODECCONTROLLER_INST|Add0~38_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CODECCONTROLLER_INST|reg_idx\(19));

-- Location: LCCOMB_X70_Y41_N10
\CODECCONTROLLER_INST|Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Add0~40_combout\ = (\CODECCONTROLLER_INST|reg_idx\(20) & (\CODECCONTROLLER_INST|Add0~39\ $ (GND))) # (!\CODECCONTROLLER_INST|reg_idx\(20) & (!\CODECCONTROLLER_INST|Add0~39\ & VCC))
-- \CODECCONTROLLER_INST|Add0~41\ = CARRY((\CODECCONTROLLER_INST|reg_idx\(20) & !\CODECCONTROLLER_INST|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CODECCONTROLLER_INST|reg_idx\(20),
	datad => VCC,
	cin => \CODECCONTROLLER_INST|Add0~39\,
	combout => \CODECCONTROLLER_INST|Add0~40_combout\,
	cout => \CODECCONTROLLER_INST|Add0~41\);

-- Location: FF_X70_Y41_N11
\CODECCONTROLLER_INST|reg_idx[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \CODECCONTROLLER_INST|Add0~40_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CODECCONTROLLER_INST|reg_idx\(20));

-- Location: LCCOMB_X69_Y41_N10
\CODECCONTROLLER_INST|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Equal0~3_combout\ = (!\CODECCONTROLLER_INST|reg_idx\(18) & (!\CODECCONTROLLER_INST|reg_idx\(20) & (!\CODECCONTROLLER_INST|reg_idx\(19) & !\CODECCONTROLLER_INST|reg_idx\(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CODECCONTROLLER_INST|reg_idx\(18),
	datab => \CODECCONTROLLER_INST|reg_idx\(20),
	datac => \CODECCONTROLLER_INST|reg_idx\(19),
	datad => \CODECCONTROLLER_INST|reg_idx\(17),
	combout => \CODECCONTROLLER_INST|Equal0~3_combout\);

-- Location: LCCOMB_X70_Y41_N12
\CODECCONTROLLER_INST|Add0~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Add0~42_combout\ = (\CODECCONTROLLER_INST|reg_idx\(21) & (!\CODECCONTROLLER_INST|Add0~41\)) # (!\CODECCONTROLLER_INST|reg_idx\(21) & ((\CODECCONTROLLER_INST|Add0~41\) # (GND)))
-- \CODECCONTROLLER_INST|Add0~43\ = CARRY((!\CODECCONTROLLER_INST|Add0~41\) # (!\CODECCONTROLLER_INST|reg_idx\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CODECCONTROLLER_INST|reg_idx\(21),
	datad => VCC,
	cin => \CODECCONTROLLER_INST|Add0~41\,
	combout => \CODECCONTROLLER_INST|Add0~42_combout\,
	cout => \CODECCONTROLLER_INST|Add0~43\);

-- Location: FF_X70_Y41_N13
\CODECCONTROLLER_INST|reg_idx[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \CODECCONTROLLER_INST|Add0~42_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CODECCONTROLLER_INST|reg_idx\(21));

-- Location: LCCOMB_X70_Y41_N14
\CODECCONTROLLER_INST|Add0~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Add0~44_combout\ = (\CODECCONTROLLER_INST|reg_idx\(22) & (\CODECCONTROLLER_INST|Add0~43\ $ (GND))) # (!\CODECCONTROLLER_INST|reg_idx\(22) & (!\CODECCONTROLLER_INST|Add0~43\ & VCC))
-- \CODECCONTROLLER_INST|Add0~45\ = CARRY((\CODECCONTROLLER_INST|reg_idx\(22) & !\CODECCONTROLLER_INST|Add0~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CODECCONTROLLER_INST|reg_idx\(22),
	datad => VCC,
	cin => \CODECCONTROLLER_INST|Add0~43\,
	combout => \CODECCONTROLLER_INST|Add0~44_combout\,
	cout => \CODECCONTROLLER_INST|Add0~45\);

-- Location: FF_X70_Y41_N15
\CODECCONTROLLER_INST|reg_idx[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \CODECCONTROLLER_INST|Add0~44_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CODECCONTROLLER_INST|reg_idx\(22));

-- Location: LCCOMB_X70_Y41_N16
\CODECCONTROLLER_INST|Add0~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Add0~46_combout\ = (\CODECCONTROLLER_INST|reg_idx\(23) & (!\CODECCONTROLLER_INST|Add0~45\)) # (!\CODECCONTROLLER_INST|reg_idx\(23) & ((\CODECCONTROLLER_INST|Add0~45\) # (GND)))
-- \CODECCONTROLLER_INST|Add0~47\ = CARRY((!\CODECCONTROLLER_INST|Add0~45\) # (!\CODECCONTROLLER_INST|reg_idx\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CODECCONTROLLER_INST|reg_idx\(23),
	datad => VCC,
	cin => \CODECCONTROLLER_INST|Add0~45\,
	combout => \CODECCONTROLLER_INST|Add0~46_combout\,
	cout => \CODECCONTROLLER_INST|Add0~47\);

-- Location: FF_X70_Y41_N17
\CODECCONTROLLER_INST|reg_idx[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \CODECCONTROLLER_INST|Add0~46_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CODECCONTROLLER_INST|reg_idx\(23));

-- Location: LCCOMB_X70_Y41_N18
\CODECCONTROLLER_INST|Add0~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Add0~48_combout\ = (\CODECCONTROLLER_INST|reg_idx\(24) & (\CODECCONTROLLER_INST|Add0~47\ $ (GND))) # (!\CODECCONTROLLER_INST|reg_idx\(24) & (!\CODECCONTROLLER_INST|Add0~47\ & VCC))
-- \CODECCONTROLLER_INST|Add0~49\ = CARRY((\CODECCONTROLLER_INST|reg_idx\(24) & !\CODECCONTROLLER_INST|Add0~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CODECCONTROLLER_INST|reg_idx\(24),
	datad => VCC,
	cin => \CODECCONTROLLER_INST|Add0~47\,
	combout => \CODECCONTROLLER_INST|Add0~48_combout\,
	cout => \CODECCONTROLLER_INST|Add0~49\);

-- Location: FF_X70_Y41_N19
\CODECCONTROLLER_INST|reg_idx[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \CODECCONTROLLER_INST|Add0~48_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CODECCONTROLLER_INST|reg_idx\(24));

-- Location: LCCOMB_X70_Y41_N20
\CODECCONTROLLER_INST|Add0~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Add0~50_combout\ = (\CODECCONTROLLER_INST|reg_idx\(25) & (!\CODECCONTROLLER_INST|Add0~49\)) # (!\CODECCONTROLLER_INST|reg_idx\(25) & ((\CODECCONTROLLER_INST|Add0~49\) # (GND)))
-- \CODECCONTROLLER_INST|Add0~51\ = CARRY((!\CODECCONTROLLER_INST|Add0~49\) # (!\CODECCONTROLLER_INST|reg_idx\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CODECCONTROLLER_INST|reg_idx\(25),
	datad => VCC,
	cin => \CODECCONTROLLER_INST|Add0~49\,
	combout => \CODECCONTROLLER_INST|Add0~50_combout\,
	cout => \CODECCONTROLLER_INST|Add0~51\);

-- Location: FF_X70_Y41_N21
\CODECCONTROLLER_INST|reg_idx[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \CODECCONTROLLER_INST|Add0~50_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CODECCONTROLLER_INST|reg_idx\(25));

-- Location: LCCOMB_X70_Y41_N22
\CODECCONTROLLER_INST|Add0~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Add0~52_combout\ = (\CODECCONTROLLER_INST|reg_idx\(26) & (\CODECCONTROLLER_INST|Add0~51\ $ (GND))) # (!\CODECCONTROLLER_INST|reg_idx\(26) & (!\CODECCONTROLLER_INST|Add0~51\ & VCC))
-- \CODECCONTROLLER_INST|Add0~53\ = CARRY((\CODECCONTROLLER_INST|reg_idx\(26) & !\CODECCONTROLLER_INST|Add0~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CODECCONTROLLER_INST|reg_idx\(26),
	datad => VCC,
	cin => \CODECCONTROLLER_INST|Add0~51\,
	combout => \CODECCONTROLLER_INST|Add0~52_combout\,
	cout => \CODECCONTROLLER_INST|Add0~53\);

-- Location: FF_X70_Y41_N23
\CODECCONTROLLER_INST|reg_idx[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \CODECCONTROLLER_INST|Add0~52_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CODECCONTROLLER_INST|reg_idx\(26));

-- Location: LCCOMB_X70_Y41_N24
\CODECCONTROLLER_INST|Add0~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Add0~54_combout\ = (\CODECCONTROLLER_INST|reg_idx\(27) & (!\CODECCONTROLLER_INST|Add0~53\)) # (!\CODECCONTROLLER_INST|reg_idx\(27) & ((\CODECCONTROLLER_INST|Add0~53\) # (GND)))
-- \CODECCONTROLLER_INST|Add0~55\ = CARRY((!\CODECCONTROLLER_INST|Add0~53\) # (!\CODECCONTROLLER_INST|reg_idx\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CODECCONTROLLER_INST|reg_idx\(27),
	datad => VCC,
	cin => \CODECCONTROLLER_INST|Add0~53\,
	combout => \CODECCONTROLLER_INST|Add0~54_combout\,
	cout => \CODECCONTROLLER_INST|Add0~55\);

-- Location: FF_X70_Y41_N25
\CODECCONTROLLER_INST|reg_idx[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \CODECCONTROLLER_INST|Add0~54_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CODECCONTROLLER_INST|reg_idx\(27));

-- Location: LCCOMB_X70_Y41_N26
\CODECCONTROLLER_INST|Add0~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Add0~56_combout\ = (\CODECCONTROLLER_INST|reg_idx\(28) & (\CODECCONTROLLER_INST|Add0~55\ $ (GND))) # (!\CODECCONTROLLER_INST|reg_idx\(28) & (!\CODECCONTROLLER_INST|Add0~55\ & VCC))
-- \CODECCONTROLLER_INST|Add0~57\ = CARRY((\CODECCONTROLLER_INST|reg_idx\(28) & !\CODECCONTROLLER_INST|Add0~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CODECCONTROLLER_INST|reg_idx\(28),
	datad => VCC,
	cin => \CODECCONTROLLER_INST|Add0~55\,
	combout => \CODECCONTROLLER_INST|Add0~56_combout\,
	cout => \CODECCONTROLLER_INST|Add0~57\);

-- Location: FF_X70_Y41_N27
\CODECCONTROLLER_INST|reg_idx[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \CODECCONTROLLER_INST|Add0~56_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CODECCONTROLLER_INST|reg_idx\(28));

-- Location: LCCOMB_X69_Y41_N18
\CODECCONTROLLER_INST|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Equal0~1_combout\ = (!\CODECCONTROLLER_INST|reg_idx\(25) & (!\CODECCONTROLLER_INST|reg_idx\(26) & (!\CODECCONTROLLER_INST|reg_idx\(28) & !\CODECCONTROLLER_INST|reg_idx\(27))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CODECCONTROLLER_INST|reg_idx\(25),
	datab => \CODECCONTROLLER_INST|reg_idx\(26),
	datac => \CODECCONTROLLER_INST|reg_idx\(28),
	datad => \CODECCONTROLLER_INST|reg_idx\(27),
	combout => \CODECCONTROLLER_INST|Equal0~1_combout\);

-- Location: LCCOMB_X69_Y41_N4
\CODECCONTROLLER_INST|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Equal0~2_combout\ = (!\CODECCONTROLLER_INST|reg_idx\(21) & (!\CODECCONTROLLER_INST|reg_idx\(24) & (!\CODECCONTROLLER_INST|reg_idx\(22) & !\CODECCONTROLLER_INST|reg_idx\(23))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CODECCONTROLLER_INST|reg_idx\(21),
	datab => \CODECCONTROLLER_INST|reg_idx\(24),
	datac => \CODECCONTROLLER_INST|reg_idx\(22),
	datad => \CODECCONTROLLER_INST|reg_idx\(23),
	combout => \CODECCONTROLLER_INST|Equal0~2_combout\);

-- Location: LCCOMB_X70_Y41_N28
\CODECCONTROLLER_INST|Add0~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Add0~58_combout\ = (\CODECCONTROLLER_INST|reg_idx\(29) & (!\CODECCONTROLLER_INST|Add0~57\)) # (!\CODECCONTROLLER_INST|reg_idx\(29) & ((\CODECCONTROLLER_INST|Add0~57\) # (GND)))
-- \CODECCONTROLLER_INST|Add0~59\ = CARRY((!\CODECCONTROLLER_INST|Add0~57\) # (!\CODECCONTROLLER_INST|reg_idx\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CODECCONTROLLER_INST|reg_idx\(29),
	datad => VCC,
	cin => \CODECCONTROLLER_INST|Add0~57\,
	combout => \CODECCONTROLLER_INST|Add0~58_combout\,
	cout => \CODECCONTROLLER_INST|Add0~59\);

-- Location: FF_X70_Y41_N29
\CODECCONTROLLER_INST|reg_idx[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \CODECCONTROLLER_INST|Add0~58_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CODECCONTROLLER_INST|reg_idx\(29));

-- Location: LCCOMB_X70_Y41_N30
\CODECCONTROLLER_INST|Add0~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Add0~60_combout\ = \CODECCONTROLLER_INST|reg_idx\(30) $ (!\CODECCONTROLLER_INST|Add0~59\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CODECCONTROLLER_INST|reg_idx\(30),
	cin => \CODECCONTROLLER_INST|Add0~59\,
	combout => \CODECCONTROLLER_INST|Add0~60_combout\);

-- Location: FF_X70_Y41_N31
\CODECCONTROLLER_INST|reg_idx[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \CODECCONTROLLER_INST|Add0~60_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|write_done~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CODECCONTROLLER_INST|reg_idx\(30));

-- Location: LCCOMB_X69_Y41_N16
\CODECCONTROLLER_INST|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Equal0~0_combout\ = (!\CODECCONTROLLER_INST|reg_idx\(30) & (!\CODECCONTROLLER_INST|reg_idx\(29) & (\CODECCONTROLLER_INST|reg_idx\(0) & \CODECCONTROLLER_INST|reg_idx\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CODECCONTROLLER_INST|reg_idx\(30),
	datab => \CODECCONTROLLER_INST|reg_idx\(29),
	datac => \CODECCONTROLLER_INST|reg_idx\(0),
	datad => \CODECCONTROLLER_INST|reg_idx\(3),
	combout => \CODECCONTROLLER_INST|Equal0~0_combout\);

-- Location: LCCOMB_X69_Y41_N0
\CODECCONTROLLER_INST|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Equal0~4_combout\ = (\CODECCONTROLLER_INST|Equal0~3_combout\ & (\CODECCONTROLLER_INST|Equal0~1_combout\ & (\CODECCONTROLLER_INST|Equal0~2_combout\ & \CODECCONTROLLER_INST|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CODECCONTROLLER_INST|Equal0~3_combout\,
	datab => \CODECCONTROLLER_INST|Equal0~1_combout\,
	datac => \CODECCONTROLLER_INST|Equal0~2_combout\,
	datad => \CODECCONTROLLER_INST|Equal0~0_combout\,
	combout => \CODECCONTROLLER_INST|Equal0~4_combout\);

-- Location: LCCOMB_X69_Y42_N12
\CODECCONTROLLER_INST|Equal0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Equal0~9_combout\ = (\CODECCONTROLLER_INST|Equal0~6_combout\ & (\CODECCONTROLLER_INST|Equal0~5_combout\ & (\CODECCONTROLLER_INST|Equal0~8_combout\ & \CODECCONTROLLER_INST|Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CODECCONTROLLER_INST|Equal0~6_combout\,
	datab => \CODECCONTROLLER_INST|Equal0~5_combout\,
	datac => \CODECCONTROLLER_INST|Equal0~8_combout\,
	datad => \CODECCONTROLLER_INST|Equal0~4_combout\,
	combout => \CODECCONTROLLER_INST|Equal0~9_combout\);

-- Location: LCCOMB_X69_Y42_N20
\CODECCONTROLLER_INST|Selector0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Selector0~0_combout\ = (\CODECCONTROLLER_INST|zustand.send~q\ & ((\I2C_MASTER_INST|write_done~q\ & ((\CODECCONTROLLER_INST|Equal0~9_combout\))) # (!\I2C_MASTER_INST|write_done~q\ & (\I2C_MASTER_INST|ack_error~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|ack_error~q\,
	datab => \CODECCONTROLLER_INST|zustand.send~q\,
	datac => \I2C_MASTER_INST|write_done~q\,
	datad => \CODECCONTROLLER_INST|Equal0~9_combout\,
	combout => \CODECCONTROLLER_INST|Selector0~0_combout\);

-- Location: LCCOMB_X69_Y42_N24
\CODECCONTROLLER_INST|Selector0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Selector0~1_combout\ = (!\CODECCONTROLLER_INST|Selector0~0_combout\ & ((\INFRASTRUCTURE_BLOCK_INST|sync_inst17|qreg\(0)) # (\CODECCONTROLLER_INST|zustand.idle~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \INFRASTRUCTURE_BLOCK_INST|sync_inst17|qreg\(0),
	datac => \CODECCONTROLLER_INST|zustand.idle~q\,
	datad => \CODECCONTROLLER_INST|Selector0~0_combout\,
	combout => \CODECCONTROLLER_INST|Selector0~1_combout\);

-- Location: FF_X69_Y42_N25
\CODECCONTROLLER_INST|zustand.idle\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \CODECCONTROLLER_INST|Selector0~1_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CODECCONTROLLER_INST|zustand.idle~q\);

-- Location: LCCOMB_X68_Y42_N16
\CODECCONTROLLER_INST|Selector1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Selector1~0_combout\ = (\INFRASTRUCTURE_BLOCK_INST|sync_inst17|qreg\(0) & !\CODECCONTROLLER_INST|zustand.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \INFRASTRUCTURE_BLOCK_INST|sync_inst17|qreg\(0),
	datad => \CODECCONTROLLER_INST|zustand.idle~q\,
	combout => \CODECCONTROLLER_INST|Selector1~0_combout\);

-- Location: LCCOMB_X69_Y42_N4
\CODECCONTROLLER_INST|Selector1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Selector1~1_combout\ = (\CODECCONTROLLER_INST|Selector1~0_combout\) # ((\CODECCONTROLLER_INST|zustand.send~q\ & (\I2C_MASTER_INST|write_done~q\ & !\CODECCONTROLLER_INST|Equal0~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CODECCONTROLLER_INST|Selector1~0_combout\,
	datab => \CODECCONTROLLER_INST|zustand.send~q\,
	datac => \I2C_MASTER_INST|write_done~q\,
	datad => \CODECCONTROLLER_INST|Equal0~9_combout\,
	combout => \CODECCONTROLLER_INST|Selector1~1_combout\);

-- Location: FF_X69_Y42_N5
\CODECCONTROLLER_INST|zustand.start_write\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \CODECCONTROLLER_INST|Selector1~1_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CODECCONTROLLER_INST|zustand.start_write~q\);

-- Location: LCCOMB_X69_Y42_N26
\I2C_MASTER_INST|Selector30~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector30~1_combout\ = (\CODECCONTROLLER_INST|zustand.start_write~q\ & !\I2C_MASTER_INST|fsm_state.S_IDLE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CODECCONTROLLER_INST|zustand.start_write~q\,
	datad => \I2C_MASTER_INST|fsm_state.S_IDLE~q\,
	combout => \I2C_MASTER_INST|Selector30~1_combout\);

-- Location: LCCOMB_X69_Y43_N16
\I2C_MASTER_INST|Selector28~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector28~1_combout\ = (\I2C_MASTER_INST|Selector28~0_combout\ & (((\I2C_MASTER_INST|fsm_state.S_SEND_BYTE~q\ & !\I2C_MASTER_INST|Equal2~0_combout\)) # (!\I2C_MASTER_INST|Selector30~1_combout\))) # 
-- (!\I2C_MASTER_INST|Selector28~0_combout\ & (\I2C_MASTER_INST|fsm_state.S_SEND_BYTE~q\ & ((!\I2C_MASTER_INST|Equal2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|Selector28~0_combout\,
	datab => \I2C_MASTER_INST|fsm_state.S_SEND_BYTE~q\,
	datac => \I2C_MASTER_INST|Selector30~1_combout\,
	datad => \I2C_MASTER_INST|Equal2~0_combout\,
	combout => \I2C_MASTER_INST|Selector28~1_combout\);

-- Location: LCCOMB_X69_Y43_N2
\I2C_MASTER_INST|Selector31~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector31~0_combout\ = (!\I2C_MASTER_INST|next_ack_error~0_combout\ & ((\I2C_MASTER_INST|fsm_state.S_ACK_BYTE~q\) # (\I2C_MASTER_INST|Selector28~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|fsm_state.S_ACK_BYTE~q\,
	datac => \I2C_MASTER_INST|next_ack_error~0_combout\,
	datad => \I2C_MASTER_INST|Selector28~1_combout\,
	combout => \I2C_MASTER_INST|Selector31~0_combout\);

-- Location: LCCOMB_X69_Y43_N10
\I2C_MASTER_INST|Selector28~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector28~2_combout\ = (\I2C_MASTER_INST|Selector31~1_combout\ & ((\I2C_MASTER_INST|next_ack_error~0_combout\) # ((\I2C_MASTER_INST|fsm_state.S_WAIT_FOR_NEXT_BYTE~q\ & \I2C_MASTER_INST|Selector31~0_combout\)))) # 
-- (!\I2C_MASTER_INST|Selector31~1_combout\ & (((\I2C_MASTER_INST|fsm_state.S_WAIT_FOR_NEXT_BYTE~q\ & \I2C_MASTER_INST|Selector31~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|Selector31~1_combout\,
	datab => \I2C_MASTER_INST|next_ack_error~0_combout\,
	datac => \I2C_MASTER_INST|fsm_state.S_WAIT_FOR_NEXT_BYTE~q\,
	datad => \I2C_MASTER_INST|Selector31~0_combout\,
	combout => \I2C_MASTER_INST|Selector28~2_combout\);

-- Location: FF_X69_Y43_N11
\I2C_MASTER_INST|fsm_state.S_WAIT_FOR_NEXT_BYTE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|Selector28~2_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|fsm_state.S_WAIT_FOR_NEXT_BYTE~q\);

-- Location: LCCOMB_X69_Y43_N0
\I2C_MASTER_INST|fsm_state.S_START~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|fsm_state.S_START~feeder_combout\ = \I2C_MASTER_INST|fsm_state.S_WAIT_FOR_START~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \I2C_MASTER_INST|fsm_state.S_WAIT_FOR_START~q\,
	combout => \I2C_MASTER_INST|fsm_state.S_START~feeder_combout\);

-- Location: FF_X69_Y43_N1
\I2C_MASTER_INST|fsm_state.S_START\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|fsm_state.S_START~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|Equal2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|fsm_state.S_START~q\);

-- Location: LCCOMB_X69_Y43_N20
\I2C_MASTER_INST|Selector0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector0~2_combout\ = (!\I2C_MASTER_INST|fsm_state.S_WAIT_FOR_NEXT_BYTE~q\ & !\I2C_MASTER_INST|fsm_state.S_START~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|fsm_state.S_WAIT_FOR_NEXT_BYTE~q\,
	datad => \I2C_MASTER_INST|fsm_state.S_START~q\,
	combout => \I2C_MASTER_INST|Selector0~2_combout\);

-- Location: LCCOMB_X69_Y43_N18
\I2C_MASTER_INST|Selector29~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector29~0_combout\ = (\I2C_MASTER_INST|Equal2~0_combout\ & (((!\I2C_MASTER_INST|Equal0~0_combout\ & \I2C_MASTER_INST|fsm_state.S_SEND_BYTE~q\)) # (!\I2C_MASTER_INST|Selector0~2_combout\))) # (!\I2C_MASTER_INST|Equal2~0_combout\ & 
-- (((\I2C_MASTER_INST|fsm_state.S_SEND_BYTE~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|Selector0~2_combout\,
	datab => \I2C_MASTER_INST|Equal0~0_combout\,
	datac => \I2C_MASTER_INST|fsm_state.S_SEND_BYTE~q\,
	datad => \I2C_MASTER_INST|Equal2~0_combout\,
	combout => \I2C_MASTER_INST|Selector29~0_combout\);

-- Location: FF_X69_Y43_N19
\I2C_MASTER_INST|fsm_state.S_SEND_BYTE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|Selector29~0_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|fsm_state.S_SEND_BYTE~q\);

-- Location: LCCOMB_X67_Y43_N16
\I2C_MASTER_INST|Selector37~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector37~0_combout\ = (!\I2C_MASTER_INST|bit_count\(0) & \I2C_MASTER_INST|fsm_state.S_SEND_BYTE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \I2C_MASTER_INST|bit_count\(0),
	datad => \I2C_MASTER_INST|fsm_state.S_SEND_BYTE~q\,
	combout => \I2C_MASTER_INST|Selector37~0_combout\);

-- Location: LCCOMB_X67_Y43_N24
\I2C_MASTER_INST|bit_count[2]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|bit_count[2]~0_combout\ = (\I2C_MASTER_INST|Equal2~0_combout\ & ((\I2C_MASTER_INST|fsm_state.S_SEND_BYTE~q\) # (\I2C_MASTER_INST|fsm_state.S_START~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \I2C_MASTER_INST|fsm_state.S_SEND_BYTE~q\,
	datac => \I2C_MASTER_INST|fsm_state.S_START~q\,
	datad => \I2C_MASTER_INST|Equal2~0_combout\,
	combout => \I2C_MASTER_INST|bit_count[2]~0_combout\);

-- Location: FF_X67_Y43_N17
\I2C_MASTER_INST|bit_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|Selector37~0_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|bit_count[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|bit_count\(0));

-- Location: LCCOMB_X67_Y43_N8
\I2C_MASTER_INST|Selector36~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector36~0_combout\ = \I2C_MASTER_INST|bit_count\(1) $ (\I2C_MASTER_INST|bit_count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \I2C_MASTER_INST|bit_count\(1),
	datad => \I2C_MASTER_INST|bit_count\(0),
	combout => \I2C_MASTER_INST|Selector36~0_combout\);

-- Location: FF_X67_Y43_N9
\I2C_MASTER_INST|bit_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|Selector36~0_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sclr => \I2C_MASTER_INST|ALT_INV_fsm_state.S_SEND_BYTE~q\,
	ena => \I2C_MASTER_INST|bit_count[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|bit_count\(1));

-- Location: LCCOMB_X67_Y43_N10
\I2C_MASTER_INST|Selector35~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector35~0_combout\ = (\I2C_MASTER_INST|fsm_state.S_SEND_BYTE~q\ & (\I2C_MASTER_INST|bit_count\(2) $ (((\I2C_MASTER_INST|bit_count\(1) & \I2C_MASTER_INST|bit_count\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|bit_count\(1),
	datab => \I2C_MASTER_INST|bit_count\(0),
	datac => \I2C_MASTER_INST|bit_count\(2),
	datad => \I2C_MASTER_INST|fsm_state.S_SEND_BYTE~q\,
	combout => \I2C_MASTER_INST|Selector35~0_combout\);

-- Location: FF_X67_Y43_N11
\I2C_MASTER_INST|bit_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|Selector35~0_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|bit_count[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|bit_count\(2));

-- Location: LCCOMB_X67_Y43_N14
\I2C_MASTER_INST|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Equal0~0_combout\ = (\I2C_MASTER_INST|bit_count\(2) & (\I2C_MASTER_INST|bit_count\(1) & \I2C_MASTER_INST|bit_count\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|bit_count\(2),
	datac => \I2C_MASTER_INST|bit_count\(1),
	datad => \I2C_MASTER_INST|bit_count\(0),
	combout => \I2C_MASTER_INST|Equal0~0_combout\);

-- Location: LCCOMB_X68_Y43_N14
\I2C_MASTER_INST|Selector30~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector30~4_combout\ = (\I2C_MASTER_INST|Selector30~3_combout\) # ((\I2C_MASTER_INST|Equal2~0_combout\ & (\I2C_MASTER_INST|Equal0~0_combout\ & \I2C_MASTER_INST|fsm_state.S_SEND_BYTE~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|Selector30~3_combout\,
	datab => \I2C_MASTER_INST|Equal2~0_combout\,
	datac => \I2C_MASTER_INST|Equal0~0_combout\,
	datad => \I2C_MASTER_INST|fsm_state.S_SEND_BYTE~q\,
	combout => \I2C_MASTER_INST|Selector30~4_combout\);

-- Location: FF_X68_Y43_N15
\I2C_MASTER_INST|fsm_state.S_ACK_BYTE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|Selector30~4_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|fsm_state.S_ACK_BYTE~q\);

-- Location: LCCOMB_X68_Y43_N6
\I2C_MASTER_INST|next_scl~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|next_scl~0_combout\ = (\I2C_MASTER_INST|clk_edge_mask\(2) & (!\I2C_MASTER_INST|clk_edge_mask\(0) & \I2C_MASTER_INST|clk_edge_mask\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \I2C_MASTER_INST|clk_edge_mask\(2),
	datac => \I2C_MASTER_INST|clk_edge_mask\(0),
	datad => \I2C_MASTER_INST|clk_edge_mask\(1),
	combout => \I2C_MASTER_INST|next_scl~0_combout\);

-- Location: LCCOMB_X66_Y43_N26
\I2C_MASTER_INST|ack~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|ack~0_combout\ = (\I2C_MASTER_INST|fsm_state.S_ACK_BYTE~q\ & ((\I2C_MASTER_INST|next_scl~0_combout\ & (\I2C_SDAT~input_o\)) # (!\I2C_MASTER_INST|next_scl~0_combout\ & ((\I2C_MASTER_INST|ack~q\))))) # 
-- (!\I2C_MASTER_INST|fsm_state.S_ACK_BYTE~q\ & (((\I2C_MASTER_INST|ack~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_SDAT~input_o\,
	datab => \I2C_MASTER_INST|fsm_state.S_ACK_BYTE~q\,
	datac => \I2C_MASTER_INST|ack~q\,
	datad => \I2C_MASTER_INST|next_scl~0_combout\,
	combout => \I2C_MASTER_INST|ack~0_combout\);

-- Location: FF_X66_Y43_N27
\I2C_MASTER_INST|ack\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|ack~0_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|ack~q\);

-- Location: LCCOMB_X67_Y43_N26
\I2C_MASTER_INST|byte_count[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|byte_count[0]~0_combout\ = (\I2C_MASTER_INST|Equal2~0_combout\ & ((\I2C_MASTER_INST|fsm_state.S_START~q\) # ((\I2C_MASTER_INST|Equal0~0_combout\ & \I2C_MASTER_INST|fsm_state.S_SEND_BYTE~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|Equal0~0_combout\,
	datab => \I2C_MASTER_INST|fsm_state.S_SEND_BYTE~q\,
	datac => \I2C_MASTER_INST|fsm_state.S_START~q\,
	datad => \I2C_MASTER_INST|Equal2~0_combout\,
	combout => \I2C_MASTER_INST|byte_count[0]~0_combout\);

-- Location: LCCOMB_X66_Y43_N28
\I2C_MASTER_INST|byte_count[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|byte_count[0]~1_combout\ = (\I2C_MASTER_INST|byte_count[0]~0_combout\ & (!\I2C_MASTER_INST|byte_count\(0) & \I2C_MASTER_INST|fsm_state.S_SEND_BYTE~q\)) # (!\I2C_MASTER_INST|byte_count[0]~0_combout\ & (\I2C_MASTER_INST|byte_count\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \I2C_MASTER_INST|byte_count[0]~0_combout\,
	datac => \I2C_MASTER_INST|byte_count\(0),
	datad => \I2C_MASTER_INST|fsm_state.S_SEND_BYTE~q\,
	combout => \I2C_MASTER_INST|byte_count[0]~1_combout\);

-- Location: FF_X66_Y43_N29
\I2C_MASTER_INST|byte_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|byte_count[0]~1_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|byte_count\(0));

-- Location: LCCOMB_X66_Y43_N12
\I2C_MASTER_INST|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Add0~0_combout\ = \I2C_MASTER_INST|byte_count\(1) $ (\I2C_MASTER_INST|byte_count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \I2C_MASTER_INST|byte_count\(1),
	datad => \I2C_MASTER_INST|byte_count\(0),
	combout => \I2C_MASTER_INST|Add0~0_combout\);

-- Location: FF_X66_Y43_N13
\I2C_MASTER_INST|byte_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|Add0~0_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sclr => \I2C_MASTER_INST|ALT_INV_fsm_state.S_SEND_BYTE~q\,
	ena => \I2C_MASTER_INST|byte_count[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|byte_count\(1));

-- Location: LCCOMB_X66_Y43_N18
\I2C_MASTER_INST|Selector31~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector31~1_combout\ = (!\I2C_MASTER_INST|ack~q\ & (!\I2C_SDAT~input_o\ & ((!\I2C_MASTER_INST|byte_count\(1)) # (!\I2C_MASTER_INST|byte_count\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|ack~q\,
	datab => \I2C_MASTER_INST|byte_count\(0),
	datac => \I2C_SDAT~input_o\,
	datad => \I2C_MASTER_INST|byte_count\(1),
	combout => \I2C_MASTER_INST|Selector31~1_combout\);

-- Location: LCCOMB_X69_Y43_N24
\I2C_MASTER_INST|Selector31~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector31~2_combout\ = (\I2C_MASTER_INST|Selector31~1_combout\ & (((\I2C_MASTER_INST|fsm_state.S_WAIT_FOR_STOP~q\ & \I2C_MASTER_INST|Selector31~0_combout\)))) # (!\I2C_MASTER_INST|Selector31~1_combout\ & 
-- ((\I2C_MASTER_INST|next_ack_error~0_combout\) # ((\I2C_MASTER_INST|fsm_state.S_WAIT_FOR_STOP~q\ & \I2C_MASTER_INST|Selector31~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|Selector31~1_combout\,
	datab => \I2C_MASTER_INST|next_ack_error~0_combout\,
	datac => \I2C_MASTER_INST|fsm_state.S_WAIT_FOR_STOP~q\,
	datad => \I2C_MASTER_INST|Selector31~0_combout\,
	combout => \I2C_MASTER_INST|Selector31~2_combout\);

-- Location: FF_X69_Y43_N25
\I2C_MASTER_INST|fsm_state.S_WAIT_FOR_STOP\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|Selector31~2_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|fsm_state.S_WAIT_FOR_STOP~q\);

-- Location: LCCOMB_X68_Y43_N30
\I2C_MASTER_INST|fsm_state.S_STOP~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|fsm_state.S_STOP~feeder_combout\ = \I2C_MASTER_INST|fsm_state.S_WAIT_FOR_STOP~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \I2C_MASTER_INST|fsm_state.S_WAIT_FOR_STOP~q\,
	combout => \I2C_MASTER_INST|fsm_state.S_STOP~feeder_combout\);

-- Location: FF_X68_Y43_N31
\I2C_MASTER_INST|fsm_state.S_STOP\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|fsm_state.S_STOP~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|Equal2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|fsm_state.S_STOP~q\);

-- Location: LCCOMB_X69_Y42_N10
\I2C_MASTER_INST|Selector25~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector25~0_combout\ = (\I2C_MASTER_INST|Equal2~0_combout\ & (!\I2C_MASTER_INST|fsm_state.S_STOP~q\ & ((\I2C_MASTER_INST|fsm_state.S_IDLE~q\) # (\CODECCONTROLLER_INST|zustand.start_write~q\)))) # (!\I2C_MASTER_INST|Equal2~0_combout\ & 
-- (((\I2C_MASTER_INST|fsm_state.S_IDLE~q\) # (\CODECCONTROLLER_INST|zustand.start_write~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011101110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|Equal2~0_combout\,
	datab => \I2C_MASTER_INST|fsm_state.S_STOP~q\,
	datac => \I2C_MASTER_INST|fsm_state.S_IDLE~q\,
	datad => \CODECCONTROLLER_INST|zustand.start_write~q\,
	combout => \I2C_MASTER_INST|Selector25~0_combout\);

-- Location: FF_X69_Y42_N11
\I2C_MASTER_INST|fsm_state.S_IDLE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|Selector25~0_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|fsm_state.S_IDLE~q\);

-- Location: LCCOMB_X68_Y43_N0
\I2C_MASTER_INST|Selector30~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector30~2_combout\ = (\I2C_MASTER_INST|Equal0~0_combout\ & (\I2C_MASTER_INST|Equal2~0_combout\ & \I2C_MASTER_INST|fsm_state.S_SEND_BYTE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|Equal0~0_combout\,
	datab => \I2C_MASTER_INST|Equal2~0_combout\,
	datad => \I2C_MASTER_INST|fsm_state.S_SEND_BYTE~q\,
	combout => \I2C_MASTER_INST|Selector30~2_combout\);

-- Location: LCCOMB_X68_Y43_N16
\I2C_MASTER_INST|Selector26~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector26~2_combout\ = (\I2C_MASTER_INST|clk_edge_mask\(1)) # ((\I2C_MASTER_INST|clk_edge_mask\(0) $ (!\I2C_MASTER_INST|fsm_state.S_ACK_BYTE~q\)) # (!\I2C_MASTER_INST|clk_edge_mask\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|clk_edge_mask\(0),
	datab => \I2C_MASTER_INST|fsm_state.S_ACK_BYTE~q\,
	datac => \I2C_MASTER_INST|clk_edge_mask\(1),
	datad => \I2C_MASTER_INST|clk_edge_mask\(2),
	combout => \I2C_MASTER_INST|Selector26~2_combout\);

-- Location: LCCOMB_X68_Y43_N28
\I2C_MASTER_INST|Selector26~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector26~3_combout\ = (\I2C_MASTER_INST|fsm_state.S_WAIT_FOR_START~q\ & ((\I2C_MASTER_INST|fsm_state.S_SEND_BYTE~q\) # ((\I2C_MASTER_INST|Selector26~2_combout\) # (!\I2C_MASTER_INST|fsm_state.S_IDLE~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|fsm_state.S_WAIT_FOR_START~q\,
	datab => \I2C_MASTER_INST|fsm_state.S_SEND_BYTE~q\,
	datac => \I2C_MASTER_INST|fsm_state.S_IDLE~q\,
	datad => \I2C_MASTER_INST|Selector26~2_combout\,
	combout => \I2C_MASTER_INST|Selector26~3_combout\);

-- Location: LCCOMB_X68_Y43_N12
\I2C_MASTER_INST|Selector26~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector26~4_combout\ = (!\I2C_MASTER_INST|Selector30~2_combout\ & ((\I2C_MASTER_INST|Selector26~3_combout\) # ((!\I2C_MASTER_INST|fsm_state.S_IDLE~q\ & \CODECCONTROLLER_INST|zustand.start_write~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|fsm_state.S_IDLE~q\,
	datab => \I2C_MASTER_INST|Selector30~2_combout\,
	datac => \CODECCONTROLLER_INST|zustand.start_write~q\,
	datad => \I2C_MASTER_INST|Selector26~3_combout\,
	combout => \I2C_MASTER_INST|Selector26~4_combout\);

-- Location: FF_X68_Y43_N13
\I2C_MASTER_INST|fsm_state.S_WAIT_FOR_START\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|Selector26~4_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|fsm_state.S_WAIT_FOR_START~q\);

-- Location: IOIBUF_X67_Y73_N22
\SW[16]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(16),
	o => \SW[16]~input_o\);

-- Location: FF_X67_Y42_N5
\INFRASTRUCTURE_BLOCK_INST|sync_inst16|qreg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	asdata => \SW[16]~input_o\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INFRASTRUCTURE_BLOCK_INST|sync_inst16|qreg\(1));

-- Location: FF_X67_Y42_N7
\INFRASTRUCTURE_BLOCK_INST|sync_inst16|qreg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	asdata => \INFRASTRUCTURE_BLOCK_INST|sync_inst16|qreg\(1),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INFRASTRUCTURE_BLOCK_INST|sync_inst16|qreg\(0));

-- Location: LCCOMB_X67_Y42_N30
\I2C_MASTER_INST|Selector20~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector20~3_combout\ = (\CODECCONTROLLER_INST|reg_idx\(1) & (((!\CODECCONTROLLER_INST|reg_idx\(2))))) # (!\CODECCONTROLLER_INST|reg_idx\(1) & (\INFRASTRUCTURE_BLOCK_INST|sync_inst16|qreg\(0) & (!\CODECCONTROLLER_INST|reg_idx\(0) & 
-- \CODECCONTROLLER_INST|reg_idx\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INFRASTRUCTURE_BLOCK_INST|sync_inst16|qreg\(0),
	datab => \CODECCONTROLLER_INST|reg_idx\(0),
	datac => \CODECCONTROLLER_INST|reg_idx\(1),
	datad => \CODECCONTROLLER_INST|reg_idx\(2),
	combout => \I2C_MASTER_INST|Selector20~3_combout\);

-- Location: LCCOMB_X67_Y42_N2
\CODECCONTROLLER_INST|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Mux3~0_combout\ = (\CODECCONTROLLER_INST|reg_idx\(1) & ((\CODECCONTROLLER_INST|reg_idx\(3)) # ((\CODECCONTROLLER_INST|reg_idx\(2))))) # (!\CODECCONTROLLER_INST|reg_idx\(1) & (\CODECCONTROLLER_INST|reg_idx\(3) & 
-- ((\CODECCONTROLLER_INST|reg_idx\(0)) # (\CODECCONTROLLER_INST|reg_idx\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CODECCONTROLLER_INST|reg_idx\(1),
	datab => \CODECCONTROLLER_INST|reg_idx\(3),
	datac => \CODECCONTROLLER_INST|reg_idx\(0),
	datad => \CODECCONTROLLER_INST|reg_idx\(2),
	combout => \CODECCONTROLLER_INST|Mux3~0_combout\);

-- Location: LCCOMB_X67_Y42_N0
\CODECCONTROLLER_INST|Equal0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Equal0~10_combout\ = (\CODECCONTROLLER_INST|reg_idx\(3) & \CODECCONTROLLER_INST|reg_idx\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CODECCONTROLLER_INST|reg_idx\(3),
	datad => \CODECCONTROLLER_INST|reg_idx\(0),
	combout => \CODECCONTROLLER_INST|Equal0~10_combout\);

-- Location: LCCOMB_X67_Y42_N6
\I2C_MASTER_INST|Selector21~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector21~2_combout\ = (\INFRASTRUCTURE_BLOCK_INST|sync_inst16|qreg\(0) & (!\CODECCONTROLLER_INST|reg_idx\(2) & ((!\CODECCONTROLLER_INST|Equal0~10_combout\)))) # (!\INFRASTRUCTURE_BLOCK_INST|sync_inst16|qreg\(0) & 
-- (((!\CODECCONTROLLER_INST|Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001101010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CODECCONTROLLER_INST|reg_idx\(2),
	datab => \CODECCONTROLLER_INST|Mux3~0_combout\,
	datac => \INFRASTRUCTURE_BLOCK_INST|sync_inst16|qreg\(0),
	datad => \CODECCONTROLLER_INST|Equal0~10_combout\,
	combout => \I2C_MASTER_INST|Selector21~2_combout\);

-- Location: LCCOMB_X68_Y42_N22
\CODECCONTROLLER_INST|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|Mux4~0_combout\ = (\CODECCONTROLLER_INST|reg_idx\(3)) # ((\CODECCONTROLLER_INST|reg_idx\(2) & (\CODECCONTROLLER_INST|reg_idx\(0) $ (\CODECCONTROLLER_INST|reg_idx\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CODECCONTROLLER_INST|reg_idx\(3),
	datab => \CODECCONTROLLER_INST|reg_idx\(0),
	datac => \CODECCONTROLLER_INST|reg_idx\(1),
	datad => \CODECCONTROLLER_INST|reg_idx\(2),
	combout => \CODECCONTROLLER_INST|Mux4~0_combout\);

-- Location: LCCOMB_X68_Y42_N28
\I2C_MASTER_INST|Selector24~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector24~1_combout\ = (!\I2C_MASTER_INST|fsm_state.S_IDLE~q\ & (\CODECCONTROLLER_INST|zustand.start_write~q\ & ((\CODECCONTROLLER_INST|reg_idx\(0)) # (!\CODECCONTROLLER_INST|reg_idx\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CODECCONTROLLER_INST|reg_idx\(3),
	datab => \CODECCONTROLLER_INST|reg_idx\(0),
	datac => \I2C_MASTER_INST|fsm_state.S_IDLE~q\,
	datad => \CODECCONTROLLER_INST|zustand.start_write~q\,
	combout => \I2C_MASTER_INST|Selector24~1_combout\);

-- Location: LCCOMB_X68_Y43_N18
\I2C_MASTER_INST|Selector0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector0~6_combout\ = (!\I2C_MASTER_INST|fsm_state.S_STOP~q\ & (!\I2C_MASTER_INST|fsm_state.S_WAIT_FOR_STOP~q\ & (!\I2C_MASTER_INST|fsm_state.S_ACK_BYTE~q\ & !\I2C_MASTER_INST|fsm_state.S_WAIT_FOR_START~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|fsm_state.S_STOP~q\,
	datab => \I2C_MASTER_INST|fsm_state.S_WAIT_FOR_STOP~q\,
	datac => \I2C_MASTER_INST|fsm_state.S_ACK_BYTE~q\,
	datad => \I2C_MASTER_INST|fsm_state.S_WAIT_FOR_START~q\,
	combout => \I2C_MASTER_INST|Selector0~6_combout\);

-- Location: LCCOMB_X68_Y43_N20
\I2C_MASTER_INST|Selector20~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector20~0_combout\ = (\I2C_MASTER_INST|fsm_state.S_SEND_BYTE~q\ & ((\I2C_MASTER_INST|Equal0~0_combout\) # (!\I2C_MASTER_INST|Equal2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|Equal0~0_combout\,
	datab => \I2C_MASTER_INST|fsm_state.S_SEND_BYTE~q\,
	datad => \I2C_MASTER_INST|Equal2~0_combout\,
	combout => \I2C_MASTER_INST|Selector20~0_combout\);

-- Location: LCCOMB_X68_Y43_N26
\I2C_MASTER_INST|Selector23~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector23~1_combout\ = (\I2C_MASTER_INST|Selector0~6_combout\ & (!\I2C_MASTER_INST|Selector20~0_combout\ & ((\I2C_MASTER_INST|fsm_state.S_IDLE~q\) # (\CODECCONTROLLER_INST|zustand.start_write~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|fsm_state.S_IDLE~q\,
	datab => \I2C_MASTER_INST|Selector0~6_combout\,
	datac => \CODECCONTROLLER_INST|zustand.start_write~q\,
	datad => \I2C_MASTER_INST|Selector20~0_combout\,
	combout => \I2C_MASTER_INST|Selector23~1_combout\);

-- Location: LCCOMB_X67_Y42_N16
\I2C_MASTER_INST|Selector24~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector24~0_combout\ = (\I2C_MASTER_INST|data\(0) & (((!\I2C_MASTER_INST|Equal2~0_combout\ & !\I2C_MASTER_INST|Selector0~2_combout\)) # (!\I2C_MASTER_INST|Selector23~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|Equal2~0_combout\,
	datab => \I2C_MASTER_INST|Selector0~2_combout\,
	datac => \I2C_MASTER_INST|data\(0),
	datad => \I2C_MASTER_INST|Selector23~1_combout\,
	combout => \I2C_MASTER_INST|Selector24~0_combout\);

-- Location: LCCOMB_X67_Y42_N12
\I2C_MASTER_INST|Selector24~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector24~2_combout\ = (\I2C_MASTER_INST|Selector24~0_combout\) # ((!\CODECCONTROLLER_INST|reg_idx\(2) & \I2C_MASTER_INST|Selector24~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CODECCONTROLLER_INST|reg_idx\(2),
	datab => \I2C_MASTER_INST|Selector24~1_combout\,
	datad => \I2C_MASTER_INST|Selector24~0_combout\,
	combout => \I2C_MASTER_INST|Selector24~2_combout\);

-- Location: FF_X67_Y42_N13
\I2C_MASTER_INST|data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|Selector24~2_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|data\(0));

-- Location: LCCOMB_X67_Y42_N22
\I2C_MASTER_INST|Selector23~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector23~2_combout\ = (!\I2C_MASTER_INST|Selector0~2_combout\ & ((\I2C_MASTER_INST|Equal2~0_combout\ & (\I2C_MASTER_INST|data\(0))) # (!\I2C_MASTER_INST|Equal2~0_combout\ & ((\I2C_MASTER_INST|data\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|data\(0),
	datab => \I2C_MASTER_INST|Selector0~2_combout\,
	datac => \I2C_MASTER_INST|data\(1),
	datad => \I2C_MASTER_INST|Equal2~0_combout\,
	combout => \I2C_MASTER_INST|Selector23~2_combout\);

-- Location: LCCOMB_X67_Y42_N4
\I2C_MASTER_INST|Selector23~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector23~0_combout\ = (!\I2C_MASTER_INST|Equal0~0_combout\ & (\I2C_MASTER_INST|fsm_state.S_SEND_BYTE~q\ & \I2C_MASTER_INST|Equal2~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|Equal0~0_combout\,
	datab => \I2C_MASTER_INST|fsm_state.S_SEND_BYTE~q\,
	datad => \I2C_MASTER_INST|Equal2~0_combout\,
	combout => \I2C_MASTER_INST|Selector23~0_combout\);

-- Location: LCCOMB_X67_Y42_N10
\I2C_MASTER_INST|Selector23~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector23~3_combout\ = (\I2C_MASTER_INST|data\(0) & ((\I2C_MASTER_INST|Selector23~0_combout\) # ((\I2C_MASTER_INST|data\(1) & !\I2C_MASTER_INST|Selector23~1_combout\)))) # (!\I2C_MASTER_INST|data\(0) & (((\I2C_MASTER_INST|data\(1) & 
-- !\I2C_MASTER_INST|Selector23~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|data\(0),
	datab => \I2C_MASTER_INST|Selector23~0_combout\,
	datac => \I2C_MASTER_INST|data\(1),
	datad => \I2C_MASTER_INST|Selector23~1_combout\,
	combout => \I2C_MASTER_INST|Selector23~3_combout\);

-- Location: LCCOMB_X67_Y42_N14
\I2C_MASTER_INST|Selector23~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector23~4_combout\ = (\I2C_MASTER_INST|Selector23~2_combout\) # ((\I2C_MASTER_INST|Selector23~3_combout\) # ((\I2C_MASTER_INST|Selector30~1_combout\ & !\CODECCONTROLLER_INST|Mux4~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|Selector30~1_combout\,
	datab => \CODECCONTROLLER_INST|Mux4~0_combout\,
	datac => \I2C_MASTER_INST|Selector23~2_combout\,
	datad => \I2C_MASTER_INST|Selector23~3_combout\,
	combout => \I2C_MASTER_INST|Selector23~4_combout\);

-- Location: FF_X67_Y42_N15
\I2C_MASTER_INST|data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|Selector23~4_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|data\(1));

-- Location: LCCOMB_X67_Y43_N30
\I2C_MASTER_INST|Selector22~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector22~0_combout\ = (\I2C_MASTER_INST|fsm_state.S_IDLE~q\ & (\I2C_MASTER_INST|data\(1))) # (!\I2C_MASTER_INST|fsm_state.S_IDLE~q\ & (((!\CODECCONTROLLER_INST|reg_idx\(2) & !\CODECCONTROLLER_INST|Equal0~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|data\(1),
	datab => \I2C_MASTER_INST|fsm_state.S_IDLE~q\,
	datac => \CODECCONTROLLER_INST|reg_idx\(2),
	datad => \CODECCONTROLLER_INST|Equal0~10_combout\,
	combout => \I2C_MASTER_INST|Selector22~0_combout\);

-- Location: LCCOMB_X69_Y43_N4
\I2C_MASTER_INST|data[23]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|data[23]~0_combout\ = ((!\I2C_MASTER_INST|fsm_state.S_WAIT_FOR_NEXT_BYTE~q\ & ((\I2C_MASTER_INST|Equal0~0_combout\) # (!\I2C_MASTER_INST|fsm_state.S_SEND_BYTE~q\)))) # (!\I2C_MASTER_INST|Equal2~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|fsm_state.S_WAIT_FOR_NEXT_BYTE~q\,
	datab => \I2C_MASTER_INST|fsm_state.S_SEND_BYTE~q\,
	datac => \I2C_MASTER_INST|Equal0~0_combout\,
	datad => \I2C_MASTER_INST|Equal2~0_combout\,
	combout => \I2C_MASTER_INST|data[23]~0_combout\);

-- Location: LCCOMB_X69_Y43_N14
\I2C_MASTER_INST|data[23]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|data[23]~1_combout\ = (\I2C_MASTER_INST|Selector30~1_combout\) # (((\I2C_MASTER_INST|Equal2~0_combout\ & \I2C_MASTER_INST|fsm_state.S_START~q\)) # (!\I2C_MASTER_INST|data[23]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|Equal2~0_combout\,
	datab => \I2C_MASTER_INST|Selector30~1_combout\,
	datac => \I2C_MASTER_INST|data[23]~0_combout\,
	datad => \I2C_MASTER_INST|fsm_state.S_START~q\,
	combout => \I2C_MASTER_INST|data[23]~1_combout\);

-- Location: FF_X67_Y43_N31
\I2C_MASTER_INST|data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|Selector22~0_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|data[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|data\(2));

-- Location: LCCOMB_X67_Y42_N24
\I2C_MASTER_INST|Selector21~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector21~1_combout\ = (!\I2C_MASTER_INST|Selector0~2_combout\ & ((\I2C_MASTER_INST|Equal2~0_combout\ & (\I2C_MASTER_INST|data\(2))) # (!\I2C_MASTER_INST|Equal2~0_combout\ & ((\I2C_MASTER_INST|data\(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|data\(2),
	datab => \I2C_MASTER_INST|Selector0~2_combout\,
	datac => \I2C_MASTER_INST|data\(3),
	datad => \I2C_MASTER_INST|Equal2~0_combout\,
	combout => \I2C_MASTER_INST|Selector21~1_combout\);

-- Location: LCCOMB_X67_Y42_N18
\I2C_MASTER_INST|Selector21~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector21~0_combout\ = (\I2C_MASTER_INST|data\(2) & ((\I2C_MASTER_INST|Selector23~0_combout\) # ((\I2C_MASTER_INST|data\(3) & !\I2C_MASTER_INST|Selector23~1_combout\)))) # (!\I2C_MASTER_INST|data\(2) & (((\I2C_MASTER_INST|data\(3) & 
-- !\I2C_MASTER_INST|Selector23~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|data\(2),
	datab => \I2C_MASTER_INST|Selector23~0_combout\,
	datac => \I2C_MASTER_INST|data\(3),
	datad => \I2C_MASTER_INST|Selector23~1_combout\,
	combout => \I2C_MASTER_INST|Selector21~0_combout\);

-- Location: LCCOMB_X67_Y42_N8
\I2C_MASTER_INST|Selector21~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector21~3_combout\ = (\I2C_MASTER_INST|Selector21~1_combout\) # ((\I2C_MASTER_INST|Selector21~0_combout\) # ((\I2C_MASTER_INST|Selector21~2_combout\ & \I2C_MASTER_INST|Selector30~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|Selector21~2_combout\,
	datab => \I2C_MASTER_INST|Selector21~1_combout\,
	datac => \I2C_MASTER_INST|Selector30~1_combout\,
	datad => \I2C_MASTER_INST|Selector21~0_combout\,
	combout => \I2C_MASTER_INST|Selector21~3_combout\);

-- Location: FF_X67_Y42_N9
\I2C_MASTER_INST|data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|Selector21~3_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|data\(3));

-- Location: LCCOMB_X67_Y42_N26
\I2C_MASTER_INST|Selector20~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector20~2_combout\ = (!\I2C_MASTER_INST|Selector0~2_combout\ & ((\I2C_MASTER_INST|Equal2~0_combout\ & (\I2C_MASTER_INST|data\(3))) # (!\I2C_MASTER_INST|Equal2~0_combout\ & ((\I2C_MASTER_INST|data\(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|Equal2~0_combout\,
	datab => \I2C_MASTER_INST|data\(3),
	datac => \I2C_MASTER_INST|data\(4),
	datad => \I2C_MASTER_INST|Selector0~2_combout\,
	combout => \I2C_MASTER_INST|Selector20~2_combout\);

-- Location: LCCOMB_X67_Y42_N28
\I2C_MASTER_INST|Selector20~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector20~1_combout\ = (\I2C_MASTER_INST|data\(4) & (((\I2C_MASTER_INST|Selector23~0_combout\ & \I2C_MASTER_INST|data\(3))) # (!\I2C_MASTER_INST|Selector23~1_combout\))) # (!\I2C_MASTER_INST|data\(4) & 
-- (\I2C_MASTER_INST|Selector23~0_combout\ & (\I2C_MASTER_INST|data\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|data\(4),
	datab => \I2C_MASTER_INST|Selector23~0_combout\,
	datac => \I2C_MASTER_INST|data\(3),
	datad => \I2C_MASTER_INST|Selector23~1_combout\,
	combout => \I2C_MASTER_INST|Selector20~1_combout\);

-- Location: LCCOMB_X67_Y42_N20
\I2C_MASTER_INST|Selector20~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector20~4_combout\ = (\I2C_MASTER_INST|Selector20~2_combout\) # ((\I2C_MASTER_INST|Selector20~1_combout\) # ((\I2C_MASTER_INST|Selector20~3_combout\ & \I2C_MASTER_INST|Selector30~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|Selector20~3_combout\,
	datab => \I2C_MASTER_INST|Selector30~1_combout\,
	datac => \I2C_MASTER_INST|Selector20~2_combout\,
	datad => \I2C_MASTER_INST|Selector20~1_combout\,
	combout => \I2C_MASTER_INST|Selector20~4_combout\);

-- Location: FF_X67_Y42_N21
\I2C_MASTER_INST|data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|Selector20~4_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|data\(4));

-- Location: LCCOMB_X67_Y43_N28
\I2C_MASTER_INST|Selector19~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector19~0_combout\ = (\I2C_MASTER_INST|fsm_state.S_IDLE~q\ & (\I2C_MASTER_INST|data\(4))) # (!\I2C_MASTER_INST|fsm_state.S_IDLE~q\ & (((!\CODECCONTROLLER_INST|reg_idx\(2) & \CODECCONTROLLER_INST|reg_idx\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|data\(4),
	datab => \CODECCONTROLLER_INST|reg_idx\(2),
	datac => \I2C_MASTER_INST|fsm_state.S_IDLE~q\,
	datad => \CODECCONTROLLER_INST|reg_idx\(1),
	combout => \I2C_MASTER_INST|Selector19~0_combout\);

-- Location: FF_X67_Y43_N29
\I2C_MASTER_INST|data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|Selector19~0_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|data[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|data\(5));

-- Location: LCCOMB_X67_Y43_N18
\I2C_MASTER_INST|Selector18~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector18~0_combout\ = (\I2C_MASTER_INST|fsm_state.S_IDLE~q\ & (((\I2C_MASTER_INST|data\(5))))) # (!\I2C_MASTER_INST|fsm_state.S_IDLE~q\ & (\CODECCONTROLLER_INST|reg_idx\(1) & (!\CODECCONTROLLER_INST|reg_idx\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|fsm_state.S_IDLE~q\,
	datab => \CODECCONTROLLER_INST|reg_idx\(1),
	datac => \CODECCONTROLLER_INST|reg_idx\(2),
	datad => \I2C_MASTER_INST|data\(5),
	combout => \I2C_MASTER_INST|Selector18~0_combout\);

-- Location: FF_X67_Y43_N19
\I2C_MASTER_INST|data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|Selector18~0_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|data[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|data\(6));

-- Location: LCCOMB_X67_Y43_N20
\I2C_MASTER_INST|Selector17~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector17~0_combout\ = (\I2C_MASTER_INST|fsm_state.S_IDLE~q\ & \I2C_MASTER_INST|data\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \I2C_MASTER_INST|fsm_state.S_IDLE~q\,
	datad => \I2C_MASTER_INST|data\(6),
	combout => \I2C_MASTER_INST|Selector17~0_combout\);

-- Location: FF_X67_Y43_N21
\I2C_MASTER_INST|data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|Selector17~0_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|data[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|data\(7));

-- Location: LCCOMB_X70_Y43_N14
\I2C_MASTER_INST|Selector16~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector16~0_combout\ = (\I2C_MASTER_INST|data\(7) & \I2C_MASTER_INST|fsm_state.S_IDLE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \I2C_MASTER_INST|data\(7),
	datad => \I2C_MASTER_INST|fsm_state.S_IDLE~q\,
	combout => \I2C_MASTER_INST|Selector16~0_combout\);

-- Location: FF_X70_Y43_N15
\I2C_MASTER_INST|data[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|Selector16~0_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|data[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|data\(8));

-- Location: LCCOMB_X70_Y43_N20
\I2C_MASTER_INST|Selector15~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector15~0_combout\ = (\I2C_MASTER_INST|fsm_state.S_IDLE~q\ & ((\I2C_MASTER_INST|data\(8)))) # (!\I2C_MASTER_INST|fsm_state.S_IDLE~q\ & (\CODECCONTROLLER_INST|reg_idx\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CODECCONTROLLER_INST|reg_idx\(0),
	datac => \I2C_MASTER_INST|data\(8),
	datad => \I2C_MASTER_INST|fsm_state.S_IDLE~q\,
	combout => \I2C_MASTER_INST|Selector15~0_combout\);

-- Location: FF_X70_Y43_N21
\I2C_MASTER_INST|data[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|Selector15~0_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|data[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|data\(9));

-- Location: LCCOMB_X70_Y43_N6
\I2C_MASTER_INST|Selector14~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector14~0_combout\ = (\I2C_MASTER_INST|fsm_state.S_IDLE~q\ & ((\I2C_MASTER_INST|data\(9)))) # (!\I2C_MASTER_INST|fsm_state.S_IDLE~q\ & (\CODECCONTROLLER_INST|reg_idx\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CODECCONTROLLER_INST|reg_idx\(1),
	datab => \I2C_MASTER_INST|data\(9),
	datad => \I2C_MASTER_INST|fsm_state.S_IDLE~q\,
	combout => \I2C_MASTER_INST|Selector14~0_combout\);

-- Location: FF_X70_Y43_N7
\I2C_MASTER_INST|data[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|Selector14~0_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|data[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|data\(10));

-- Location: LCCOMB_X70_Y43_N12
\I2C_MASTER_INST|Selector13~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector13~0_combout\ = (\I2C_MASTER_INST|fsm_state.S_IDLE~q\ & (\I2C_MASTER_INST|data\(10))) # (!\I2C_MASTER_INST|fsm_state.S_IDLE~q\ & ((\CODECCONTROLLER_INST|reg_idx\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|data\(10),
	datac => \CODECCONTROLLER_INST|reg_idx\(2),
	datad => \I2C_MASTER_INST|fsm_state.S_IDLE~q\,
	combout => \I2C_MASTER_INST|Selector13~0_combout\);

-- Location: FF_X70_Y43_N13
\I2C_MASTER_INST|data[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|Selector13~0_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|data[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|data\(11));

-- Location: LCCOMB_X70_Y43_N10
\I2C_MASTER_INST|Selector12~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector12~0_combout\ = (\I2C_MASTER_INST|fsm_state.S_IDLE~q\ & (\I2C_MASTER_INST|data\(11))) # (!\I2C_MASTER_INST|fsm_state.S_IDLE~q\ & ((\CODECCONTROLLER_INST|reg_idx\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|data\(11),
	datab => \CODECCONTROLLER_INST|reg_idx\(3),
	datad => \I2C_MASTER_INST|fsm_state.S_IDLE~q\,
	combout => \I2C_MASTER_INST|Selector12~0_combout\);

-- Location: FF_X70_Y43_N11
\I2C_MASTER_INST|data[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|Selector12~0_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|data[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|data\(12));

-- Location: LCCOMB_X70_Y43_N16
\I2C_MASTER_INST|Selector11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector11~0_combout\ = (\I2C_MASTER_INST|fsm_state.S_IDLE~q\ & (\I2C_MASTER_INST|data\(12))) # (!\I2C_MASTER_INST|fsm_state.S_IDLE~q\ & ((\CODECCONTROLLER_INST|reg_idx\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|data\(12),
	datac => \CODECCONTROLLER_INST|reg_idx\(4),
	datad => \I2C_MASTER_INST|fsm_state.S_IDLE~q\,
	combout => \I2C_MASTER_INST|Selector11~0_combout\);

-- Location: FF_X70_Y43_N17
\I2C_MASTER_INST|data[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|Selector11~0_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|data[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|data\(13));

-- Location: LCCOMB_X70_Y43_N2
\I2C_MASTER_INST|Selector10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector10~0_combout\ = (\I2C_MASTER_INST|fsm_state.S_IDLE~q\ & (\I2C_MASTER_INST|data\(13))) # (!\I2C_MASTER_INST|fsm_state.S_IDLE~q\ & ((\CODECCONTROLLER_INST|reg_idx\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \I2C_MASTER_INST|data\(13),
	datac => \CODECCONTROLLER_INST|reg_idx\(5),
	datad => \I2C_MASTER_INST|fsm_state.S_IDLE~q\,
	combout => \I2C_MASTER_INST|Selector10~0_combout\);

-- Location: FF_X70_Y43_N3
\I2C_MASTER_INST|data[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|Selector10~0_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|data[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|data\(14));

-- Location: LCCOMB_X70_Y43_N8
\I2C_MASTER_INST|Selector9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector9~0_combout\ = (\I2C_MASTER_INST|fsm_state.S_IDLE~q\ & (\I2C_MASTER_INST|data\(14))) # (!\I2C_MASTER_INST|fsm_state.S_IDLE~q\ & ((\CODECCONTROLLER_INST|reg_idx\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \I2C_MASTER_INST|data\(14),
	datac => \CODECCONTROLLER_INST|reg_idx\(6),
	datad => \I2C_MASTER_INST|fsm_state.S_IDLE~q\,
	combout => \I2C_MASTER_INST|Selector9~0_combout\);

-- Location: FF_X70_Y43_N9
\I2C_MASTER_INST|data[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|Selector9~0_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|data[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|data\(15));

-- Location: LCCOMB_X70_Y43_N30
\I2C_MASTER_INST|Selector8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector8~0_combout\ = (\I2C_MASTER_INST|data\(15) & \I2C_MASTER_INST|fsm_state.S_IDLE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \I2C_MASTER_INST|data\(15),
	datad => \I2C_MASTER_INST|fsm_state.S_IDLE~q\,
	combout => \I2C_MASTER_INST|Selector8~0_combout\);

-- Location: FF_X70_Y43_N31
\I2C_MASTER_INST|data[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|Selector8~0_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|data[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|data\(16));

-- Location: LCCOMB_X70_Y43_N0
\I2C_MASTER_INST|Selector7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector7~0_combout\ = (\I2C_MASTER_INST|data\(16) & \I2C_MASTER_INST|fsm_state.S_IDLE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \I2C_MASTER_INST|data\(16),
	datad => \I2C_MASTER_INST|fsm_state.S_IDLE~q\,
	combout => \I2C_MASTER_INST|Selector7~0_combout\);

-- Location: FF_X70_Y43_N1
\I2C_MASTER_INST|data[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|Selector7~0_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|data[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|data\(17));

-- Location: LCCOMB_X70_Y43_N22
\I2C_MASTER_INST|Selector6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector6~0_combout\ = (\I2C_MASTER_INST|data\(17)) # (!\I2C_MASTER_INST|fsm_state.S_IDLE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \I2C_MASTER_INST|data\(17),
	datad => \I2C_MASTER_INST|fsm_state.S_IDLE~q\,
	combout => \I2C_MASTER_INST|Selector6~0_combout\);

-- Location: FF_X70_Y43_N23
\I2C_MASTER_INST|data[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|Selector6~0_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|data[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|data\(18));

-- Location: LCCOMB_X70_Y43_N28
\I2C_MASTER_INST|Selector5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector5~0_combout\ = (\I2C_MASTER_INST|data\(18) & \I2C_MASTER_INST|fsm_state.S_IDLE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \I2C_MASTER_INST|data\(18),
	datad => \I2C_MASTER_INST|fsm_state.S_IDLE~q\,
	combout => \I2C_MASTER_INST|Selector5~0_combout\);

-- Location: FF_X70_Y43_N29
\I2C_MASTER_INST|data[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|Selector5~0_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|data[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|data\(19));

-- Location: LCCOMB_X70_Y43_N18
\I2C_MASTER_INST|Selector4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector4~0_combout\ = (\I2C_MASTER_INST|data\(19)) # (!\I2C_MASTER_INST|fsm_state.S_IDLE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \I2C_MASTER_INST|data\(19),
	datad => \I2C_MASTER_INST|fsm_state.S_IDLE~q\,
	combout => \I2C_MASTER_INST|Selector4~0_combout\);

-- Location: FF_X70_Y43_N19
\I2C_MASTER_INST|data[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|Selector4~0_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|data[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|data\(20));

-- Location: LCCOMB_X70_Y43_N4
\I2C_MASTER_INST|Selector3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector3~0_combout\ = (\I2C_MASTER_INST|data\(20)) # (!\I2C_MASTER_INST|fsm_state.S_IDLE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \I2C_MASTER_INST|data\(20),
	datad => \I2C_MASTER_INST|fsm_state.S_IDLE~q\,
	combout => \I2C_MASTER_INST|Selector3~0_combout\);

-- Location: FF_X70_Y43_N5
\I2C_MASTER_INST|data[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|Selector3~0_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|data[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|data\(21));

-- Location: LCCOMB_X70_Y43_N26
\I2C_MASTER_INST|Selector2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector2~0_combout\ = (\I2C_MASTER_INST|data\(21) & \I2C_MASTER_INST|fsm_state.S_IDLE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \I2C_MASTER_INST|data\(21),
	datad => \I2C_MASTER_INST|fsm_state.S_IDLE~q\,
	combout => \I2C_MASTER_INST|Selector2~0_combout\);

-- Location: FF_X70_Y43_N27
\I2C_MASTER_INST|data[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|Selector2~0_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|data[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|data\(22));

-- Location: LCCOMB_X70_Y43_N24
\I2C_MASTER_INST|Selector1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector1~0_combout\ = (\I2C_MASTER_INST|data\(22) & \I2C_MASTER_INST|fsm_state.S_IDLE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \I2C_MASTER_INST|data\(22),
	datad => \I2C_MASTER_INST|fsm_state.S_IDLE~q\,
	combout => \I2C_MASTER_INST|Selector1~0_combout\);

-- Location: FF_X70_Y43_N25
\I2C_MASTER_INST|data[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|Selector1~0_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2C_MASTER_INST|data[23]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|data\(23));

-- Location: LCCOMB_X69_Y43_N8
\I2C_MASTER_INST|Selector0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector0~4_combout\ = (\I2C_MASTER_INST|data\(23)) # ((\I2C_MASTER_INST|Selector0~2_combout\ & ((\I2C_MASTER_INST|Equal0~0_combout\) # (!\I2C_MASTER_INST|fsm_state.S_SEND_BYTE~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|Selector0~2_combout\,
	datab => \I2C_MASTER_INST|fsm_state.S_SEND_BYTE~q\,
	datac => \I2C_MASTER_INST|Equal0~0_combout\,
	datad => \I2C_MASTER_INST|data\(23),
	combout => \I2C_MASTER_INST|Selector0~4_combout\);

-- Location: LCCOMB_X69_Y43_N22
\I2C_MASTER_INST|Selector0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector0~3_combout\ = ((!\I2C_MASTER_INST|fsm_state.S_ACK_BYTE~q\ & \I2C_MASTER_INST|Equal2~0_combout\)) # (!\I2C_MASTER_INST|sda~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|fsm_state.S_ACK_BYTE~q\,
	datab => \I2C_MASTER_INST|Equal2~0_combout\,
	datad => \I2C_MASTER_INST|sda~q\,
	combout => \I2C_MASTER_INST|Selector0~3_combout\);

-- Location: LCCOMB_X69_Y43_N6
\I2C_MASTER_INST|Selector0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector0~5_combout\ = (!\I2C_MASTER_INST|fsm_state.S_WAIT_FOR_START~q\ & (\I2C_MASTER_INST|Selector0~4_combout\ & (\I2C_MASTER_INST|Selector0~3_combout\ & !\I2C_MASTER_INST|fsm_state.S_WAIT_FOR_STOP~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|fsm_state.S_WAIT_FOR_START~q\,
	datab => \I2C_MASTER_INST|Selector0~4_combout\,
	datac => \I2C_MASTER_INST|Selector0~3_combout\,
	datad => \I2C_MASTER_INST|fsm_state.S_WAIT_FOR_STOP~q\,
	combout => \I2C_MASTER_INST|Selector0~5_combout\);

-- Location: LCCOMB_X69_Y43_N28
\I2C_MASTER_INST|Selector0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector0~8_combout\ = (!\I2C_MASTER_INST|fsm_state.S_WAIT_FOR_NEXT_BYTE~q\ & (!\I2C_MASTER_INST|fsm_state.S_START~q\ & (\I2C_MASTER_INST|Selector0~6_combout\ & !\I2C_MASTER_INST|fsm_state.S_SEND_BYTE~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|fsm_state.S_WAIT_FOR_NEXT_BYTE~q\,
	datab => \I2C_MASTER_INST|fsm_state.S_START~q\,
	datac => \I2C_MASTER_INST|Selector0~6_combout\,
	datad => \I2C_MASTER_INST|fsm_state.S_SEND_BYTE~q\,
	combout => \I2C_MASTER_INST|Selector0~8_combout\);

-- Location: LCCOMB_X69_Y43_N12
\I2C_MASTER_INST|Selector0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|Selector0~7_combout\ = (!\I2C_MASTER_INST|Selector0~5_combout\ & (!\I2C_MASTER_INST|Selector0~8_combout\ & ((\I2C_MASTER_INST|Equal2~0_combout\) # (\I2C_MASTER_INST|sda~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|Selector0~5_combout\,
	datab => \I2C_MASTER_INST|Equal2~0_combout\,
	datac => \I2C_MASTER_INST|sda~q\,
	datad => \I2C_MASTER_INST|Selector0~8_combout\,
	combout => \I2C_MASTER_INST|Selector0~7_combout\);

-- Location: FF_X69_Y43_N13
\I2C_MASTER_INST|sda\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|Selector0~7_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|sda~q\);

-- Location: IOIBUF_X0_Y20_N15
\SW[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(15),
	o => \SW[15]~input_o\);

-- Location: LCCOMB_X1_Y20_N24
\INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg[1]~feeder_combout\ = \SW[15]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SW[15]~input_o\,
	combout => \INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg[1]~feeder_combout\);

-- Location: FF_X1_Y20_N25
\INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg[1]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg\(1));

-- Location: FF_X9_Y20_N17
\INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	asdata => \INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg\(1),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg\(0));

-- Location: LCCOMB_X9_Y20_N20
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector4~0_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.hold_L~q\ & \INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.hold_L~q\,
	datad => \INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg\(0),
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector4~0_combout\);

-- Location: LCCOMB_X11_Y21_N2
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[0]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[0]~31_combout\ = \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(0) $ (VCC)
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[0]~32\ = CARRY(\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(0),
	datad => VCC,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[0]~31_combout\,
	cout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[0]~32\);

-- Location: LCCOMB_X10_Y20_N18
\~GND\ : cycloneive_lcell_comb
-- Equation(s):
-- \~GND~combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~GND~combout\);

-- Location: LCCOMB_X11_Y21_N4
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[1]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[1]~33_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(1) & (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[0]~32\)) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(1) & 
-- ((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[0]~32\) # (GND)))
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[1]~34\ = CARRY((!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[0]~32\) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(1),
	datad => VCC,
	cin => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[0]~32\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[1]~33_combout\,
	cout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[1]~34\);

-- Location: LCCOMB_X10_Y21_N16
\INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg[0]~_wirecell\ : cycloneive_lcell_comb
-- Equation(s):
-- \INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg[0]~_wirecell_combout\ = !\INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg\(0),
	combout => \INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg[0]~_wirecell_combout\);

-- Location: LCCOMB_X9_Y20_N12
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|folge_zustand~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|folge_zustand~0_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_bclk~q\) # (!\INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_bclk~q\,
	datad => \INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg\(0),
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|folge_zustand~0_combout\);

-- Location: FF_X11_Y21_N5
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[1]~33_combout\,
	asdata => \INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg[0]~_wirecell_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~36_combout\,
	ena => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|folge_zustand~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(1));

-- Location: LCCOMB_X11_Y21_N6
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[2]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[2]~37_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(2) & (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[1]~34\ $ (GND))) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(2) & 
-- (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[1]~34\ & VCC))
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[2]~38\ = CARRY((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(2) & !\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[1]~34\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(2),
	datad => VCC,
	cin => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[1]~34\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[2]~37_combout\,
	cout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[2]~38\);

-- Location: FF_X11_Y21_N7
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[2]~37_combout\,
	asdata => \INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg[0]~_wirecell_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~36_combout\,
	ena => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|folge_zustand~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(2));

-- Location: LCCOMB_X11_Y21_N8
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[3]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[3]~39_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(3) & (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[2]~38\)) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(3) & 
-- ((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[2]~38\) # (GND)))
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[3]~40\ = CARRY((!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[2]~38\) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(3),
	datad => VCC,
	cin => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[2]~38\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[3]~39_combout\,
	cout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[3]~40\);

-- Location: FF_X11_Y21_N9
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[3]~39_combout\,
	asdata => \INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg[0]~_wirecell_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~36_combout\,
	ena => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|folge_zustand~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(3));

-- Location: LCCOMB_X11_Y21_N10
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[4]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[4]~41_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(4) & (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[3]~40\ $ (GND))) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(4) & 
-- (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[3]~40\ & VCC))
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[4]~42\ = CARRY((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(4) & !\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[3]~40\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(4),
	datad => VCC,
	cin => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[3]~40\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[4]~41_combout\,
	cout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[4]~42\);

-- Location: FF_X11_Y21_N11
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[4]~41_combout\,
	asdata => \INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg[0]~_wirecell_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~36_combout\,
	ena => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|folge_zustand~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(4));

-- Location: LCCOMB_X11_Y21_N12
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~43_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(5) & (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[4]~42\)) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(5) & 
-- ((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[4]~42\) # (GND)))
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~44\ = CARRY((!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[4]~42\) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(5),
	datad => VCC,
	cin => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[4]~42\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~43_combout\,
	cout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~44\);

-- Location: FF_X11_Y21_N13
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~43_combout\,
	asdata => \INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg[0]~_wirecell_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~36_combout\,
	ena => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|folge_zustand~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(5));

-- Location: LCCOMB_X11_Y21_N14
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[6]~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[6]~45_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(6) & (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~44\ $ (GND))) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(6) & 
-- (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~44\ & VCC))
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[6]~46\ = CARRY((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(6) & !\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~44\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(6),
	datad => VCC,
	cin => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~44\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[6]~45_combout\,
	cout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[6]~46\);

-- Location: FF_X11_Y21_N15
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[6]~45_combout\,
	asdata => \INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg[0]~_wirecell_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~36_combout\,
	ena => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|folge_zustand~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(6));

-- Location: LCCOMB_X11_Y21_N16
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[7]~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[7]~47_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(7) & (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[6]~46\)) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(7) & 
-- ((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[6]~46\) # (GND)))
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[7]~48\ = CARRY((!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[6]~46\) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(7),
	datad => VCC,
	cin => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[6]~46\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[7]~47_combout\,
	cout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[7]~48\);

-- Location: FF_X11_Y21_N17
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[7]~47_combout\,
	asdata => \~GND~combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~36_combout\,
	ena => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|folge_zustand~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(7));

-- Location: LCCOMB_X11_Y21_N18
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[8]~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[8]~49_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(8) & (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[7]~48\ $ (GND))) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(8) & 
-- (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[7]~48\ & VCC))
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[8]~50\ = CARRY((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(8) & !\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[7]~48\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(8),
	datad => VCC,
	cin => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[7]~48\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[8]~49_combout\,
	cout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[8]~50\);

-- Location: FF_X11_Y21_N19
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[8]~49_combout\,
	asdata => \INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg[0]~_wirecell_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~36_combout\,
	ena => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|folge_zustand~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(8));

-- Location: LCCOMB_X11_Y21_N20
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[9]~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[9]~51_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(9) & (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[8]~50\)) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(9) & 
-- ((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[8]~50\) # (GND)))
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[9]~52\ = CARRY((!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[8]~50\) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(9),
	datad => VCC,
	cin => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[8]~50\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[9]~51_combout\,
	cout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[9]~52\);

-- Location: FF_X11_Y21_N21
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[9]~51_combout\,
	asdata => \~GND~combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~36_combout\,
	ena => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|folge_zustand~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(9));

-- Location: LCCOMB_X11_Y21_N22
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[10]~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[10]~53_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(10) & (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[9]~52\ $ (GND))) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(10) & 
-- (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[9]~52\ & VCC))
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[10]~54\ = CARRY((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(10) & !\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[9]~52\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(10),
	datad => VCC,
	cin => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[9]~52\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[10]~53_combout\,
	cout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[10]~54\);

-- Location: FF_X11_Y21_N23
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[10]~53_combout\,
	asdata => \~GND~combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~36_combout\,
	ena => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|folge_zustand~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(10));

-- Location: LCCOMB_X11_Y21_N24
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[11]~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[11]~55_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(11) & (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[10]~54\)) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(11) & 
-- ((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[10]~54\) # (GND)))
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[11]~56\ = CARRY((!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[10]~54\) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(11),
	datad => VCC,
	cin => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[10]~54\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[11]~55_combout\,
	cout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[11]~56\);

-- Location: FF_X11_Y21_N25
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[11]~55_combout\,
	asdata => \~GND~combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~36_combout\,
	ena => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|folge_zustand~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(11));

-- Location: LCCOMB_X11_Y21_N26
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[12]~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[12]~57_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(12) & (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[11]~56\ $ (GND))) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(12) & 
-- (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[11]~56\ & VCC))
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[12]~58\ = CARRY((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(12) & !\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[11]~56\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(12),
	datad => VCC,
	cin => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[11]~56\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[12]~57_combout\,
	cout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[12]~58\);

-- Location: FF_X11_Y21_N27
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[12]~57_combout\,
	asdata => \~GND~combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~36_combout\,
	ena => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|folge_zustand~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(12));

-- Location: LCCOMB_X11_Y21_N28
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[13]~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[13]~59_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(13) & (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[12]~58\)) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(13) & 
-- ((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[12]~58\) # (GND)))
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[13]~60\ = CARRY((!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[12]~58\) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(13),
	datad => VCC,
	cin => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[12]~58\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[13]~59_combout\,
	cout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[13]~60\);

-- Location: FF_X11_Y21_N29
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[13]~59_combout\,
	asdata => \~GND~combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~36_combout\,
	ena => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|folge_zustand~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(13));

-- Location: LCCOMB_X11_Y21_N30
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[14]~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[14]~61_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(14) & (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[13]~60\ $ (GND))) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(14) & 
-- (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[13]~60\ & VCC))
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[14]~62\ = CARRY((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(14) & !\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[13]~60\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(14),
	datad => VCC,
	cin => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[13]~60\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[14]~61_combout\,
	cout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[14]~62\);

-- Location: FF_X11_Y21_N31
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[14]~61_combout\,
	asdata => \~GND~combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~36_combout\,
	ena => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|folge_zustand~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(14));

-- Location: LCCOMB_X11_Y20_N0
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[15]~63\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[15]~63_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(15) & (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[14]~62\)) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(15) & 
-- ((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[14]~62\) # (GND)))
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[15]~64\ = CARRY((!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[14]~62\) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(15),
	datad => VCC,
	cin => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[14]~62\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[15]~63_combout\,
	cout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[15]~64\);

-- Location: FF_X11_Y20_N1
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[15]~63_combout\,
	asdata => \~GND~combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~36_combout\,
	ena => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|folge_zustand~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(15));

-- Location: LCCOMB_X11_Y20_N2
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[16]~65\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[16]~65_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(16) & (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[15]~64\ $ (GND))) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(16) & 
-- (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[15]~64\ & VCC))
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[16]~66\ = CARRY((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(16) & !\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[15]~64\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(16),
	datad => VCC,
	cin => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[15]~64\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[16]~65_combout\,
	cout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[16]~66\);

-- Location: FF_X11_Y20_N3
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[16]~65_combout\,
	asdata => \~GND~combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~36_combout\,
	ena => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|folge_zustand~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(16));

-- Location: LCCOMB_X11_Y20_N4
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[17]~67\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[17]~67_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(17) & (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[16]~66\)) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(17) & 
-- ((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[16]~66\) # (GND)))
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[17]~68\ = CARRY((!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[16]~66\) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(17),
	datad => VCC,
	cin => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[16]~66\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[17]~67_combout\,
	cout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[17]~68\);

-- Location: FF_X11_Y20_N5
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[17]~67_combout\,
	asdata => \~GND~combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~36_combout\,
	ena => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|folge_zustand~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(17));

-- Location: LCCOMB_X11_Y20_N6
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[18]~69\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[18]~69_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(18) & (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[17]~68\ $ (GND))) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(18) & 
-- (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[17]~68\ & VCC))
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[18]~70\ = CARRY((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(18) & !\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[17]~68\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(18),
	datad => VCC,
	cin => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[17]~68\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[18]~69_combout\,
	cout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[18]~70\);

-- Location: FF_X11_Y20_N7
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[18]~69_combout\,
	asdata => \~GND~combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~36_combout\,
	ena => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|folge_zustand~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(18));

-- Location: LCCOMB_X11_Y20_N8
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[19]~71\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[19]~71_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(19) & (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[18]~70\)) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(19) & 
-- ((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[18]~70\) # (GND)))
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[19]~72\ = CARRY((!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[18]~70\) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(19),
	datad => VCC,
	cin => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[18]~70\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[19]~71_combout\,
	cout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[19]~72\);

-- Location: FF_X11_Y20_N9
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[19]~71_combout\,
	asdata => \~GND~combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~36_combout\,
	ena => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|folge_zustand~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(19));

-- Location: LCCOMB_X11_Y20_N10
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[20]~73\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[20]~73_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(20) & (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[19]~72\ $ (GND))) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(20) & 
-- (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[19]~72\ & VCC))
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[20]~74\ = CARRY((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(20) & !\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[19]~72\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(20),
	datad => VCC,
	cin => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[19]~72\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[20]~73_combout\,
	cout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[20]~74\);

-- Location: FF_X11_Y20_N11
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[20]~73_combout\,
	asdata => \~GND~combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~36_combout\,
	ena => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|folge_zustand~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(20));

-- Location: LCCOMB_X10_Y20_N10
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~3_combout\ = (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(18) & (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(19) & (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(20) & 
-- !\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(18),
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(19),
	datac => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(20),
	datad => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(17),
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~3_combout\);

-- Location: LCCOMB_X10_Y20_N14
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~0_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(1) & (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(2) & (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(7) & 
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(1),
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(2),
	datac => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(7),
	datad => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(3),
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~0_combout\);

-- Location: LCCOMB_X10_Y20_N4
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~2_combout\ = (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(13) & (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(15) & (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(14) & 
-- !\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(13),
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(15),
	datac => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(14),
	datad => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(16),
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~2_combout\);

-- Location: LCCOMB_X11_Y21_N0
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~1_combout\ = (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(12) & (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(9) & (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(10) & 
-- !\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(12),
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(9),
	datac => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(10),
	datad => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(11),
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~1_combout\);

-- Location: LCCOMB_X10_Y20_N20
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~4_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~3_combout\ & (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~0_combout\ & (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~2_combout\ & 
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~3_combout\,
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~0_combout\,
	datac => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~2_combout\,
	datad => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~1_combout\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~4_combout\);

-- Location: LCCOMB_X11_Y20_N12
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[21]~75\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[21]~75_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(21) & (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[20]~74\)) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(21) & 
-- ((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[20]~74\) # (GND)))
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[21]~76\ = CARRY((!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[20]~74\) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(21),
	datad => VCC,
	cin => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[20]~74\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[21]~75_combout\,
	cout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[21]~76\);

-- Location: FF_X11_Y20_N13
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[21]~75_combout\,
	asdata => \~GND~combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~36_combout\,
	ena => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|folge_zustand~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(21));

-- Location: LCCOMB_X11_Y20_N14
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[22]~77\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[22]~77_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(22) & (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[21]~76\ $ (GND))) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(22) & 
-- (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[21]~76\ & VCC))
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[22]~78\ = CARRY((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(22) & !\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[21]~76\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(22),
	datad => VCC,
	cin => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[21]~76\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[22]~77_combout\,
	cout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[22]~78\);

-- Location: FF_X11_Y20_N15
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[22]~77_combout\,
	asdata => \~GND~combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~36_combout\,
	ena => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|folge_zustand~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(22));

-- Location: LCCOMB_X11_Y20_N16
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[23]~79\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[23]~79_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(23) & (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[22]~78\)) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(23) & 
-- ((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[22]~78\) # (GND)))
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[23]~80\ = CARRY((!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[22]~78\) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(23),
	datad => VCC,
	cin => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[22]~78\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[23]~79_combout\,
	cout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[23]~80\);

-- Location: FF_X11_Y20_N17
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[23]~79_combout\,
	asdata => \~GND~combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~36_combout\,
	ena => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|folge_zustand~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(23));

-- Location: LCCOMB_X11_Y20_N18
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[24]~81\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[24]~81_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(24) & (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[23]~80\ $ (GND))) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(24) & 
-- (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[23]~80\ & VCC))
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[24]~82\ = CARRY((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(24) & !\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[23]~80\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(24),
	datad => VCC,
	cin => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[23]~80\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[24]~81_combout\,
	cout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[24]~82\);

-- Location: FF_X11_Y20_N19
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[24]~81_combout\,
	asdata => \~GND~combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~36_combout\,
	ena => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|folge_zustand~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(24));

-- Location: LCCOMB_X10_Y20_N26
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~5_combout\ = (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(21) & (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(24) & (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(22) & 
-- !\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(23))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(21),
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(24),
	datac => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(22),
	datad => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(23),
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~5_combout\);

-- Location: LCCOMB_X11_Y20_N20
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[25]~83\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[25]~83_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(25) & (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[24]~82\)) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(25) & 
-- ((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[24]~82\) # (GND)))
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[25]~84\ = CARRY((!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[24]~82\) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(25),
	datad => VCC,
	cin => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[24]~82\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[25]~83_combout\,
	cout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[25]~84\);

-- Location: FF_X11_Y20_N21
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[25]~83_combout\,
	asdata => \~GND~combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~36_combout\,
	ena => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|folge_zustand~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(25));

-- Location: LCCOMB_X11_Y20_N22
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[26]~85\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[26]~85_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(26) & (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[25]~84\ $ (GND))) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(26) & 
-- (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[25]~84\ & VCC))
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[26]~86\ = CARRY((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(26) & !\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[25]~84\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(26),
	datad => VCC,
	cin => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[25]~84\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[26]~85_combout\,
	cout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[26]~86\);

-- Location: FF_X11_Y20_N23
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[26]~85_combout\,
	asdata => \~GND~combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~36_combout\,
	ena => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|folge_zustand~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(26));

-- Location: LCCOMB_X11_Y20_N24
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[27]~87\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[27]~87_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(27) & (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[26]~86\)) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(27) & 
-- ((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[26]~86\) # (GND)))
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[27]~88\ = CARRY((!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[26]~86\) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(27),
	datad => VCC,
	cin => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[26]~86\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[27]~87_combout\,
	cout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[27]~88\);

-- Location: FF_X11_Y20_N25
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[27]~87_combout\,
	asdata => \~GND~combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~36_combout\,
	ena => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|folge_zustand~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(27));

-- Location: LCCOMB_X11_Y20_N26
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[28]~89\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[28]~89_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(28) & (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[27]~88\ $ (GND))) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(28) & 
-- (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[27]~88\ & VCC))
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[28]~90\ = CARRY((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(28) & !\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[27]~88\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(28),
	datad => VCC,
	cin => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[27]~88\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[28]~89_combout\,
	cout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[28]~90\);

-- Location: FF_X11_Y20_N27
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[28]~89_combout\,
	asdata => \~GND~combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~36_combout\,
	ena => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|folge_zustand~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(28));

-- Location: LCCOMB_X11_Y20_N28
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[29]~91\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[29]~91_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(29) & (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[28]~90\)) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(29) & 
-- ((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[28]~90\) # (GND)))
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[29]~92\ = CARRY((!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[28]~90\) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(29),
	datad => VCC,
	cin => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[28]~90\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[29]~91_combout\,
	cout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[29]~92\);

-- Location: FF_X11_Y20_N29
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[29]~91_combout\,
	asdata => \~GND~combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~36_combout\,
	ena => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|folge_zustand~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(29));

-- Location: LCCOMB_X11_Y20_N30
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[30]~93\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[30]~93_combout\ = \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(30) $ (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[29]~92\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(30),
	cin => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[29]~92\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[30]~93_combout\);

-- Location: FF_X11_Y20_N31
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[30]~93_combout\,
	asdata => \~GND~combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~36_combout\,
	ena => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|folge_zustand~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(30));

-- Location: LCCOMB_X10_Y20_N8
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~6_combout\ = (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(25) & (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(28) & (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(27) & 
-- !\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(26))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(25),
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(28),
	datac => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(27),
	datad => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(26),
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~6_combout\);

-- Location: LCCOMB_X10_Y20_N30
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~7_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~5_combout\ & (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(30) & (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~6_combout\ & 
-- !\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(29))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~5_combout\,
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(30),
	datac => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~6_combout\,
	datad => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(29),
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~7_combout\);

-- Location: LCCOMB_X10_Y20_N12
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ws_logik~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ws_logik~0_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(4) & (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(5) & (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(8) & 
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(4),
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(5),
	datac => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(8),
	datad => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(6),
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ws_logik~0_combout\);

-- Location: LCCOMB_X10_Y20_N6
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~35_combout\ = (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ws_logik~0_combout\) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(0),
	datad => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ws_logik~0_combout\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~35_combout\);

-- Location: LCCOMB_X10_Y20_N0
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~36_combout\ = ((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~4_combout\ & (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~7_combout\ & !\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~35_combout\))) # 
-- (!\INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010111010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg\(0),
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~4_combout\,
	datac => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~7_combout\,
	datad => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~35_combout\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~36_combout\);

-- Location: FF_X11_Y21_N3
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[0]~31_combout\,
	asdata => \~GND~combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx[5]~36_combout\,
	ena => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|folge_zustand~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(0));

-- Location: LCCOMB_X10_Y20_N2
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~11_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~7_combout\ & \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~7_combout\,
	datad => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~4_combout\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~11_combout\);

-- Location: LCCOMB_X9_Y20_N10
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ws_logik~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ws_logik~1_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_bclk~q\ & (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(0) & (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ws_logik~0_combout\ & 
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~11_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_bclk~q\,
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(0),
	datac => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ws_logik~0_combout\,
	datad => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~11_combout\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ws_logik~1_combout\);

-- Location: LCCOMB_X9_Y20_N26
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector4~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector4~3_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.shift_adc_R~q\ & \INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.shift_adc_R~q\,
	datad => \INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg\(0),
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector4~3_combout\);

-- Location: LCCOMB_X9_Y20_N8
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|next_s_WS~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|next_s_WS~0_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_WS~q\ $ (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ws_logik~1_combout\)) # (!\INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg\(0),
	datac => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_WS~q\,
	datad => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ws_logik~1_combout\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|next_s_WS~0_combout\);

-- Location: FF_X9_Y20_N9
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_WS\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|next_s_WS~0_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_WS~q\);

-- Location: LCCOMB_X9_Y20_N30
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector4~1_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_WS~q\ & \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_bclk~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_WS~q\,
	datad => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_bclk~q\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector4~1_combout\);

-- Location: LCCOMB_X9_Y20_N4
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector4~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector4~2_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector4~1_combout\ & (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(0) & (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ws_logik~0_combout\ & 
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~11_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector4~1_combout\,
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(0),
	datac => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ws_logik~0_combout\,
	datad => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~11_combout\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector4~2_combout\);

-- Location: LCCOMB_X10_Y20_N22
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~9_combout\ = (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(8) & !\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(8),
	datad => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(6),
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~9_combout\);

-- Location: LCCOMB_X10_Y20_N28
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~8_combout\ = (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(4) & (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_bclk~q\ & (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(0) & 
-- !\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(4),
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_bclk~q\,
	datac => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(0),
	datad => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|reg_idx\(5),
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~8_combout\);

-- Location: LCCOMB_X10_Y20_N24
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~10_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~9_combout\ & (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~8_combout\ & (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~7_combout\ & 
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~9_combout\,
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~8_combout\,
	datac => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~7_combout\,
	datad => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~4_combout\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~10_combout\);

-- Location: LCCOMB_X9_Y20_N28
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector4~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector4~4_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector4~3_combout\ & (((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector4~0_combout\ & \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector4~2_combout\)) # 
-- (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~10_combout\))) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector4~3_combout\ & (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector4~0_combout\ & (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector4~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector4~3_combout\,
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector4~0_combout\,
	datac => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector4~2_combout\,
	datad => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~10_combout\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector4~4_combout\);

-- Location: FF_X9_Y20_N29
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.shift_adc_R\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector4~4_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.shift_adc_R~q\);

-- Location: LCCOMB_X9_Y20_N18
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector0~0_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.load_dac~q\) # ((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.hold_L~q\) # ((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.shift_adc_R~q\) # 
-- (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.shift_adc_L~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.load_dac~q\,
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.hold_L~q\,
	datac => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.shift_adc_R~q\,
	datad => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.shift_adc_L~q\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector0~0_combout\);

-- Location: LCCOMB_X9_Y20_N24
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector0~1_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector0~0_combout\ & (((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.shift_adc_R~q\ & \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~10_combout\)) # 
-- (!\INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg\(0)))) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector0~0_combout\ & (((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.shift_adc_R~q\ & \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector0~0_combout\,
	datab => \INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg\(0),
	datac => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.shift_adc_R~q\,
	datad => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~10_combout\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector0~1_combout\);

-- Location: LCCOMB_X9_Y20_N22
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector0~2_combout\ = (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector0~1_combout\ & ((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ws_logik~1_combout\) # (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.hold_R~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ws_logik~1_combout\,
	datac => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.hold_R~q\,
	datad => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector0~1_combout\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector0~2_combout\);

-- Location: FF_X9_Y20_N23
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.hold_R\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector0~2_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.hold_R~q\);

-- Location: LCCOMB_X9_Y20_N2
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector1~0_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.hold_R~q\ & (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|folge_zustand~0_combout\ & (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.load_dac~q\))) # 
-- (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.hold_R~q\ & ((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ws_logik~1_combout\) # ((!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|folge_zustand~0_combout\ & \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.load_dac~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.hold_R~q\,
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|folge_zustand~0_combout\,
	datac => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.load_dac~q\,
	datad => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ws_logik~1_combout\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector1~0_combout\);

-- Location: FF_X9_Y20_N3
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.load_dac\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector1~0_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.load_dac~q\);

-- Location: LCCOMB_X9_Y20_N16
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector2~0_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_bclk~q\ & (\INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg\(0) & \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.load_dac~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_bclk~q\,
	datac => \INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg\(0),
	datad => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.load_dac~q\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector2~0_combout\);

-- Location: LCCOMB_X10_Y20_N16
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector2~1_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector2~0_combout\) # ((\INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg\(0) & (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.shift_adc_L~q\ & 
-- !\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg\(0),
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector2~0_combout\,
	datac => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.shift_adc_L~q\,
	datad => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~10_combout\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector2~1_combout\);

-- Location: FF_X10_Y20_N17
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.shift_adc_L\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector2~1_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.shift_adc_L~q\);

-- Location: LCCOMB_X9_Y20_N14
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector3~0_combout\ = (\INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg\(0) & \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.shift_adc_L~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \INFRASTRUCTURE_BLOCK_INST|sync_inst15|qreg\(0),
	datad => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.shift_adc_L~q\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector3~0_combout\);

-- Location: LCCOMB_X9_Y20_N0
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector3~1_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector4~0_combout\ & (((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector3~0_combout\ & \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~10_combout\)) # 
-- (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector4~2_combout\))) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector4~0_combout\ & (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector3~0_combout\ & ((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector4~0_combout\,
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector3~0_combout\,
	datac => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector4~2_combout\,
	datad => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|logic~10_combout\,
	combout => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector3~1_combout\);

-- Location: FF_X9_Y20_N1
\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.hold_L\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|Selector3~1_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.hold_L~q\);

-- Location: IOIBUF_X0_Y23_N15
\AUD_ADCDAT~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_AUD_ADCDAT,
	o => \AUD_ADCDAT~input_o\);

-- Location: LCCOMB_X6_Y23_N0
\I2S_MASTER_INST|S2P_INST|l_zustand[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|S2P_INST|l_zustand[0]~feeder_combout\ = \AUD_ADCDAT~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \AUD_ADCDAT~input_o\,
	combout => \I2S_MASTER_INST|S2P_INST|l_zustand[0]~feeder_combout\);

-- Location: LCCOMB_X6_Y23_N18
\I2S_MASTER_INST|S2P_INST|einganglog_l~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|S2P_INST|einganglog_l~0_combout\ = (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_bclk~q\ & \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.shift_adc_L~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_bclk~q\,
	datad => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.shift_adc_L~q\,
	combout => \I2S_MASTER_INST|S2P_INST|einganglog_l~0_combout\);

-- Location: FF_X6_Y23_N1
\I2S_MASTER_INST|S2P_INST|l_zustand[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|S2P_INST|l_zustand[0]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2S_MASTER_INST|S2P_INST|einganglog_l~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|S2P_INST|l_zustand\(0));

-- Location: LCCOMB_X6_Y23_N26
\I2S_MASTER_INST|S2P_INST|l_zustand[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|S2P_INST|l_zustand[1]~feeder_combout\ = \I2S_MASTER_INST|S2P_INST|l_zustand\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \I2S_MASTER_INST|S2P_INST|l_zustand\(0),
	combout => \I2S_MASTER_INST|S2P_INST|l_zustand[1]~feeder_combout\);

-- Location: FF_X6_Y23_N27
\I2S_MASTER_INST|S2P_INST|l_zustand[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|S2P_INST|l_zustand[1]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2S_MASTER_INST|S2P_INST|einganglog_l~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|S2P_INST|l_zustand\(1));

-- Location: LCCOMB_X6_Y23_N20
\I2S_MASTER_INST|S2P_INST|l_zustand[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|S2P_INST|l_zustand[2]~feeder_combout\ = \I2S_MASTER_INST|S2P_INST|l_zustand\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \I2S_MASTER_INST|S2P_INST|l_zustand\(1),
	combout => \I2S_MASTER_INST|S2P_INST|l_zustand[2]~feeder_combout\);

-- Location: FF_X6_Y23_N21
\I2S_MASTER_INST|S2P_INST|l_zustand[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|S2P_INST|l_zustand[2]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2S_MASTER_INST|S2P_INST|einganglog_l~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|S2P_INST|l_zustand\(2));

-- Location: LCCOMB_X6_Y23_N28
\I2S_MASTER_INST|S2P_INST|l_zustand[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|S2P_INST|l_zustand[3]~feeder_combout\ = \I2S_MASTER_INST|S2P_INST|l_zustand\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \I2S_MASTER_INST|S2P_INST|l_zustand\(2),
	combout => \I2S_MASTER_INST|S2P_INST|l_zustand[3]~feeder_combout\);

-- Location: FF_X6_Y23_N29
\I2S_MASTER_INST|S2P_INST|l_zustand[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|S2P_INST|l_zustand[3]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2S_MASTER_INST|S2P_INST|einganglog_l~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|S2P_INST|l_zustand\(3));

-- Location: LCCOMB_X6_Y23_N24
\I2S_MASTER_INST|S2P_INST|l_zustand[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|S2P_INST|l_zustand[4]~feeder_combout\ = \I2S_MASTER_INST|S2P_INST|l_zustand\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \I2S_MASTER_INST|S2P_INST|l_zustand\(3),
	combout => \I2S_MASTER_INST|S2P_INST|l_zustand[4]~feeder_combout\);

-- Location: FF_X6_Y23_N25
\I2S_MASTER_INST|S2P_INST|l_zustand[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|S2P_INST|l_zustand[4]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2S_MASTER_INST|S2P_INST|einganglog_l~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|S2P_INST|l_zustand\(4));

-- Location: LCCOMB_X6_Y23_N6
\I2S_MASTER_INST|S2P_INST|l_zustand[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|S2P_INST|l_zustand[5]~feeder_combout\ = \I2S_MASTER_INST|S2P_INST|l_zustand\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \I2S_MASTER_INST|S2P_INST|l_zustand\(4),
	combout => \I2S_MASTER_INST|S2P_INST|l_zustand[5]~feeder_combout\);

-- Location: FF_X6_Y23_N7
\I2S_MASTER_INST|S2P_INST|l_zustand[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|S2P_INST|l_zustand[5]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2S_MASTER_INST|S2P_INST|einganglog_l~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|S2P_INST|l_zustand\(5));

-- Location: LCCOMB_X6_Y23_N8
\I2S_MASTER_INST|S2P_INST|l_zustand[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|S2P_INST|l_zustand[6]~feeder_combout\ = \I2S_MASTER_INST|S2P_INST|l_zustand\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \I2S_MASTER_INST|S2P_INST|l_zustand\(5),
	combout => \I2S_MASTER_INST|S2P_INST|l_zustand[6]~feeder_combout\);

-- Location: FF_X6_Y23_N9
\I2S_MASTER_INST|S2P_INST|l_zustand[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|S2P_INST|l_zustand[6]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2S_MASTER_INST|S2P_INST|einganglog_l~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|S2P_INST|l_zustand\(6));

-- Location: LCCOMB_X6_Y23_N12
\I2S_MASTER_INST|S2P_INST|l_zustand[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|S2P_INST|l_zustand[7]~feeder_combout\ = \I2S_MASTER_INST|S2P_INST|l_zustand\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \I2S_MASTER_INST|S2P_INST|l_zustand\(6),
	combout => \I2S_MASTER_INST|S2P_INST|l_zustand[7]~feeder_combout\);

-- Location: FF_X6_Y23_N13
\I2S_MASTER_INST|S2P_INST|l_zustand[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|S2P_INST|l_zustand[7]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2S_MASTER_INST|S2P_INST|einganglog_l~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|S2P_INST|l_zustand\(7));

-- Location: LCCOMB_X6_Y23_N14
\I2S_MASTER_INST|S2P_INST|l_zustand[8]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|S2P_INST|l_zustand[8]~feeder_combout\ = \I2S_MASTER_INST|S2P_INST|l_zustand\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \I2S_MASTER_INST|S2P_INST|l_zustand\(7),
	combout => \I2S_MASTER_INST|S2P_INST|l_zustand[8]~feeder_combout\);

-- Location: FF_X6_Y23_N15
\I2S_MASTER_INST|S2P_INST|l_zustand[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|S2P_INST|l_zustand[8]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2S_MASTER_INST|S2P_INST|einganglog_l~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|S2P_INST|l_zustand\(8));

-- Location: LCCOMB_X6_Y23_N16
\I2S_MASTER_INST|S2P_INST|l_zustand[9]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|S2P_INST|l_zustand[9]~feeder_combout\ = \I2S_MASTER_INST|S2P_INST|l_zustand\(8)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \I2S_MASTER_INST|S2P_INST|l_zustand\(8),
	combout => \I2S_MASTER_INST|S2P_INST|l_zustand[9]~feeder_combout\);

-- Location: FF_X6_Y23_N17
\I2S_MASTER_INST|S2P_INST|l_zustand[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|S2P_INST|l_zustand[9]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2S_MASTER_INST|S2P_INST|einganglog_l~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|S2P_INST|l_zustand\(9));

-- Location: LCCOMB_X6_Y23_N2
\I2S_MASTER_INST|S2P_INST|l_zustand[10]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|S2P_INST|l_zustand[10]~feeder_combout\ = \I2S_MASTER_INST|S2P_INST|l_zustand\(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \I2S_MASTER_INST|S2P_INST|l_zustand\(9),
	combout => \I2S_MASTER_INST|S2P_INST|l_zustand[10]~feeder_combout\);

-- Location: FF_X6_Y23_N3
\I2S_MASTER_INST|S2P_INST|l_zustand[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|S2P_INST|l_zustand[10]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2S_MASTER_INST|S2P_INST|einganglog_l~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|S2P_INST|l_zustand\(10));

-- Location: LCCOMB_X6_Y23_N10
\I2S_MASTER_INST|S2P_INST|l_zustand[11]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|S2P_INST|l_zustand[11]~feeder_combout\ = \I2S_MASTER_INST|S2P_INST|l_zustand\(10)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \I2S_MASTER_INST|S2P_INST|l_zustand\(10),
	combout => \I2S_MASTER_INST|S2P_INST|l_zustand[11]~feeder_combout\);

-- Location: FF_X6_Y23_N11
\I2S_MASTER_INST|S2P_INST|l_zustand[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|S2P_INST|l_zustand[11]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2S_MASTER_INST|S2P_INST|einganglog_l~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|S2P_INST|l_zustand\(11));

-- Location: LCCOMB_X6_Y23_N22
\I2S_MASTER_INST|S2P_INST|l_zustand[12]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|S2P_INST|l_zustand[12]~feeder_combout\ = \I2S_MASTER_INST|S2P_INST|l_zustand\(11)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \I2S_MASTER_INST|S2P_INST|l_zustand\(11),
	combout => \I2S_MASTER_INST|S2P_INST|l_zustand[12]~feeder_combout\);

-- Location: FF_X6_Y23_N23
\I2S_MASTER_INST|S2P_INST|l_zustand[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|S2P_INST|l_zustand[12]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2S_MASTER_INST|S2P_INST|einganglog_l~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|S2P_INST|l_zustand\(12));

-- Location: LCCOMB_X6_Y23_N4
\I2S_MASTER_INST|S2P_INST|l_zustand[13]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|S2P_INST|l_zustand[13]~feeder_combout\ = \I2S_MASTER_INST|S2P_INST|l_zustand\(12)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \I2S_MASTER_INST|S2P_INST|l_zustand\(12),
	combout => \I2S_MASTER_INST|S2P_INST|l_zustand[13]~feeder_combout\);

-- Location: FF_X6_Y23_N5
\I2S_MASTER_INST|S2P_INST|l_zustand[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|S2P_INST|l_zustand[13]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2S_MASTER_INST|S2P_INST|einganglog_l~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|S2P_INST|l_zustand\(13));

-- Location: FF_X6_Y23_N19
\I2S_MASTER_INST|S2P_INST|l_zustand[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	asdata => \I2S_MASTER_INST|S2P_INST|l_zustand\(13),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => VCC,
	ena => \I2S_MASTER_INST|S2P_INST|einganglog_l~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|S2P_INST|l_zustand\(14));

-- Location: LCCOMB_X6_Y23_N30
\I2S_MASTER_INST|S2P_INST|l_zustand[15]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|S2P_INST|l_zustand[15]~feeder_combout\ = \I2S_MASTER_INST|S2P_INST|l_zustand\(14)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \I2S_MASTER_INST|S2P_INST|l_zustand\(14),
	combout => \I2S_MASTER_INST|S2P_INST|l_zustand[15]~feeder_combout\);

-- Location: FF_X6_Y23_N31
\I2S_MASTER_INST|S2P_INST|l_zustand[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|S2P_INST|l_zustand[15]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2S_MASTER_INST|S2P_INST|einganglog_l~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|S2P_INST|l_zustand\(15));

-- Location: IOIBUF_X0_Y21_N15
\SW[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(14),
	o => \SW[14]~input_o\);

-- Location: LCCOMB_X1_Y21_N24
\INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg[1]~feeder_combout\ = \SW[14]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SW[14]~input_o\,
	combout => \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg[1]~feeder_combout\);

-- Location: FF_X1_Y21_N25
\INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg[1]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(1));

-- Location: LCCOMB_X2_Y21_N4
\INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg[0]~feeder_combout\ = \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(1),
	combout => \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg[0]~feeder_combout\);

-- Location: FF_X2_Y21_N5
\INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg[0]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0));

-- Location: LCCOMB_X7_Y23_N2
\AUDIO_CONTROL_INST|DACDAT_pl_o[15]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \AUDIO_CONTROL_INST|DACDAT_pl_o[15]~0_combout\ = (\I2S_MASTER_INST|S2P_INST|l_zustand\(15) & \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \I2S_MASTER_INST|S2P_INST|l_zustand\(15),
	datad => \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0),
	combout => \AUDIO_CONTROL_INST|DACDAT_pl_o[15]~0_combout\);

-- Location: LCCOMB_X7_Y23_N26
\I2S_MASTER_INST|P2S_INST|l_folgezustand[14]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|P2S_INST|l_folgezustand[14]~1_combout\ = (\I2S_MASTER_INST|S2P_INST|l_zustand\(14) & \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \I2S_MASTER_INST|S2P_INST|l_zustand\(14),
	datad => \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0),
	combout => \I2S_MASTER_INST|P2S_INST|l_folgezustand[14]~1_combout\);

-- Location: LCCOMB_X7_Y23_N14
\I2S_MASTER_INST|P2S_INST|l_folgezustand[13]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|P2S_INST|l_folgezustand[13]~2_combout\ = (\I2S_MASTER_INST|S2P_INST|l_zustand\(13) & \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \I2S_MASTER_INST|S2P_INST|l_zustand\(13),
	datad => \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0),
	combout => \I2S_MASTER_INST|P2S_INST|l_folgezustand[13]~2_combout\);

-- Location: LCCOMB_X7_Y23_N30
\I2S_MASTER_INST|P2S_INST|l_folgezustand[12]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|P2S_INST|l_folgezustand[12]~3_combout\ = (\I2S_MASTER_INST|S2P_INST|l_zustand\(12) & \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \I2S_MASTER_INST|S2P_INST|l_zustand\(12),
	datad => \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0),
	combout => \I2S_MASTER_INST|P2S_INST|l_folgezustand[12]~3_combout\);

-- Location: LCCOMB_X7_Y23_N22
\I2S_MASTER_INST|P2S_INST|l_folgezustand[11]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|P2S_INST|l_folgezustand[11]~4_combout\ = (\I2S_MASTER_INST|S2P_INST|l_zustand\(11) & \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|S2P_INST|l_zustand\(11),
	datad => \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0),
	combout => \I2S_MASTER_INST|P2S_INST|l_folgezustand[11]~4_combout\);

-- Location: LCCOMB_X7_Y23_N8
\I2S_MASTER_INST|P2S_INST|l_folgezustand[10]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|P2S_INST|l_folgezustand[10]~5_combout\ = (\I2S_MASTER_INST|S2P_INST|l_zustand\(10) & \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|S2P_INST|l_zustand\(10),
	datad => \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0),
	combout => \I2S_MASTER_INST|P2S_INST|l_folgezustand[10]~5_combout\);

-- Location: LCCOMB_X7_Y23_N4
\I2S_MASTER_INST|P2S_INST|l_folgezustand[9]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|P2S_INST|l_folgezustand[9]~6_combout\ = (\I2S_MASTER_INST|S2P_INST|l_zustand\(9) & \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \I2S_MASTER_INST|S2P_INST|l_zustand\(9),
	datad => \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0),
	combout => \I2S_MASTER_INST|P2S_INST|l_folgezustand[9]~6_combout\);

-- Location: LCCOMB_X7_Y23_N0
\I2S_MASTER_INST|P2S_INST|l_folgezustand[8]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|P2S_INST|l_folgezustand[8]~7_combout\ = (\I2S_MASTER_INST|S2P_INST|l_zustand\(8) & \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|S2P_INST|l_zustand\(8),
	datad => \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0),
	combout => \I2S_MASTER_INST|P2S_INST|l_folgezustand[8]~7_combout\);

-- Location: LCCOMB_X7_Y23_N16
\I2S_MASTER_INST|P2S_INST|l_folgezustand[7]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|P2S_INST|l_folgezustand[7]~8_combout\ = (\I2S_MASTER_INST|S2P_INST|l_zustand\(7) & \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|S2P_INST|l_zustand\(7),
	datad => \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0),
	combout => \I2S_MASTER_INST|P2S_INST|l_folgezustand[7]~8_combout\);

-- Location: LCCOMB_X7_Y23_N18
\I2S_MASTER_INST|P2S_INST|l_folgezustand[6]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|P2S_INST|l_folgezustand[6]~9_combout\ = (\I2S_MASTER_INST|S2P_INST|l_zustand\(6) & \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|S2P_INST|l_zustand\(6),
	datad => \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0),
	combout => \I2S_MASTER_INST|P2S_INST|l_folgezustand[6]~9_combout\);

-- Location: LCCOMB_X7_Y23_N28
\I2S_MASTER_INST|P2S_INST|l_folgezustand[5]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|P2S_INST|l_folgezustand[5]~10_combout\ = (\I2S_MASTER_INST|S2P_INST|l_zustand\(5) & \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|S2P_INST|l_zustand\(5),
	datad => \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0),
	combout => \I2S_MASTER_INST|P2S_INST|l_folgezustand[5]~10_combout\);

-- Location: LCCOMB_X7_Y23_N20
\I2S_MASTER_INST|P2S_INST|l_folgezustand[4]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|P2S_INST|l_folgezustand[4]~11_combout\ = (\I2S_MASTER_INST|S2P_INST|l_zustand\(4) & \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \I2S_MASTER_INST|S2P_INST|l_zustand\(4),
	datad => \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0),
	combout => \I2S_MASTER_INST|P2S_INST|l_folgezustand[4]~11_combout\);

-- Location: LCCOMB_X7_Y23_N24
\I2S_MASTER_INST|P2S_INST|l_folgezustand[3]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|P2S_INST|l_folgezustand[3]~12_combout\ = (\I2S_MASTER_INST|S2P_INST|l_zustand\(3) & \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \I2S_MASTER_INST|S2P_INST|l_zustand\(3),
	datad => \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0),
	combout => \I2S_MASTER_INST|P2S_INST|l_folgezustand[3]~12_combout\);

-- Location: LCCOMB_X7_Y23_N12
\I2S_MASTER_INST|P2S_INST|l_folgezustand[2]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|P2S_INST|l_folgezustand[2]~13_combout\ = (\I2S_MASTER_INST|S2P_INST|l_zustand\(2) & \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \I2S_MASTER_INST|S2P_INST|l_zustand\(2),
	datad => \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0),
	combout => \I2S_MASTER_INST|P2S_INST|l_folgezustand[2]~13_combout\);

-- Location: LCCOMB_X7_Y23_N10
\I2S_MASTER_INST|P2S_INST|l_folgezustand[1]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|P2S_INST|l_folgezustand[1]~14_combout\ = (\I2S_MASTER_INST|S2P_INST|l_zustand\(1) & \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|S2P_INST|l_zustand\(1),
	datad => \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0),
	combout => \I2S_MASTER_INST|P2S_INST|l_folgezustand[1]~14_combout\);

-- Location: LCCOMB_X8_Y23_N0
\I2S_MASTER_INST|P2S_INST|l_folgezustand[0]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|P2S_INST|l_folgezustand[0]~15_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.load_dac~q\ & (\I2S_MASTER_INST|S2P_INST|l_zustand\(0) & \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.load_dac~q\,
	datab => \I2S_MASTER_INST|S2P_INST|l_zustand\(0),
	datac => \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0),
	combout => \I2S_MASTER_INST|P2S_INST|l_folgezustand[0]~15_combout\);

-- Location: LCCOMB_X7_Y23_N6
\I2S_MASTER_INST|P2S_INST|l_folgezustand[15]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|P2S_INST|l_folgezustand[15]~0_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.load_dac~q\) # ((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_bclk~q\ & ((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.shift_adc_L~q\) # 
-- (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.hold_L~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.load_dac~q\,
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_bclk~q\,
	datac => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.shift_adc_L~q\,
	datad => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.hold_L~q\,
	combout => \I2S_MASTER_INST|P2S_INST|l_folgezustand[15]~0_combout\);

-- Location: FF_X8_Y23_N1
\I2S_MASTER_INST|P2S_INST|l_zustand[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|P2S_INST|l_folgezustand[0]~15_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2S_MASTER_INST|P2S_INST|l_folgezustand[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|P2S_INST|l_zustand\(0));

-- Location: FF_X7_Y23_N11
\I2S_MASTER_INST|P2S_INST|l_zustand[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|P2S_INST|l_folgezustand[1]~14_combout\,
	asdata => \I2S_MASTER_INST|P2S_INST|l_zustand\(0),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ALT_INV_zustand.load_dac~q\,
	ena => \I2S_MASTER_INST|P2S_INST|l_folgezustand[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|P2S_INST|l_zustand\(1));

-- Location: FF_X7_Y23_N13
\I2S_MASTER_INST|P2S_INST|l_zustand[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|P2S_INST|l_folgezustand[2]~13_combout\,
	asdata => \I2S_MASTER_INST|P2S_INST|l_zustand\(1),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ALT_INV_zustand.load_dac~q\,
	ena => \I2S_MASTER_INST|P2S_INST|l_folgezustand[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|P2S_INST|l_zustand\(2));

-- Location: FF_X7_Y23_N25
\I2S_MASTER_INST|P2S_INST|l_zustand[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|P2S_INST|l_folgezustand[3]~12_combout\,
	asdata => \I2S_MASTER_INST|P2S_INST|l_zustand\(2),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ALT_INV_zustand.load_dac~q\,
	ena => \I2S_MASTER_INST|P2S_INST|l_folgezustand[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|P2S_INST|l_zustand\(3));

-- Location: FF_X7_Y23_N21
\I2S_MASTER_INST|P2S_INST|l_zustand[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|P2S_INST|l_folgezustand[4]~11_combout\,
	asdata => \I2S_MASTER_INST|P2S_INST|l_zustand\(3),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ALT_INV_zustand.load_dac~q\,
	ena => \I2S_MASTER_INST|P2S_INST|l_folgezustand[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|P2S_INST|l_zustand\(4));

-- Location: FF_X7_Y23_N29
\I2S_MASTER_INST|P2S_INST|l_zustand[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|P2S_INST|l_folgezustand[5]~10_combout\,
	asdata => \I2S_MASTER_INST|P2S_INST|l_zustand\(4),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ALT_INV_zustand.load_dac~q\,
	ena => \I2S_MASTER_INST|P2S_INST|l_folgezustand[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|P2S_INST|l_zustand\(5));

-- Location: FF_X7_Y23_N19
\I2S_MASTER_INST|P2S_INST|l_zustand[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|P2S_INST|l_folgezustand[6]~9_combout\,
	asdata => \I2S_MASTER_INST|P2S_INST|l_zustand\(5),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ALT_INV_zustand.load_dac~q\,
	ena => \I2S_MASTER_INST|P2S_INST|l_folgezustand[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|P2S_INST|l_zustand\(6));

-- Location: FF_X7_Y23_N17
\I2S_MASTER_INST|P2S_INST|l_zustand[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|P2S_INST|l_folgezustand[7]~8_combout\,
	asdata => \I2S_MASTER_INST|P2S_INST|l_zustand\(6),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ALT_INV_zustand.load_dac~q\,
	ena => \I2S_MASTER_INST|P2S_INST|l_folgezustand[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|P2S_INST|l_zustand\(7));

-- Location: FF_X7_Y23_N1
\I2S_MASTER_INST|P2S_INST|l_zustand[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|P2S_INST|l_folgezustand[8]~7_combout\,
	asdata => \I2S_MASTER_INST|P2S_INST|l_zustand\(7),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ALT_INV_zustand.load_dac~q\,
	ena => \I2S_MASTER_INST|P2S_INST|l_folgezustand[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|P2S_INST|l_zustand\(8));

-- Location: FF_X7_Y23_N5
\I2S_MASTER_INST|P2S_INST|l_zustand[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|P2S_INST|l_folgezustand[9]~6_combout\,
	asdata => \I2S_MASTER_INST|P2S_INST|l_zustand\(8),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ALT_INV_zustand.load_dac~q\,
	ena => \I2S_MASTER_INST|P2S_INST|l_folgezustand[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|P2S_INST|l_zustand\(9));

-- Location: FF_X7_Y23_N9
\I2S_MASTER_INST|P2S_INST|l_zustand[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|P2S_INST|l_folgezustand[10]~5_combout\,
	asdata => \I2S_MASTER_INST|P2S_INST|l_zustand\(9),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ALT_INV_zustand.load_dac~q\,
	ena => \I2S_MASTER_INST|P2S_INST|l_folgezustand[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|P2S_INST|l_zustand\(10));

-- Location: FF_X7_Y23_N23
\I2S_MASTER_INST|P2S_INST|l_zustand[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|P2S_INST|l_folgezustand[11]~4_combout\,
	asdata => \I2S_MASTER_INST|P2S_INST|l_zustand\(10),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ALT_INV_zustand.load_dac~q\,
	ena => \I2S_MASTER_INST|P2S_INST|l_folgezustand[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|P2S_INST|l_zustand\(11));

-- Location: FF_X7_Y23_N31
\I2S_MASTER_INST|P2S_INST|l_zustand[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|P2S_INST|l_folgezustand[12]~3_combout\,
	asdata => \I2S_MASTER_INST|P2S_INST|l_zustand\(11),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ALT_INV_zustand.load_dac~q\,
	ena => \I2S_MASTER_INST|P2S_INST|l_folgezustand[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|P2S_INST|l_zustand\(12));

-- Location: FF_X7_Y23_N15
\I2S_MASTER_INST|P2S_INST|l_zustand[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|P2S_INST|l_folgezustand[13]~2_combout\,
	asdata => \I2S_MASTER_INST|P2S_INST|l_zustand\(12),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ALT_INV_zustand.load_dac~q\,
	ena => \I2S_MASTER_INST|P2S_INST|l_folgezustand[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|P2S_INST|l_zustand\(13));

-- Location: FF_X7_Y23_N27
\I2S_MASTER_INST|P2S_INST|l_zustand[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|P2S_INST|l_folgezustand[14]~1_combout\,
	asdata => \I2S_MASTER_INST|P2S_INST|l_zustand\(13),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ALT_INV_zustand.load_dac~q\,
	ena => \I2S_MASTER_INST|P2S_INST|l_folgezustand[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|P2S_INST|l_zustand\(14));

-- Location: FF_X7_Y23_N3
\I2S_MASTER_INST|P2S_INST|l_zustand[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \AUDIO_CONTROL_INST|DACDAT_pl_o[15]~0_combout\,
	asdata => \I2S_MASTER_INST|P2S_INST|l_zustand\(14),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ALT_INV_zustand.load_dac~q\,
	ena => \I2S_MASTER_INST|P2S_INST|l_folgezustand[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|P2S_INST|l_zustand\(15));

-- Location: LCCOMB_X5_Y21_N8
\I2S_MASTER_INST|S2P_INST|r_zustand[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|S2P_INST|r_zustand[0]~feeder_combout\ = \AUD_ADCDAT~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \AUD_ADCDAT~input_o\,
	combout => \I2S_MASTER_INST|S2P_INST|r_zustand[0]~feeder_combout\);

-- Location: LCCOMB_X5_Y21_N20
\I2S_MASTER_INST|S2P_INST|einganglog_r~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|S2P_INST|einganglog_r~0_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.shift_adc_R~q\ & !\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_bclk~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.shift_adc_R~q\,
	datad => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_bclk~q\,
	combout => \I2S_MASTER_INST|S2P_INST|einganglog_r~0_combout\);

-- Location: FF_X5_Y21_N9
\I2S_MASTER_INST|S2P_INST|r_zustand[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|S2P_INST|r_zustand[0]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2S_MASTER_INST|S2P_INST|einganglog_r~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|S2P_INST|r_zustand\(0));

-- Location: LCCOMB_X5_Y21_N4
\I2S_MASTER_INST|S2P_INST|r_zustand[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|S2P_INST|r_zustand[1]~feeder_combout\ = \I2S_MASTER_INST|S2P_INST|r_zustand\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \I2S_MASTER_INST|S2P_INST|r_zustand\(0),
	combout => \I2S_MASTER_INST|S2P_INST|r_zustand[1]~feeder_combout\);

-- Location: FF_X5_Y21_N5
\I2S_MASTER_INST|S2P_INST|r_zustand[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|S2P_INST|r_zustand[1]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2S_MASTER_INST|S2P_INST|einganglog_r~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|S2P_INST|r_zustand\(1));

-- Location: LCCOMB_X5_Y21_N6
\I2S_MASTER_INST|S2P_INST|r_zustand[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|S2P_INST|r_zustand[2]~feeder_combout\ = \I2S_MASTER_INST|S2P_INST|r_zustand\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \I2S_MASTER_INST|S2P_INST|r_zustand\(1),
	combout => \I2S_MASTER_INST|S2P_INST|r_zustand[2]~feeder_combout\);

-- Location: FF_X5_Y21_N7
\I2S_MASTER_INST|S2P_INST|r_zustand[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|S2P_INST|r_zustand[2]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2S_MASTER_INST|S2P_INST|einganglog_r~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|S2P_INST|r_zustand\(2));

-- Location: LCCOMB_X5_Y21_N16
\I2S_MASTER_INST|S2P_INST|r_zustand[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|S2P_INST|r_zustand[3]~feeder_combout\ = \I2S_MASTER_INST|S2P_INST|r_zustand\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \I2S_MASTER_INST|S2P_INST|r_zustand\(2),
	combout => \I2S_MASTER_INST|S2P_INST|r_zustand[3]~feeder_combout\);

-- Location: FF_X5_Y21_N17
\I2S_MASTER_INST|S2P_INST|r_zustand[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|S2P_INST|r_zustand[3]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2S_MASTER_INST|S2P_INST|einganglog_r~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|S2P_INST|r_zustand\(3));

-- Location: LCCOMB_X5_Y21_N12
\I2S_MASTER_INST|S2P_INST|r_zustand[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|S2P_INST|r_zustand[4]~feeder_combout\ = \I2S_MASTER_INST|S2P_INST|r_zustand\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \I2S_MASTER_INST|S2P_INST|r_zustand\(3),
	combout => \I2S_MASTER_INST|S2P_INST|r_zustand[4]~feeder_combout\);

-- Location: FF_X5_Y21_N13
\I2S_MASTER_INST|S2P_INST|r_zustand[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|S2P_INST|r_zustand[4]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2S_MASTER_INST|S2P_INST|einganglog_r~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|S2P_INST|r_zustand\(4));

-- Location: LCCOMB_X5_Y21_N14
\I2S_MASTER_INST|S2P_INST|r_zustand[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|S2P_INST|r_zustand[5]~feeder_combout\ = \I2S_MASTER_INST|S2P_INST|r_zustand\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \I2S_MASTER_INST|S2P_INST|r_zustand\(4),
	combout => \I2S_MASTER_INST|S2P_INST|r_zustand[5]~feeder_combout\);

-- Location: FF_X5_Y21_N15
\I2S_MASTER_INST|S2P_INST|r_zustand[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|S2P_INST|r_zustand[5]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2S_MASTER_INST|S2P_INST|einganglog_r~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|S2P_INST|r_zustand\(5));

-- Location: LCCOMB_X5_Y21_N10
\I2S_MASTER_INST|S2P_INST|r_zustand[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|S2P_INST|r_zustand[6]~feeder_combout\ = \I2S_MASTER_INST|S2P_INST|r_zustand\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \I2S_MASTER_INST|S2P_INST|r_zustand\(5),
	combout => \I2S_MASTER_INST|S2P_INST|r_zustand[6]~feeder_combout\);

-- Location: FF_X5_Y21_N11
\I2S_MASTER_INST|S2P_INST|r_zustand[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|S2P_INST|r_zustand[6]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2S_MASTER_INST|S2P_INST|einganglog_r~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|S2P_INST|r_zustand\(6));

-- Location: LCCOMB_X5_Y21_N0
\I2S_MASTER_INST|S2P_INST|r_zustand[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|S2P_INST|r_zustand[7]~feeder_combout\ = \I2S_MASTER_INST|S2P_INST|r_zustand\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \I2S_MASTER_INST|S2P_INST|r_zustand\(6),
	combout => \I2S_MASTER_INST|S2P_INST|r_zustand[7]~feeder_combout\);

-- Location: FF_X5_Y21_N1
\I2S_MASTER_INST|S2P_INST|r_zustand[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|S2P_INST|r_zustand[7]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2S_MASTER_INST|S2P_INST|einganglog_r~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|S2P_INST|r_zustand\(7));

-- Location: LCCOMB_X5_Y21_N2
\I2S_MASTER_INST|S2P_INST|r_zustand[8]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|S2P_INST|r_zustand[8]~feeder_combout\ = \I2S_MASTER_INST|S2P_INST|r_zustand\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \I2S_MASTER_INST|S2P_INST|r_zustand\(7),
	combout => \I2S_MASTER_INST|S2P_INST|r_zustand[8]~feeder_combout\);

-- Location: FF_X5_Y21_N3
\I2S_MASTER_INST|S2P_INST|r_zustand[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|S2P_INST|r_zustand[8]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2S_MASTER_INST|S2P_INST|einganglog_r~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|S2P_INST|r_zustand\(8));

-- Location: LCCOMB_X5_Y21_N26
\I2S_MASTER_INST|S2P_INST|r_zustand[9]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|S2P_INST|r_zustand[9]~feeder_combout\ = \I2S_MASTER_INST|S2P_INST|r_zustand\(8)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \I2S_MASTER_INST|S2P_INST|r_zustand\(8),
	combout => \I2S_MASTER_INST|S2P_INST|r_zustand[9]~feeder_combout\);

-- Location: FF_X5_Y21_N27
\I2S_MASTER_INST|S2P_INST|r_zustand[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|S2P_INST|r_zustand[9]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2S_MASTER_INST|S2P_INST|einganglog_r~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|S2P_INST|r_zustand\(9));

-- Location: LCCOMB_X5_Y21_N22
\I2S_MASTER_INST|S2P_INST|r_zustand[10]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|S2P_INST|r_zustand[10]~feeder_combout\ = \I2S_MASTER_INST|S2P_INST|r_zustand\(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \I2S_MASTER_INST|S2P_INST|r_zustand\(9),
	combout => \I2S_MASTER_INST|S2P_INST|r_zustand[10]~feeder_combout\);

-- Location: FF_X5_Y21_N23
\I2S_MASTER_INST|S2P_INST|r_zustand[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|S2P_INST|r_zustand[10]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2S_MASTER_INST|S2P_INST|einganglog_r~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|S2P_INST|r_zustand\(10));

-- Location: LCCOMB_X5_Y21_N18
\I2S_MASTER_INST|S2P_INST|r_zustand[11]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|S2P_INST|r_zustand[11]~feeder_combout\ = \I2S_MASTER_INST|S2P_INST|r_zustand\(10)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \I2S_MASTER_INST|S2P_INST|r_zustand\(10),
	combout => \I2S_MASTER_INST|S2P_INST|r_zustand[11]~feeder_combout\);

-- Location: FF_X5_Y21_N19
\I2S_MASTER_INST|S2P_INST|r_zustand[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|S2P_INST|r_zustand[11]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2S_MASTER_INST|S2P_INST|einganglog_r~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|S2P_INST|r_zustand\(11));

-- Location: LCCOMB_X5_Y21_N28
\I2S_MASTER_INST|S2P_INST|r_zustand[12]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|S2P_INST|r_zustand[12]~feeder_combout\ = \I2S_MASTER_INST|S2P_INST|r_zustand\(11)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \I2S_MASTER_INST|S2P_INST|r_zustand\(11),
	combout => \I2S_MASTER_INST|S2P_INST|r_zustand[12]~feeder_combout\);

-- Location: FF_X5_Y21_N29
\I2S_MASTER_INST|S2P_INST|r_zustand[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|S2P_INST|r_zustand[12]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2S_MASTER_INST|S2P_INST|einganglog_r~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|S2P_INST|r_zustand\(12));

-- Location: LCCOMB_X5_Y21_N30
\I2S_MASTER_INST|S2P_INST|r_zustand[13]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|S2P_INST|r_zustand[13]~feeder_combout\ = \I2S_MASTER_INST|S2P_INST|r_zustand\(12)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \I2S_MASTER_INST|S2P_INST|r_zustand\(12),
	combout => \I2S_MASTER_INST|S2P_INST|r_zustand[13]~feeder_combout\);

-- Location: FF_X5_Y21_N31
\I2S_MASTER_INST|S2P_INST|r_zustand[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|S2P_INST|r_zustand[13]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2S_MASTER_INST|S2P_INST|einganglog_r~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|S2P_INST|r_zustand\(13));

-- Location: LCCOMB_X5_Y21_N24
\I2S_MASTER_INST|S2P_INST|r_zustand[14]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|S2P_INST|r_zustand[14]~feeder_combout\ = \I2S_MASTER_INST|S2P_INST|r_zustand\(13)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \I2S_MASTER_INST|S2P_INST|r_zustand\(13),
	combout => \I2S_MASTER_INST|S2P_INST|r_zustand[14]~feeder_combout\);

-- Location: FF_X5_Y21_N25
\I2S_MASTER_INST|S2P_INST|r_zustand[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|S2P_INST|r_zustand[14]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2S_MASTER_INST|S2P_INST|einganglog_r~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|S2P_INST|r_zustand\(14));

-- Location: FF_X5_Y21_N21
\I2S_MASTER_INST|S2P_INST|r_zustand[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	asdata => \I2S_MASTER_INST|S2P_INST|r_zustand\(14),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => VCC,
	ena => \I2S_MASTER_INST|S2P_INST|einganglog_r~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|S2P_INST|r_zustand\(15));

-- Location: LCCOMB_X6_Y21_N24
\AUDIO_CONTROL_INST|DACDAT_pr_o[15]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \AUDIO_CONTROL_INST|DACDAT_pr_o[15]~0_combout\ = (\I2S_MASTER_INST|S2P_INST|r_zustand\(15) & \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \I2S_MASTER_INST|S2P_INST|r_zustand\(15),
	datad => \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0),
	combout => \AUDIO_CONTROL_INST|DACDAT_pr_o[15]~0_combout\);

-- Location: LCCOMB_X6_Y21_N8
\I2S_MASTER_INST|P2S_INST|r_folgezustand[14]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|P2S_INST|r_folgezustand[14]~1_combout\ = (\I2S_MASTER_INST|S2P_INST|r_zustand\(14) & \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \I2S_MASTER_INST|S2P_INST|r_zustand\(14),
	datad => \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0),
	combout => \I2S_MASTER_INST|P2S_INST|r_folgezustand[14]~1_combout\);

-- Location: LCCOMB_X6_Y21_N14
\I2S_MASTER_INST|P2S_INST|r_folgezustand[13]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|P2S_INST|r_folgezustand[13]~2_combout\ = (\I2S_MASTER_INST|S2P_INST|r_zustand\(13) & \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \I2S_MASTER_INST|S2P_INST|r_zustand\(13),
	datad => \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0),
	combout => \I2S_MASTER_INST|P2S_INST|r_folgezustand[13]~2_combout\);

-- Location: LCCOMB_X6_Y21_N30
\I2S_MASTER_INST|P2S_INST|r_folgezustand[12]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|P2S_INST|r_folgezustand[12]~3_combout\ = (\I2S_MASTER_INST|S2P_INST|r_zustand\(12) & \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \I2S_MASTER_INST|S2P_INST|r_zustand\(12),
	datad => \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0),
	combout => \I2S_MASTER_INST|P2S_INST|r_folgezustand[12]~3_combout\);

-- Location: LCCOMB_X6_Y21_N22
\I2S_MASTER_INST|P2S_INST|r_folgezustand[11]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|P2S_INST|r_folgezustand[11]~4_combout\ = (\I2S_MASTER_INST|S2P_INST|r_zustand\(11) & \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \I2S_MASTER_INST|S2P_INST|r_zustand\(11),
	datad => \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0),
	combout => \I2S_MASTER_INST|P2S_INST|r_folgezustand[11]~4_combout\);

-- Location: LCCOMB_X6_Y21_N4
\I2S_MASTER_INST|P2S_INST|r_folgezustand[10]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|P2S_INST|r_folgezustand[10]~5_combout\ = (\I2S_MASTER_INST|S2P_INST|r_zustand\(10) & \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \I2S_MASTER_INST|S2P_INST|r_zustand\(10),
	datad => \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0),
	combout => \I2S_MASTER_INST|P2S_INST|r_folgezustand[10]~5_combout\);

-- Location: LCCOMB_X6_Y21_N26
\I2S_MASTER_INST|P2S_INST|r_folgezustand[9]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|P2S_INST|r_folgezustand[9]~6_combout\ = (\I2S_MASTER_INST|S2P_INST|r_zustand\(9) & \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|S2P_INST|r_zustand\(9),
	datad => \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0),
	combout => \I2S_MASTER_INST|P2S_INST|r_folgezustand[9]~6_combout\);

-- Location: LCCOMB_X6_Y21_N12
\I2S_MASTER_INST|P2S_INST|r_folgezustand[8]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|P2S_INST|r_folgezustand[8]~7_combout\ = (\I2S_MASTER_INST|S2P_INST|r_zustand\(8) & \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|S2P_INST|r_zustand\(8),
	datad => \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0),
	combout => \I2S_MASTER_INST|P2S_INST|r_folgezustand[8]~7_combout\);

-- Location: LCCOMB_X6_Y21_N18
\I2S_MASTER_INST|P2S_INST|r_folgezustand[7]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|P2S_INST|r_folgezustand[7]~8_combout\ = (\I2S_MASTER_INST|S2P_INST|r_zustand\(7) & \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|S2P_INST|r_zustand\(7),
	datad => \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0),
	combout => \I2S_MASTER_INST|P2S_INST|r_folgezustand[7]~8_combout\);

-- Location: LCCOMB_X6_Y21_N6
\I2S_MASTER_INST|P2S_INST|r_folgezustand[6]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|P2S_INST|r_folgezustand[6]~9_combout\ = (\I2S_MASTER_INST|S2P_INST|r_zustand\(6) & \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|S2P_INST|r_zustand\(6),
	datad => \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0),
	combout => \I2S_MASTER_INST|P2S_INST|r_folgezustand[6]~9_combout\);

-- Location: LCCOMB_X6_Y21_N2
\I2S_MASTER_INST|P2S_INST|r_folgezustand[5]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|P2S_INST|r_folgezustand[5]~10_combout\ = (\I2S_MASTER_INST|S2P_INST|r_zustand\(5) & \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|S2P_INST|r_zustand\(5),
	datad => \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0),
	combout => \I2S_MASTER_INST|P2S_INST|r_folgezustand[5]~10_combout\);

-- Location: LCCOMB_X6_Y21_N16
\I2S_MASTER_INST|P2S_INST|r_folgezustand[4]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|P2S_INST|r_folgezustand[4]~11_combout\ = (\I2S_MASTER_INST|S2P_INST|r_zustand\(4) & \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|S2P_INST|r_zustand\(4),
	datad => \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0),
	combout => \I2S_MASTER_INST|P2S_INST|r_folgezustand[4]~11_combout\);

-- Location: LCCOMB_X6_Y21_N20
\I2S_MASTER_INST|P2S_INST|r_folgezustand[3]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|P2S_INST|r_folgezustand[3]~12_combout\ = (\I2S_MASTER_INST|S2P_INST|r_zustand\(3) & \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \I2S_MASTER_INST|S2P_INST|r_zustand\(3),
	datad => \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0),
	combout => \I2S_MASTER_INST|P2S_INST|r_folgezustand[3]~12_combout\);

-- Location: LCCOMB_X6_Y21_N28
\I2S_MASTER_INST|P2S_INST|r_folgezustand[2]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|P2S_INST|r_folgezustand[2]~13_combout\ = (\I2S_MASTER_INST|S2P_INST|r_zustand\(2) & \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|S2P_INST|r_zustand\(2),
	datad => \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0),
	combout => \I2S_MASTER_INST|P2S_INST|r_folgezustand[2]~13_combout\);

-- Location: LCCOMB_X4_Y21_N8
\I2S_MASTER_INST|P2S_INST|r_folgezustand[1]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|P2S_INST|r_folgezustand[1]~14_combout\ = (\I2S_MASTER_INST|S2P_INST|r_zustand\(1) & \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|S2P_INST|r_zustand\(1),
	datad => \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0),
	combout => \I2S_MASTER_INST|P2S_INST|r_folgezustand[1]~14_combout\);

-- Location: LCCOMB_X4_Y21_N22
\I2S_MASTER_INST|P2S_INST|r_folgezustand[0]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|P2S_INST|r_folgezustand[0]~15_combout\ = (\INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0) & (\I2S_MASTER_INST|S2P_INST|r_zustand\(0) & \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.load_dac~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INFRASTRUCTURE_BLOCK_INST|sync_inst14|qreg\(0),
	datab => \I2S_MASTER_INST|S2P_INST|r_zustand\(0),
	datac => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.load_dac~q\,
	combout => \I2S_MASTER_INST|P2S_INST|r_folgezustand[0]~15_combout\);

-- Location: LCCOMB_X6_Y21_N10
\I2S_MASTER_INST|P2S_INST|r_folgezustand[15]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|P2S_INST|r_folgezustand[15]~0_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.load_dac~q\) # ((!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.hold_L~q\ & (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_bclk~q\ & 
-- !\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.shift_adc_L~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.hold_L~q\,
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|s_bclk~q\,
	datac => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.shift_adc_L~q\,
	datad => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.load_dac~q\,
	combout => \I2S_MASTER_INST|P2S_INST|r_folgezustand[15]~0_combout\);

-- Location: FF_X4_Y21_N23
\I2S_MASTER_INST|P2S_INST|r_zustand[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|P2S_INST|r_folgezustand[0]~15_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \I2S_MASTER_INST|P2S_INST|r_folgezustand[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|P2S_INST|r_zustand\(0));

-- Location: FF_X4_Y21_N9
\I2S_MASTER_INST|P2S_INST|r_zustand[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|P2S_INST|r_folgezustand[1]~14_combout\,
	asdata => \I2S_MASTER_INST|P2S_INST|r_zustand\(0),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ALT_INV_zustand.load_dac~q\,
	ena => \I2S_MASTER_INST|P2S_INST|r_folgezustand[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|P2S_INST|r_zustand\(1));

-- Location: FF_X6_Y21_N29
\I2S_MASTER_INST|P2S_INST|r_zustand[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|P2S_INST|r_folgezustand[2]~13_combout\,
	asdata => \I2S_MASTER_INST|P2S_INST|r_zustand\(1),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ALT_INV_zustand.load_dac~q\,
	ena => \I2S_MASTER_INST|P2S_INST|r_folgezustand[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|P2S_INST|r_zustand\(2));

-- Location: FF_X6_Y21_N21
\I2S_MASTER_INST|P2S_INST|r_zustand[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|P2S_INST|r_folgezustand[3]~12_combout\,
	asdata => \I2S_MASTER_INST|P2S_INST|r_zustand\(2),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ALT_INV_zustand.load_dac~q\,
	ena => \I2S_MASTER_INST|P2S_INST|r_folgezustand[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|P2S_INST|r_zustand\(3));

-- Location: FF_X6_Y21_N17
\I2S_MASTER_INST|P2S_INST|r_zustand[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|P2S_INST|r_folgezustand[4]~11_combout\,
	asdata => \I2S_MASTER_INST|P2S_INST|r_zustand\(3),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ALT_INV_zustand.load_dac~q\,
	ena => \I2S_MASTER_INST|P2S_INST|r_folgezustand[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|P2S_INST|r_zustand\(4));

-- Location: FF_X6_Y21_N3
\I2S_MASTER_INST|P2S_INST|r_zustand[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|P2S_INST|r_folgezustand[5]~10_combout\,
	asdata => \I2S_MASTER_INST|P2S_INST|r_zustand\(4),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ALT_INV_zustand.load_dac~q\,
	ena => \I2S_MASTER_INST|P2S_INST|r_folgezustand[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|P2S_INST|r_zustand\(5));

-- Location: FF_X6_Y21_N7
\I2S_MASTER_INST|P2S_INST|r_zustand[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|P2S_INST|r_folgezustand[6]~9_combout\,
	asdata => \I2S_MASTER_INST|P2S_INST|r_zustand\(5),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ALT_INV_zustand.load_dac~q\,
	ena => \I2S_MASTER_INST|P2S_INST|r_folgezustand[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|P2S_INST|r_zustand\(6));

-- Location: FF_X6_Y21_N19
\I2S_MASTER_INST|P2S_INST|r_zustand[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|P2S_INST|r_folgezustand[7]~8_combout\,
	asdata => \I2S_MASTER_INST|P2S_INST|r_zustand\(6),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ALT_INV_zustand.load_dac~q\,
	ena => \I2S_MASTER_INST|P2S_INST|r_folgezustand[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|P2S_INST|r_zustand\(7));

-- Location: FF_X6_Y21_N13
\I2S_MASTER_INST|P2S_INST|r_zustand[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|P2S_INST|r_folgezustand[8]~7_combout\,
	asdata => \I2S_MASTER_INST|P2S_INST|r_zustand\(7),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ALT_INV_zustand.load_dac~q\,
	ena => \I2S_MASTER_INST|P2S_INST|r_folgezustand[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|P2S_INST|r_zustand\(8));

-- Location: FF_X6_Y21_N27
\I2S_MASTER_INST|P2S_INST|r_zustand[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|P2S_INST|r_folgezustand[9]~6_combout\,
	asdata => \I2S_MASTER_INST|P2S_INST|r_zustand\(8),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ALT_INV_zustand.load_dac~q\,
	ena => \I2S_MASTER_INST|P2S_INST|r_folgezustand[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|P2S_INST|r_zustand\(9));

-- Location: FF_X6_Y21_N5
\I2S_MASTER_INST|P2S_INST|r_zustand[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|P2S_INST|r_folgezustand[10]~5_combout\,
	asdata => \I2S_MASTER_INST|P2S_INST|r_zustand\(9),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ALT_INV_zustand.load_dac~q\,
	ena => \I2S_MASTER_INST|P2S_INST|r_folgezustand[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|P2S_INST|r_zustand\(10));

-- Location: FF_X6_Y21_N23
\I2S_MASTER_INST|P2S_INST|r_zustand[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|P2S_INST|r_folgezustand[11]~4_combout\,
	asdata => \I2S_MASTER_INST|P2S_INST|r_zustand\(10),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ALT_INV_zustand.load_dac~q\,
	ena => \I2S_MASTER_INST|P2S_INST|r_folgezustand[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|P2S_INST|r_zustand\(11));

-- Location: FF_X6_Y21_N31
\I2S_MASTER_INST|P2S_INST|r_zustand[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|P2S_INST|r_folgezustand[12]~3_combout\,
	asdata => \I2S_MASTER_INST|P2S_INST|r_zustand\(11),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ALT_INV_zustand.load_dac~q\,
	ena => \I2S_MASTER_INST|P2S_INST|r_folgezustand[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|P2S_INST|r_zustand\(12));

-- Location: FF_X6_Y21_N15
\I2S_MASTER_INST|P2S_INST|r_zustand[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|P2S_INST|r_folgezustand[13]~2_combout\,
	asdata => \I2S_MASTER_INST|P2S_INST|r_zustand\(12),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ALT_INV_zustand.load_dac~q\,
	ena => \I2S_MASTER_INST|P2S_INST|r_folgezustand[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|P2S_INST|r_zustand\(13));

-- Location: FF_X6_Y21_N9
\I2S_MASTER_INST|P2S_INST|r_zustand[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2S_MASTER_INST|P2S_INST|r_folgezustand[14]~1_combout\,
	asdata => \I2S_MASTER_INST|P2S_INST|r_zustand\(13),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ALT_INV_zustand.load_dac~q\,
	ena => \I2S_MASTER_INST|P2S_INST|r_folgezustand[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|P2S_INST|r_zustand\(14));

-- Location: FF_X6_Y21_N25
\I2S_MASTER_INST|P2S_INST|r_zustand[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \AUDIO_CONTROL_INST|DACDAT_pr_o[15]~0_combout\,
	asdata => \I2S_MASTER_INST|P2S_INST|r_zustand\(14),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|ALT_INV_zustand.load_dac~q\,
	ena => \I2S_MASTER_INST|P2S_INST|r_folgezustand[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2S_MASTER_INST|P2S_INST|r_zustand\(15));

-- Location: LCCOMB_X6_Y21_N0
\I2S_MASTER_INST|P2S_INST|DACDAT_s_o~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2S_MASTER_INST|P2S_INST|DACDAT_s_o~0_combout\ = (\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.hold_L~q\ & (((\I2S_MASTER_INST|P2S_INST|l_zustand\(15))))) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.hold_L~q\ & 
-- ((\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.shift_adc_L~q\ & (\I2S_MASTER_INST|P2S_INST|l_zustand\(15))) # (!\I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.shift_adc_L~q\ & ((\I2S_MASTER_INST|P2S_INST|r_zustand\(15))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.hold_L~q\,
	datab => \I2S_MASTER_INST|FSM_BCLK_COUNT_INST|zustand.shift_adc_L~q\,
	datac => \I2S_MASTER_INST|P2S_INST|l_zustand\(15),
	datad => \I2S_MASTER_INST|P2S_INST|r_zustand\(15),
	combout => \I2S_MASTER_INST|P2S_INST|DACDAT_s_o~0_combout\);

-- Location: LCCOMB_X68_Y43_N2
\I2C_MASTER_INST|next_scl~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|next_scl~1_combout\ = (\I2C_MASTER_INST|clk_edge_mask\(0)) # (((\I2C_MASTER_INST|fsm_state.S_WAIT_FOR_START~q\) # (!\I2C_MASTER_INST|fsm_state.S_IDLE~q\)) # (!\I2C_MASTER_INST|clk_edge_mask\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|clk_edge_mask\(0),
	datab => \I2C_MASTER_INST|clk_edge_mask\(2),
	datac => \I2C_MASTER_INST|fsm_state.S_WAIT_FOR_START~q\,
	datad => \I2C_MASTER_INST|fsm_state.S_IDLE~q\,
	combout => \I2C_MASTER_INST|next_scl~1_combout\);

-- Location: LCCOMB_X68_Y43_N10
\I2C_MASTER_INST|next_scl~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \I2C_MASTER_INST|next_scl~2_combout\ = (!\I2C_MASTER_INST|next_scl~0_combout\ & ((\I2C_MASTER_INST|scl~q\) # ((!\I2C_MASTER_INST|fsm_state.S_STOP~q\ & !\I2C_MASTER_INST|next_scl~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_MASTER_INST|fsm_state.S_STOP~q\,
	datab => \I2C_MASTER_INST|next_scl~1_combout\,
	datac => \I2C_MASTER_INST|scl~q\,
	datad => \I2C_MASTER_INST|next_scl~0_combout\,
	combout => \I2C_MASTER_INST|next_scl~2_combout\);

-- Location: FF_X68_Y43_N11
\I2C_MASTER_INST|scl\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \I2C_MASTER_INST|next_scl~2_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \I2C_MASTER_INST|scl~q\);

-- Location: LCCOMB_X66_Y43_N10
\CODECCONTROLLER_INST|LED_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CODECCONTROLLER_INST|LED_out~0_combout\ = (\CODECCONTROLLER_INST|LED_out~q\) # (\I2C_MASTER_INST|ack_error~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CODECCONTROLLER_INST|LED_out~q\,
	datad => \I2C_MASTER_INST|ack_error~q\,
	combout => \CODECCONTROLLER_INST|LED_out~0_combout\);

-- Location: FF_X66_Y43_N11
\CODECCONTROLLER_INST|LED_out\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \CODECCONTROLLER_INST|LED_out~0_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CODECCONTROLLER_INST|LED_out~q\);

-- Location: LCCOMB_X7_Y72_N20
\FM_CODER_7SEGMENT_INST|next_reg_idx_ratio~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \FM_CODER_7SEGMENT_INST|next_reg_idx_ratio~0_combout\ = (!\FM_CODER_7SEGMENT_INST|reg_idx_ratio\(0) & ((\FM_CODER_7SEGMENT_INST|reg_idx_ratio\(1)) # (!\FM_CODER_7SEGMENT_INST|reg_idx_ratio\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FM_CODER_7SEGMENT_INST|reg_idx_ratio\(2),
	datac => \FM_CODER_7SEGMENT_INST|reg_idx_ratio\(0),
	datad => \FM_CODER_7SEGMENT_INST|reg_idx_ratio\(1),
	combout => \FM_CODER_7SEGMENT_INST|next_reg_idx_ratio~0_combout\);

-- Location: IOIBUF_X9_Y73_N1
\KEY[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(1),
	o => \KEY[1]~input_o\);

-- Location: LCCOMB_X8_Y72_N24
\INFRASTRUCTURE_BLOCK_INST|sync_inst19|qreg[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \INFRASTRUCTURE_BLOCK_INST|sync_inst19|qreg[1]~feeder_combout\ = \KEY[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \KEY[1]~input_o\,
	combout => \INFRASTRUCTURE_BLOCK_INST|sync_inst19|qreg[1]~feeder_combout\);

-- Location: FF_X8_Y72_N25
\INFRASTRUCTURE_BLOCK_INST|sync_inst19|qreg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \INFRASTRUCTURE_BLOCK_INST|sync_inst19|qreg[1]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INFRASTRUCTURE_BLOCK_INST|sync_inst19|qreg\(1));

-- Location: LCCOMB_X7_Y72_N2
\INFRASTRUCTURE_BLOCK_INST|sync_inst19|qreg[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \INFRASTRUCTURE_BLOCK_INST|sync_inst19|qreg[0]~feeder_combout\ = \INFRASTRUCTURE_BLOCK_INST|sync_inst19|qreg\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \INFRASTRUCTURE_BLOCK_INST|sync_inst19|qreg\(1),
	combout => \INFRASTRUCTURE_BLOCK_INST|sync_inst19|qreg[0]~feeder_combout\);

-- Location: FF_X7_Y72_N3
\INFRASTRUCTURE_BLOCK_INST|sync_inst19|qreg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \INFRASTRUCTURE_BLOCK_INST|sync_inst19|qreg[0]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INFRASTRUCTURE_BLOCK_INST|sync_inst19|qreg\(0));

-- Location: LCCOMB_X7_Y72_N24
\FM_CODER_7SEGMENT_INST|delay_count[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \FM_CODER_7SEGMENT_INST|delay_count[1]~feeder_combout\ = \INFRASTRUCTURE_BLOCK_INST|sync_inst19|qreg\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \INFRASTRUCTURE_BLOCK_INST|sync_inst19|qreg\(0),
	combout => \FM_CODER_7SEGMENT_INST|delay_count[1]~feeder_combout\);

-- Location: FF_X7_Y72_N25
\FM_CODER_7SEGMENT_INST|delay_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \FM_CODER_7SEGMENT_INST|delay_count[1]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FM_CODER_7SEGMENT_INST|delay_count\(1));

-- Location: LCCOMB_X7_Y72_N6
\INFRASTRUCTURE_BLOCK_INST|sync_inst18|qreg[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \INFRASTRUCTURE_BLOCK_INST|sync_inst18|qreg[1]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \INFRASTRUCTURE_BLOCK_INST|sync_inst18|qreg[1]~feeder_combout\);

-- Location: FF_X7_Y72_N7
\INFRASTRUCTURE_BLOCK_INST|sync_inst18|qreg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \INFRASTRUCTURE_BLOCK_INST|sync_inst18|qreg[1]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INFRASTRUCTURE_BLOCK_INST|sync_inst18|qreg\(1));

-- Location: LCCOMB_X7_Y72_N14
\INFRASTRUCTURE_BLOCK_INST|sync_inst18|qreg[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \INFRASTRUCTURE_BLOCK_INST|sync_inst18|qreg[0]~feeder_combout\ = \INFRASTRUCTURE_BLOCK_INST|sync_inst18|qreg\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \INFRASTRUCTURE_BLOCK_INST|sync_inst18|qreg\(1),
	combout => \INFRASTRUCTURE_BLOCK_INST|sync_inst18|qreg[0]~feeder_combout\);

-- Location: FF_X7_Y72_N15
\INFRASTRUCTURE_BLOCK_INST|sync_inst18|qreg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \INFRASTRUCTURE_BLOCK_INST|sync_inst18|qreg[0]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INFRASTRUCTURE_BLOCK_INST|sync_inst18|qreg\(0));

-- Location: FF_X7_Y72_N5
\FM_CODER_7SEGMENT_INST|delay_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	asdata => \INFRASTRUCTURE_BLOCK_INST|sync_inst18|qreg\(0),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FM_CODER_7SEGMENT_INST|delay_count\(0));

-- Location: LCCOMB_X7_Y72_N4
\FM_CODER_7SEGMENT_INST|reg_idx_ratio[2]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \FM_CODER_7SEGMENT_INST|reg_idx_ratio[2]~0_combout\ = (!\INFRASTRUCTURE_BLOCK_INST|sync_inst18|qreg\(0) & (\FM_CODER_7SEGMENT_INST|delay_count\(0) & ((\INFRASTRUCTURE_BLOCK_INST|sync_inst19|qreg\(0)) # (!\FM_CODER_7SEGMENT_INST|delay_count\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FM_CODER_7SEGMENT_INST|delay_count\(1),
	datab => \INFRASTRUCTURE_BLOCK_INST|sync_inst18|qreg\(0),
	datac => \FM_CODER_7SEGMENT_INST|delay_count\(0),
	datad => \INFRASTRUCTURE_BLOCK_INST|sync_inst19|qreg\(0),
	combout => \FM_CODER_7SEGMENT_INST|reg_idx_ratio[2]~0_combout\);

-- Location: FF_X7_Y72_N21
\FM_CODER_7SEGMENT_INST|reg_idx_ratio[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \FM_CODER_7SEGMENT_INST|next_reg_idx_ratio~0_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \FM_CODER_7SEGMENT_INST|reg_idx_ratio[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FM_CODER_7SEGMENT_INST|reg_idx_ratio\(0));

-- Location: LCCOMB_X7_Y72_N30
\FM_CODER_7SEGMENT_INST|next_reg_idx_ratio~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \FM_CODER_7SEGMENT_INST|next_reg_idx_ratio~1_combout\ = (\FM_CODER_7SEGMENT_INST|reg_idx_ratio\(2) & ((\FM_CODER_7SEGMENT_INST|reg_idx_ratio\(0)))) # (!\FM_CODER_7SEGMENT_INST|reg_idx_ratio\(2) & (\FM_CODER_7SEGMENT_INST|reg_idx_ratio\(1) & 
-- !\FM_CODER_7SEGMENT_INST|reg_idx_ratio\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \FM_CODER_7SEGMENT_INST|reg_idx_ratio\(1),
	datac => \FM_CODER_7SEGMENT_INST|reg_idx_ratio\(2),
	datad => \FM_CODER_7SEGMENT_INST|reg_idx_ratio\(0),
	combout => \FM_CODER_7SEGMENT_INST|next_reg_idx_ratio~1_combout\);

-- Location: FF_X7_Y72_N31
\FM_CODER_7SEGMENT_INST|reg_idx_ratio[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \FM_CODER_7SEGMENT_INST|next_reg_idx_ratio~1_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \FM_CODER_7SEGMENT_INST|reg_idx_ratio[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FM_CODER_7SEGMENT_INST|reg_idx_ratio\(2));

-- Location: LCCOMB_X7_Y72_N28
\FM_CODER_7SEGMENT_INST|next_reg_idx_ratio~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \FM_CODER_7SEGMENT_INST|next_reg_idx_ratio~2_combout\ = (\FM_CODER_7SEGMENT_INST|reg_idx_ratio\(1) & ((\FM_CODER_7SEGMENT_INST|reg_idx_ratio\(0)))) # (!\FM_CODER_7SEGMENT_INST|reg_idx_ratio\(1) & (!\FM_CODER_7SEGMENT_INST|reg_idx_ratio\(2) & 
-- !\FM_CODER_7SEGMENT_INST|reg_idx_ratio\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FM_CODER_7SEGMENT_INST|reg_idx_ratio\(2),
	datac => \FM_CODER_7SEGMENT_INST|reg_idx_ratio\(1),
	datad => \FM_CODER_7SEGMENT_INST|reg_idx_ratio\(0),
	combout => \FM_CODER_7SEGMENT_INST|next_reg_idx_ratio~2_combout\);

-- Location: FF_X7_Y72_N29
\FM_CODER_7SEGMENT_INST|reg_idx_ratio[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \FM_CODER_7SEGMENT_INST|next_reg_idx_ratio~2_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \FM_CODER_7SEGMENT_INST|reg_idx_ratio[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FM_CODER_7SEGMENT_INST|reg_idx_ratio\(1));

-- Location: LCCOMB_X7_Y72_N26
\FM_CODER_7SEGMENT_INST|Mux11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \FM_CODER_7SEGMENT_INST|Mux11~0_combout\ = (!\FM_CODER_7SEGMENT_INST|reg_idx_ratio\(1) & (\FM_CODER_7SEGMENT_INST|reg_idx_ratio\(2) & \FM_CODER_7SEGMENT_INST|reg_idx_ratio\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \FM_CODER_7SEGMENT_INST|reg_idx_ratio\(1),
	datac => \FM_CODER_7SEGMENT_INST|reg_idx_ratio\(2),
	datad => \FM_CODER_7SEGMENT_INST|reg_idx_ratio\(0),
	combout => \FM_CODER_7SEGMENT_INST|Mux11~0_combout\);

-- Location: LCCOMB_X6_Y72_N12
\FM_CODER_7SEGMENT_INST|Mux7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \FM_CODER_7SEGMENT_INST|Mux7~0_combout\ = \FM_CODER_7SEGMENT_INST|reg_idx_ratio\(2) $ (((\FM_CODER_7SEGMENT_INST|reg_idx_ratio\(1)) # (!\FM_CODER_7SEGMENT_INST|reg_idx_ratio\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110010101100101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FM_CODER_7SEGMENT_INST|reg_idx_ratio\(2),
	datab => \FM_CODER_7SEGMENT_INST|reg_idx_ratio\(1),
	datac => \FM_CODER_7SEGMENT_INST|reg_idx_ratio\(0),
	combout => \FM_CODER_7SEGMENT_INST|Mux7~0_combout\);

-- Location: LCCOMB_X6_Y72_N26
\FM_CODER_7SEGMENT_INST|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \FM_CODER_7SEGMENT_INST|Mux6~0_combout\ = (\FM_CODER_7SEGMENT_INST|reg_idx_ratio\(2)) # ((!\FM_CODER_7SEGMENT_INST|reg_idx_ratio\(1) & \FM_CODER_7SEGMENT_INST|reg_idx_ratio\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FM_CODER_7SEGMENT_INST|reg_idx_ratio\(2),
	datab => \FM_CODER_7SEGMENT_INST|reg_idx_ratio\(1),
	datac => \FM_CODER_7SEGMENT_INST|reg_idx_ratio\(0),
	combout => \FM_CODER_7SEGMENT_INST|Mux6~0_combout\);

-- Location: LCCOMB_X6_Y72_N0
\FM_CODER_7SEGMENT_INST|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \FM_CODER_7SEGMENT_INST|Mux5~0_combout\ = (!\FM_CODER_7SEGMENT_INST|reg_idx_ratio\(2) & (\FM_CODER_7SEGMENT_INST|reg_idx_ratio\(1) & \FM_CODER_7SEGMENT_INST|reg_idx_ratio\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FM_CODER_7SEGMENT_INST|reg_idx_ratio\(2),
	datab => \FM_CODER_7SEGMENT_INST|reg_idx_ratio\(1),
	datac => \FM_CODER_7SEGMENT_INST|reg_idx_ratio\(0),
	combout => \FM_CODER_7SEGMENT_INST|Mux5~0_combout\);

-- Location: LCCOMB_X6_Y72_N2
\FM_CODER_7SEGMENT_INST|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \FM_CODER_7SEGMENT_INST|Mux1~0_combout\ = (!\FM_CODER_7SEGMENT_INST|reg_idx_ratio\(2) & (\FM_CODER_7SEGMENT_INST|reg_idx_ratio\(1) & !\FM_CODER_7SEGMENT_INST|reg_idx_ratio\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FM_CODER_7SEGMENT_INST|reg_idx_ratio\(2),
	datab => \FM_CODER_7SEGMENT_INST|reg_idx_ratio\(1),
	datac => \FM_CODER_7SEGMENT_INST|reg_idx_ratio\(0),
	combout => \FM_CODER_7SEGMENT_INST|Mux1~0_combout\);

-- Location: LCCOMB_X6_Y72_N4
\FM_CODER_7SEGMENT_INST|Mux5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \FM_CODER_7SEGMENT_INST|Mux5~1_combout\ = (!\FM_CODER_7SEGMENT_INST|reg_idx_ratio\(2) & \FM_CODER_7SEGMENT_INST|reg_idx_ratio\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FM_CODER_7SEGMENT_INST|reg_idx_ratio\(2),
	datad => \FM_CODER_7SEGMENT_INST|reg_idx_ratio\(1),
	combout => \FM_CODER_7SEGMENT_INST|Mux5~1_combout\);

-- Location: LCCOMB_X8_Y72_N10
\FM_CODER_7SEGMENT_INST|reg_idx_depth[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \FM_CODER_7SEGMENT_INST|reg_idx_depth[0]~1_combout\ = !\FM_CODER_7SEGMENT_INST|reg_idx_depth\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \FM_CODER_7SEGMENT_INST|reg_idx_depth\(0),
	combout => \FM_CODER_7SEGMENT_INST|reg_idx_depth[0]~1_combout\);

-- Location: LCCOMB_X7_Y72_N16
\FM_CODER_7SEGMENT_INST|counter_on[1]\ : cycloneive_lcell_comb
-- Equation(s):
-- \FM_CODER_7SEGMENT_INST|counter_on\(1) = (!\INFRASTRUCTURE_BLOCK_INST|sync_inst19|qreg\(0) & \FM_CODER_7SEGMENT_INST|delay_count\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \INFRASTRUCTURE_BLOCK_INST|sync_inst19|qreg\(0),
	datad => \FM_CODER_7SEGMENT_INST|delay_count\(1),
	combout => \FM_CODER_7SEGMENT_INST|counter_on\(1));

-- Location: FF_X8_Y72_N11
\FM_CODER_7SEGMENT_INST|reg_idx_depth[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \FM_CODER_7SEGMENT_INST|reg_idx_depth[0]~1_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \FM_CODER_7SEGMENT_INST|counter_on\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FM_CODER_7SEGMENT_INST|reg_idx_depth\(0));

-- Location: LCCOMB_X8_Y72_N4
\FM_CODER_7SEGMENT_INST|Mux17~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \FM_CODER_7SEGMENT_INST|Mux17~1_combout\ = \FM_CODER_7SEGMENT_INST|reg_idx_depth\(1) $ (\FM_CODER_7SEGMENT_INST|reg_idx_depth\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \FM_CODER_7SEGMENT_INST|reg_idx_depth\(1),
	datad => \FM_CODER_7SEGMENT_INST|reg_idx_depth\(0),
	combout => \FM_CODER_7SEGMENT_INST|Mux17~1_combout\);

-- Location: FF_X8_Y72_N5
\FM_CODER_7SEGMENT_INST|reg_idx_depth[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \FM_CODER_7SEGMENT_INST|Mux17~1_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	ena => \FM_CODER_7SEGMENT_INST|counter_on\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FM_CODER_7SEGMENT_INST|reg_idx_depth\(1));

-- Location: LCCOMB_X7_Y72_N8
\FM_CODER_7SEGMENT_INST|reg_idx_depth[2]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \FM_CODER_7SEGMENT_INST|reg_idx_depth[2]~0_combout\ = \FM_CODER_7SEGMENT_INST|reg_idx_depth\(2) $ (((\FM_CODER_7SEGMENT_INST|reg_idx_depth\(1) & (\FM_CODER_7SEGMENT_INST|reg_idx_depth\(0) & \FM_CODER_7SEGMENT_INST|counter_on\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FM_CODER_7SEGMENT_INST|reg_idx_depth\(1),
	datab => \FM_CODER_7SEGMENT_INST|reg_idx_depth\(0),
	datac => \FM_CODER_7SEGMENT_INST|reg_idx_depth\(2),
	datad => \FM_CODER_7SEGMENT_INST|counter_on\(1),
	combout => \FM_CODER_7SEGMENT_INST|reg_idx_depth[2]~0_combout\);

-- Location: FF_X7_Y72_N9
\FM_CODER_7SEGMENT_INST|reg_idx_depth[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INFRASTRUCTURE_BLOCK_INST|divider_inst|count[3]~clkctrl_outclk\,
	d => \FM_CODER_7SEGMENT_INST|reg_idx_depth[2]~0_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FM_CODER_7SEGMENT_INST|reg_idx_depth\(2));

-- Location: LCCOMB_X7_Y72_N10
\FM_CODER_7SEGMENT_INST|Mux18~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \FM_CODER_7SEGMENT_INST|Mux18~0_combout\ = (\FM_CODER_7SEGMENT_INST|reg_idx_depth\(0) & (!\FM_CODER_7SEGMENT_INST|reg_idx_depth\(1) & !\FM_CODER_7SEGMENT_INST|reg_idx_depth\(2))) # (!\FM_CODER_7SEGMENT_INST|reg_idx_depth\(0) & 
-- ((\FM_CODER_7SEGMENT_INST|reg_idx_depth\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FM_CODER_7SEGMENT_INST|reg_idx_depth\(1),
	datab => \FM_CODER_7SEGMENT_INST|reg_idx_depth\(0),
	datad => \FM_CODER_7SEGMENT_INST|reg_idx_depth\(2),
	combout => \FM_CODER_7SEGMENT_INST|Mux18~0_combout\);

-- Location: LCCOMB_X8_Y72_N12
\FM_CODER_7SEGMENT_INST|Mux17~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \FM_CODER_7SEGMENT_INST|Mux17~0_combout\ = (\FM_CODER_7SEGMENT_INST|reg_idx_depth\(2) & (\FM_CODER_7SEGMENT_INST|reg_idx_depth\(1) $ (\FM_CODER_7SEGMENT_INST|reg_idx_depth\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FM_CODER_7SEGMENT_INST|reg_idx_depth\(2),
	datab => \FM_CODER_7SEGMENT_INST|reg_idx_depth\(1),
	datad => \FM_CODER_7SEGMENT_INST|reg_idx_depth\(0),
	combout => \FM_CODER_7SEGMENT_INST|Mux17~0_combout\);

-- Location: LCCOMB_X8_Y72_N6
\FM_CODER_7SEGMENT_INST|Mux16~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \FM_CODER_7SEGMENT_INST|Mux16~0_combout\ = (!\FM_CODER_7SEGMENT_INST|reg_idx_depth\(2) & (\FM_CODER_7SEGMENT_INST|reg_idx_depth\(1) & !\FM_CODER_7SEGMENT_INST|reg_idx_depth\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FM_CODER_7SEGMENT_INST|reg_idx_depth\(2),
	datab => \FM_CODER_7SEGMENT_INST|reg_idx_depth\(1),
	datad => \FM_CODER_7SEGMENT_INST|reg_idx_depth\(0),
	combout => \FM_CODER_7SEGMENT_INST|Mux16~0_combout\);

-- Location: LCCOMB_X7_Y72_N12
\FM_CODER_7SEGMENT_INST|Mux15~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \FM_CODER_7SEGMENT_INST|Mux15~0_combout\ = (\FM_CODER_7SEGMENT_INST|reg_idx_depth\(1) & (\FM_CODER_7SEGMENT_INST|reg_idx_depth\(0) & \FM_CODER_7SEGMENT_INST|reg_idx_depth\(2))) # (!\FM_CODER_7SEGMENT_INST|reg_idx_depth\(1) & 
-- (\FM_CODER_7SEGMENT_INST|reg_idx_depth\(0) $ (\FM_CODER_7SEGMENT_INST|reg_idx_depth\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FM_CODER_7SEGMENT_INST|reg_idx_depth\(1),
	datab => \FM_CODER_7SEGMENT_INST|reg_idx_depth\(0),
	datad => \FM_CODER_7SEGMENT_INST|reg_idx_depth\(2),
	combout => \FM_CODER_7SEGMENT_INST|Mux15~0_combout\);

-- Location: LCCOMB_X8_Y72_N0
\FM_CODER_7SEGMENT_INST|Mux14~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \FM_CODER_7SEGMENT_INST|Mux14~0_combout\ = (\FM_CODER_7SEGMENT_INST|reg_idx_depth\(0)) # ((\FM_CODER_7SEGMENT_INST|reg_idx_depth\(2) & !\FM_CODER_7SEGMENT_INST|reg_idx_depth\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FM_CODER_7SEGMENT_INST|reg_idx_depth\(2),
	datab => \FM_CODER_7SEGMENT_INST|reg_idx_depth\(1),
	datad => \FM_CODER_7SEGMENT_INST|reg_idx_depth\(0),
	combout => \FM_CODER_7SEGMENT_INST|Mux14~0_combout\);

-- Location: LCCOMB_X8_Y72_N2
\FM_CODER_7SEGMENT_INST|Mux13~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \FM_CODER_7SEGMENT_INST|Mux13~0_combout\ = (\FM_CODER_7SEGMENT_INST|reg_idx_depth\(2) & (\FM_CODER_7SEGMENT_INST|reg_idx_depth\(1) & \FM_CODER_7SEGMENT_INST|reg_idx_depth\(0))) # (!\FM_CODER_7SEGMENT_INST|reg_idx_depth\(2) & 
-- ((\FM_CODER_7SEGMENT_INST|reg_idx_depth\(1)) # (\FM_CODER_7SEGMENT_INST|reg_idx_depth\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FM_CODER_7SEGMENT_INST|reg_idx_depth\(2),
	datab => \FM_CODER_7SEGMENT_INST|reg_idx_depth\(1),
	datad => \FM_CODER_7SEGMENT_INST|reg_idx_depth\(0),
	combout => \FM_CODER_7SEGMENT_INST|Mux13~0_combout\);

-- Location: LCCOMB_X7_Y72_N22
\FM_CODER_7SEGMENT_INST|Mux12~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \FM_CODER_7SEGMENT_INST|Mux12~0_combout\ = (\FM_CODER_7SEGMENT_INST|reg_idx_depth\(1) & (\FM_CODER_7SEGMENT_INST|reg_idx_depth\(0) & \FM_CODER_7SEGMENT_INST|reg_idx_depth\(2))) # (!\FM_CODER_7SEGMENT_INST|reg_idx_depth\(1) & 
-- ((!\FM_CODER_7SEGMENT_INST|reg_idx_depth\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FM_CODER_7SEGMENT_INST|reg_idx_depth\(1),
	datab => \FM_CODER_7SEGMENT_INST|reg_idx_depth\(0),
	datad => \FM_CODER_7SEGMENT_INST|reg_idx_depth\(2),
	combout => \FM_CODER_7SEGMENT_INST|Mux12~0_combout\);

-- Location: IOIBUF_X115_Y68_N22
\KEY[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(3),
	o => \KEY[3]~input_o\);

-- Location: IOIBUF_X69_Y73_N22
\SW[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

-- Location: IOIBUF_X96_Y0_N8
\SW[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(1),
	o => \SW[1]~input_o\);

-- Location: IOIBUF_X38_Y0_N8
\SW[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(2),
	o => \SW[2]~input_o\);

-- Location: IOIBUF_X115_Y5_N15
\SW[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(3),
	o => \SW[3]~input_o\);

-- Location: IOIBUF_X40_Y73_N1
\SW[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(4),
	o => \SW[4]~input_o\);

-- Location: IOIBUF_X0_Y50_N15
\SW[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(5),
	o => \SW[5]~input_o\);

-- Location: IOIBUF_X20_Y73_N1
\SW[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(6),
	o => \SW[6]~input_o\);

-- Location: IOIBUF_X0_Y30_N8
\SW[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(7),
	o => \SW[7]~input_o\);

-- Location: IOIBUF_X79_Y0_N22
\SW[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(8),
	o => \SW[8]~input_o\);

-- Location: IOIBUF_X56_Y0_N1
\SW[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(9),
	o => \SW[9]~input_o\);

-- Location: IOIBUF_X79_Y0_N1
\SW[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(10),
	o => \SW[10]~input_o\);

-- Location: IOIBUF_X35_Y73_N15
\SW[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(11),
	o => \SW[11]~input_o\);

-- Location: IOIBUF_X98_Y73_N15
\SW[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(12),
	o => \SW[12]~input_o\);

-- Location: IOIBUF_X45_Y73_N1
\SW[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(13),
	o => \SW[13]~input_o\);

-- Location: IOIBUF_X115_Y23_N1
\GPIO_10~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_GPIO_10,
	o => \GPIO_10~input_o\);

-- Location: IOIBUF_X0_Y44_N8
\KEY[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(2),
	o => \KEY[2]~input_o\);

ww_AUD_DACDAT <= \AUD_DACDAT~output_o\;

ww_AUD_BCLK <= \AUD_BCLK~output_o\;

ww_AUD_XCK <= \AUD_XCK~output_o\;

ww_AUD_DACLRCK <= \AUD_DACLRCK~output_o\;

ww_AUD_ADCLRCK <= \AUD_ADCLRCK~output_o\;

ww_I2C_SCLK <= \I2C_SCLK~output_o\;

ww_LEDG(0) <= \LEDG[0]~output_o\;

ww_LEDG(1) <= \LEDG[1]~output_o\;

ww_LEDG(2) <= \LEDG[2]~output_o\;

ww_LEDG(3) <= \LEDG[3]~output_o\;

ww_LEDG(4) <= \LEDG[4]~output_o\;

ww_LEDG(5) <= \LEDG[5]~output_o\;

ww_LEDG(6) <= \LEDG[6]~output_o\;

ww_LEDG(7) <= \LEDG[7]~output_o\;

ww_HEX0(0) <= \HEX0[0]~output_o\;

ww_HEX0(1) <= \HEX0[1]~output_o\;

ww_HEX0(2) <= \HEX0[2]~output_o\;

ww_HEX0(3) <= \HEX0[3]~output_o\;

ww_HEX0(4) <= \HEX0[4]~output_o\;

ww_HEX0(5) <= \HEX0[5]~output_o\;

ww_HEX0(6) <= \HEX0[6]~output_o\;

ww_HEX3(0) <= \HEX3[0]~output_o\;

ww_HEX3(1) <= \HEX3[1]~output_o\;

ww_HEX3(2) <= \HEX3[2]~output_o\;

ww_HEX3(3) <= \HEX3[3]~output_o\;

ww_HEX3(4) <= \HEX3[4]~output_o\;

ww_HEX3(5) <= \HEX3[5]~output_o\;

ww_HEX3(6) <= \HEX3[6]~output_o\;

ww_HEX2(0) <= \HEX2[0]~output_o\;

ww_HEX2(1) <= \HEX2[1]~output_o\;

ww_HEX2(2) <= \HEX2[2]~output_o\;

ww_HEX2(3) <= \HEX2[3]~output_o\;

ww_HEX2(4) <= \HEX2[4]~output_o\;

ww_HEX2(5) <= \HEX2[5]~output_o\;

ww_HEX2(6) <= \HEX2[6]~output_o\;

ww_HEX4(0) <= \HEX4[0]~output_o\;

ww_HEX4(1) <= \HEX4[1]~output_o\;

ww_HEX4(2) <= \HEX4[2]~output_o\;

ww_HEX4(3) <= \HEX4[3]~output_o\;

ww_HEX4(4) <= \HEX4[4]~output_o\;

ww_HEX4(5) <= \HEX4[5]~output_o\;

ww_HEX4(6) <= \HEX4[6]~output_o\;

ww_HEX5(0) <= \HEX5[0]~output_o\;

ww_HEX5(1) <= \HEX5[1]~output_o\;

ww_HEX5(2) <= \HEX5[2]~output_o\;

ww_HEX5(3) <= \HEX5[3]~output_o\;

ww_HEX5(4) <= \HEX5[4]~output_o\;

ww_HEX5(5) <= \HEX5[5]~output_o\;

ww_HEX5(6) <= \HEX5[6]~output_o\;

ww_HEX1(0) <= \HEX1[0]~output_o\;

ww_HEX1(1) <= \HEX1[1]~output_o\;

ww_HEX1(2) <= \HEX1[2]~output_o\;

ww_HEX1(3) <= \HEX1[3]~output_o\;

ww_HEX1(4) <= \HEX1[4]~output_o\;

ww_HEX1(5) <= \HEX1[5]~output_o\;

ww_HEX1(6) <= \HEX1[6]~output_o\;

I2C_SDAT <= \I2C_SDAT~output_o\;
END structure;


