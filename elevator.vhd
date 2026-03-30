library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

use work.SevenSegmentDecoding.all;


entity elevator is
	port(
		clk : in std_logic;
		reset : in std_logic; 
		row : in std_logic_vector(3 downto 0); 
		column : in std_logic_vector(2 downto 0);
		--enter : in std_logic; 
		seg_out: out std_logic_vector(6 downto 0);
		led_out : out std_logic
	);

end entity;

architecture rtl of elevator is	

begin
--	out_i <= to_SevenSegment(i);

	process(clk, reset)
		begin
			if reset = '0' then
				--seg_out <= "1111111"; 
				led_out <= '0';
	
			elsif rising_edge(clk) then
				if row = "0001" and column = "010" then
					--seg_out <= "0000001";
					led_out <= '1';
				end if;
			end if; 
    
    end process;

end rtl;