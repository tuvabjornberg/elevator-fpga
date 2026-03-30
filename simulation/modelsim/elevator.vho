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

-- DATE "03/30/2026 09:19:41"

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
	column : IN std_logic_vector(2 DOWNTO 0);
	seg_out : OUT std_logic_vector(6 DOWNTO 0);
	led_out : OUT std_logic
	);
END elevator;

-- Design Ports Information
-- seg_out[0]	=>  Location: PIN_AE17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_out[1]	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_out[2]	=>  Location: PIN_AK24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_out[3]	=>  Location: PIN_AD9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_out[4]	=>  Location: PIN_AB13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_out[5]	=>  Location: PIN_AF21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_out[6]	=>  Location: PIN_F13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led_out	=>  Location: PIN_AA25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- column[0]	=>  Location: PIN_AB23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- column[1]	=>  Location: PIN_AE28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- column[2]	=>  Location: PIN_AB22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- row[0]	=>  Location: PIN_AB26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- row[1]	=>  Location: PIN_AG28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- row[2]	=>  Location: PIN_AE27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- row[3]	=>  Location: PIN_AA24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_AB25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_AF28,	 I/O Standard: 2.5 V,	 Current Strength: Default


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
SIGNAL ww_column : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_seg_out : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_led_out : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \column[0]~input_o\ : std_logic;
SIGNAL \column[2]~input_o\ : std_logic;
SIGNAL \row[2]~input_o\ : std_logic;
SIGNAL \row[3]~input_o\ : std_logic;
SIGNAL \row[0]~input_o\ : std_logic;
SIGNAL \row[1]~input_o\ : std_logic;
SIGNAL \process_0~0_combout\ : std_logic;
SIGNAL \column[1]~input_o\ : std_logic;
SIGNAL \led_out~0_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \led_out~reg0_q\ : std_logic;
SIGNAL \ALT_INV_row[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_row[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_row[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_row[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_column[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_column[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_column[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_process_0~0_combout\ : std_logic;
SIGNAL \ALT_INV_led_out~reg0_q\ : std_logic;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_row <= row;
ww_column <= column;
seg_out <= ww_seg_out;
led_out <= ww_led_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_row[3]~input_o\ <= NOT \row[3]~input_o\;
\ALT_INV_row[2]~input_o\ <= NOT \row[2]~input_o\;
\ALT_INV_row[1]~input_o\ <= NOT \row[1]~input_o\;
\ALT_INV_row[0]~input_o\ <= NOT \row[0]~input_o\;
\ALT_INV_column[2]~input_o\ <= NOT \column[2]~input_o\;
\ALT_INV_column[1]~input_o\ <= NOT \column[1]~input_o\;
\ALT_INV_column[0]~input_o\ <= NOT \column[0]~input_o\;
\ALT_INV_process_0~0_combout\ <= NOT \process_0~0_combout\;
\ALT_INV_led_out~reg0_q\ <= NOT \led_out~reg0_q\;

-- Location: IOOBUF_X50_Y0_N42
\seg_out[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_seg_out(0));

-- Location: IOOBUF_X30_Y81_N53
\seg_out[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_seg_out(1));

-- Location: IOOBUF_X72_Y0_N53
\seg_out[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_seg_out(2));

-- Location: IOOBUF_X2_Y0_N76
\seg_out[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_seg_out(3));

-- Location: IOOBUF_X20_Y0_N19
\seg_out[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_seg_out(4));

-- Location: IOOBUF_X70_Y0_N19
\seg_out[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_seg_out(5));

-- Location: IOOBUF_X26_Y81_N42
\seg_out[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_seg_out(6));

-- Location: IOOBUF_X89_Y9_N39
\led_out~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \led_out~reg0_q\,
	devoe => ww_devoe,
	o => ww_led_out);

-- Location: IOIBUF_X89_Y11_N61
\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: IOIBUF_X89_Y9_N21
\column[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_column(0),
	o => \column[0]~input_o\);

-- Location: IOIBUF_X89_Y9_N4
\column[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_column(2),
	o => \column[2]~input_o\);

-- Location: IOIBUF_X89_Y11_N78
\row[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_row(2),
	o => \row[2]~input_o\);

-- Location: IOIBUF_X89_Y11_N44
\row[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_row(3),
	o => \row[3]~input_o\);

-- Location: IOIBUF_X89_Y9_N55
\row[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_row(0),
	o => \row[0]~input_o\);

-- Location: IOIBUF_X89_Y13_N38
\row[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_row(1),
	o => \row[1]~input_o\);

-- Location: LABCELL_X88_Y11_N12
\process_0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \process_0~0_combout\ = ( \row[0]~input_o\ & ( !\row[1]~input_o\ & ( (!\row[2]~input_o\ & !\row[3]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110000001100000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_row[2]~input_o\,
	datac => \ALT_INV_row[3]~input_o\,
	datae => \ALT_INV_row[0]~input_o\,
	dataf => \ALT_INV_row[1]~input_o\,
	combout => \process_0~0_combout\);

-- Location: IOIBUF_X89_Y11_N95
\column[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_column(1),
	o => \column[1]~input_o\);

-- Location: LABCELL_X88_Y11_N57
\led_out~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \led_out~0_combout\ = ( \column[1]~input_o\ & ( \led_out~reg0_q\ ) ) # ( !\column[1]~input_o\ & ( \led_out~reg0_q\ ) ) # ( \column[1]~input_o\ & ( !\led_out~reg0_q\ & ( (!\column[0]~input_o\ & (!\column[2]~input_o\ & \process_0~0_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000010000000100011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_column[0]~input_o\,
	datab => \ALT_INV_column[2]~input_o\,
	datac => \ALT_INV_process_0~0_combout\,
	datae => \ALT_INV_column[1]~input_o\,
	dataf => \ALT_INV_led_out~reg0_q\,
	combout => \led_out~0_combout\);

-- Location: IOIBUF_X89_Y13_N55
\reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: FF_X88_Y11_N17
\led_out~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \led_out~0_combout\,
	clrn => \reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \led_out~reg0_q\);

-- Location: LABCELL_X67_Y36_N0
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


