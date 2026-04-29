library ieee;
use ieee.std_logic_1164.all;

package ReverseSevenSegmentDecoding is
	function to_ReverseSevenSegment (i: in std_logic_vector(3 downto 0)) 
		return std_logic_vector;
	
		
	function SevenSegment_logical (i: in std_logic_vector(3 downto 0)) 
		return std_logic_vector;
		
end package ReverseSevenSegmentDecoding;

package body ReverseSevenSegmentDecoding is
	function to_ReverseSevenSegment (i: in std_logic_vector(3 downto 0)) return
		std_logic_vector is
		
		variable out_i : std_logic_vector(6 downto 0) := (others => '1');
		
		begin				
			case i is 
				--when "0000" => out_i := "1111110"; -- "0"
				when "0000" => out_i := "0110000"; -- "1"
				when "0001" => out_i := "1101101"; -- "2"
				when "0010" => out_i := "1111001"; -- "3"
				when "0011" => out_i := "1111101"; -- "A"
				
				when "0100" => out_i := "0110011"; -- "4"
				when "0101" => out_i := "1011011"; -- "5"
				when "0110" => out_i := "1011111"; -- "6"
				when "0111" => out_i := "1011110"; -- "B"

				when "1000" => out_i := "1110000"; -- "7"
				when "1001" => out_i := "1111111"; -- "8"
				when "1010" => out_i := "1111011"; -- "9"
				when "1011" => out_i := "1001110"; -- C
				
				when "1100" => out_i := "1001111"; -- */E
				when "1101" => out_i := "1111110"; -- 0
				when "1110" => out_i := "1000111"; -- #/F
				when "1111" => out_i := "0111101"; -- D
				
				when others => out_i := (others => 'U');
				
				--when "0000" => out_i := "1111110"; -- "0"
				--when "0001" => out_i := "0110000"; -- "1"
				--when "0010" => out_i := "1101101"; -- "2"
				--when "0011" => out_i := "1111001"; -- "3"
				--when "0100" => out_i := "0110011"; -- "4"
				--when "0101" => out_i := "1011011"; -- "5"
				--when "0110" => out_i := "1011111"; -- "6"
				--when "0111" => out_i := "1110000"; -- "7"
				--when "1000" => out_i := "1111111"; -- "8"
				--when "1001" => out_i := "1111011"; -- "9"
				--when "1010" => out_i := "1111101"; -- a
				--when "1011" => out_i := "0011111"; -- b
				--when "1100" => out_i := "1001110"; -- C
				--when "1101" => out_i := "0111101"; -- d
				--when "1110" => out_i := "1001111"; -- E
				--when "1111" => out_i := "1000111"; -- F
				--when others => out_i := (others => 'U');
			end case;
										
			return out_i; 
	end function to_ReverseSevenSegment;
	
	function SevenSegment_logical (i: in std_logic_vector(3 downto 0)) return
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
				--when "1101" => out_i := "1111110"; -- 0
				--when "1110" => out_i := "1000111"; -- #/F
				--when "1111" => out_i := "0111101"; -- D
				
				when others => out_i := (others => 'U');

			end case;
										
			return out_i; 
	end function SevenSegment_logical;
end package body ReverseSevenSegmentDecoding;