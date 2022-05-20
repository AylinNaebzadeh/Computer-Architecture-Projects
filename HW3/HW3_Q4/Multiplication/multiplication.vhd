----------------------------------------------------------------------------------
-- https://www.tutorialspoint.com/two-s-complement#:~:text=To%20get%202's%20complement%20of,01101)%20%2B%201%20%3D%2001110.
-- https://stackoverflow.com/questions/20428277/twos-complement-vhdl
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity multiplication is
    Port ( multiplicand : in  STD_LOGIC_VECTOR (15 downto 0);
           multiplier : in  STD_LOGIC_VECTOR (5 downto 0);
           product : out  STD_LOGIC_VECTOR (15 downto 0));
end multiplication;

architecture Behavioral of multiplication is

	--signal tmp : std_logic_vector(15 downto 0);

begin
	process(multiplicand, multiplier)
		variable tmp_product : std_logic_vector(15 downto 0);
		variable shifted_multiplicand : std_logic_vector(15 downto 0);
		variable shifted_multiplier : std_logic_vector (5 downto 0);
		
	begin
		shifted_multiplier := multiplier;
		shifted_multiplicand := multiplicand;
		tmp_product := "0000000000000000";
		
		for i in 0 to 16 loop
			if (shifted_multiplier(0) = '1') then
				tmp_product := tmp_product + shifted_multiplicand;
			end if;
			-- shift multiplicand 1 bit to the left
			shifted_multiplicand := shifted_multiplicand(14 downto 0) & '0';
			-- shift multiplier 1 bit to the right
			shifted_multiplier := '0' & shifted_multiplier(5 downto 1);
		end loop;
		if (multiplier(5) /= multiplicand(15)) then
			--tmp <= not tmp_product;
			tmp_product := std_logic_vector(not tmp_product + 1);
		end if;
		
		-- if (multiplier(5) = multiplicand(15)) then
			-- tmp_product(15) := '0';
		-- end if;
		
		product <= tmp_product;
	end process;

end Behavioral;

