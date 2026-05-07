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

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "04/08/2026 09:18:53"
                                                            
-- Vhdl Test Bench template for design  :  elevator
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY elevator_vhd_tst IS
END elevator_vhd_tst;
ARCHITECTURE elevator_arch OF elevator_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL column : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL dir : STD_LOGIC;
SIGNAL disp_nr : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL em_stop : STD_LOGIC;
SIGNAL en : STD_LOGIC;
SIGNAL nsleep : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
SIGNAL row : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL seg_out : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL step : STD_LOGIC;
SIGNAL stop : STD_LOGIC;
SIGNAL mode_level_steps : STD_LOGIC; 
COMPONENT elevator
	PORT (
	clk : IN STD_LOGIC;
	column : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0);
	dir : BUFFER STD_LOGIC;
	disp_nr : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0);
	em_stop : IN STD_LOGIC;
	en : INOUT STD_LOGIC;
	nsleep : BUFFER STD_LOGIC;
	reset : IN STD_LOGIC;
	row : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	seg_out : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0);
	step : BUFFER STD_LOGIC;
	stop : IN STD_LOGIC;
	mode_level_steps : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : elevator
	
	GENERIC MAP (
    g_max_speed  => 30000,
    g_cal_speed  => 250000,
    g_min_speed  => 500000,
    g_keypad_div => 25000
	)

	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	column => column,
	dir => dir,
	disp_nr => disp_nr,
	em_stop => em_stop,
	en => en,
	nsleep => nsleep,
	reset => reset,
	row => row,
	seg_out => seg_out,
	step => step,
	stop => stop,
	mode_level_steps => mode_level_steps
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
WAIT;                                                       
END PROCESS init;  

clk_process : process
begin
    clk <= '0';
    wait for 50 ns;
    clk <= '1';
    wait for 50 ns;
end process clk_process;
                                          
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
	row <= "1111";
	stop <= '0';
	em_stop <= '1';
	reset <= '1';
	mode_level_steps <= '1';
	
	wait for 1 ms;
	reset <= '0';
	wait for 5 ms;
	reset <= '1';

	wait for 500 ms;
	stop <= '1';
	wait for 1 ms;
	stop <= '0';

	wait for 5 ms;
	wait until column = "1011";  -- 3
	row <= "1110";              
	wait for 5 ms;
	row <= "1111";  

	wait for 5 ms;
	wait until column = "1101";  -- 0
	row <= "0111";              
	wait for 5 ms;
	row <= "1111"; 

	wait for 5 ms;
	wait until column = "1110";  -- 4
	row <= "1101";              
	wait for 5 ms;
	row <= "1111"; 

	wait for 5 ms;
	wait until column = "1101";  -- 2
	row <= "1110";              
	wait for 5 ms;
	row <= "1111"; 
	
	wait for 5 ms;
	wait until column = "1110";  -- *
	row <= "0111";              
	wait for 5 ms;
	row <= "1111"; 
	

	
	wait for 50000 ms;
	
	mode_level_steps <= '0';
	
	wait for 5 ms;
	wait until column = "1101";  -- 2
	row <= "1110";              
	wait for 5 ms;
	row <= "1111";     
	
	wait for 5 ms;
	wait until column = "1110";  -- *
	row <= "0111";              
	wait for 5 ms;
	row <= "1111"; 

	wait for 40000 ms;


	
END PROCESS always;  

	                                      
END elevator_arch;
