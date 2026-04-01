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

-- DATE "04/01/2026 16:05:43"

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
	led1_out : OUT std_logic
	);
END elevator;

-- Design Ports Information
-- column[0]	=>  Location: PIN_AH22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- column[1]	=>  Location: PIN_AF24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- column[2]	=>  Location: PIN_AE22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- column[3]	=>  Location: PIN_AA20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_out[0]	=>  Location: PIN_AJ24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_out[1]	=>  Location: PIN_AH24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_out[2]	=>  Location: PIN_AJ27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_out[3]	=>  Location: PIN_AK28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_out[4]	=>  Location: PIN_AH25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_out[5]	=>  Location: PIN_AG23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_out[6]	=>  Location: PIN_AG25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- disp_nr1	=>  Location: PIN_AF25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led1_out	=>  Location: PIN_AB17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_AF14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- row[3]	=>  Location: PIN_AG22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- row[0]	=>  Location: PIN_AC22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- row[1]	=>  Location: PIN_AD21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- row[2]	=>  Location: PIN_AF23,	 I/O Standard: 2.5 V,	 Current Strength: Default


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
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \NEXT_STATE.idle~1_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \NEXT_STATE.idle~q\ : std_logic;
SIGNAL \CURRENT_STATE.idle~feeder_combout\ : std_logic;
SIGNAL \CURRENT_STATE.idle~q\ : std_logic;
SIGNAL \NEXT_STATE.col0~1_combout\ : std_logic;
SIGNAL \NEXT_STATE.col0~q\ : std_logic;
SIGNAL \CURRENT_STATE.col0~feeder_combout\ : std_logic;
SIGNAL \CURRENT_STATE.col0~q\ : std_logic;
SIGNAL \NEXT_STATE.col1~feeder_combout\ : std_logic;
SIGNAL \NEXT_STATE.col1~q\ : std_logic;
SIGNAL \CURRENT_STATE.col1~feeder_combout\ : std_logic;
SIGNAL \CURRENT_STATE.col1~q\ : std_logic;
SIGNAL \NEXT_STATE.col2~q\ : std_logic;
SIGNAL \CURRENT_STATE.col2~q\ : std_logic;
SIGNAL \NEXT_STATE.col3~q\ : std_logic;
SIGNAL \CURRENT_STATE.col3~feeder_combout\ : std_logic;
SIGNAL \CURRENT_STATE.col3~q\ : std_logic;
SIGNAL \column[0]~1_combout\ : std_logic;
SIGNAL \column[0]~0_combout\ : std_logic;
SIGNAL \column[0]~reg0_q\ : std_logic;
SIGNAL \column[1]~2_combout\ : std_logic;
SIGNAL \column[1]~reg0_q\ : std_logic;
SIGNAL \column[2]~3_combout\ : std_logic;
SIGNAL \column[2]~reg0_q\ : std_logic;
SIGNAL \column[3]~4_combout\ : std_logic;
SIGNAL \column[3]~reg0_q\ : std_logic;
SIGNAL \Selector4~0_combout\ : std_logic;
SIGNAL \row[0]~input_o\ : std_logic;
SIGNAL \prev_row[0]~3_combout\ : std_logic;
SIGNAL \row[2]~input_o\ : std_logic;
SIGNAL \row[1]~input_o\ : std_logic;
SIGNAL \row[3]~input_o\ : std_logic;
SIGNAL \Equal4~0_combout\ : std_logic;
SIGNAL \prev_row[3]~0_combout\ : std_logic;
SIGNAL \prev_row[1]~2_combout\ : std_logic;
SIGNAL \prev_row[2]~1_combout\ : std_logic;
SIGNAL \process_0~0_combout\ : std_logic;
SIGNAL \row_index~2_combout\ : std_logic;
SIGNAL \row_index[1]~1_combout\ : std_logic;
SIGNAL \current_key[3]~feeder_combout\ : std_logic;
SIGNAL \row_index~0_combout\ : std_logic;
SIGNAL \current_key[2]~feeder_combout\ : std_logic;
SIGNAL \Selector5~0_combout\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \seg_out[0]~reg0_q\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \seg_out[1]~reg0_q\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \seg_out[2]~reg0_q\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \seg_out[3]~reg0_q\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \seg_out[4]~reg0_q\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \seg_out[5]~reg0_q\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \seg_out[6]~reg0_q\ : std_logic;
SIGNAL \Equal6~0_combout\ : std_logic;
SIGNAL \led1_out~reg0_q\ : std_logic;
SIGNAL current_key : std_logic_vector(3 DOWNTO 0);
SIGNAL col_index : std_logic_vector(1 DOWNTO 0);
SIGNAL prev_row : std_logic_vector(3 DOWNTO 0);
SIGNAL row_index : std_logic_vector(1 DOWNTO 0);
SIGNAL \ALT_INV_row[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_row[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_row[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_row[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_reset~input_o\ : std_logic;
SIGNAL ALT_INV_row_index : std_logic_vector(1 DOWNTO 0);
SIGNAL ALT_INV_col_index : std_logic_vector(1 DOWNTO 0);
SIGNAL \ALT_INV_Equal4~0_combout\ : std_logic;
SIGNAL ALT_INV_prev_row : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_NEXT_STATE.col0~q\ : std_logic;
SIGNAL \ALT_INV_NEXT_STATE.col1~q\ : std_logic;
SIGNAL \ALT_INV_NEXT_STATE.idle~q\ : std_logic;
SIGNAL \ALT_INV_NEXT_STATE.col3~q\ : std_logic;
SIGNAL ALT_INV_current_key : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_CURRENT_STATE.col0~q\ : std_logic;
SIGNAL \ALT_INV_CURRENT_STATE.col1~q\ : std_logic;
SIGNAL \ALT_INV_CURRENT_STATE.col2~q\ : std_logic;
SIGNAL \ALT_INV_CURRENT_STATE.idle~q\ : std_logic;
SIGNAL \ALT_INV_CURRENT_STATE.col3~q\ : std_logic;
SIGNAL \ALT_INV_seg_out[6]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_seg_out[5]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_seg_out[4]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_seg_out[3]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_seg_out[2]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_seg_out[1]~reg0_q\ : std_logic;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_row <= row;
column <= ww_column;
seg_out <= ww_seg_out;
disp_nr1 <= ww_disp_nr1;
led1_out <= ww_led1_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_row[2]~input_o\ <= NOT \row[2]~input_o\;
\ALT_INV_row[1]~input_o\ <= NOT \row[1]~input_o\;
\ALT_INV_row[0]~input_o\ <= NOT \row[0]~input_o\;
\ALT_INV_row[3]~input_o\ <= NOT \row[3]~input_o\;
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;
ALT_INV_row_index(1) <= NOT row_index(1);
ALT_INV_row_index(0) <= NOT row_index(0);
ALT_INV_col_index(1) <= NOT col_index(1);
\ALT_INV_Equal4~0_combout\ <= NOT \Equal4~0_combout\;
ALT_INV_prev_row(0) <= NOT prev_row(0);
ALT_INV_prev_row(1) <= NOT prev_row(1);
ALT_INV_prev_row(2) <= NOT prev_row(2);
ALT_INV_prev_row(3) <= NOT prev_row(3);
ALT_INV_col_index(0) <= NOT col_index(0);
\ALT_INV_NEXT_STATE.col0~q\ <= NOT \NEXT_STATE.col0~q\;
\ALT_INV_NEXT_STATE.col1~q\ <= NOT \NEXT_STATE.col1~q\;
\ALT_INV_NEXT_STATE.idle~q\ <= NOT \NEXT_STATE.idle~q\;
\ALT_INV_NEXT_STATE.col3~q\ <= NOT \NEXT_STATE.col3~q\;
ALT_INV_current_key(3) <= NOT current_key(3);
ALT_INV_current_key(2) <= NOT current_key(2);
ALT_INV_current_key(1) <= NOT current_key(1);
ALT_INV_current_key(0) <= NOT current_key(0);
\ALT_INV_CURRENT_STATE.col0~q\ <= NOT \CURRENT_STATE.col0~q\;
\ALT_INV_CURRENT_STATE.col1~q\ <= NOT \CURRENT_STATE.col1~q\;
\ALT_INV_CURRENT_STATE.col2~q\ <= NOT \CURRENT_STATE.col2~q\;
\ALT_INV_CURRENT_STATE.idle~q\ <= NOT \CURRENT_STATE.idle~q\;
\ALT_INV_CURRENT_STATE.col3~q\ <= NOT \CURRENT_STATE.col3~q\;
\ALT_INV_seg_out[6]~reg0_q\ <= NOT \seg_out[6]~reg0_q\;
\ALT_INV_seg_out[5]~reg0_q\ <= NOT \seg_out[5]~reg0_q\;
\ALT_INV_seg_out[4]~reg0_q\ <= NOT \seg_out[4]~reg0_q\;
\ALT_INV_seg_out[3]~reg0_q\ <= NOT \seg_out[3]~reg0_q\;
\ALT_INV_seg_out[2]~reg0_q\ <= NOT \seg_out[2]~reg0_q\;
\ALT_INV_seg_out[1]~reg0_q\ <= NOT \seg_out[1]~reg0_q\;

-- Location: IOOBUF_X66_Y0_N93
\column[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \column[0]~reg0_q\,
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
	i => \column[1]~reg0_q\,
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
	i => \column[2]~reg0_q\,
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
	i => \column[3]~reg0_q\,
	devoe => ww_devoe,
	o => ww_column(3));

-- Location: IOOBUF_X74_Y0_N76
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

-- Location: IOOBUF_X64_Y0_N53
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

-- Location: IOOBUF_X80_Y0_N36
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
	i => \ALT_INV_seg_out[3]~reg0_q\,
	devoe => ww_devoe,
	o => ww_seg_out(3));

-- Location: IOOBUF_X78_Y0_N53
\seg_out[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_seg_out[4]~reg0_q\,
	devoe => ww_devoe,
	o => ww_seg_out(4));

-- Location: IOOBUF_X64_Y0_N36
\seg_out[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_seg_out[5]~reg0_q\,
	devoe => ww_devoe,
	o => ww_seg_out(5));

-- Location: IOOBUF_X78_Y0_N36
\seg_out[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_seg_out[6]~reg0_q\,
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
	i => VCC,
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

-- Location: LABCELL_X75_Y1_N21
\NEXT_STATE.idle~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \NEXT_STATE.idle~1_combout\ = ( !\CURRENT_STATE.col3~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_CURRENT_STATE.col3~q\,
	combout => \NEXT_STATE.idle~1_combout\);

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

-- Location: FF_X75_Y1_N22
\NEXT_STATE.idle\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \NEXT_STATE.idle~1_combout\,
	ena => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \NEXT_STATE.idle~q\);

-- Location: LABCELL_X75_Y1_N24
\CURRENT_STATE.idle~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \CURRENT_STATE.idle~feeder_combout\ = ( \NEXT_STATE.idle~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_NEXT_STATE.idle~q\,
	combout => \CURRENT_STATE.idle~feeder_combout\);

-- Location: FF_X75_Y1_N26
\CURRENT_STATE.idle\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \CURRENT_STATE.idle~feeder_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CURRENT_STATE.idle~q\);

-- Location: LABCELL_X75_Y1_N42
\NEXT_STATE.col0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \NEXT_STATE.col0~1_combout\ = ( !\CURRENT_STATE.idle~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_CURRENT_STATE.idle~q\,
	combout => \NEXT_STATE.col0~1_combout\);

-- Location: FF_X75_Y1_N44
\NEXT_STATE.col0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \NEXT_STATE.col0~1_combout\,
	ena => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \NEXT_STATE.col0~q\);

-- Location: LABCELL_X75_Y1_N9
\CURRENT_STATE.col0~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \CURRENT_STATE.col0~feeder_combout\ = ( \NEXT_STATE.col0~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_NEXT_STATE.col0~q\,
	combout => \CURRENT_STATE.col0~feeder_combout\);

-- Location: FF_X75_Y1_N11
\CURRENT_STATE.col0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \CURRENT_STATE.col0~feeder_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CURRENT_STATE.col0~q\);

