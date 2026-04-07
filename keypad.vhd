library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

package keypad is
	function decode_row (row : in std_logic_vector(3 downto 0)) 
		return std_logic_vector;
	function map_key (row_index : in std_logic_vector(1 downto 0); 
							col_index : in std_logic_vector(1 downto 0)) 
		return std_logic_vector;
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
	
end package body keypad; 

