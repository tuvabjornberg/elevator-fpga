-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"

-- DATE "03/30/2026 17:07:23"

-- 
-- Device: Altera 5CSEMA5F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	elevator IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	row : IN std_logic_vector(3 DOWNTO 0);
	column : OUT std_logic_vector(3 DOWNTO 0);
	seg_out : OUT std_logic_vector(6 DOWNTO 0);
	disp_nr1 : OUT std_logic;
	led1_out : OUT std_logic;
	led2_out : OUT std_logic
	);
END elevator;

-- Design Ports Information
-- column[0]	=>  Location: PIN_AH22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- column[1]	=>  Location: PIN_AF24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- column[2]	=>  Location: PIN_AE22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- column[3]	=>  Location: PIN_AA20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_out[0]	=>  Location: PIN_AG25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_out[1]	=>  Location: PIN_AG23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_out[2]	=>  Location: PIN_AH25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_out[3]	=>  Location: PIN_AK28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_out[4]	=>  Location: PIN_AJ27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_out[5]	=>  Location: PIN_AH24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_out[6]	=>  Location: PIN_AJ24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- disp_nr1	=>  Location: PIN_AF25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led1_out	=>  Location: PIN_AB17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led2_out	=>  Location: PIN_AB21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- row[0]	=>  Location: PIN_AC22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- row[2]	=>  Location: PIN_AF23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- row[1]	=>  Location: PIN_AD21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- row[3]	=>  Location: PIN_AG22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_AF14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF elevator IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_row : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_column : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_seg_out : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_disp_nr1 : std_logic;
SIGNAL ww_led1_out : std_logic;
SIGNAL ww_led2_out : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \row[1]~input_o\ : std_logic;
SIGNAL \row[3]~input_o\ : std_logic;
SIGNAL \row[2]~input_o\ : std_logic;
SIGNAL \row[0]~input_o\ : std_logic;
SIGNAL \seg_out~0_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \seg_out[0]~reg0_q\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \seg_out[1]~1_combout\ : std_logic;
SIGNAL \seg_out[1]~reg0_q\ : std_logic;
SIGNAL \seg_out[2]~reg0feeder_combout\ : std_logic;
SIGNAL \seg_out[2]~reg0_q\ : std_logic;
SIGNAL \disp_nr1~0_combout\ : std_logic;
SIGNAL \disp_nr1~reg0_q\ : std_logic;
SIGNAL \led1_out~0_combout\ : std_logic;
SIGNAL \led1_out~reg0_q\ : std_logic;
SIGNAL \led2_out~0_combout\ : std_logic;
SIGNAL \led2_out~reg0_q\ : std_logic;
SIGNAL \ALT_INV_row[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_row[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_row[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_row[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_led2_out~reg0_q\ : std_logic;
SIGNAL \ALT_INV_led1_out~reg0_q\ : std_logic;
SIGNAL \ALT_INV_disp_nr1~reg0_q\ : std_logic;
SIGNAL \ALT_INV_seg_out[2]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_seg_out[1]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_seg_out[0]~reg0_q\ : std_logic;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_row <= row;
column <= ww_column;
seg_out <= ww_seg_out;
disp_nr1 <= ww_disp_nr1;
led1_out <= ww_led1_out;
led2_out <= ww_led2_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_row[3]~input_o\ <= NOT \row[3]~input_o\;
\ALT_INV_row[1]~input_o\ <= NOT \row[1]~input_o\;
\ALT_INV_row[2]~input_o\ <= NOT \row[2]~input_o\;
\ALT_INV_row[0]~input_o\ <= NOT \row[0]~input_o\;
\ALT_INV_led2_out~reg0_q\ <= NOT \led2_out~reg0_q\;
\ALT_INV_led1_out~reg0_q\ <= NOT \led1_out~reg0_q\;
\ALT_INV_disp_nr1~reg0_q\ <= NOT \disp_nr1~reg0_q\;
\ALT_INV_seg_out[2]~reg0_q\ <= NOT \seg_out[2]~reg0_q\;
\ALT_INV_seg_out[1]~reg0_q\ <= NOT \seg_out[1]~reg0_q\;
\ALT_INV_seg_out[0]~reg0_q\ <= NOT \seg_out[0]~reg0_q\;

-- Location: IOOBUF_X66_Y0_N93
\column[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_column(0));

-- Location: IOOBUF_X74_Y0_N59
\column[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_column(1));

-- Location: IOOBUF_X78_Y0_N2
\column[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_column(2));

-- Location: IOOBUF_X84_Y0_N19
\column[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_column(3));

-- Location: IOOBUF_X78_Y0_N36
\seg_out[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \seg_out[0]~reg0_q\,
	devoe => ww_devoe,
	o => ww_seg_out(0));

-- Location: IOOBUF_X64_Y0_N36
\seg_out[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_seg_out[1]~reg0_q\,
	devoe => ww_devoe,
	o => ww_seg_out(1));

-- Location: IOOBUF_X78_Y0_N53
\seg_out[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_seg_out[2]~reg0_q\,
	devoe => ww_devoe,
	o => ww_seg_out(2));

-- Location: IOOBUF_X82_Y0_N76
\seg_out[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_seg_out[2]~reg0_q\,
	devoe => ww_devoe,
	o => ww_seg_out(3));

-- Location: IOOBUF_X80_Y0_N36
\seg_out[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_seg_out(4));

-- Location: IOOBUF_X64_Y0_N53
\seg_out[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_seg_out(5));

-- Location: IOOBUF_X74_Y0_N76
\seg_out[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_seg_out[2]~reg0_q\,
	devoe => ww_devoe,
	o => ww_seg_out(6));

-- Location: IOOBUF_X86_Y0_N36
\disp_nr1~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \disp_nr1~reg0_q\,
	devoe => ww_devoe,
	o => ww_disp_nr1);

-- Location: IOOBUF_X56_Y0_N19
\led1_out~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \led1_out~reg0_q\,
	devoe => ww_devoe,
	o => ww_led1_out);

-- Location: IOOBUF_X88_Y0_N20
\led2_out~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \led2_out~reg0_q\,
	devoe => ww_devoe,
	o => ww_led2_out);

-- Location: IOIBUF_X32_Y0_N1
\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G6
\clk~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clk~input_o\,
	outclk => \clk~inputCLKENA0_outclk\);

