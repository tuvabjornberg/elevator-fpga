library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

package lift_controller_func is
	-- takes a (row, column) basedn on the keypad indexing and returns the correconing integer
	function decode_key (key : in std_logic_vector(3 downto 0))  
		return integer;
		
	-- converts 4-bit key into a number of steps
	function key_to_step_level (key : in std_logic_vector(3 downto 0)) 
		return integer;
	
	--converts a 16-bit bdc-keys into a number of steps
	function key_to_step_steps (keys : in std_logic_vector(15 downto 0)) 
		return integer;
		
end package lift_controller_func;

package body lift_controller_func is
	
	function decode_key (key : in std_logic_vector(3 downto 0))  return
		integer is
		
		variable int : integer; 
		
		begin
			case key is 				
					when "1111" => int := 1; -- "1"
					when "1110" => int := 2; -- "2"
					when "1101" => int := 3; -- "3"
					--when "0011" =>  := ; -- "A"
					
					when "1011" => int := 4; -- "4"
					when "1010" => int := 5; -- "5"
					when "1001" => int := 6; -- "6"
					--when "0111" =>  := ; -- "B"
	
					when "0111" => int := 7; -- "7"
					when "0110" => int := 8; -- "8"
					when "0101" => int := 9; -- "9"
					--when "1011" => 	:= ; -- C
					--
					--when "1100" => 	:= ; -- */E
					when "0010" => int := 0; -- 0
					--when "1110" => 	:= ; -- #/F
					--when "1111" => 	:= ; -- D
					
					when others => int := 0;
					
				end case;
				
		return int; 
		
	end function decode_key;
	
	function key_to_step_level (key : in std_logic_vector(3 downto 0)) return
		integer is
		
		variable steps : integer; 
	
		begin			
			steps := 1000 * decode_key(key); 
			
			if steps > 6550 then --reality 6000 for even levels
				return 0; --invalid keypad entry
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
	
		thousands := 1000 * decode_key(keys(15 downto 12));
		hundreds := 100 * decode_key(keys(11 downto 8));
		tens := 10 * decode_key(keys(7 downto 4));
		singles := decode_key(keys(3 downto 0));
	
		steps := thousands + hundreds + tens + singles; 
		
		if steps > 6550 then
			return 0; --invalid keypad entry
		end if; 
		
		return steps; 
		
	end function key_to_step_steps;
	
		
end package body lift_controller_func; 

