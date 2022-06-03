----------------------------------------------------------------------------------
-- Create Date:    14:12:38 06/03/2022 
 
-- Module Name:    DFF - Behavioral 
-- Project Name: 4-bit-ripple-carry-adder using full adders in Pipelined version

-- Additional Comments: https://thunderwiring.wordpress.com/coding-pipeline-in-vhdl-part-1/
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity DFF is
    Port ( D : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end DFF;

architecture D_flipflop of DFF is

begin
	process(clk, reset)
	begin
		if (reset = '0') then
			Q <= '0';
		elsif rising_edge(clk) then
			Q <= D;
		end if;
	end process;

end D_flipflop;