-- Location: IOIBUF_X82_Y0_N58
\row[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_row(1),
	o => \row[1]~input_o\);

-- Location: IOIBUF_X66_Y0_N75
\row[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_row(3),
	o => \row[3]~input_o\);

-- Location: IOIBUF_X74_Y0_N41
\row[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_row(2),
	o => \row[2]~input_o\);

-- Location: IOIBUF_X86_Y0_N1
\row[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_row(0),
	o => \row[0]~input_o\);

-- Location: LABCELL_X77_Y1_N12
\seg_out~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \seg_out~0_combout\ = ( \seg_out[0]~reg0_q\ & ( \row[0]~input_o\ ) ) # ( !\seg_out[0]~reg0_q\ & ( \row[0]~input_o\ & ( (\row[1]~input_o\ & (\row[3]~input_o\ & !\row[2]~input_o\)) ) ) ) # ( \seg_out[0]~reg0_q\ & ( !\row[0]~input_o\ & ( (!\row[1]~input_o\) 
-- # ((!\row[3]~input_o\) # (!\row[2]~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111101111111000010000000100001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_row[1]~input_o\,
	datab => \ALT_INV_row[3]~input_o\,
	datac => \ALT_INV_row[2]~input_o\,
	datae => \ALT_INV_seg_out[0]~reg0_q\,
	dataf => \ALT_INV_row[0]~input_o\,
	combout => \seg_out~0_combout\);

-- Location: IOIBUF_X36_Y0_N1
\reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: FF_X77_Y1_N13
\seg_out[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \seg_out~0_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_out[0]~reg0_q\);

