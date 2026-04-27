library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

use work.ReverseSevenSegmentDecoding.all;
use work.keypad.all;


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
		disp_nr1 : out std_logic;
		led1_out : out std_logic;
		
		step : out std_logic; -- rising edge causes the indexer to advance 
		dir : out std_logic; -- direction of stepping 
		en : out std_logic; -- Logic low to disable device outputs; logic high to enable. Also used for fault indication. Pulled logic low in fault condition. input/output in documentation
		nsleep : out std_logic; -- sleep mode input
		stop : in std_logic;
		
		em_stop : in std_logic
	);

end entity;

architecture rtl of elevator is	
signal col_index : std_logic_vector(1 downto 0) := "01"; 
signal previous_key : std_logic_vector (3 downto 0) := "1101";
signal current_key : std_logic_vector(3 downto 0) := "1101"; -- 1101 = index 13 = "0" on keypad
signal prev_row : std_logic_vector(3 downto 0) := "1111"; -- for no-bouncing guarantee

signal current_position : integer range 0 to 6000 := 0; 
signal target_position : integer range 0 to 6000 := 0; 

type STATE_TYPE_KEYPAD is (idle, col0, col1, col2, col3);
signal CURRENT_STATE_KEYPAD : STATE_TYPE_KEYPAD;
signal NEXT_STATE_KEYPAD : STATE_TYPE_KEYPAD;

type STATE_TYPE_LIFT is (idle, calibrate, move, stopped);
signal CURRENT_STATE_LIFT : STATE_TYPE_LIFT;
signal NEXT_STATE_LIFT : STATE_TYPE_LIFT;

signal count_keypad : integer := 1; -- 1kHz clock
signal count_calibrate : integer := 1; 
signal count_updown : integer := 1;

signal stepper_en : std_logic := '0'; -- toggles between 1 and 0 for the stepper motor
signal calibrated : std_logic := '0'; 
	
constant max_speed : integer := g_max_speed;
constant cal_speed : integer := g_cal_speed;
constant min_speed : integer := g_min_speed;
constant keypad_div : integer := g_keypad_div; 
constant accel_delay : integer := g_accel_delay;
constant no_steps_accel : integer := (g_min_speed - g_max_speed)/g_accel_delay; -- number of steps it takes to go from max speed --> min speed

signal current_delay : integer range (g_max_speed - g_accel_delay) to (g_min_speed + g_accel_delay) := g_min_speed; --min_speed-accelspeedcount = 30000-25000=5000, same with max_speed

signal dir_tmp : std_logic := '0'; 

