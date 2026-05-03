library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

use work.ReverseSevenSegmentDecoding.all;
use work.keypad_func.all;


entity elevator is

	generic ( -- for faster simulation, can be overrided in TB
        g_max_speed   : integer := 100000; -- actual maxspeed for motor capacity is 12500
        g_cal_speed   : integer := 450000; 
        g_min_speed   : integer := 500000; -- 1 step/s
        g_keypad_div  : integer := 25000; -- 50MHz --> 1kHz (clk divider)
		  g_accel_delay : integer := 1500   
    );
	
	port(
		clk : in std_logic;
		reset : in std_logic; 
		row : in std_logic_vector(3 downto 0); 
		column : out std_logic_vector(3 downto 0);
		seg_out : out std_logic_vector(6 downto 0);
		disp_nr : out std_logic_vector(3 downto 0);
		
		step : out std_logic; -- rising edge causes the indexer to advance 
		dir : out std_logic; -- direction of stepping 
		en : out std_logic; -- Logic low to disable device outputs; logic high to enable. Also used for fault indication. Pulled logic low in fault condition. input/output in documentation
		nsleep : out std_logic; -- sleep mode input
		stop : in std_logic;
		
		em_stop : in std_logic;
		
		mode_level_steps : in std_logic -- 0 = level, 1 = steps, for input on keypad
	);

end entity;

architecture rtl of elevator is	
signal previous_key : std_logic_vector (3 downto 0) := "1101";
signal current_key : std_logic_vector(3 downto 0) := "1101"; -- 1101 = index 13 = "0" on keypad

signal current_position : integer range 0 to 6550 := 0; 
signal target_position : integer range 0 to 6550 := 0; 

signal key_decoded : std_logic_vector(3 downto 0);
signal key_valid : std_logic;

signal disp_keys : std_logic_vector(15 downto 0);
signal display_mode : std_logic; 

signal moving : std_logic; 

begin

	keypad : entity work.keypad
		generic map(
			g_keypad_div => g_keypad_div
		)
		port map(
			clk => clk,
			reset => reset,
			row => row,
			column => column,
			key_decoded => key_decoded,
			key_valid => key_valid
		);

		
	display : entity work.display
		generic map(
			g_keypad_div => g_keypad_div
		)
		port map(
			clk => clk,
			reset => reset,
			mode_level_steps => mode_level_steps,
			disp_keys => disp_keys,
			seg_out => seg_out,
			disp_nr => disp_nr,
			display_mode => display_mode,
			current_position => current_position
		);
		
	lift_controller : entity work.lift_controller
		generic map(
			g_max_speed => g_max_speed, 
			g_cal_speed => g_cal_speed,
			g_min_speed => g_min_speed,
			g_accel_delay => g_accel_delay
		
		)
		port map(
			clk => clk,
			reset => reset,	
			stop => stop,
			em_stop => em_stop,
			step => step,
			dir => dir,
			en => en,
			nsleep => nsleep,
			target_position => target_position,
			current_position_out => current_position,
			moving => moving
		);

	process(clk, reset)
		
		begin
						
			if reset = '0' then
				current_key <= "1101"; 
				previous_key <= "1101"; 

				disp_keys <= "1101110111011101";
				
				target_position <= 0; 			
				
			elsif rising_edge(clk) then					
			
				if moving = '1' then
					display_mode <= '1'; -- movement of elevator --show_position_bcd;
				else
					display_mode <= '0'; -- keypad input --show_key_index;
				end if;
								
					if key_valid = '1' then
						current_key <= key_decoded;
						previous_key <= current_key; 
					
						if current_key /= previous_key then -- problem: cannot press same digit twice
							disp_keys(15 downto 12) <= disp_keys(11 downto 8);
							disp_keys(11 downto 8) <= disp_keys(7 downto 4);
							disp_keys(7 downto 4) <= disp_keys(3 downto 0);
							disp_keys(3 downto 0) <= current_key;
						end if; 
						
					end if;
					
					-- * pressed (enter)
					if current_key = "1100" then
						current_key <= previous_key; 
						
						if mode_level_steps = '0' then
							target_position <= key_to_step_level(previous_key) / 2; -- so step counter can increent by +1 and not +2, odd numbers gets floored
						else
							target_position <= key_to_step_steps(disp_keys) / 2;
						end if; 
					end if; 
								
			end if; 
    
    end process;
	 

end rtl;

