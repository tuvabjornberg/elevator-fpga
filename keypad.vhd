library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

package keypad is
	function decode_row (row : in std_logic_vector(3 downto 0)) 
		return std_logic_vector;
		
	function map_key (row_index : in std_logic_vector(1 downto 0); 
							col_index : in std_logic_vector(1 downto 0)) 
		return std_logic_vector;
		
	function key_to_step_level (key : in std_logic_vector(3 downto 0)) 
		return integer;
		
	function key_to_step_steps (keys : in std_logic_vector(15 downto 0)) 
		return integer;
		
	function decode_key (key : in std_logic_vector(3 downto 0))  
		return integer;

	function int_to_binary_position (position : in integer) 
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
	
	function key_to_step_level (key : in std_logic_vector(3 downto 0)) return
		integer is
		
		variable steps : integer; 
	
		begin			
			steps := 1000 * decode_key(key); 
			
			if steps > 6550 then --reality 6000 for even levels
				return 0; 
			end if; 
						
		return steps; 
	
	end function key_to_step_level;
	
	function key_to_step_steps (keys : in std_logic_vector(15 downto 0)) return
		integer is
		
		variable thousands : integer;
		variable hundreds : integer;
		variable tens : integer; 
		variable singles : integer; 

		variable steps : integer; 
					
	begin
	
		-- change to double dabble
		thousands := 1000 * decode_key(keys(15 downto 12));
		hundreds := 100 * decode_key(keys(11 downto 8));
		tens := 10 * decode_key(keys(7 downto 4));
		singles := decode_key(keys(3 downto 0));
	
		steps := thousands + hundreds + tens + singles; 
		
		if steps > 6550 then
			return 0; 
		end if; 
		
		return steps; 
		
	end function key_to_step_steps;
	
	function decode_key (key : in std_logic_vector(3 downto 0))  return
		integer is
		
		variable int : integer; 
		
		begin
			case key is 
					when "0000" => int := 1; -- "1"
					when "0001" => int := 2; -- "2"
					when "0010" => int := 3; -- "3"
					--when "0011" =>  := ; -- "A"
					
					when "0100" => int := 4; -- "4"
					when "0101" => int := 5; -- "5"
					when "0110" => int := 6; -- "6"
					--when "0111" =>  := ; -- "B"
	
					--when "1000" =>  := ; -- "7"
					--when "1001" =>  := ; -- "8"
					--when "1010" =>  := ; -- "9"
					--when "1011" => 	:= ; -- C
					--
					--when "1100" => 	:= ; -- */E
					when "1101" => int := 0; -- 0
					--when "1110" => 	:= ; -- #/F
					--when "1111" => 	:= ; -- D
					
					when others => int := 0;
					
				end case;
				
		return int; 
		
	end function decode_key;

	
	function int_to_binary_position(position : in integer) return
		std_logic_vector is
		
			variable position_bin : unsigned(12 downto 0); -- max int/steps = 6550 = 1100110010110 -> 13 digits
			variable position_bcd : std_logic_vector(15 downto 0) := (others => '0'); -- ddd -> double dabbled
			variable i : integer;
			variable scratch : unsigned(28 downto 0) := (others => '0'); -- bcd (16 bits) + bin (13 bits)
		
		begin
			position_bin := to_unsigned(position, 13); 
			scratch(12 downto 0) := position_bin; 
			
			for i in 12 downto 0 loop
				if scratch(16 downto 13) > 4 then
					scratch(16 downto 13) := scratch(16 downto 13) + 3;
				end if;
				if scratch(20 downto 17) > 4 then
					scratch(20 downto 17) := scratch(20 downto 17) + 3;
				end if;
				if scratch(24 downto 21) > 4 then
					scratch(24 downto 21) := scratch(24 downto 21) + 3;
				end if;
				if scratch(28 downto 25) > 4 then
					scratch(28 downto 25) := scratch(28 downto 25) + 3;
				end if;

				scratch(28 downto 1) := scratch(27 downto 0);
				scratch(0) := '0';
			end loop; 
			
			position_bcd := std_logic_vector(scratch(28 downto 13));
			
			return position_bcd; 
			
		
	end function int_to_binary_position; 
	
		
end package body keypad; 

