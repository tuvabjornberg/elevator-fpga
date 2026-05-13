library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.keypad_func.all;

entity keypad is

	generic(
		g_keypad_div : integer := 25000
	);
	
	port(
		clk : in  std_logic;
		reset : in  std_logic;
		row : in  std_logic_vector(3 downto 0);
		column : out std_logic_vector(3 downto 0);
		
		key_decoded : out std_logic_vector(3 downto 0);
		key_valid : out std_logic
	);

	end entity;

architecture rtl of keypad is

type STATE_TYPE is (idle, col0, col1, col2, col3);
signal CURRENT_STATE : STATE_TYPE;
signal NEXT_STATE : STATE_TYPE;

signal count : integer := 0;

signal col_index : std_logic_vector(1 downto 0);
constant div : integer := g_keypad_div; 

signal key_pressed : std_logic := '0';

begin
	process(clk, reset)
		begin
			if reset = '0' then
				CURRENT_STATE <= col0;
				NEXT_STATE <= col0;
				count <= 0;
				key_valid <= '0';
				key_pressed <= '0';
				key_decoded <= "0010";

			elsif rising_edge(clk) then
				key_valid <= '0';
				
				if count = div then
					count <= 0;
					CURRENT_STATE <= NEXT_STATE;
					
					if row = "1111" then
						key_pressed <= '0';
						case CURRENT_STATE is
							when col0 => 
								column <= "0111"; -- right most column
								col_index <= "00";
								NEXT_STATE <= col1;
				
							when col1 => 
								column <= "1011"; 
								col_index <= "01";
								NEXT_STATE <= col2;
				
							when col2 => 
								column <= "1101"; 
								col_index <= "10";
								NEXT_STATE <= col3;
				
							when col3 => 
								column <= "1110"; -- left most column
								col_index <= "11";
								NEXT_STATE <= col0;
				
							when others =>
								NEXT_STATE <= idle;
							
						end case;
					else
						if key_pressed = '0' then
							key_decoded <= map_key(decode_row(row), col_index);
							key_valid <= '1';
							key_pressed <= '1';
						end if;
					end if;
				else
					count <= count + 1;
				end if;
			end if;
		end process;
end rtl;
					