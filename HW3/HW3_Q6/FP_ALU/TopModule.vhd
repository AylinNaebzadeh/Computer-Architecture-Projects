----------------------------------------------------------------------------------
-- This file works as main function, and the start point of the program
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TopModule is
    Port ( Opcode : in  STD_LOGIC;
           clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           first_number : in  STD_LOGIC_VECTOR (15 downto 0);
           second_number : in  STD_LOGIC_VECTOR (15 downto 0);
			  final_result : out STD_LOGIC_VECTOR (15 downto 0) );
end TopModule;

architecture Behavioral of TopModule is
	signal initiate : std_logic := '0';
	signal finish : std_logic := '0';
	signal adder_result : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
	signal multiplier_result : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
begin

	Multiplier: entity work.FP_Multiplier PORT MAP(
		number_a => first_number,
		number_b => second_number,
		result => multiplier_result
	);
	
	Adder: entity work.FP_Adder PORT MAP(
		number_a => first_number,
		number_b => second_number,
		clk => clock,
		reset => reset,
		start => initiate,
		done => finish,
		result => adder_result
	);
	
	final_result <= adder_result when Opcode = '0' else multiplier_result;
end Behavioral;

