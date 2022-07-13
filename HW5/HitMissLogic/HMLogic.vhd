----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity HMLogic is
    Port ( tag : in  STD_LOGIC_VECTOR (3 downto 0);
           w0 : in  STD_LOGIC_VECTOR (4 downto 0);
           w1 : in  STD_LOGIC_VECTOR (4 downto 0);
           hit : out  STD_LOGIC;
           w0_valid : out  STD_LOGIC;
           w1_valid : out  STD_LOGIC);
end HMLogic;

architecture Behavioral of HMLogic is

begin

	hit <= '1' when '1' & tag = w0 or '1' & tag = w1 else '0';
	w0_valid <= '1' when w0 = '1' & tag else '0';
	w1_valid <= '1' when w1 = '1' & tag else '0';

end Behavioral;

