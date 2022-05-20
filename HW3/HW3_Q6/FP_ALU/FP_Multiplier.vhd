----------------------------------------------------------------------------------
-- In this floating point format, the exponent has 7 bits 
										-- the fraction has 8 bits
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity FP_Multiplier is
    Port ( number_a : in  STD_LOGIC_VECTOR (15 downto 0);
           number_b : in  STD_LOGIC_VECTOR (15 downto 0);
           result : out  STD_LOGIC_VECTOR (15 downto 0));
end FP_Multiplier;

architecture Behavioral of FP_Multiplier is

begin
	process (number_a, number_b)
		variable a_fraction : std_logic_vector(7 downto 0);
		variable a_exponent : std_logic_vector(6 downto 0);
		variable a_sign : std_logic;
		
		variable b_fraction : std_logic_vector(7 downto 0);
		variable b_exponent : std_logic_vector(6 downto 0);
		variable b_sign : std_logic;
		
		variable res_fraction : std_logic_vector(7 downto 0);
		variable res_exponent : std_logic_vector(6 downto 0);
		variable res_sign : std_logic;
		
		variable aux : std_logic;
		variable aux2 :std_logic_vector(17 downto 0);
		
		variable exponents_sum : std_logic_vector(7 downto 0);
		
	begin

		a_fraction := number_a(7 downto 0);
		a_exponent := number_a(14 downto 8);
		a_sign := number_a(15);
		
		b_fraction := number_b(7 downto 0);
		b_exponent := number_b(14 downto 8);
		b_sign := number_b(15);
		
		-- check for Nan result
		if (to_integer(unsigned(a_exponent)) = 127 or to_integer(unsigned(b_exponent)) = 127) then
			res_exponent := "1111111";
			res_fraction := (others => '0');
			res_sign := a_sign xor b_sign;
			
		elsif (to_integer(unsigned(a_exponent)) = 0 or to_integer(unsigned(b_exponent)) = 0) then
			res_exponent := (others => '0');
			res_fraction := (others => '0');
			res_sign := '0';
		else
			aux2 := ('1' & a_fraction) * ('1' & b_fraction);
			if (aux2(17) = '1') then
				res_fraction := aux2(17 downto 10) + aux2(9);
				aux := '1';
			else
				res_fraction := aux2(16 downto 9) + aux2(8);
				aux := '0';
			end if;
			
			exponents_sum := ('0' & a_exponent) + ('0' & b_exponent) + aux - 63;
			
			if (exponents_sum(7) = '1') then
				if (exponents_sum(6) = '0') then -- checking for overflow
					res_exponent := "1111111";
					res_fraction := (others => '0');
					res_sign := a_sign xor b_sign;
				else										-- checking for underflow
					res_exponent := (others => '0');
					res_fraction := (others => '0');
					res_sign := '0';
				end if;
			else 
				res_exponent := exponents_sum(6 downto 0);
				res_sign := a_sign xor b_sign;
			end if;
		end if;
		
		result(7 downto 0) <= res_fraction;
		result(14 downto 8) <= res_exponent;
		result(15) <= res_sign;
		
	end process;

end Behavioral;