-- Location: LABCELL_X77_Y1_N42
\Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = ( !\row[0]~input_o\ & ( (\row[1]~input_o\ & (\row[3]~input_o\ & \row[2]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000000010000000100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_row[1]~input_o\,
	datab => \ALT_INV_row[3]~input_o\,
	datac => \ALT_INV_row[2]~input_o\,
	dataf => \ALT_INV_row[0]~input_o\,
	combout => \Equal0~0_combout\);

-- Location: LABCELL_X77_Y1_N21
\seg_out[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \seg_out[1]~1_combout\ = ( \row[1]~input_o\ & ( \row[0]~input_o\ & ( (!\row[2]~input_o\ & \row[3]~input_o\) ) ) ) # ( \row[1]~input_o\ & ( !\row[0]~input_o\ & ( (\row[2]~input_o\ & \row[3]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000001010000010100000000000000000000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_row[2]~input_o\,
	datac => \ALT_INV_row[3]~input_o\,
	datae => \ALT_INV_row[1]~input_o\,
	dataf => \ALT_INV_row[0]~input_o\,
	combout => \seg_out[1]~1_combout\);

-- Location: FF_X77_Y1_N43
\seg_out[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Equal0~0_combout\,
	clrn => \reset~input_o\,
	ena => \seg_out[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_out[1]~reg0_q\);

-- Location: LABCELL_X77_Y1_N45
\seg_out[2]~reg0feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \seg_out[2]~reg0feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \seg_out[2]~reg0feeder_combout\);

-- Location: FF_X77_Y1_N47
\seg_out[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \seg_out[2]~reg0feeder_combout\,
	clrn => \reset~input_o\,
	ena => \seg_out[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_out[2]~reg0_q\);

-- Location: LABCELL_X77_Y1_N48
\disp_nr1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \disp_nr1~0_combout\ = ( \disp_nr1~reg0_q\ & ( \row[0]~input_o\ ) ) # ( !\disp_nr1~reg0_q\ & ( \row[0]~input_o\ & ( (\row[1]~input_o\ & (\row[3]~input_o\ & !\row[2]~input_o\)) ) ) ) # ( \disp_nr1~reg0_q\ & ( !\row[0]~input_o\ ) ) # ( !\disp_nr1~reg0_q\ & 
-- ( !\row[0]~input_o\ & ( (\row[1]~input_o\ & (\row[3]~input_o\ & \row[2]~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001111111111111111100010000000100001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_row[1]~input_o\,
	datab => \ALT_INV_row[3]~input_o\,
	datac => \ALT_INV_row[2]~input_o\,
	datae => \ALT_INV_disp_nr1~reg0_q\,
	dataf => \ALT_INV_row[0]~input_o\,
	combout => \disp_nr1~0_combout\);

-- Location: FF_X77_Y1_N49
\disp_nr1~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \disp_nr1~0_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \disp_nr1~reg0_q\);

-- Location: LABCELL_X77_Y1_N57
\led1_out~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \led1_out~0_combout\ = ( \led1_out~reg0_q\ & ( \row[0]~input_o\ ) ) # ( \led1_out~reg0_q\ & ( !\row[0]~input_o\ ) ) # ( !\led1_out~reg0_q\ & ( !\row[0]~input_o\ & ( (\row[1]~input_o\ & (\row[3]~input_o\ & \row[2]~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000101111111111111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_row[1]~input_o\,
	datac => \ALT_INV_row[3]~input_o\,
	datad => \ALT_INV_row[2]~input_o\,
	datae => \ALT_INV_led1_out~reg0_q\,
	dataf => \ALT_INV_row[0]~input_o\,
	combout => \led1_out~0_combout\);

-- Location: FF_X77_Y1_N58
\led1_out~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \led1_out~0_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \led1_out~reg0_q\);

-- Location: LABCELL_X77_Y1_N36
\led2_out~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \led2_out~0_combout\ = ( \led2_out~reg0_q\ & ( \row[0]~input_o\ ) ) # ( !\led2_out~reg0_q\ & ( \row[0]~input_o\ & ( (\row[1]~input_o\ & (\row[3]~input_o\ & !\row[2]~input_o\)) ) ) ) # ( \led2_out~reg0_q\ & ( !\row[0]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100010000000100001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_row[1]~input_o\,
	datab => \ALT_INV_row[3]~input_o\,
	datac => \ALT_INV_row[2]~input_o\,
	datae => \ALT_INV_led2_out~reg0_q\,
	dataf => \ALT_INV_row[0]~input_o\,
	combout => \led2_out~0_combout\);

-- Location: FF_X77_Y1_N37
\led2_out~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \led2_out~0_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \led2_out~reg0_q\);

-- Location: MLABCELL_X47_Y19_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


