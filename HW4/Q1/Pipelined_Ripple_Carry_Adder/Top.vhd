----------------------------------------------------------------------------------
-- Create Date:    14:25:52 06/03/2022 

-- Module Name:    Top - Behavioral 
-- Project Name: 

-- Additional Comments: 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity Top is
    Port ( i_add_term1 : in  STD_LOGIC_VECTOR (3 downto 0);
           i_add_term2 : in  STD_LOGIC_VECTOR (3 downto 0);
           o_result : out  STD_LOGIC_VECTOR (3 downto 0);
			  CLK, RST, CarryIn : in STD_LOGIC;
			  CarryOut : out STD_LOGIC
			);
end Top;

architecture Behavioral of Top is

begin


end Behavioral;

