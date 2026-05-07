library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.lift_controller_func.all;

entity lift_controller is
	generic(
		g_max_speed : integer := 100000;
		g_cal_speed : integer := 450000;
		g_min_speed : integer := 500000;
		g_accel_delay : integer := 1500
	);
	port(
		clk : in std_logic;
		reset : in std_logic;	
		
		target_position : in integer range 0 to 6549;
		current_position_out : out integer range 0 to 6549;
		
		step : out std_logic;
		dir : out std_logic;
		en : out std_logic;
		nsleep : out std_logic;
		stop : in std_logic;
		
		em_stop : in std_logic;
		
		moving : out std_logic
	);
end entity;

architecture rtl of lift_controller is

type STATE_TYPE_LIFT is (idle, calibrate, move, stopped);
signal CURRENT_STATE_LIFT : STATE_TYPE_LIFT;
signal NEXT_STATE_LIFT : STATE_TYPE_LIFT;

signal dir_tmp : std_logic := '0'; -- decides up or down movement
signal stepper_en : std_logic := '0'; -- toggles between 1 and 0 for the stepper motor
signal calibrated : std_logic := '0'; 

signal count_calibrate : integer := 1; -- ensures proper delay for calibration
signal count_updown : integer := 1;	-- ensures proper delay for movement
	
constant max_speed : integer := g_max_speed; -- Set range/size, do not need 32 bits
constant cal_speed : integer := g_cal_speed;
constant min_speed : integer := g_min_speed;
constant accel_delay : integer := g_accel_delay;
constant no_steps_accel : integer := (g_min_speed - g_max_speed)/g_accel_delay; -- number of steps it takes to go from max speed --> min speed

signal current_delay : integer range (g_max_speed - g_accel_delay) to (g_min_speed + g_accel_delay) := g_min_speed; --min_speed-accelspeedcount = 30000-25000=5000, same with max_speed

signal current_position : integer range 0 to 6549;

begin
	process(clk, reset)
		begin
			if reset = '0' then
				dir_tmp <= '0'; 
				stepper_en <= '0';
				calibrated <= '0';
				
				count_calibrate <= 1; 
				count_updown <= 1; 
				
				CURRENT_STATE_LIFT <= calibrate;
				NEXT_STATE_LIFT <= calibrate;
				
			elsif rising_edge(clk) then
				CURRENT_STATE_LIFT <= NEXT_STATE_LIFT;
				current_position_out <= current_position; 
				
				if em_stop = '0' then
					step <= '0';
					dir <= '0';
					en <= '0';
					nsleep <= '0';
					NEXT_STATE_LIFT <= stopped; 
					calibrated <= '0'; 
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
														
					when move =>
						dir <= dir_tmp;
						en <= '1';
						nsleep <= '1';
						moving <= '1'; 
					
						-- if reached target
						if (current_position >= target_position and dir_tmp = '1') or (current_position <= target_position and dir_tmp = '0') then -- at right floor (or just missed...)
							NEXT_STATE_LIFT <= stopped; 
							moving <= '0'; 
						else
							NEXT_STATE_LIFT <= move;
						end if; 
						
						-- actual stepper motor movement
						if count_updown = current_delay then 
							count_updown <= 1; 
							if stepper_en = '1' then 
								step <= '1';
								stepper_en <= '0';
								
								if dir_tmp = '1' then --up
									current_position <= current_position + 1; 
								else --down
									current_position <= current_position - 1; 
								end if;  
								
								if dir_tmp = '1' then
									-- curren_position is delayed on cycle, EVAULATE
									if current_position < target_position - no_steps_accel then
										if current_delay <= max_speed then
											current_delay <= max_speed; 
										else
											current_delay <= current_delay - accel_delay; --accel (make delay shorter --> faster speed)
										end if; 
									else 
										if current_delay >= min_speed then
											current_delay <= min_speed; 
										else
											current_delay <= current_delay + accel_delay; --deaccel (make delay longer --> slower speed)
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

					when stopped => -- remove? existed for debug
						NEXT_STATE_LIFT <= idle;
										
					when others =>
						step <= '0';
						dir <= '0';
						en <= '0';
						nsleep <= '0';
						stepper_en <= '0';
						NEXT_STATE_LIFT <= idle;
				end case;
			end if; 
	end process;
end rtl; 