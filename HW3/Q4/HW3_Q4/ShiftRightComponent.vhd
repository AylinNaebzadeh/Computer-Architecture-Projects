----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ShiftRightComponent is
    Port ( 	srl_clk: in std_logic;
				Mlier : in  signed (15 downto 0);
				rightShiftedMlier : out signed(15 downto 0));
end ShiftRightComponent;

architecture Behavioral of ShiftRightComponent is

begin
	srl_p : process(srl_clk)
	begin
	if (rising_edge(srl_clk)) then
		rightShiftedMlier <= Mlier srl 1;
	end if;
	end process srl_p;
end Behavioral;

