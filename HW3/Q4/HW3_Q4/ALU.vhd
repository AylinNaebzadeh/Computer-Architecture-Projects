----------------------------------------------------------------------------------
-- This file is for implementing the ALU. It only has to add to numbers, when the Mlier(0) = 1;
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity ALU is
    Port ( Ci: in std_logic;
			  Co: out std_logic;
			  Mcand : in  signed (15 downto 0);
           Product : inout  signed (15 downto 0));
end ALU;

architecture Behavioral of ALU is

signal Couts: std_logic_vector(14 downto 0);

begin
	FA1: entity work.FullAdder PORT MAP(
		A => Mcand(0),
		B => Product(0),
		Cin => Ci,
		sum => Product(0),
		Cout => Couts(0)
	);
	FA2: entity work.FullAdder PORT MAP(
		A => Mcand(1),
		B => Product(1),
		Cin => Couts(0),
		sum => Product(1),
		Cout => Couts(1)
	);
	FA3: entity work.FullAdder PORT MAP(
		A => Mcand(2),
		B => Product(2),
		Cin => Couts(1),
		sum => Product(2),
		Cout => Couts(2)
	);
	FA4: entity work.FullAdder PORT MAP(
		A => Mcand(3),
		B => Product(3),
		Cin => Couts(2),
		sum => Product(3),
		Cout => Couts(3)
	);
	FA5: entity work.FullAdder PORT MAP(
		A => ,
		B => ,
		Cin => ,
		sum => ,
		Cout => 
	);
	FA6: entity work.FullAdder PORT MAP(
		A => ,
		B => ,
		Cin => ,
		sum => ,
		Cout => 
	);
	FA7: entity work.FullAdder PORT MAP(
		A => ,
		B => ,
		Cin => ,
		sum => ,
		Cout => 
	);
	FA8: entity work.FullAdder PORT MAP(
		A => ,
		B => ,
		Cin => ,
		sum => ,
		Cout => 
	);
	FA9: entity work.FullAdder PORT MAP(
		A => ,
		B => ,
		Cin => ,
		sum => ,
		Cout => 
	);
	FA10: entity work.FullAdder PORT MAP(
		A => ,
		B => ,
		Cin => ,
		sum => ,
		Cout => 
	);
	FA11: entity work.FullAdder PORT MAP(
		A => ,
		B => ,
		Cin => ,
		sum => ,
		Cout => 
	);
	FA12: entity work.FullAdder PORT MAP(
		A => ,
		B => ,
		Cin => ,
		sum => ,
		Cout => 
	);
	FA13: entity work.FullAdder PORT MAP(
		A => ,
		B => ,
		Cin => ,
		sum => ,
		Cout => 
	);
	FA14: entity work.FullAdder PORT MAP(
		A => ,
		B => ,
		Cin => ,
		sum => ,
		Cout => 
	);
	FA15: entity work.FullAdder PORT MAP(
		A => ,
		B => ,
		Cin => ,
		sum => ,
		Cout => 
	);
	FA16: entity work.FullAdder PORT MAP(
		A => ,
		B => ,
		Cin => ,
		sum => ,
		Cout => 
	);
end Behavioral;