begin

	process(clk, reset)
	
		begin
			if reset = '0' then
				current_key <= "1101"; 
				previous_key <= "1101"; 
				seg_out <= to_ReverseSevenSegment("1101"); -- 0
				disp_nr1 <= '1';
				
				led1_out <= '0'; 
				target_position <= 0; 
				
				CURRENT_STATE_KEYPAD <= idle;
				CURRENT_STATE_LIFT <= calibrate;
				NEXT_STATE_LIFT <= calibrate;
				
				col_index <= "01";
				
				count_keypad <= 1;
				
				count_calibrate <= 1; 
				count_updown <= 1; 
				
				dir_tmp <= '0'; 
				stepper_en <= '0';
				calibrated <= '0';
							
	
			elsif rising_edge(clk) then	
				CURRENT_STATE_LIFT <= NEXT_STATE_LIFT;
				
				if em_stop = '0' then
					step <= '0';
					dir <= '0';
					en <= '0';
					nsleep <= '0';
				end if;
					
				case CURRENT_STATE_LIFT is
						when idle =>
							step <= '0';
							dir <= '0';
							en <= '0';
							nsleep <= '0';
					
							
							
							if current_position < target_position and calibrated = '1' then
								NEXT_STATE_LIFT <= move; --move up
								dir_tmp <= '1';
							elsif current_position > target_position  and calibrated = '1' then
								NEXT_STATE_LIFT <= move; --move down 
								dir_tmp <= '0';
							else
								NEXT_STATE_LIFT <= idle;
							end if;
								
							
		  
						when calibrate =>
							dir <= '0';
							en <= '1';
							nsleep <= '1';
							
							--if em_stop = '0' then -- needs some action, either remember to recalibrate, or do it automatically
							--	calibrated <= '0';
							--	NEXT_STATE_LIFT <= idle;
								
							if stop = '0' then
								calibrated <= '1';
								current_position <= 0; 
								
								NEXT_STATE_LIFT <= stopped;
								
							else
								NEXT_STATE_LIFT <= calibrate;
							end if;
							
							-- OBS constant speed
							if count_calibrate = cal_speed then 
								count_calibrate <= 1; 
								if stepper_en = '1' then 
									step <= '1';
									--en <= '1';
									--nsleep <= '1';
									stepper_en <= '0';
								else 
									step <= '0'; -- now high for and entire cycle, motor technically only needs a pulse (dirac), possible to have step=1 high for 1 clk and step=0 for 12500 clk?
									--en <= '0'; -- "Make sure the EN and nSLEEP are ON only while moving the motor, otherwise the motor gets hot." ???
									--nsleep <= '0';
									stepper_en <= '1';
								end if;
							else 
								count_calibrate <= count_calibrate + 1; 
							end if;
									
								
						when move => --move_up
							dir <= dir_tmp;
							en <= '1';
							nsleep <= '1';
						
							if current_position = target_position then
								NEXT_STATE_LIFT <= stopped; 
							end if; 
							
							if count_updown = current_delay then 
								count_updown <= 1; 
								if stepper_en = '1' then 
									step <= '1';
									stepper_en <= '0';
									
									if dir_tmp = '1' then
										current_position <= current_position + 2; 
									else 
										current_position <= current_position - 2; 
									end if; 
									
									
									if dir_tmp = '1' then
										-- curren_position is delayed on cycle, EVAULATE
										if current_position < target_position - no_steps_accel then
											if current_delay <= max_speed then
												current_delay <= max_speed; 
											else
												current_delay <= current_delay - accel_delay; --accel 
											end if; 
										else 
											if current_delay >= min_speed then
												current_delay <= min_speed; 
											else
												current_delay <= current_delay + accel_delay; --deaccel 
											end if; 
										end if;
									else
										if current_position > target_position + no_steps_accel then 
											if current_delay <= max_speed then
												current_delay <= max_speed; 
											else
												current_delay <= current_delay - accel_delay; --accel
											end if; 
										else  
											if current_delay >= min_speed then
												current_delay <= min_speed; 
											else
												current_delay <= current_delay + accel_delay; --deaccel
											end if; 
										end if;
									end if;
							
								else 
									step <= '0'; 
									stepper_en <= '1';
								end if;
							else 
								count_updown <= count_updown + 1; 
							end if;
							

						when stopped =>
							NEXT_STATE_LIFT <= idle;
							
						when others =>
							step <= '0';
							dir <= '0';
							en <= '0';
							nsleep <= '0';
							stepper_en <= '0';
							NEXT_STATE_LIFT <= idle;
					end case;				 	
				
				
				
				count_keypad <= count_keypad + 1; 	
				
				if count_keypad = keypad_div then 
					count_keypad <= 1; 
					CURRENT_STATE_KEYPAD <= NEXT_STATE_KEYPAD;
					
	
					case CURRENT_STATE_KEYPAD is
						when idle =>
							NEXT_STATE_KEYPAD <= col0;
							
						-- since keypad matrix is flipped, col0 --> col3 = logical (to me) 
						when col0 =>
							column <= "0111";
							col_index <= "11";
							NEXT_STATE_KEYPAD <= col1; 
						when col1 =>
							column <= "1011";
							col_index <= "10";
							NEXT_STATE_KEYPAD <= col2; 
						when col2 =>
							column <= "1101";
							col_index <= "01";
							NEXT_STATE_KEYPAD <= col3; 
						when col3 =>
							column <= "1110";
							col_index <= "00";
							NEXT_STATE_KEYPAD <= idle; 
						when others =>
							NEXT_STATE_KEYPAD <= idle;
					end case;
					
					
					-- no key press and delay for debouncing
					if row /= "1111" and prev_row = "1111" then
						previous_key <= current_key; 
						current_key <= map_key(decode_row(row), col_index);
						disp_nr1 <= '1';
					end if; 
					prev_row <= row;
						
					seg_out <= to_ReverseSevenSegment(current_key);
					
					-- * pressed (enter)
					if current_key = "1100" then
						led1_out <= '1';
						current_key <= previous_key; 
					
						target_position <= key_to_step(previous_key);
						
					else
						led1_out <= '0'; 
					end if; 
				
				end if;
			end if; 
    
    end process;
	 

end rtl;

