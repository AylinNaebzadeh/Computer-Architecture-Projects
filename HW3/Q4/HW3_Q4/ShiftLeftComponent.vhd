----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity ShiftLeftComponent is
    Port (  sll_clk : in std_logic;
				Mcand : in signed (15 downto 0);
				leftShiftedMcand : out signed(15 downto 0));
end ShiftLeftComponent;

architecture Behavioral of ShiftLeftComponent is

begin
	sll_p : process(sll_clk)
	begin
	if (rising_edge(sll_clk)) then
		leftShiftedMcand <= Mcand sll 1;
	end if;
	end process sll_p;


end Behavioral;

