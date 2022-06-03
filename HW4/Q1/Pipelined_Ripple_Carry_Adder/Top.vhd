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
    Port ( i_number_a : in  STD_LOGIC_VECTOR (3 downto 0);
           i_number_b : in  STD_LOGIC_VECTOR (3 downto 0);
           o_result : out  STD_LOGIC_VECTOR (3 downto 0);
			  CLK, RST, CarryIn : in STD_LOGIC;
			  CarryOut : out STD_LOGIC
			);
end Top;

architecture Behavioral of Top is
	signal tmp_cout : std_logic_vector(3 downto 0); -- C3, C2, C1, C0
	signal tmp_cin : std_logic_vector(2 downto 0); -- C2, C1, C0
	
	signal tmp_result0 : std_logic_vector(3 downto 0);
	signal tmp_result1 : std_logic_vector(2 downto 0);
	signal tmp_result2 : std_logic_vector(1 downto 0);
	signal tmp_result3 : std_logic;
	
	signal tmp_a1 : std_logic;
	signal tmp_a2 : std_logic_vector(1 downto 0);
	signal tmp_a3 : std_logic_vector(2 downto 0);
	
	signal tmp_b1 : std_logic;
	signal tmp_b2 : std_logic_vector(1 downto 0);
	signal tmp_b3 : std_logic_vector(2 downto 0);
begin
	reg_res0_0: entity work.DFF PORT MAP(
		D => tmp_result0(0),
		clk => CLK,
		reset => RST,
		Q => tmp_result0(1)
	);
	reg_res0_1: entity work.DFF PORT MAP(
		D => tmp_result0(1),
		clk => CLK,
		reset => RST,
		Q => tmp_result0(2)
	);	
	reg_res0_2: entity work.DFF PORT MAP(
		D => tmp_result0(2),
		clk => CLK,
		reset => RST,
		Q => tmp_result0(3)
	);	
	reg_res0_3: entity work.DFF PORT MAP(
		D => tmp_result0(3),
		clk => CLK,
		reset => RST,
		Q => o_result(0)
	);
	-- ********************************
	reg_res1_0: entity work.DFF PORT MAP(
		D => tmp_result1(0),
		clk => CLK,
		reset => RST,
		Q => tmp_result1(1)
	);	
	reg_res1_1: entity work.DFF PORT MAP(
		D => tmp_result1(1),
		clk => CLK,
		reset => RST,
		Q => tmp_result1(2)
	);	
	reg_res1_2: entity work.DFF PORT MAP(
		D => tmp_result1(2),
		clk => CLK,
		reset => RST,
		Q => o_result(1)
	);
	-- ********************************
	reg_res2_0: entity work.DFF PORT MAP(
		D => tmp_result2(0),
		clk => CLK,
		reset => RST,
		Q => tmp_result2(1)
	);	
	reg_res2_1: entity work.DFF PORT MAP(
		D => tmp_result2(1),
		clk => CLK,
		reset => RST,
		Q => o_result(2)
	);
	-- ********************************
	reg_res3_1: entity work.DFF PORT MAP(
		D => tmp_result3,
		clk => CLK,
		reset => RST,
		Q => o_result(3)
	);
	-- ********************************
	reg_cout0: entity work.DFF PORT MAP(
		D => tmp_cout(0),
		clk => CLK,
		reset => RST,
		Q => tmp_cin(0)
	);
	reg_cout1: entity work.DFF PORT MAP(
		D => tmp_cout(1),
		clk => CLK,
		reset => RST,
		Q => tmp_cin(1)
	);	
	reg_cout2: entity work.DFF PORT MAP(
		D => tmp_cout(2),
		clk => CLK,
		reset => RST,
		Q => tmp_cin(2)
	);	
	reg_cout3: entity work.DFF PORT MAP(
		D => tmp_cout(3),
		clk => CLK,
		reset => RST,
		Q => CarryOut
	);
	-- ********************************
	reg_a1: entity work.DFF PORT MAP(
		D => i_number_a(1),
		clk => CLK,
		reset => RST,
		Q => tmp_a1
	);	
	reg_b1: entity work.DFF PORT MAP(
		D => i_number_b(1),
		clk => CLK,
		reset => RST,
		Q => tmp_b1
	);
	-- ********************************
	reg_a2_0: entity work.DFF PORT MAP(
		D => i_number_a(2),
		clk => CLK,
		reset => RST,
		Q => tmp_a2(0)
	);	
	reg_b2_0: entity work.DFF PORT MAP(
		D => i_number_b(2),
		clk => CLK,
		reset => RST,
		Q => tmp_b2(0)
	);
	reg_a2_1: entity work.DFF PORT MAP(
		D => tmp_a2(0),
		clk => CLK,
		reset => RST,
		Q => tmp_a2(1)
	);	
	reg_b2_1: entity work.DFF PORT MAP(
		D => tmp_b2(0),
		clk => CLK,
		reset => RST,
		Q => tmp_b2(1)
	);
	-- ********************************
	reg_a3_0: entity work.DFF PORT MAP(
		D => i_number_a(3),
		clk => CLK,
		reset => RST,
		Q => tmp_a3(0)
	);	
	reg_b3_0: entity work.DFF PORT MAP(
		D => i_number_b(3),
		clk => CLK,
		reset => RST,
		Q => tmp_b3(0)
	);
	reg_a3_1: entity work.DFF PORT MAP(
		D => tmp_a3(0),
		clk => CLK,
		reset => RST,
		Q => tmp_a3(1)
	);	
	reg_b3_1: entity work.DFF PORT MAP(
		D => tmp_b3(0),
		clk => CLK,
		reset => RST,
		Q => tmp_b3(1)
	);
	reg_a3_2: entity work.DFF PORT MAP(
		D => tmp_a3(1),
		clk => CLK,
		reset => RST,
		Q => tmp_a3(2)
	);	
	reg_b3_2: entity work.DFF PORT MAP(
		D => tmp_b3(1),
		clk => CLK,
		reset => RST,
		Q => tmp_b3(2)
	);
	-- ********************************
	FA_1 : entity work.FA PORT MAP(
		A => i_number_a(0),
		B => i_number_b(0),
		Cin => CarryIn,
		S => tmp_result0(0),
		Cout => tmp_cout(0)
	);
	FA_2 : entity work.FA PORT MAP(
		A => tmp_a1,
		B => tmp_b1,
		Cin => tmp_cin(0),
		S => tmp_result1(0),
		Cout => tmp_cout(1)
	);
	FA_3 : entity work.FA PORT MAP(
		A => tmp_a2(1),
		B => tmp_b2(1),
		Cin => tmp_cin(1),
		S => tmp_result2(0),
		Cout => tmp_cout(2)
	);
	FA_4: entity work.FA PORT MAP(
		A => tmp_a3(2),
		B => tmp_b3(2),
		Cin => tmp_cin(2),
		S => tmp_result3,
		Cout => tmp_cout(3)
	);
	
end Behavioral;

