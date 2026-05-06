library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

package display_func is
	-- outputs the seven segment signals based on the (row, column) indexes from a keypad press
	function ReverseSevenSegment_index (i: in std_logic_vector(3 downto 0)) 
		return std_logic_vector;
	
	-- outputs the seven segment signals based on binary numbers 
	function reverseSevenSegment_binary (i: in std_logic_vector(3 downto 0)) 
		return std_logic_vector;
		
	-- double dabble algorithm, convert integer to binary-coded decimal
	function int13b_to_bcd16b (position : in integer) 
		return std_logic_vector;
		
end package display_func;

package body display_func is
	function reverseSevenSegment_index (i: in std_logic_vector(3 downto 0)) return
		std_logic_vector is
		
		variable out_i : std_logic_vector(6 downto 0) := (others => '1');
		
		begin				
			case i is 				
				when "1111" => out_i := "0110000"; -- "1"
				when "1110" => out_i := "1101101"; -- "2"
				when "1101" => out_i := "1111001"; -- "3"
				--when "1100" => out_i := "1111101"; -- "A"
				
				when "1011" => out_i := "0110011"; -- "4"
				when "1010" => out_i := "1011011"; -- "5"
				when "1001" => out_i := "1011111"; -- "6"
				--when "1000" => out_i := "1011110"; -- "B"

				when "0111" => out_i := "1110000"; -- "7"
				when "0110" => out_i := "1111111"; -- "8"
				when "0101" => out_i := "1111011"; -- "9"
				--when "0100" => out_i := "1001110"; -- C
				
				when "0011" => out_i := "1001111"; -- */E
				when "0010" => out_i := "1111110"; -- 0
				--when "0001" => out_i := "1000111"; -- #/F
				--when "0000" => out_i := "0111101"; -- D
				
				when others => out_i := "1111110";
				
			end case;
										
			return out_i; 
	end function reverseSevenSegment_index;
	
	function reverseSevenSegment_binary(i: in std_logic_vector(3 downto 0)) return
		std_logic_vector is
		
		variable out_i : std_logic_vector(6 downto 0) := (others => '1');
		
		begin				
			case i is 
				when "0000" => out_i := "1111110"; -- "0"
				when "0001" => out_i := "0110000"; -- "1"
				when "0010" => out_i := "1101101"; -- "2"
				when "0011" => out_i := "1111001"; -- "3"
				--when "0101" => out_i := "1111101"; -- "A"
				
				when "0100" => out_i := "0110011"; -- "4"
				when "0101" => out_i := "1011011"; -- "5"
				when "0110" => out_i := "1011111"; -- "6"
				--when "0111" => out_i := "1011110"; -- "B"

				when "0111" => out_i := "1110000"; -- "7"
				when "1000" => out_i := "1111111"; -- "8"
				when "1001" => out_i := "1111011"; -- "9"
				--when "1011" => out_i := "1001110"; -- C
				
				--when "1100" => out_i := "1001111"; -- */E
				--when "1110" => out_i := "1000111"; -- #/F
				--when "1111" => out_i := "0111101"; -- D
				
				when others => out_i := (others => 'U');

			end case;
										
			return out_i; 
	end function reverseSevenSegment_binary;
	
	function int13b_to_bcd16b(position : in integer) return
		std_logic_vector is
		
			variable position_bin : unsigned(12 downto 0); -- max int/steps = 6550 = 1100110010110 -> 13 digits
			variable position_bcd : std_logic_vector(15 downto 0) := (others => '0');
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
			
		
	end function int13b_to_bcd16b; 
	
end package body display_func;