----------------------------------------------------------------------------------
-- Module Name:    FA - Behavioral 
-- Project Name: 4-bit-ripple-carry-adder using full adders in Pipelined version

-- Additional Comments: https://allaboutfpga.com/vhdl-code-for-full-adder/
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FA is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           S : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end FA;

architecture FA_Behavioral of FA is

begin
	S <= A xor B xor Cin;
	Cout <= (A and B) or (Cin and A) or (Cin and B);
end FA_Behavioral;

