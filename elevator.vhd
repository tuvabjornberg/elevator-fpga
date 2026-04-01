library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

use work.ReverseSevenSegmentDecoding.all;


entity elevator is
	port(
		clk : in std_logic;
		reset : in std_logic; 
		row : in std_logic_vector(3 downto 0); 
		column : out std_logic_vector(3 downto 0);
		seg_out : out std_logic_vector(6 downto 0);
		disp_nr1 : out std_logic;
		led1_out : out std_logic
	);

end entity;

architecture rtl of elevator is	
signal row_index : std_logic_vector(1 downto 0) := "11"; 
signal col_index : std_logic_vector(1 downto 0) := "01"; 
signal current_key : std_logic_vector(3 downto 0) := "1101"; 
signal prev_row : std_logic_vector(3 downto 0) := "1111"; -- for no-bouncing guarantee

signal enter : std_logic := '0'; 

type STATE_TYPE is (idle, col0, col1, col2, col3);
signal CURRENT_STATE : STATE_TYPE;
signal NEXT_STATE : STATE_TYPE;

signal count: integer := 1; 

begin

	process(clk, reset)
		begin
			if reset = '0' then
				current_key <= "1101"; 
				seg_out <= to_ReverseSevenSegment("1101"); --0
				disp_nr1 <= '1';
				
				enter <= '0'; 
				led1_out <= '0'; 
				
				CURRENT_STATE <= idle;
				
				row_index <= "11";
				col_index <= "01";
				
				count <= 1;
	
			elsif rising_edge(clk) then
				count <= count + 1; 
				
				if count = 25000 then -- 50MHz --> 1kHz (clk divider)
					count <= 1; 
					CURRENT_STATE <= NEXT_STATE;
					
	
					case CURRENT_STATE is
						when idle =>
							NEXT_STATE <= col0;
							
						-- since keypad matrix is flipped, col0 --> col3 = logical (to me) 
						when col0 =>
							column <= "0111";
							col_index <= "11";
							NEXT_STATE <= col1; 
						when col1 =>
							column <= "1011";
							col_index <= "10";
							NEXT_STATE <= col2; 
						when col2 =>
							column <= "1101";
							col_index <= "01";
							NEXT_STATE <= col3; 
						when col3 =>
							column <= "1110";
							col_index <= "00";
							NEXT_STATE <= idle; 
						when others =>
							NEXT_STATE <= idle;
					end case;
					
					if CURRENT_STATE /= idle then
						if row = "0111" then
							row_index <= "11";
						elsif row = "1011" then
							row_index <= "10";
						elsif row = "1101" then
							row_index <= "01";
						elsif row = "1110" then
							row_index <= "00";
						else
						end if;
					end if; 
					
					-- no key press and delay for debouncing
					if row /= "1111" and prev_row = "1111" then
						current_key <= row_index & col_index;
						disp_nr1 <= '1';
					end if; 
					prev_row <= row;
						
					seg_out <= to_ReverseSevenSegment(current_key);
					
					-- * pressed (enter)
					if current_key = "1100" then
						enter <= '1';
						led1_out <= '1'; 
					else
						enter <= '0';
						led1_out <= '0'; 
					end if; 
				
				end if;
			end if; 
    
    end process;
	 

end rtl;


