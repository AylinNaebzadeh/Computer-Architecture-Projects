----------------------------------------------------------------------------------
-- Create Date:    20:00:14 06/03/2022 
-- Design Name: 
-- Module Name:    SieveAlgorithm - Behavioral 

-- Description: Design a datapath and controller for the following circuit specification. 
-- The circuit receives a 10-bit number bigger than one and generates a prime number less than-or-equal to the input number. 
-- The circuit has a start signal such that when the start signal becomes one, the circuit starts finding the output.

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity SieveAlgorithm is
    Port ( input : in  STD_LOGIC_VECTOR (9 downto 0);
           start : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           output : out  STD_LOGIC);
end SieveAlgorithm;

architecture Behavioral of SieveAlgorithm is
	-- input = 15 --> 0, 1, 2, 3, 4, ..., 15
	type memory is array (0 to 100) of std_logic;
	signal primes : memory;
	
	
begin
	process (clk)
	variable index : integer := 0;
	begin
		if start = '1' then
			if rising_edge(clk) then
				if (index < (to_integer(unsigned(input)) + 1)) then
					primes(index) <= '1';
					index := index + 1;
				end if;
			end if;
			
			primes(0) <= '0';
			primes(1) <= '0';
			
			for i in 2 to 100 loop 
				if primes(i) = '1' then
					for ii in i to 100  loop
						if i * ii <  to_integer(unsigned(input)) then
							primes(i * ii) <= '0';
						else
							exit;
						end if;
					end loop;
				end if;
			end loop;
			
			for j in 100 downto 0 loop
				if primes(j) = '1' then
					output <= primes(j);
					exit;
				end if;
			end loop;
		end if;
	end process;
	
	
end Behavioral;

