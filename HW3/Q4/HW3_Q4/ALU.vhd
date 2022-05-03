----------------------------------------------------------------------------------
-- This file is for implementing the ALU. It only has to add 2 numbers, when the Mlier(0) = 1;
-- I have test this component in new_alu_test.vhd
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity ALU is
    Port ( Ci: in std_logic;
			  Co: out std_logic;
			  Mcand : in  signed (15 downto 0);
           Product : in  signed (15 downto 0);
			  NewProduct : out signed (15 downto 0));
end ALU;

architecture Behavioral of ALU is

signal Couts: std_logic_vector(14 downto 0);

begin
	FA1: entity work.FullAdder PORT MAP(
		A => Mcand(0),
		B => Product(0),
		Cin => Ci,
		sum => NewProduct(0),
		Cout => Couts(0)
	);
	FA2: entity work.FullAdder PORT MAP(
		A => Mcand(1),
		B => Product(1),
		Cin => Couts(0),
		sum => NewProduct(1),
		Cout => Couts(1)
	);
	FA3: entity work.FullAdder PORT MAP(
		A => Mcand(2),
		B => Product(2),
		Cin => Couts(1),
		sum => NewProduct(2),
		Cout => Couts(2)
	);
	FA4: entity work.FullAdder PORT MAP(
		A => Mcand(3),
		B => Product(3),
		Cin => Couts(2),
		sum => NewProduct(3),
		Cout => Couts(3)
	);
	FA5: entity work.FullAdder PORT MAP(
		A => Mcand(4),
		B => Product(4),
		Cin => Couts(3),
		sum => NewProduct(4),
		Cout => Couts(4)
	);
	FA6: entity work.FullAdder PORT MAP(
		A => Mcand(5),
		B => Product(5),
		Cin => Couts(4),
		sum => NewProduct(5),
		Cout => Couts(5)
	);
	FA7: entity work.FullAdder PORT MAP(
		A => Mcand(6),
		B => Product(6),
		Cin => Couts(5),
		sum => NewProduct(6),
		Cout => Couts(6)
	);
	FA8: entity work.FullAdder PORT MAP(
		A => Mcand(7),
		B => Product(7),
		Cin => Couts(6),
		sum => NewProduct(7),
		Cout => Couts(7)
	);
	FA9: entity work.FullAdder PORT MAP(
		A => Mcand(8),
		B => Product(8),
		Cin => Couts(7),
		sum => NewProduct(8),
		Cout => Couts(8)
	);
	FA10: entity work.FullAdder PORT MAP(
		A => Mcand(9),
		B => Product(9),
		Cin => Couts(8),
		sum => NewProduct(9),
		Cout => Couts(9)
	);
	FA11: entity work.FullAdder PORT MAP(
		A => Mcand(10),
		B => Product(10),
		Cin => Couts(9),
		sum => NewProduct(10),
		Cout => Couts(10)
	);
	FA12: entity work.FullAdder PORT MAP(
		A => Mcand(11),
		B => Product(11),
		Cin => Couts(10),
		sum => NewProduct(11),
		Cout => Couts(11) 
	);
	FA13: entity work.FullAdder PORT MAP(
		A => Mcand(12),
		B => Product(12),
		Cin => Couts(11),
		sum => NewProduct(12),
		Cout => Couts(12)
	);
	FA14: entity work.FullAdder PORT MAP(
		A => Mcand(13),
		B => Product(13),
		Cin => Couts(12),
		sum => NewProduct(13),
		Cout => Couts(13)
	);
	FA15: entity work.FullAdder PORT MAP(
		A => Mcand(14),
		B => Product(14),
		Cin => Couts(13),
		sum => NewProduct(14),
		Cout => Couts(14) 
	);
	FA16: entity work.FullAdder PORT MAP(
		A => Mcand(15),
		B => Product(15),
		Cin => Couts(14),
		sum => NewProduct(15),
		Cout => Co
	);
end Behavioral;

