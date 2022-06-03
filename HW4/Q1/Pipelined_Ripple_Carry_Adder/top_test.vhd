--------------------------------------------------------------------------------
-- Create Date:   16:43:36 06/03/2022
-- Module Name:   D:/CA/HW4_implementations/Q1/Pipelined_Ripple_Carry_Adder/top_test.vhd
-- Project Name:  Pipelined_Ripple_Carry_Adder

-- VHDL Test Bench Created by ISE for module: Top

--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY top_test IS
END top_test;
 
ARCHITECTURE behavior OF top_test IS 
 
    COMPONENT Top
    PORT(
         i_number_a : IN  std_logic_vector(3 downto 0);
         i_number_b : IN  std_logic_vector(3 downto 0);
         o_result : OUT  std_logic_vector(3 downto 0);
         CLK : IN  std_logic;
         RST : IN  std_logic;
         CarryIn : IN  std_logic;
         CarryOut : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal i_number_a : std_logic_vector(3 downto 0) := (others => '0');
   signal i_number_b : std_logic_vector(3 downto 0) := (others => '0');
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal CarryIn : std_logic := '0';

 	--Outputs
   signal o_result : std_logic_vector(3 downto 0);
   signal CarryOut : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Top PORT MAP (
          i_number_a => i_number_a,
          i_number_b => i_number_b,
          o_result => o_result,
          CLK => CLK,
          RST => RST,
          CarryIn => CarryIn,
          CarryOut => CarryOut
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
	
	RST <= '1', '0' after CLK_period / 2;

   -- Stimulus process
   --stim_proc: process
   --begin		
      -- hold reset state for 100 ns.
      --wait for 100 ns;
		
		--i_number_a <= "1011";
		--i_number_b <= "0001";
		--CarryIn <= '0';
		
      --wait for 10 ns;
		
		--i_number_a <= "1001";
		--i_number_b <= "0001";
		--CarryIn <= '0';
		
      --wait for 10 ns;
		
		--i_number_a <= "1000";
		--i_number_b <= "0001";
		--CarryIn <= '1';
		
      --wait for 10 ns;

      -- insert stimulus here 

      --wait;
   --end process;
	
	Q1_test : process
		constant period: time := 20 ns;
		begin
		i_number_a <= "1011";
		i_number_b <= "0001";
		CarryIn <= '0';
		
		wait for period;
		assert ((o_result = "1100") and (CarryOut = '0'))
		report "the first case failed" severity error;
		
		i_number_a <= "1000";
		i_number_b <= "0001";
		CarryIn <= '0';
		
		wait for period;
		assert ((o_result = "1001") and (CarryOut = '0'))
		report "the second case failed" severity error;
		end process;

END;
