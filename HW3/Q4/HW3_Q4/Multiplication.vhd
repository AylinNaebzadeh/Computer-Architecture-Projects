----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;



entity Multiplication is
    Port ( multiplicand : inout  signed (5 downto 0);
           multiplier : inout  signed (15 downto 0);
			  carryIn : in signed;
           output : inout  signed (15 downto 0));
end Multiplication;

architecture Behavioral of Multiplication is

begin
	process is
	variable carryOut: signed := 0;
	begin
	for i in 0 to 16 loop
		if (multiplier(0) = '1') then
			Inst_ALU: entity work.ALU PORT MAP(Ci => carryIn, Co => carryOut, Mcand => multiplicand, Product => output, NewProduct => output);
		end if;
		Inst_ShiftLeftComponent: entity work.ShiftLeftComponent PORT MAP(Mcand => multiplicand, leftShiftedMcand => multiplicand);
		Inst_ShiftRightComponent: entity work.ShiftRightComponent PORT MAP(Mlier => multiplier, rightShiftedMlier => multiplier);
	end loop;
	
	end process;

end Behavioral;

