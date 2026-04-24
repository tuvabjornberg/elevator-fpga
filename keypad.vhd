library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

package keypad is
	function decode_row (row : in std_logic_vector(3 downto 0)) 
		return std_logic_vector;
		
	function map_key (row_index : in std_logic_vector(1 downto 0); 
							col_index : in std_logic_vector(1 downto 0)) 
		return std_logic_vector;
		
	function key_to_step (key : in std_logic_vector(3 downto 0)) 
		return integer;
		
end package keypad;

package body keypad is
	function decode_row (row: in std_logic_vector(3 downto 0)) return
		std_logic_vector is
		
		variable row_index : std_logic_vector(1 downto 0) := (others => '1');
		
		begin			
			if row = "0111" then
				row_index := "11";
			elsif row = "1011" then
				row_index := "10";
			elsif row = "1101" then
				row_index := "01";
			elsif row = "1110" then
				row_index := "00";
			else
				row_index := "00"; 
			end if;
			
			return row_index; 
	end function decode_row;
	
	function map_key (row_index : in std_logic_vector(1 downto 0); col_index : in std_logic_vector(1 downto 0)) return
		std_logic_vector is
		variable current_key : std_logic_vector(3 downto 0);
		
		begin
			current_key := row_index & col_index;
		
			return current_key; 
	end function map_key; 
	
	function key_to_step (key : in std_logic_vector(3 downto 0)) return
		integer is
		
		variable step : integer; 
	
	begin
		case key is 
		-- 0-6 floors: 0-6000 steps --> 1000 steps between each floor, gives target position
				when "0000" => step := 1000; -- "1"
				when "0001" => step := 2000; -- "2"
				when "0010" => step := 3000; -- "3"
				--when "0011" =>  := ; -- "A"
				
				when "0100" => step := 4000; -- "4"
				when "0101" => step := 5000; -- "5"
				when "0110" => step := 6000; -- "6"
				--when "0111" =>  := ; -- "B"

				--when "1000" =>  := ; -- "7"
				--when "1001" =>  := ; -- "8"
				--when "1010" =>  := ; -- "9"
				--when "1011" => 	:= ; -- C
				--
				--when "1100" => 	:= ; -- */E
				when "1101" => step := 0; -- 0
				--when "1110" => 	:= ; -- #/F
				--when "1111" => 	:= ; -- D
				
				when others => step := 0;
				
			end case;
			
			return step; 
	
	end function key_to_step;
		
end package body keypad; 

