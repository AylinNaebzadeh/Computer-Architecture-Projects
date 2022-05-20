----------------------------------------------------------------------------------
-- the final remainder will be stored in the LHS of dividend/remainder
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Division is
    Port ( divisor : in  signed (31 downto 0);
           dividend : in  signed (31 downto 0);
           remainder : out  signed (31 downto 0);
           quotient : out  signed (31 downto 0));
end Division;

architecture Behavioral of Division is

	signal shifted_quotient : signed (31 downto 0);
	signal dividend_remainder : signed (63 downto 0);
	signal subtraction : signed (31 downto 0);

begin

	process (shifted_quotient, dividend_remainder, subtraction)
		
	begin
		-- step 0 - initialize step
		subtraction <= (others => '0');
		shifted_quotient <= (others => '0');
		dividend_remainder <= "00000000000000000000000000000000" & dividend;
		
		-- the loop is iterated for 33 times
		
		for i in 0 to 32 loop
			subtraction <= dividend_remainder(63 downto 32) - divisor;
			
			if (subtraction < 0) and (i /= 32) then
				-- shift dividend/remainder one bit to the left
				dividend_remainder <= dividend_remainder sll 1;
				-- shift quotient one bit to the left and set the LSB to 0
				shifted_quotient <= shifted_quotient sll 1;
			end if;
			
			if (subtraction > 0) and (i /= 32) then
					dividend_remainder(63 downto 32) <= dividend_remainder(63 downto 32) - divisor;
					-- shift dividend/remainder one bit to the left
					dividend_remainder <= dividend_remainder sll 1;
					-- shift quotient one bit to the left, but this time set the LSB to 1
					shifted_quotient <= shifted_quotient sll 1;
					shifted_quotient(0) <= '1';
			end if;
			
			if (subtraction < 0) and (i = 32) then
				-- shift quotient one bit to the left and set the LSB to 0
				shifted_quotient <= shifted_quotient sll 1;
			end if;
			
			if (subtraction > 0) and (i = 32) then
					-- dividend_remainder(63 downto 32) <= dividend_remainder(63 downto 32) - divisor;
					-- shift quotient one bit to the left, but this time set the LSB to 1
					shifted_quotient <= shifted_quotient sll 1;
					shifted_quotient(0) <= '1';
			end if;
			
		end loop;
		
		quotient <= shifted_quotient;
		remainder <= dividend_remainder(63 downto 32);

	end process;

end Behavioral;

