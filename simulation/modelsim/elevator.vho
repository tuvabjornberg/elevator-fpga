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

-- DATE "04/07/2026 16:51:41"

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
-- row[2]	=>  Location: PIN_AF23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- row[3]	=>  Location: PIN_AG22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- row[0]	=>  Location: PIN_AC22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- row[1]	=>  Location: PIN_AD21,	 I/O Standard: 2.5 V,	 Current Strength: Default


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
SIGNAL \NEXT_STATE.idle~0_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \Add0~81_sumout\ : std_logic;
SIGNAL \count[0]~0_combout\ : std_logic;
SIGNAL \Add0~82\ : std_logic;
SIGNAL \Add0~121_sumout\ : std_logic;
SIGNAL \count[1]~DUPLICATE_q\ : std_logic;
SIGNAL \Add0~122\ : std_logic;
SIGNAL \Add0~117_sumout\ : std_logic;
SIGNAL \count[2]~DUPLICATE_q\ : std_logic;
SIGNAL \Add0~118\ : std_logic;
SIGNAL \Add0~113_sumout\ : std_logic;
SIGNAL \count[3]~DUPLICATE_q\ : std_logic;
SIGNAL \Add0~114\ : std_logic;
SIGNAL \Add0~45_sumout\ : std_logic;
SIGNAL \Add0~46\ : std_logic;
SIGNAL \Add0~109_sumout\ : std_logic;
SIGNAL \Add0~110\ : std_logic;
SIGNAL \Add0~101_sumout\ : std_logic;
SIGNAL \count[6]~DUPLICATE_q\ : std_logic;
SIGNAL \Add0~102\ : std_logic;
SIGNAL \Add0~97_sumout\ : std_logic;
SIGNAL \count[7]~DUPLICATE_q\ : std_logic;
SIGNAL \Add0~98\ : std_logic;
SIGNAL \Add0~93_sumout\ : std_logic;
SIGNAL \count[8]~DUPLICATE_q\ : std_logic;
SIGNAL \Add0~94\ : std_logic;
SIGNAL \Add0~89_sumout\ : std_logic;
SIGNAL \count[9]~DUPLICATE_q\ : std_logic;
SIGNAL \Add0~90\ : std_logic;
SIGNAL \Add0~85_sumout\ : std_logic;
SIGNAL \Add0~86\ : std_logic;
SIGNAL \Add0~5_sumout\ : std_logic;
SIGNAL \Add0~6\ : std_logic;
SIGNAL \Add0~1_sumout\ : std_logic;
SIGNAL \Add0~2\ : std_logic;
SIGNAL \Add0~29_sumout\ : std_logic;
SIGNAL \Add0~30\ : std_logic;
SIGNAL \Add0~25_sumout\ : std_logic;
SIGNAL \Add0~26\ : std_logic;
SIGNAL \Add0~21_sumout\ : std_logic;
SIGNAL \Add0~22\ : std_logic;
SIGNAL \Add0~17_sumout\ : std_logic;
SIGNAL \Add0~18\ : std_logic;
SIGNAL \Add0~13_sumout\ : std_logic;
SIGNAL \Add0~14\ : std_logic;
SIGNAL \Add0~9_sumout\ : std_logic;
SIGNAL \Add0~10\ : std_logic;
SIGNAL \Add0~53_sumout\ : std_logic;
SIGNAL \Add0~54\ : std_logic;
SIGNAL \Add0~49_sumout\ : std_logic;
SIGNAL \Add0~50\ : std_logic;
SIGNAL \Add0~105_sumout\ : std_logic;
SIGNAL \Add0~106\ : std_logic;
SIGNAL \Add0~41_sumout\ : std_logic;
SIGNAL \Add0~42\ : std_logic;
SIGNAL \Add0~37_sumout\ : std_logic;
SIGNAL \Add0~38\ : std_logic;
SIGNAL \Add0~33_sumout\ : std_logic;
SIGNAL \Add0~34\ : std_logic;
SIGNAL \Add0~77_sumout\ : std_logic;
SIGNAL \Add0~78\ : std_logic;
SIGNAL \Add0~73_sumout\ : std_logic;
SIGNAL \Add0~74\ : std_logic;
SIGNAL \Add0~69_sumout\ : std_logic;
SIGNAL \Add0~70\ : std_logic;
SIGNAL \Add0~65_sumout\ : std_logic;
SIGNAL \Add0~66\ : std_logic;
SIGNAL \Add0~61_sumout\ : std_logic;
SIGNAL \Add0~62\ : std_logic;
SIGNAL \Add0~57_sumout\ : std_logic;
SIGNAL \Add0~58\ : std_logic;
SIGNAL \Add0~125_sumout\ : std_logic;
SIGNAL \Equal0~5_combout\ : std_logic;
SIGNAL \Equal0~3_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \count[19]~DUPLICATE_q\ : std_logic;
SIGNAL \count[4]~DUPLICATE_q\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Equal0~4_combout\ : std_logic;
SIGNAL \Equal0~6_combout\ : std_logic;
SIGNAL \prev_row[0]~0_combout\ : std_logic;
SIGNAL \NEXT_STATE.idle~q\ : std_logic;
SIGNAL \CURRENT_STATE.idle~q\ : std_logic;
SIGNAL \NEXT_STATE.col0~0_combout\ : std_logic;
SIGNAL \NEXT_STATE.col0~q\ : std_logic;
SIGNAL \CURRENT_STATE.col0~q\ : std_logic;
SIGNAL \NEXT_STATE.col1~q\ : std_logic;
SIGNAL \CURRENT_STATE.col1~q\ : std_logic;
SIGNAL \NEXT_STATE.col2~q\ : std_logic;
SIGNAL \CURRENT_STATE.col2~q\ : std_logic;
SIGNAL \NEXT_STATE.col3~q\ : std_logic;
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
SIGNAL \row[1]~input_o\ : std_logic;
SIGNAL \row[2]~input_o\ : std_logic;
SIGNAL \row[3]~input_o\ : std_logic;
SIGNAL \prev_row[1]~4_combout\ : std_logic;
SIGNAL \prev_row[2]~3_combout\ : std_logic;
SIGNAL \prev_row[0]~1_combout\ : std_logic;
SIGNAL \prev_row[3]~2_combout\ : std_logic;
SIGNAL \current_key[3]~0_combout\ : std_logic;
SIGNAL \current_key[3]~1_combout\ : std_logic;
SIGNAL \row_index~1_combout\ : std_logic;
SIGNAL \row_index~0_combout\ : std_logic;
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
SIGNAL count : std_logic_vector(31 DOWNTO 0);
SIGNAL current_key : std_logic_vector(3 DOWNTO 0);
SIGNAL col_index : std_logic_vector(1 DOWNTO 0);
SIGNAL prev_row : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_count[1]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_count[2]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_count[3]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_count[6]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_count[7]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_count[8]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_count[9]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_count[19]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_count[4]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_row[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_row[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_row[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_row[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_reset~input_o\ : std_logic;
SIGNAL ALT_INV_col_index : std_logic_vector(1 DOWNTO 0);
SIGNAL \ALT_INV_current_key[3]~0_combout\ : std_logic;
SIGNAL ALT_INV_prev_row : std_logic_vector(3 DOWNTO 0);
SIGNAL ALT_INV_current_key : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_CURRENT_STATE.col0~q\ : std_logic;
SIGNAL \ALT_INV_CURRENT_STATE.col1~q\ : std_logic;
SIGNAL \ALT_INV_CURRENT_STATE.col2~q\ : std_logic;
SIGNAL \ALT_INV_CURRENT_STATE.idle~q\ : std_logic;
SIGNAL \ALT_INV_Equal0~6_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~5_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~4_combout\ : std_logic;
SIGNAL ALT_INV_count : std_logic_vector(31 DOWNTO 0);
SIGNAL \ALT_INV_Equal0~3_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~2_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~1_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \ALT_INV_CURRENT_STATE.col3~q\ : std_logic;
SIGNAL \ALT_INV_seg_out[6]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_seg_out[5]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_seg_out[4]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_seg_out[3]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_seg_out[2]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_seg_out[1]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_Add0~81_sumout\ : std_logic;

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
\ALT_INV_count[1]~DUPLICATE_q\ <= NOT \count[1]~DUPLICATE_q\;
\ALT_INV_count[2]~DUPLICATE_q\ <= NOT \count[2]~DUPLICATE_q\;
\ALT_INV_count[3]~DUPLICATE_q\ <= NOT \count[3]~DUPLICATE_q\;
\ALT_INV_count[6]~DUPLICATE_q\ <= NOT \count[6]~DUPLICATE_q\;
\ALT_INV_count[7]~DUPLICATE_q\ <= NOT \count[7]~DUPLICATE_q\;
\ALT_INV_count[8]~DUPLICATE_q\ <= NOT \count[8]~DUPLICATE_q\;
\ALT_INV_count[9]~DUPLICATE_q\ <= NOT \count[9]~DUPLICATE_q\;
\ALT_INV_count[19]~DUPLICATE_q\ <= NOT \count[19]~DUPLICATE_q\;
\ALT_INV_count[4]~DUPLICATE_q\ <= NOT \count[4]~DUPLICATE_q\;
\ALT_INV_row[1]~input_o\ <= NOT \row[1]~input_o\;
\ALT_INV_row[0]~input_o\ <= NOT \row[0]~input_o\;
\ALT_INV_row[3]~input_o\ <= NOT \row[3]~input_o\;
\ALT_INV_row[2]~input_o\ <= NOT \row[2]~input_o\;
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;
ALT_INV_col_index(1) <= NOT col_index(1);
\ALT_INV_current_key[3]~0_combout\ <= NOT \current_key[3]~0_combout\;
ALT_INV_prev_row(1) <= NOT prev_row(1);
ALT_INV_prev_row(2) <= NOT prev_row(2);
ALT_INV_prev_row(3) <= NOT prev_row(3);
ALT_INV_prev_row(0) <= NOT prev_row(0);
ALT_INV_col_index(0) <= NOT col_index(0);
ALT_INV_current_key(3) <= NOT current_key(3);
ALT_INV_current_key(2) <= NOT current_key(2);
ALT_INV_current_key(1) <= NOT current_key(1);
ALT_INV_current_key(0) <= NOT current_key(0);
\ALT_INV_CURRENT_STATE.col0~q\ <= NOT \CURRENT_STATE.col0~q\;
\ALT_INV_CURRENT_STATE.col1~q\ <= NOT \CURRENT_STATE.col1~q\;
\ALT_INV_CURRENT_STATE.col2~q\ <= NOT \CURRENT_STATE.col2~q\;
\ALT_INV_CURRENT_STATE.idle~q\ <= NOT \CURRENT_STATE.idle~q\;
\ALT_INV_Equal0~6_combout\ <= NOT \Equal0~6_combout\;
\ALT_INV_Equal0~5_combout\ <= NOT \Equal0~5_combout\;
\ALT_INV_Equal0~4_combout\ <= NOT \Equal0~4_combout\;
ALT_INV_count(0) <= NOT count(0);
\ALT_INV_Equal0~3_combout\ <= NOT \Equal0~3_combout\;
\ALT_INV_Equal0~2_combout\ <= NOT \Equal0~2_combout\;
\ALT_INV_Equal0~1_combout\ <= NOT \Equal0~1_combout\;
\ALT_INV_Equal0~0_combout\ <= NOT \Equal0~0_combout\;
\ALT_INV_CURRENT_STATE.col3~q\ <= NOT \CURRENT_STATE.col3~q\;
\ALT_INV_seg_out[6]~reg0_q\ <= NOT \seg_out[6]~reg0_q\;
\ALT_INV_seg_out[5]~reg0_q\ <= NOT \seg_out[5]~reg0_q\;
\ALT_INV_seg_out[4]~reg0_q\ <= NOT \seg_out[4]~reg0_q\;
\ALT_INV_seg_out[3]~reg0_q\ <= NOT \seg_out[3]~reg0_q\;
\ALT_INV_seg_out[2]~reg0_q\ <= NOT \seg_out[2]~reg0_q\;
\ALT_INV_seg_out[1]~reg0_q\ <= NOT \seg_out[1]~reg0_q\;
\ALT_INV_Add0~81_sumout\ <= NOT \Add0~81_sumout\;
ALT_INV_count(31) <= NOT count(31);
ALT_INV_count(1) <= NOT count(1);
ALT_INV_count(2) <= NOT count(2);
ALT_INV_count(3) <= NOT count(3);
ALT_INV_count(5) <= NOT count(5);
ALT_INV_count(21) <= NOT count(21);
ALT_INV_count(6) <= NOT count(6);
ALT_INV_count(7) <= NOT count(7);
ALT_INV_count(8) <= NOT count(8);
ALT_INV_count(9) <= NOT count(9);
ALT_INV_count(10) <= NOT count(10);
ALT_INV_count(25) <= NOT count(25);
ALT_INV_count(26) <= NOT count(26);
ALT_INV_count(27) <= NOT count(27);
ALT_INV_count(28) <= NOT count(28);
ALT_INV_count(29) <= NOT count(29);
ALT_INV_count(30) <= NOT count(30);
ALT_INV_count(19) <= NOT count(19);
ALT_INV_count(20) <= NOT count(20);
ALT_INV_count(4) <= NOT count(4);
ALT_INV_count(22) <= NOT count(22);
ALT_INV_count(23) <= NOT count(23);
ALT_INV_count(24) <= NOT count(24);
ALT_INV_count(13) <= NOT count(13);
ALT_INV_count(14) <= NOT count(14);
ALT_INV_count(15) <= NOT count(15);
ALT_INV_count(16) <= NOT count(16);
ALT_INV_count(17) <= NOT count(17);
ALT_INV_count(18) <= NOT count(18);
ALT_INV_count(11) <= NOT count(11);
ALT_INV_count(12) <= NOT count(12);

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

-- Location: MLABCELL_X72_Y2_N48
\NEXT_STATE.idle~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \NEXT_STATE.idle~0_combout\ = ( !\CURRENT_STATE.col3~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \ALT_INV_CURRENT_STATE.col3~q\,
	combout => \NEXT_STATE.idle~0_combout\);

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

-- Location: LABCELL_X74_Y3_N0
\Add0~81\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~81_sumout\ = SUM(( !count(0) ) + ( VCC ) + ( !VCC ))
-- \Add0~82\ = CARRY(( !count(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count(0),
	cin => GND,
	sumout => \Add0~81_sumout\,
	cout => \Add0~82\);

-- Location: LABCELL_X75_Y3_N21
\count[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \count[0]~0_combout\ = ( !\Add0~81_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add0~81_sumout\,
	combout => \count[0]~0_combout\);

-- Location: FF_X75_Y3_N23
\count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \count[0]~0_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(0));

-- Location: LABCELL_X74_Y3_N3
\Add0~121\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~121_sumout\ = SUM(( \count[1]~DUPLICATE_q\ ) + ( GND ) + ( \Add0~82\ ))
-- \Add0~122\ = CARRY(( \count[1]~DUPLICATE_q\ ) + ( GND ) + ( \Add0~82\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_count[1]~DUPLICATE_q\,
	cin => \Add0~82\,
	sumout => \Add0~121_sumout\,
	cout => \Add0~122\);

-- Location: FF_X74_Y3_N5
\count[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~121_sumout\,
	clrn => \reset~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count[1]~DUPLICATE_q\);

-- Location: LABCELL_X74_Y3_N6
\Add0~117\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~117_sumout\ = SUM(( \count[2]~DUPLICATE_q\ ) + ( GND ) + ( \Add0~122\ ))
-- \Add0~118\ = CARRY(( \count[2]~DUPLICATE_q\ ) + ( GND ) + ( \Add0~122\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_count[2]~DUPLICATE_q\,
	cin => \Add0~122\,
	sumout => \Add0~117_sumout\,
	cout => \Add0~118\);

-- Location: FF_X74_Y3_N7
\count[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~117_sumout\,
	clrn => \reset~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count[2]~DUPLICATE_q\);

-- Location: LABCELL_X74_Y3_N9
\Add0~113\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~113_sumout\ = SUM(( \count[3]~DUPLICATE_q\ ) + ( GND ) + ( \Add0~118\ ))
-- \Add0~114\ = CARRY(( \count[3]~DUPLICATE_q\ ) + ( GND ) + ( \Add0~118\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_count[3]~DUPLICATE_q\,
	cin => \Add0~118\,
	sumout => \Add0~113_sumout\,
	cout => \Add0~114\);

-- Location: FF_X74_Y3_N11
\count[3]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~113_sumout\,
	clrn => \reset~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count[3]~DUPLICATE_q\);

-- Location: LABCELL_X74_Y3_N12
\Add0~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~45_sumout\ = SUM(( count(4) ) + ( GND ) + ( \Add0~114\ ))
-- \Add0~46\ = CARRY(( count(4) ) + ( GND ) + ( \Add0~114\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_count(4),
	cin => \Add0~114\,
	sumout => \Add0~45_sumout\,
	cout => \Add0~46\);

-- Location: FF_X74_Y3_N14
\count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~45_sumout\,
	clrn => \reset~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(4));

-- Location: LABCELL_X74_Y3_N15
\Add0~109\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~109_sumout\ = SUM(( count(5) ) + ( GND ) + ( \Add0~46\ ))
-- \Add0~110\ = CARRY(( count(5) ) + ( GND ) + ( \Add0~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_count(5),
	cin => \Add0~46\,
	sumout => \Add0~109_sumout\,
	cout => \Add0~110\);

-- Location: FF_X74_Y3_N17
\count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~109_sumout\,
	clrn => \reset~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(5));

-- Location: LABCELL_X74_Y3_N18
\Add0~101\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~101_sumout\ = SUM(( \count[6]~DUPLICATE_q\ ) + ( GND ) + ( \Add0~110\ ))
-- \Add0~102\ = CARRY(( \count[6]~DUPLICATE_q\ ) + ( GND ) + ( \Add0~110\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_count[6]~DUPLICATE_q\,
	cin => \Add0~110\,
	sumout => \Add0~101_sumout\,
	cout => \Add0~102\);

-- Location: FF_X74_Y3_N20
\count[6]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~101_sumout\,
	clrn => \reset~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count[6]~DUPLICATE_q\);

-- Location: LABCELL_X74_Y3_N21
\Add0~97\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~97_sumout\ = SUM(( \count[7]~DUPLICATE_q\ ) + ( GND ) + ( \Add0~102\ ))
-- \Add0~98\ = CARRY(( \count[7]~DUPLICATE_q\ ) + ( GND ) + ( \Add0~102\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_count[7]~DUPLICATE_q\,
	cin => \Add0~102\,
	sumout => \Add0~97_sumout\,
	cout => \Add0~98\);

-- Location: FF_X74_Y3_N23
\count[7]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~97_sumout\,
	clrn => \reset~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count[7]~DUPLICATE_q\);

-- Location: LABCELL_X74_Y3_N24
\Add0~93\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~93_sumout\ = SUM(( \count[8]~DUPLICATE_q\ ) + ( GND ) + ( \Add0~98\ ))
-- \Add0~94\ = CARRY(( \count[8]~DUPLICATE_q\ ) + ( GND ) + ( \Add0~98\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_count[8]~DUPLICATE_q\,
	cin => \Add0~98\,
	sumout => \Add0~93_sumout\,
	cout => \Add0~94\);

-- Location: FF_X74_Y3_N26
\count[8]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~93_sumout\,
	clrn => \reset~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count[8]~DUPLICATE_q\);

-- Location: LABCELL_X74_Y3_N27
\Add0~89\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~89_sumout\ = SUM(( \count[9]~DUPLICATE_q\ ) + ( GND ) + ( \Add0~94\ ))
-- \Add0~90\ = CARRY(( \count[9]~DUPLICATE_q\ ) + ( GND ) + ( \Add0~94\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_count[9]~DUPLICATE_q\,
	cin => \Add0~94\,
	sumout => \Add0~89_sumout\,
	cout => \Add0~90\);

-- Location: FF_X74_Y3_N29
\count[9]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~89_sumout\,
	clrn => \reset~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count[9]~DUPLICATE_q\);

-- Location: LABCELL_X74_Y3_N30
\Add0~85\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~85_sumout\ = SUM(( count(10) ) + ( GND ) + ( \Add0~90\ ))
-- \Add0~86\ = CARRY(( count(10) ) + ( GND ) + ( \Add0~90\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_count(10),
	cin => \Add0~90\,
	sumout => \Add0~85_sumout\,
	cout => \Add0~86\);

-- Location: FF_X74_Y3_N31
\count[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~85_sumout\,
	clrn => \reset~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(10));

-- Location: LABCELL_X74_Y3_N33
\Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~5_sumout\ = SUM(( count(11) ) + ( GND ) + ( \Add0~86\ ))
-- \Add0~6\ = CARRY(( count(11) ) + ( GND ) + ( \Add0~86\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_count(11),
	cin => \Add0~86\,
	sumout => \Add0~5_sumout\,
	cout => \Add0~6\);

-- Location: FF_X74_Y3_N35
\count[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~5_sumout\,
	clrn => \reset~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(11));

-- Location: LABCELL_X74_Y3_N36
\Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~1_sumout\ = SUM(( count(12) ) + ( GND ) + ( \Add0~6\ ))
-- \Add0~2\ = CARRY(( count(12) ) + ( GND ) + ( \Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count(12),
	cin => \Add0~6\,
	sumout => \Add0~1_sumout\,
	cout => \Add0~2\);

-- Location: FF_X74_Y3_N38
\count[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~1_sumout\,
	clrn => \reset~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(12));

-- Location: LABCELL_X74_Y3_N39
\Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~29_sumout\ = SUM(( count(13) ) + ( GND ) + ( \Add0~2\ ))
-- \Add0~30\ = CARRY(( count(13) ) + ( GND ) + ( \Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_count(13),
	cin => \Add0~2\,
	sumout => \Add0~29_sumout\,
	cout => \Add0~30\);

-- Location: FF_X74_Y3_N41
\count[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~29_sumout\,
	clrn => \reset~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(13));

-- Location: LABCELL_X74_Y3_N42
\Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~25_sumout\ = SUM(( count(14) ) + ( GND ) + ( \Add0~30\ ))
-- \Add0~26\ = CARRY(( count(14) ) + ( GND ) + ( \Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_count(14),
	cin => \Add0~30\,
	sumout => \Add0~25_sumout\,
	cout => \Add0~26\);

-- Location: FF_X74_Y3_N44
\count[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~25_sumout\,
	clrn => \reset~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(14));

-- Location: LABCELL_X74_Y3_N45
\Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~21_sumout\ = SUM(( count(15) ) + ( GND ) + ( \Add0~26\ ))
-- \Add0~22\ = CARRY(( count(15) ) + ( GND ) + ( \Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_count(15),
	cin => \Add0~26\,
	sumout => \Add0~21_sumout\,
	cout => \Add0~22\);

-- Location: FF_X74_Y3_N47
\count[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~21_sumout\,
	clrn => \reset~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(15));

-- Location: LABCELL_X74_Y3_N48
\Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~17_sumout\ = SUM(( count(16) ) + ( GND ) + ( \Add0~22\ ))
-- \Add0~18\ = CARRY(( count(16) ) + ( GND ) + ( \Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_count(16),
	cin => \Add0~22\,
	sumout => \Add0~17_sumout\,
	cout => \Add0~18\);

-- Location: FF_X74_Y3_N50
\count[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~17_sumout\,
	clrn => \reset~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(16));

-- Location: LABCELL_X74_Y3_N51
\Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~13_sumout\ = SUM(( count(17) ) + ( GND ) + ( \Add0~18\ ))
-- \Add0~14\ = CARRY(( count(17) ) + ( GND ) + ( \Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_count(17),
	cin => \Add0~18\,
	sumout => \Add0~13_sumout\,
	cout => \Add0~14\);

-- Location: FF_X74_Y3_N53
\count[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~13_sumout\,
	clrn => \reset~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(17));

-- Location: LABCELL_X74_Y3_N54
\Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~9_sumout\ = SUM(( count(18) ) + ( GND ) + ( \Add0~14\ ))
-- \Add0~10\ = CARRY(( count(18) ) + ( GND ) + ( \Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_count(18),
	cin => \Add0~14\,
	sumout => \Add0~9_sumout\,
	cout => \Add0~10\);

-- Location: FF_X74_Y3_N56
\count[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~9_sumout\,
	clrn => \reset~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(18));

-- Location: LABCELL_X74_Y3_N57
\Add0~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~53_sumout\ = SUM(( count(19) ) + ( GND ) + ( \Add0~10\ ))
-- \Add0~54\ = CARRY(( count(19) ) + ( GND ) + ( \Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_count(19),
	cin => \Add0~10\,
	sumout => \Add0~53_sumout\,
	cout => \Add0~54\);

-- Location: FF_X74_Y3_N59
\count[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~53_sumout\,
	clrn => \reset~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(19));

-- Location: LABCELL_X74_Y2_N0
\Add0~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~49_sumout\ = SUM(( count(20) ) + ( GND ) + ( \Add0~54\ ))
-- \Add0~50\ = CARRY(( count(20) ) + ( GND ) + ( \Add0~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_count(20),
	cin => \Add0~54\,
	sumout => \Add0~49_sumout\,
	cout => \Add0~50\);

-- Location: FF_X74_Y2_N2
\count[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~49_sumout\,
	clrn => \reset~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(20));

-- Location: LABCELL_X74_Y2_N3
\Add0~105\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~105_sumout\ = SUM(( count(21) ) + ( GND ) + ( \Add0~50\ ))
-- \Add0~106\ = CARRY(( count(21) ) + ( GND ) + ( \Add0~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count(21),
	cin => \Add0~50\,
	sumout => \Add0~105_sumout\,
	cout => \Add0~106\);

-- Location: FF_X74_Y2_N5
\count[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~105_sumout\,
	clrn => \reset~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(21));

-- Location: LABCELL_X74_Y2_N6
\Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~41_sumout\ = SUM(( count(22) ) + ( GND ) + ( \Add0~106\ ))
-- \Add0~42\ = CARRY(( count(22) ) + ( GND ) + ( \Add0~106\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_count(22),
	cin => \Add0~106\,
	sumout => \Add0~41_sumout\,
	cout => \Add0~42\);

-- Location: FF_X74_Y2_N8
\count[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~41_sumout\,
	clrn => \reset~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(22));

-- Location: LABCELL_X74_Y2_N9
\Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~37_sumout\ = SUM(( count(23) ) + ( GND ) + ( \Add0~42\ ))
-- \Add0~38\ = CARRY(( count(23) ) + ( GND ) + ( \Add0~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_count(23),
	cin => \Add0~42\,
	sumout => \Add0~37_sumout\,
	cout => \Add0~38\);

-- Location: FF_X74_Y2_N11
\count[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~37_sumout\,
	clrn => \reset~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(23));

-- Location: LABCELL_X74_Y2_N12
\Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~33_sumout\ = SUM(( count(24) ) + ( GND ) + ( \Add0~38\ ))
-- \Add0~34\ = CARRY(( count(24) ) + ( GND ) + ( \Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_count(24),
	cin => \Add0~38\,
	sumout => \Add0~33_sumout\,
	cout => \Add0~34\);

-- Location: FF_X74_Y2_N14
\count[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~33_sumout\,
	clrn => \reset~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(24));

-- Location: LABCELL_X74_Y2_N15
\Add0~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~77_sumout\ = SUM(( count(25) ) + ( GND ) + ( \Add0~34\ ))
-- \Add0~78\ = CARRY(( count(25) ) + ( GND ) + ( \Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_count(25),
	cin => \Add0~34\,
	sumout => \Add0~77_sumout\,
	cout => \Add0~78\);

-- Location: FF_X74_Y2_N16
\count[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~77_sumout\,
	clrn => \reset~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(25));

-- Location: LABCELL_X74_Y2_N18
\Add0~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~73_sumout\ = SUM(( count(26) ) + ( GND ) + ( \Add0~78\ ))
-- \Add0~74\ = CARRY(( count(26) ) + ( GND ) + ( \Add0~78\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_count(26),
	cin => \Add0~78\,
	sumout => \Add0~73_sumout\,
	cout => \Add0~74\);

-- Location: FF_X74_Y2_N20
\count[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~73_sumout\,
	clrn => \reset~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(26));

-- Location: LABCELL_X74_Y2_N21
\Add0~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~69_sumout\ = SUM(( count(27) ) + ( GND ) + ( \Add0~74\ ))
-- \Add0~70\ = CARRY(( count(27) ) + ( GND ) + ( \Add0~74\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count(27),
	cin => \Add0~74\,
	sumout => \Add0~69_sumout\,
	cout => \Add0~70\);

-- Location: FF_X74_Y2_N23
\count[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~69_sumout\,
	clrn => \reset~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(27));

-- Location: LABCELL_X74_Y2_N24
\Add0~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~65_sumout\ = SUM(( count(28) ) + ( GND ) + ( \Add0~70\ ))
-- \Add0~66\ = CARRY(( count(28) ) + ( GND ) + ( \Add0~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_count(28),
	cin => \Add0~70\,
	sumout => \Add0~65_sumout\,
	cout => \Add0~66\);

-- Location: FF_X74_Y2_N26
\count[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~65_sumout\,
	clrn => \reset~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(28));

-- Location: LABCELL_X74_Y2_N27
\Add0~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~61_sumout\ = SUM(( count(29) ) + ( GND ) + ( \Add0~66\ ))
-- \Add0~62\ = CARRY(( count(29) ) + ( GND ) + ( \Add0~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count(29),
	cin => \Add0~66\,
	sumout => \Add0~61_sumout\,
	cout => \Add0~62\);

-- Location: FF_X74_Y2_N29
\count[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~61_sumout\,
	clrn => \reset~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(29));

-- Location: LABCELL_X74_Y2_N30
\Add0~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~57_sumout\ = SUM(( count(30) ) + ( GND ) + ( \Add0~62\ ))
-- \Add0~58\ = CARRY(( count(30) ) + ( GND ) + ( \Add0~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_count(30),
	cin => \Add0~62\,
	sumout => \Add0~57_sumout\,
	cout => \Add0~58\);

-- Location: FF_X74_Y2_N32
\count[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~57_sumout\,
	clrn => \reset~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(30));

-- Location: LABCELL_X74_Y2_N33
\Add0~125\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~125_sumout\ = SUM(( count(31) ) + ( GND ) + ( \Add0~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_count(31),
	cin => \Add0~58\,
	sumout => \Add0~125_sumout\);

-- Location: FF_X74_Y2_N35
\count[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~125_sumout\,
	clrn => \reset~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(31));

-- Location: FF_X74_Y3_N4
\count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~121_sumout\,
	clrn => \reset~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(1));

-- Location: FF_X74_Y3_N10
\count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~113_sumout\,
	clrn => \reset~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(3));

-- Location: FF_X74_Y3_N8
\count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~117_sumout\,
	clrn => \reset~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(2));

-- Location: LABCELL_X74_Y2_N36
\Equal0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~5_combout\ = ( !count(2) & ( count(5) & ( (!count(31) & (!count(1) & (!count(21) & count(3)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000100000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_count(31),
	datab => ALT_INV_count(1),
	datac => ALT_INV_count(21),
	datad => ALT_INV_count(3),
	datae => ALT_INV_count(2),
	dataf => ALT_INV_count(5),
	combout => \Equal0~5_combout\);

-- Location: LABCELL_X74_Y2_N54
\Equal0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~3_combout\ = ( !count(29) & ( !count(28) & ( (!count(26) & (!count(25) & (!count(27) & !count(30)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_count(26),
	datab => ALT_INV_count(25),
	datac => ALT_INV_count(27),
	datad => ALT_INV_count(30),
	datae => ALT_INV_count(29),
	dataf => ALT_INV_count(28),
	combout => \Equal0~3_combout\);

-- Location: LABCELL_X73_Y3_N42
\Equal0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = ( !count(18) & ( count(13) & ( (!count(15) & (count(14) & (!count(17) & !count(16)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000100000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_count(15),
	datab => ALT_INV_count(14),
	datac => ALT_INV_count(17),
	datad => ALT_INV_count(16),
	datae => ALT_INV_count(18),
	dataf => ALT_INV_count(13),
	combout => \Equal0~1_combout\);

-- Location: FF_X74_Y3_N58
\count[19]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~53_sumout\,
	clrn => \reset~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count[19]~DUPLICATE_q\);

-- Location: FF_X74_Y3_N13
\count[4]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~45_sumout\,
	clrn => \reset~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count[4]~DUPLICATE_q\);

-- Location: LABCELL_X74_Y2_N48
\Equal0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = ( !\count[4]~DUPLICATE_q\ & ( !count(23) & ( (!count(20) & (!count(24) & (!\count[19]~DUPLICATE_q\ & !count(22)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_count(20),
	datab => ALT_INV_count(24),
	datac => \ALT_INV_count[19]~DUPLICATE_q\,
	datad => ALT_INV_count(22),
	datae => \ALT_INV_count[4]~DUPLICATE_q\,
	dataf => ALT_INV_count(23),
	combout => \Equal0~2_combout\);

-- Location: LABCELL_X73_Y3_N3
\Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = ( !count(12) & ( !count(11) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => ALT_INV_count(12),
	dataf => ALT_INV_count(11),
	combout => \Equal0~0_combout\);

-- Location: FF_X74_Y3_N25
\count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~93_sumout\,
	clrn => \reset~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(8));

-- Location: FF_X74_Y3_N19
\count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~101_sumout\,
	clrn => \reset~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(6));

-- Location: FF_X74_Y3_N22
\count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~97_sumout\,
	clrn => \reset~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(7));

-- Location: FF_X74_Y3_N28
\count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~89_sumout\,
	clrn => \reset~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(9));

-- Location: LABCELL_X75_Y3_N3
\Equal0~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~4_combout\ = ( !count(9) & ( !count(10) & ( (count(0) & (count(8) & (!count(6) & count(7)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_count(0),
	datab => ALT_INV_count(8),
	datac => ALT_INV_count(6),
	datad => ALT_INV_count(7),
	datae => ALT_INV_count(9),
	dataf => ALT_INV_count(10),
	combout => \Equal0~4_combout\);

-- Location: LABCELL_X74_Y2_N45
\Equal0~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~6_combout\ = ( \Equal0~0_combout\ & ( \Equal0~4_combout\ & ( (\Equal0~5_combout\ & (\Equal0~3_combout\ & (\Equal0~1_combout\ & \Equal0~2_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Equal0~5_combout\,
	datab => \ALT_INV_Equal0~3_combout\,
	datac => \ALT_INV_Equal0~1_combout\,
	datad => \ALT_INV_Equal0~2_combout\,
	datae => \ALT_INV_Equal0~0_combout\,
	dataf => \ALT_INV_Equal0~4_combout\,
	combout => \Equal0~6_combout\);

-- Location: LABCELL_X73_Y2_N21
\prev_row[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \prev_row[0]~0_combout\ = ( \Equal0~6_combout\ & ( \reset~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_reset~input_o\,
	dataf => \ALT_INV_Equal0~6_combout\,
	combout => \prev_row[0]~0_combout\);

-- Location: FF_X72_Y2_N49
\NEXT_STATE.idle\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \NEXT_STATE.idle~0_combout\,
	ena => \prev_row[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \NEXT_STATE.idle~q\);

-- Location: FF_X73_Y2_N17
\CURRENT_STATE.idle\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \NEXT_STATE.idle~q\,
	clrn => \reset~input_o\,
	sload => VCC,
	ena => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CURRENT_STATE.idle~q\);

-- Location: MLABCELL_X72_Y2_N12
\NEXT_STATE.col0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \NEXT_STATE.col0~0_combout\ = ( !\CURRENT_STATE.idle~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_CURRENT_STATE.idle~q\,
	combout => \NEXT_STATE.col0~0_combout\);

-- Location: FF_X72_Y2_N13
\NEXT_STATE.col0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \NEXT_STATE.col0~0_combout\,
	ena => \prev_row[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \NEXT_STATE.col0~q\);

-- Location: FF_X73_Y2_N44
\CURRENT_STATE.col0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \NEXT_STATE.col0~q\,
	clrn => \reset~input_o\,
	sload => VCC,
	ena => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CURRENT_STATE.col0~q\);

-- Location: FF_X72_Y2_N7
\NEXT_STATE.col1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \CURRENT_STATE.col0~q\,
	sload => VCC,
	ena => \prev_row[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \NEXT_STATE.col1~q\);

-- Location: FF_X73_Y2_N2
\CURRENT_STATE.col1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \NEXT_STATE.col1~q\,
	clrn => \reset~input_o\,
	sload => VCC,
	ena => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CURRENT_STATE.col1~q\);

-- Location: FF_X73_Y2_N20
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
	ena => \prev_row[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \NEXT_STATE.col2~q\);

-- Location: FF_X73_Y2_N47
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
	ena => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CURRENT_STATE.col2~q\);

-- Location: FF_X73_Y2_N22
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
	ena => \prev_row[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \NEXT_STATE.col3~q\);

-- Location: FF_X74_Y2_N47
\CURRENT_STATE.col3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \NEXT_STATE.col3~q\,
	clrn => \reset~input_o\,
	sload => VCC,
	ena => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CURRENT_STATE.col3~q\);

-- Location: LABCELL_X75_Y2_N39
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

-- Location: LABCELL_X75_Y2_N24
\column[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \column[0]~0_combout\ = ( \Equal0~6_combout\ & ( (\reset~input_o\ & \CURRENT_STATE.idle~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000011000000110000001100000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_reset~input_o\,
	datac => \ALT_INV_CURRENT_STATE.idle~q\,
	dataf => \ALT_INV_Equal0~6_combout\,
	combout => \column[0]~0_combout\);

-- Location: FF_X75_Y2_N40
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

-- Location: LABCELL_X75_Y2_N33
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

-- Location: FF_X75_Y2_N34
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

-- Location: LABCELL_X75_Y2_N30
\column[2]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \column[2]~3_combout\ = ( !\CURRENT_STATE.col1~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_CURRENT_STATE.col1~q\,
	combout => \column[2]~3_combout\);

-- Location: FF_X75_Y2_N31
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

-- Location: LABCELL_X75_Y2_N36
\column[3]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \column[3]~4_combout\ = ( !\CURRENT_STATE.col0~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_CURRENT_STATE.col0~q\,
	combout => \column[3]~4_combout\);

-- Location: FF_X75_Y2_N37
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

-- Location: LABCELL_X75_Y2_N15
\Selector4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector4~0_combout\ = ( col_index(1) & ( \CURRENT_STATE.col0~q\ ) ) # ( !col_index(1) & ( \CURRENT_STATE.col0~q\ ) ) # ( col_index(1) & ( !\CURRENT_STATE.col0~q\ & ( (!\CURRENT_STATE.idle~q\) # (\CURRENT_STATE.col1~q\) ) ) ) # ( !col_index(1) & ( 
-- !\CURRENT_STATE.col0~q\ & ( \CURRENT_STATE.col1~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111101011111010111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_CURRENT_STATE.idle~q\,
	datac => \ALT_INV_CURRENT_STATE.col1~q\,
	datae => ALT_INV_col_index(1),
	dataf => \ALT_INV_CURRENT_STATE.col0~q\,
	combout => \Selector4~0_combout\);

-- Location: FF_X75_Y2_N17
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
	ena => \Equal0~6_combout\,
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

-- Location: LABCELL_X73_Y2_N9
\prev_row[1]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \prev_row[1]~4_combout\ = ( !\row[1]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_row[1]~input_o\,
	combout => \prev_row[1]~4_combout\);

-- Location: FF_X73_Y2_N10
\prev_row[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \prev_row[1]~4_combout\,
	ena => \prev_row[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => prev_row(1));

-- Location: LABCELL_X73_Y2_N6
\prev_row[2]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \prev_row[2]~3_combout\ = !\row[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011001100110011001100110011001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_row[2]~input_o\,
	combout => \prev_row[2]~3_combout\);

-- Location: FF_X73_Y2_N8
\prev_row[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \prev_row[2]~3_combout\,
	ena => \prev_row[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => prev_row(2));

-- Location: LABCELL_X73_Y2_N48
\prev_row[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \prev_row[0]~1_combout\ = !\row[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000011110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_row[0]~input_o\,
	combout => \prev_row[0]~1_combout\);

-- Location: FF_X73_Y2_N49
\prev_row[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \prev_row[0]~1_combout\,
	ena => \prev_row[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => prev_row(0));

-- Location: LABCELL_X73_Y2_N39
\prev_row[3]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \prev_row[3]~2_combout\ = ( !\row[3]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_row[3]~input_o\,
	combout => \prev_row[3]~2_combout\);

-- Location: FF_X73_Y2_N53
\prev_row[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \prev_row[3]~2_combout\,
	sload => VCC,
	ena => \prev_row[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => prev_row(3));

-- Location: LABCELL_X73_Y2_N27
\current_key[3]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \current_key[3]~0_combout\ = ( !prev_row(3) & ( (!prev_row(1) & (!prev_row(2) & !prev_row(0))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000000000000101000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_prev_row(1),
	datac => ALT_INV_prev_row(2),
	datad => ALT_INV_prev_row(0),
	dataf => ALT_INV_prev_row(3),
	combout => \current_key[3]~0_combout\);

-- Location: LABCELL_X73_Y2_N3
\current_key[3]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \current_key[3]~1_combout\ = ( \current_key[3]~0_combout\ & ( \Equal0~6_combout\ & ( (!\row[0]~input_o\) # ((!\row[1]~input_o\) # ((!\row[2]~input_o\) # (!\row[3]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_row[0]~input_o\,
	datab => \ALT_INV_row[1]~input_o\,
	datac => \ALT_INV_row[2]~input_o\,
	datad => \ALT_INV_row[3]~input_o\,
	datae => \ALT_INV_current_key[3]~0_combout\,
	dataf => \ALT_INV_Equal0~6_combout\,
	combout => \current_key[3]~1_combout\);

-- Location: FF_X74_Y2_N53
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
	ena => \current_key[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => current_key(1));

-- Location: MLABCELL_X72_Y2_N33
\row_index~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \row_index~1_combout\ = ( \row[2]~input_o\ & ( \row[0]~input_o\ & ( (!\row[1]~input_o\) # (\row[3]~input_o\) ) ) ) # ( !\row[2]~input_o\ & ( \row[0]~input_o\ & ( (!\row[1]~input_o\) # (!\row[3]~input_o\) ) ) ) # ( \row[2]~input_o\ & ( !\row[0]~input_o\ ) 
-- ) # ( !\row[2]~input_o\ & ( !\row[0]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111101010101010101011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_row[1]~input_o\,
	datad => \ALT_INV_row[3]~input_o\,
	datae => \ALT_INV_row[2]~input_o\,
	dataf => \ALT_INV_row[0]~input_o\,
	combout => \row_index~1_combout\);

-- Location: FF_X72_Y2_N35
\current_key[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \row_index~1_combout\,
	clrn => \reset~input_o\,
	ena => \current_key[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => current_key(3));

-- Location: MLABCELL_X72_Y2_N36
\row_index~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \row_index~0_combout\ = ( \row[2]~input_o\ & ( \row[0]~input_o\ & ( !\row[1]~input_o\ $ (\row[3]~input_o\) ) ) ) # ( !\row[2]~input_o\ & ( \row[0]~input_o\ ) ) # ( \row[2]~input_o\ & ( !\row[0]~input_o\ ) ) # ( !\row[2]~input_o\ & ( !\row[0]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111111111111010010110100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_row[1]~input_o\,
	datac => \ALT_INV_row[3]~input_o\,
	datae => \ALT_INV_row[2]~input_o\,
	dataf => \ALT_INV_row[0]~input_o\,
	combout => \row_index~0_combout\);

-- Location: FF_X72_Y2_N38
\current_key[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \row_index~0_combout\,
	clrn => \reset~input_o\,
	ena => \current_key[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => current_key(2));

-- Location: LABCELL_X75_Y2_N54
\Selector5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector5~0_combout\ = ( col_index(0) & ( !\CURRENT_STATE.col0~q\ & ( !\CURRENT_STATE.col2~q\ ) ) ) # ( !col_index(0) & ( !\CURRENT_STATE.col0~q\ & ( (!\CURRENT_STATE.col2~q\ & \CURRENT_STATE.idle~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001010101010101010101000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_CURRENT_STATE.col2~q\,
	datac => \ALT_INV_CURRENT_STATE.idle~q\,
	datae => ALT_INV_col_index(0),
	dataf => \ALT_INV_CURRENT_STATE.col0~q\,
	combout => \Selector5~0_combout\);

-- Location: FF_X75_Y2_N55
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
	ena => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => col_index(0));

-- Location: FF_X74_Y2_N59
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
	ena => \current_key[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => current_key(0));

-- Location: LABCELL_X73_Y2_N42
\Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = (!current_key(1) & ((!current_key(2) & ((current_key(0)) # (current_key(3)))) # (current_key(2) & ((!current_key(0)))))) # (current_key(1) & ((!current_key(3) $ (current_key(2))) # (current_key(0))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110101111110101011010111111010101101011111101010110101111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_current_key(1),
	datab => ALT_INV_current_key(3),
	datac => ALT_INV_current_key(2),
	datad => ALT_INV_current_key(0),
	combout => \Mux6~0_combout\);

-- Location: FF_X74_Y2_N38
\seg_out[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Mux6~0_combout\,
	clrn => \reset~input_o\,
	sload => VCC,
	ena => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_out[0]~reg0_q\);

-- Location: LABCELL_X73_Y2_N24
\Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = ( current_key(1) & ( (!current_key(3) & (!current_key(2) & !current_key(0))) # (current_key(3) & (current_key(2))) ) ) # ( !current_key(1) & ( (current_key(2) & ((current_key(0)) # (current_key(3)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100001111000000110000111111000011000000111100001100000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_current_key(3),
	datac => ALT_INV_current_key(2),
	datad => ALT_INV_current_key(0),
	dataf => ALT_INV_current_key(1),
	combout => \Mux5~0_combout\);

-- Location: FF_X73_Y2_N26
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
	ena => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_out[1]~reg0_q\);

-- Location: LABCELL_X73_Y2_N30
\Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = ( current_key(1) & ( (current_key(2) & current_key(0)) ) ) # ( !current_key(1) & ( (!current_key(2) & ((current_key(3)))) # (current_key(2) & (current_key(0))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000110111011000100011011101100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_current_key(2),
	datab => ALT_INV_current_key(0),
	datad => ALT_INV_current_key(3),
	dataf => ALT_INV_current_key(1),
	combout => \Mux4~0_combout\);

-- Location: FF_X74_Y2_N40
\seg_out[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Mux4~0_combout\,
	clrn => \reset~input_o\,
	sload => VCC,
	ena => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_out[2]~reg0_q\);

-- Location: LABCELL_X73_Y2_N12
\Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = ( current_key(0) & ( !current_key(1) $ (((!current_key(2) & !current_key(3)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000011110000111100000000000000000000111100001111000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_current_key(2),
	datab => ALT_INV_current_key(3),
	datac => ALT_INV_current_key(1),
	datae => ALT_INV_current_key(0),
	combout => \Mux3~0_combout\);

-- Location: FF_X74_Y2_N43
\seg_out[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Mux3~0_combout\,
	clrn => \reset~input_o\,
	sload => VCC,
	ena => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_out[3]~reg0_q\);

-- Location: LABCELL_X73_Y2_N33
\Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = ( current_key(1) & ( (!current_key(3) & (!current_key(2) $ (!current_key(0)))) ) ) # ( !current_key(1) & ( (!current_key(2) & (!current_key(3) & current_key(0))) # (current_key(2) & (current_key(3) & !current_key(0))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010110100000000001011010000001010000101000000101000010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_current_key(2),
	datac => ALT_INV_current_key(3),
	datad => ALT_INV_current_key(0),
	dataf => ALT_INV_current_key(1),
	combout => \Mux2~0_combout\);

-- Location: FF_X73_Y2_N35
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
	ena => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_out[4]~reg0_q\);

-- Location: LABCELL_X73_Y2_N36
\Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = ( current_key(1) & ( !current_key(2) $ (((!current_key(3) & !current_key(0)))) ) ) # ( !current_key(1) & ( (!current_key(2) & (!current_key(3) $ (!current_key(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001010001000001000101000100001100110101010100110011010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_current_key(2),
	datab => ALT_INV_current_key(3),
	datad => ALT_INV_current_key(0),
	dataf => ALT_INV_current_key(1),
	combout => \Mux1~0_combout\);

-- Location: FF_X73_Y2_N37
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
	ena => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_out[5]~reg0_q\);

-- Location: LABCELL_X73_Y2_N57
\Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = ( current_key(1) & ( (!current_key(2) & (!current_key(3) & !current_key(0))) ) ) # ( !current_key(1) & ( (current_key(3) & current_key(0)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000110011000000000011001110001000000000001000100000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_current_key(2),
	datab => ALT_INV_current_key(3),
	datad => ALT_INV_current_key(0),
	dataf => ALT_INV_current_key(1),
	combout => \Mux0~0_combout\);

-- Location: FF_X73_Y2_N58
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
	ena => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_out[6]~reg0_q\);

-- Location: LABCELL_X73_Y2_N54
\Equal6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal6~0_combout\ = ( !current_key(1) & ( (!current_key(2) & (!current_key(3) & current_key(0))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010001000000000001000100000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_current_key(2),
	datab => ALT_INV_current_key(3),
	datad => ALT_INV_current_key(0),
	dataf => ALT_INV_current_key(1),
	combout => \Equal6~0_combout\);

-- Location: FF_X73_Y2_N55
\led1_out~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Equal6~0_combout\,
	clrn => \reset~input_o\,
	ena => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \led1_out~reg0_q\);

-- Location: LABCELL_X19_Y25_N3
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


