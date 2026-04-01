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
-- Generated on "04/01/2026 13:15:35"
                                                            
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
SIGNAL disp_nr1 : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
SIGNAL row : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL seg_out : STD_LOGIC_VECTOR(6 DOWNTO 0);
COMPONENT elevator
	PORT (
	clk : IN STD_LOGIC;
	column : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	disp_nr1 : OUT STD_LOGIC;
	reset : IN STD_LOGIC;
	row : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	seg_out : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : elevator
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	column => column,
	disp_nr1 => disp_nr1,
	reset => reset,
	row => row,
	seg_out => seg_out
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
		 
	wait until rising_edge(clk);
	row <= "1111";  -- all rows high
	WAIT FOR 50 ns;

	wait until rising_edge(clk);
	row <= "1110";
	WAIT FOR 50 ns;
	
	wait until rising_edge(clk);	
	row <= "1101";
	WAIT FOR 50 ns;
	
	wait until rising_edge(clk);
	row <= "1011";
	WAIT FOR 50 ns;
	
	wait until rising_edge(clk);
	row <= "0111";
	WAIT FOR 50 ns;
			
WAIT;                                                        
END PROCESS always;                                          
END elevator_arch;
