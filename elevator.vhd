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
		--enter : in std_logic; 
		seg_out: out std_logic_vector(6 downto 0);
		disp_nr1: out std_logic; 
		led1_out : out std_logic;
		led2_out : out std_logic
	);

end entity;

architecture rtl of elevator is	

begin

	process(clk, reset)
		begin
			if reset = '0' then
				seg_out <= to_ReverseSevenSegment("0000"); 
				led1_out <= '0';
				led2_out <= '0';
				column <= "1110";
				disp_nr1 <= '0';
	
			elsif rising_edge(clk) then
				if row = "1110" then
					seg_out <= to_ReverseSevenSegment("0001");
					disp_nr1 <= '1'; 
					led1_out <= '1';
				elsif row = "1011" then
					seg_out <= to_ReverseSevenSegment("0100");
					disp_nr1 <= '1';
					led2_out <= '1';
				end if;
				
			end if; 
    
    end process;

end rtl;