-- Location: LABCELL_X75_Y1_N48
\NEXT_STATE.col1~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \NEXT_STATE.col1~feeder_combout\ = ( \CURRENT_STATE.col0~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_CURRENT_STATE.col0~q\,
	combout => \NEXT_STATE.col1~feeder_combout\);

-- Location: FF_X75_Y1_N50
\NEXT_STATE.col1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \NEXT_STATE.col1~feeder_combout\,
	ena => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \NEXT_STATE.col1~q\);

-- Location: LABCELL_X75_Y1_N0
\CURRENT_STATE.col1~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \CURRENT_STATE.col1~feeder_combout\ = ( \NEXT_STATE.col1~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_NEXT_STATE.col1~q\,
	combout => \CURRENT_STATE.col1~feeder_combout\);

-- Location: FF_X75_Y1_N2
\CURRENT_STATE.col1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \CURRENT_STATE.col1~feeder_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CURRENT_STATE.col1~q\);

-- Location: FF_X75_Y1_N52
\NEXT_STATE.col2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \CURRENT_STATE.col1~q\,
	sload => VCC,
	ena => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \NEXT_STATE.col2~q\);

-- Location: FF_X75_Y1_N38
\CURRENT_STATE.col2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \NEXT_STATE.col2~q\,
	clrn => \reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CURRENT_STATE.col2~q\);

