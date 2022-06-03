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
           output : in  STD_LOGIC);
end SieveAlgorithm;

architecture Behavioral of SieveAlgorithm is
	-- input = 15 --> 0, 1, 2, 3, 4, ..., 15
	type memory is array (0 to input' Length) of std_logic;
	signal primes : memory;
	
	
begin


end Behavioral;

