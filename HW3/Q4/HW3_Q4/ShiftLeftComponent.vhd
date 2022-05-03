----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity ShiftLeftComponent is
    Port (  
				Mcand : in signed (15 downto 0);
				leftShiftedMcand : out signed(15 downto 0));
end ShiftLeftComponent;

architecture Behavioral of ShiftLeftComponent is

begin
	leftShiftedMcand <= Mcand sll 1;
end Behavioral;

