--------------------------------------------------------------------------------
-- Create Date:   12:32:44 06/04/2022
-- Design Name:   
-- Module Name:   D:/CA/HW4_implementations/Q2/Find_LE_Prime_Number/prime_test.vhd
-- Project Name:  Find_LE_Prime_Number
 
-- 
-- VHDL Test Bench Created by ISE for module: SieveAlgorithm
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY prime_test IS
END prime_test;
 
ARCHITECTURE behavior OF prime_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SieveAlgorithm
    PORT(
         input : IN  std_logic_vector(9 downto 0);
         start : IN  std_logic;
         clk : IN  std_logic;
         output : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic_vector(9 downto 0) := (others => '0');
   signal start : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal output : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SieveAlgorithm PORT MAP (
          input => input,
          start => start,
          clk => clk,
          output => output
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		input <= "0000000100";
		start <= '1';
		wait for 100 ns;
		
		input <= "0000000110";
		start <= '1';
      wait for clk_period*10;
		
		input <= "0000010110";
		start <= '1';
      -- insert stimulus here 

      wait;
   end process;

END;
