----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ShiftRightComponent is
    Port ( 
				Mlier : in  signed (15 downto 0);
				rightShiftedMlier : out signed(15 downto 0));
end ShiftRightComponent;

architecture Behavioral of ShiftRightComponent is

begin
	rightShiftedMlier <= Mlier srl 1;
end Behavioral;

