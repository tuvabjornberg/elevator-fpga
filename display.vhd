library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.display_func.all;
use work.lift_controller_func.all;

entity display is
	generic(
		g_keypad_div : integer := 25000
	);

	port(
		clk : in std_logic;
		reset : in std_logic;

		current_position : in integer range 0 to 6549;

		disp_keys : in std_logic_vector(15 downto 0);
		moving : in std_logic;
		seg_out : out std_logic_vector(6 downto 0);
		disp_nr : out std_logic_vector(3 downto 0);
		
		mode_level_steps : in std_logic
	);
	
end entity;

architecture rtl of display is

signal count : integer := 0;
signal display_id : integer range 0 to 3 := 0;

signal position_bcd : std_logic_vector(15 downto 0);

constant div : integer := g_keypad_div; 

begin
	process(clk, reset)
		begin
			if reset='0' then
				count <= 0;
				display_id <= 0;
				seg_out <= "1111110";
				
				if mode_level_steps = '0' then
					disp_nr <= "0001";
				else 
					disp_nr <= "1111";
				end if; 
		
			elsif rising_edge(clk) then	
	
				if count = div then
					count <= 0;
	
					if display_id = 3 then
						display_id <= 0;
					else
						display_id <= display_id + 1;
					end if;
				else         
					count <= count + 1;			
				end if;
			
				if moving = '1' then -- current elevator movement
					-- live level/steps display
					position_bcd <= int13b_to_bcd16b(current_position * 2);
					
					if mode_level_steps = '0' then -- floor
		
						disp_nr <= "0001";
						seg_out <= reverseSevenSegment_binary(position_bcd(15 downto 12));
		
					else -- steps
						case display_id is
							when 0 =>
								disp_nr <= "1000";
								seg_out <= reverseSevenSegment_binary(position_bcd(3 downto 0));
				
							when 1 =>
								disp_nr <= "0100";
								seg_out <= reverseSevenSegment_binary(position_bcd(7 downto 4));
				
							when 2 =>
								disp_nr <= "0010";
								seg_out <= reverseSevenSegment_binary(position_bcd(11 downto 8));
				
							when 3 =>
								disp_nr <= "0001";
								seg_out <= reverseSevenSegment_binary(position_bcd(15 downto 12));
							when others =>				
						end case;
					end if;
				else -- keypad input, desired position
					if mode_level_steps = '0' then -- floor
		
						disp_nr <= "0001";
						seg_out <= reverseSevenSegment_index(disp_keys(15 downto 12));
		
					else -- steps
						case display_id is
							when 0 =>
									disp_nr <= "1000";
									seg_out <= reverseSevenSegment_index(disp_keys(3 downto 0));						
							when 1 =>
									disp_nr <= "0100";
									seg_out <= reverseSevenSegment_index(disp_keys(7 downto 4));						
							when 2 =>
									disp_nr <= "0010";
									seg_out <= reverseSevenSegment_index(disp_keys(11 downto 8));
							when 3 =>
									disp_nr <= "0001";
									seg_out <= reverseSevenSegment_index(disp_keys(15 downto 12));						
							when others =>				
						end case;
					end if; 
				end if;
		end if;
	end process;
end rtl;