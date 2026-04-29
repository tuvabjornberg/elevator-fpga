LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY display_vhd_tst IS
END display_vhd_tst;
ARCHITECTURE elevator_arch OF display_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL column : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL dir : STD_LOGIC;
SIGNAL disp_nr : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL em_stop : STD_LOGIC;
SIGNAL en : STD_LOGIC;
SIGNAL led1_out : STD_LOGIC;
SIGNAL nsleep : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
SIGNAL row : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL seg_out : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL step : STD_LOGIC;
SIGNAL stop : STD_LOGIC;
SIGNAL sw_level_steps : STD_LOGIC; 
COMPONENT elevator
	PORT (
	clk : IN STD_LOGIC;
	column : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0);
	dir : BUFFER STD_LOGIC;
	disp_nr : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0);
	em_stop : IN STD_LOGIC;
	en : INOUT STD_LOGIC;
	led1_out : BUFFER STD_LOGIC;
	nsleep : BUFFER STD_LOGIC;
	reset : IN STD_LOGIC;
	row : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	seg_out : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0);
	step : BUFFER STD_LOGIC;
	stop : IN STD_LOGIC;
	sw_level_steps : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i2 : elevator
	
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
	led1_out => led1_out,
	nsleep => nsleep,
	reset => reset,
	row => row,
	seg_out => seg_out,
	step => step,
	stop => stop,
	sw_level_steps => sw_level_steps
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
	sw_level_steps <= '0';
	
	wait for 1 ms;
	reset <= '0';
	wait for 3 ms;
	reset <= '1';

	wait for 10 ms;
	stop <= '1';
	wait for 1 ms;
	stop <= '0';


	wait for 5 ms;
	wait until column = "1011";  -- 3
	row <= "1110";              
	wait for 5 ms;
	row <= "1111";	
	
	wait for 5 ms;
	wait until column = "1110";  -- 1
	row <= "1110";              
	wait for 5 ms;
	row <= "1111"; 

	wait for 5 ms;
	wait until column = "1110";  -- 4
	row <= "1101";              
	wait for 5 ms;
	row <= "1111"; 
	
	wait for 5 ms;
	wait until column = "1110";  -- 7
	row <= "1011";              
	wait for 5 ms;
	row <= "1111"; 
	
	wait for 10 ms;
	wait until column = "1110";  -- *
	row <= "0111";              
	wait for 5 ms;
	row <= "1111"; 
	
	wait for 10 ms;


	
END PROCESS always;  

	                                      
END elevator_arch;