-- Location: FF_X75_Y1_N20
\NEXT_STATE.col3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \CURRENT_STATE.col2~q\,
	sload => VCC,
	ena => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \NEXT_STATE.col3~q\);

-- Location: LABCELL_X75_Y1_N27
\CURRENT_STATE.col3~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \CURRENT_STATE.col3~feeder_combout\ = ( \NEXT_STATE.col3~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_NEXT_STATE.col3~q\,
	combout => \CURRENT_STATE.col3~feeder_combout\);

-- Location: FF_X75_Y1_N29
\CURRENT_STATE.col3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \CURRENT_STATE.col3~feeder_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CURRENT_STATE.col3~q\);

-- Location: LABCELL_X75_Y1_N33
\column[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \column[0]~1_combout\ = ( !\CURRENT_STATE.col3~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_CURRENT_STATE.col3~q\,
	combout => \column[0]~1_combout\);

-- Location: LABCELL_X75_Y1_N36
\column[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \column[0]~0_combout\ = ( \CURRENT_STATE.idle~q\ & ( \reset~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_reset~input_o\,
	dataf => \ALT_INV_CURRENT_STATE.idle~q\,
	combout => \column[0]~0_combout\);

-- Location: FF_X75_Y1_N34
\column[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \column[0]~1_combout\,
	ena => \column[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \column[0]~reg0_q\);

-- Location: LABCELL_X75_Y1_N15
\column[1]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \column[1]~2_combout\ = ( !\CURRENT_STATE.col2~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_CURRENT_STATE.col2~q\,
	combout => \column[1]~2_combout\);

-- Location: FF_X75_Y1_N17
\column[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \column[1]~2_combout\,
	ena => \column[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \column[1]~reg0_q\);

-- Location: LABCELL_X75_Y1_N30
\column[2]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \column[2]~3_combout\ = !\CURRENT_STATE.col1~q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_CURRENT_STATE.col1~q\,
	combout => \column[2]~3_combout\);

-- Location: FF_X75_Y1_N31
\column[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \column[2]~3_combout\,
	ena => \column[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \column[2]~reg0_q\);

-- Location: LABCELL_X75_Y1_N12
\column[3]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \column[3]~4_combout\ = !\CURRENT_STATE.col0~q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011001100110011001100110011001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_CURRENT_STATE.col0~q\,
	combout => \column[3]~4_combout\);

-- Location: FF_X75_Y1_N13
\column[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \column[3]~4_combout\,
	ena => \column[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \column[3]~reg0_q\);

-- Location: LABCELL_X75_Y1_N57
\Selector4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector4~0_combout\ = ( col_index(1) & ( \CURRENT_STATE.idle~q\ & ( (\CURRENT_STATE.col1~q\) # (\CURRENT_STATE.col0~q\) ) ) ) # ( !col_index(1) & ( \CURRENT_STATE.idle~q\ & ( (\CURRENT_STATE.col1~q\) # (\CURRENT_STATE.col0~q\) ) ) ) # ( col_index(1) & ( 
-- !\CURRENT_STATE.idle~q\ ) ) # ( !col_index(1) & ( !\CURRENT_STATE.idle~q\ & ( (\CURRENT_STATE.col1~q\) # (\CURRENT_STATE.col0~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111111111111111111111111100001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_CURRENT_STATE.col0~q\,
	datad => \ALT_INV_CURRENT_STATE.col1~q\,
	datae => ALT_INV_col_index(1),
	dataf => \ALT_INV_CURRENT_STATE.idle~q\,
	combout => \Selector4~0_combout\);

-- Location: FF_X75_Y1_N59
\col_index[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector4~0_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => col_index(1));

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

-- Location: LABCELL_X74_Y1_N21
\prev_row[0]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \prev_row[0]~3_combout\ = ( !\row[0]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_row[0]~input_o\,
	combout => \prev_row[0]~3_combout\);

-- Location: FF_X74_Y1_N23
\prev_row[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \prev_row[0]~3_combout\,
	ena => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => prev_row(0));

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

-- Location: LABCELL_X74_Y1_N48
\Equal4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal4~0_combout\ = ( \row[0]~input_o\ & ( (\row[2]~input_o\ & (\row[1]~input_o\ & \row[3]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000001010000000000000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_row[2]~input_o\,
	datac => \ALT_INV_row[1]~input_o\,
	datad => \ALT_INV_row[3]~input_o\,
	dataf => \ALT_INV_row[0]~input_o\,
	combout => \Equal4~0_combout\);

-- Location: LABCELL_X74_Y1_N24
\prev_row[3]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \prev_row[3]~0_combout\ = ( !\row[3]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_row[3]~input_o\,
	combout => \prev_row[3]~0_combout\);

-- Location: FF_X74_Y1_N26
\prev_row[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \prev_row[3]~0_combout\,
	ena => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => prev_row(3));

-- Location: LABCELL_X74_Y1_N54
\prev_row[1]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \prev_row[1]~2_combout\ = !\row[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000011110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_row[1]~input_o\,
	combout => \prev_row[1]~2_combout\);

-- Location: FF_X74_Y1_N56
\prev_row[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \prev_row[1]~2_combout\,
	ena => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => prev_row(1));

-- Location: LABCELL_X74_Y1_N51
\prev_row[2]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \prev_row[2]~1_combout\ = !\row[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_row[2]~input_o\,
	combout => \prev_row[2]~1_combout\);

-- Location: FF_X74_Y1_N53
\prev_row[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \prev_row[2]~1_combout\,
	ena => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => prev_row(2));

-- Location: LABCELL_X74_Y1_N36
\process_0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \process_0~0_combout\ = ( !prev_row(1) & ( !prev_row(2) & ( (!prev_row(0) & (!\Equal4~0_combout\ & !prev_row(3))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000010000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_prev_row(0),
	datab => \ALT_INV_Equal4~0_combout\,
	datac => ALT_INV_prev_row(3),
	datae => ALT_INV_prev_row(1),
	dataf => ALT_INV_prev_row(2),
	combout => \process_0~0_combout\);

-- Location: FF_X74_Y1_N41
\current_key[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => col_index(1),
	clrn => \reset~input_o\,
	sload => VCC,
	ena => \process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => current_key(1));

-- Location: LABCELL_X73_Y1_N54
\row_index~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \row_index~2_combout\ = ( \row[2]~input_o\ & ( \row[0]~input_o\ & ( (!\row[1]~input_o\) # (\row[3]~input_o\) ) ) ) # ( !\row[2]~input_o\ & ( \row[0]~input_o\ & ( (!\row[1]~input_o\) # (!\row[3]~input_o\) ) ) ) # ( \row[2]~input_o\ & ( !\row[0]~input_o\ ) 
-- ) # ( !\row[2]~input_o\ & ( !\row[0]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111100111111001100111111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_row[1]~input_o\,
	datac => \ALT_INV_row[3]~input_o\,
	datae => \ALT_INV_row[2]~input_o\,
	dataf => \ALT_INV_row[0]~input_o\,
	combout => \row_index~2_combout\);

-- Location: LABCELL_X73_Y1_N3
\row_index[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \row_index[1]~1_combout\ = ( \row[3]~input_o\ & ( (!\row[0]~input_o\ & (\row[1]~input_o\ & \row[2]~input_o\)) # (\row[0]~input_o\ & (!\row[1]~input_o\ $ (!\row[2]~input_o\))) ) ) # ( !\row[3]~input_o\ & ( (\row[0]~input_o\ & (\row[1]~input_o\ & 
-- \row[2]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000000010000000100010110000101100001011000010110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_row[0]~input_o\,
	datab => \ALT_INV_row[1]~input_o\,
	datac => \ALT_INV_row[2]~input_o\,
	dataf => \ALT_INV_row[3]~input_o\,
	combout => \row_index[1]~1_combout\);

-- Location: FF_X73_Y1_N55
\row_index[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \row_index~2_combout\,
	clrn => \reset~input_o\,
	ena => \row_index[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => row_index(1));

-- Location: LABCELL_X74_Y1_N3
\current_key[3]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \current_key[3]~feeder_combout\ = ( row_index(1) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_row_index(1),
	combout => \current_key[3]~feeder_combout\);

-- Location: FF_X74_Y1_N5
\current_key[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \current_key[3]~feeder_combout\,
	clrn => \reset~input_o\,
	ena => \process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => current_key(3));

-- Location: LABCELL_X73_Y1_N0
\row_index~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \row_index~0_combout\ = ( \row[3]~input_o\ & ( (!\row[0]~input_o\) # ((!\row[2]~input_o\) # (\row[1]~input_o\)) ) ) # ( !\row[3]~input_o\ & ( (!\row[0]~input_o\) # ((!\row[1]~input_o\) # (!\row[2]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111101110111111111110111011111111101110111111111110111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_row[0]~input_o\,
	datab => \ALT_INV_row[1]~input_o\,
	datad => \ALT_INV_row[2]~input_o\,
	dataf => \ALT_INV_row[3]~input_o\,
	combout => \row_index~0_combout\);

-- Location: FF_X73_Y1_N1
\row_index[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \row_index~0_combout\,
	clrn => \reset~input_o\,
	ena => \row_index[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => row_index(0));

-- Location: LABCELL_X74_Y1_N0
\current_key[2]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \current_key[2]~feeder_combout\ = ( row_index(0) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_row_index(0),
	combout => \current_key[2]~feeder_combout\);

-- Location: FF_X74_Y1_N2
\current_key[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \current_key[2]~feeder_combout\,
	clrn => \reset~input_o\,
	ena => \process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => current_key(2));

-- Location: LABCELL_X75_Y1_N39
\Selector5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector5~0_combout\ = ( !\CURRENT_STATE.col2~q\ & ( (!\CURRENT_STATE.col0~q\ & ((col_index(0)) # (\CURRENT_STATE.idle~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000011110000010100001111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_CURRENT_STATE.idle~q\,
	datac => \ALT_INV_CURRENT_STATE.col0~q\,
	datad => ALT_INV_col_index(0),
	dataf => \ALT_INV_CURRENT_STATE.col2~q\,
	combout => \Selector5~0_combout\);

-- Location: FF_X75_Y1_N41
\col_index[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector5~0_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => col_index(0));

-- Location: FF_X74_Y1_N38
\current_key[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => col_index(0),
	clrn => \reset~input_o\,
	sload => VCC,
	ena => \process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => current_key(0));

-- Location: LABCELL_X74_Y1_N12
\Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = ( current_key(0) & ( (!current_key(2)) # (current_key(1)) ) ) # ( !current_key(0) & ( (!current_key(1) & ((current_key(2)) # (current_key(3)))) # (current_key(1) & (!current_key(3) $ (current_key(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011110011001111001111001100111111111111001100111111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_current_key(1),
	datac => ALT_INV_current_key(3),
	datad => ALT_INV_current_key(2),
	dataf => ALT_INV_current_key(0),
	combout => \Mux6~0_combout\);

-- Location: FF_X74_Y1_N13
\seg_out[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux6~0_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_out[0]~reg0_q\);

-- Location: LABCELL_X74_Y1_N30
\Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = ( current_key(0) & ( (current_key(2) & ((!current_key(1)) # (current_key(3)))) ) ) # ( !current_key(0) & ( (!current_key(3) & (current_key(1) & !current_key(2))) # (current_key(3) & ((current_key(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000001111001100000000111100000000110011110000000011001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_current_key(1),
	datac => ALT_INV_current_key(3),
	datad => ALT_INV_current_key(2),
	dataf => ALT_INV_current_key(0),
	combout => \Mux5~0_combout\);

-- Location: FF_X74_Y1_N31
\seg_out[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux5~0_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_out[1]~reg0_q\);

-- Location: LABCELL_X74_Y1_N9
\Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = ( current_key(0) & ( ((current_key(3) & !current_key(1))) # (current_key(2)) ) ) # ( !current_key(0) & ( (current_key(3) & (!current_key(1) & !current_key(2))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000000000000010100000000000001010000111111110101000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_current_key(3),
	datac => ALT_INV_current_key(1),
	datad => ALT_INV_current_key(2),
	dataf => ALT_INV_current_key(0),
	combout => \Mux4~0_combout\);

-- Location: FF_X74_Y1_N10
\seg_out[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux4~0_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_out[2]~reg0_q\);

-- Location: LABCELL_X74_Y1_N15
\Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = ( current_key(0) & ( !current_key(1) $ (((!current_key(3) & !current_key(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001011010111100000101101011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_current_key(3),
	datac => ALT_INV_current_key(1),
	datad => ALT_INV_current_key(2),
	dataf => ALT_INV_current_key(0),
	combout => \Mux3~0_combout\);

-- Location: FF_X74_Y1_N16
\seg_out[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux3~0_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_out[3]~reg0_q\);

-- Location: LABCELL_X74_Y1_N6
\Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = ( current_key(0) & ( (!current_key(3) & !current_key(2)) ) ) # ( !current_key(0) & ( (current_key(2) & (!current_key(1) $ (!current_key(3)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000111100000000000011110011110000000000001111000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_current_key(1),
	datac => ALT_INV_current_key(3),
	datad => ALT_INV_current_key(2),
	dataf => ALT_INV_current_key(0),
	combout => \Mux2~0_combout\);

-- Location: FF_X74_Y1_N7
\seg_out[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux2~0_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_out[4]~reg0_q\);

-- Location: LABCELL_X74_Y1_N33
\Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = ( current_key(0) & ( (!current_key(2) & ((!current_key(3)) # (current_key(1)))) ) ) # ( !current_key(0) & ( (!current_key(3) & (current_key(1) & current_key(2))) # (current_key(3) & ((!current_key(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100001010010101010000101010101111000000001010111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_current_key(3),
	datac => ALT_INV_current_key(1),
	datad => ALT_INV_current_key(2),
	dataf => ALT_INV_current_key(0),
	combout => \Mux1~0_combout\);

-- Location: FF_X74_Y1_N34
\seg_out[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux1~0_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_out[5]~reg0_q\);

-- Location: LABCELL_X74_Y1_N42
\Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = ( current_key(2) & ( current_key(0) & ( (current_key(3) & !current_key(1)) ) ) ) # ( !current_key(2) & ( current_key(0) & ( (current_key(3) & !current_key(1)) ) ) ) # ( !current_key(2) & ( !current_key(0) & ( (!current_key(3) & 
-- current_key(1)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000000000000000001111000000000000111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_current_key(3),
	datad => ALT_INV_current_key(1),
	datae => ALT_INV_current_key(2),
	dataf => ALT_INV_current_key(0),
	combout => \Mux0~0_combout\);

-- Location: FF_X74_Y1_N43
\seg_out[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux0~0_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_out[6]~reg0_q\);

-- Location: LABCELL_X74_Y1_N57
\Equal6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal6~0_combout\ = ( current_key(0) & ( (!current_key(3) & (!current_key(1) & !current_key(2))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010100000000000001010000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_current_key(3),
	datac => ALT_INV_current_key(1),
	datad => ALT_INV_current_key(2),
	dataf => ALT_INV_current_key(0),
	combout => \Equal6~0_combout\);

-- Location: FF_X74_Y1_N58
\led1_out~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Equal6~0_combout\,
	ena => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \led1_out~reg0_q\);

-- Location: LABCELL_X36_Y4_N3
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


