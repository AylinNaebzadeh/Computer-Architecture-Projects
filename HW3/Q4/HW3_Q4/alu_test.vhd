--------------------------------------------------------------------------------
-- This file is for testing the correctness of ALU(16 bit full adder)
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
 
ENTITY alu_test IS
END alu_test;
 
ARCHITECTURE behavior OF alu_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         Ci : IN  std_logic;
         Co : OUT  std_logic;
         Mcand : IN  signed(15 downto 0);
         Product : INOUT  signed(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Ci : std_logic := '0';
   signal Mcand : signed(15 downto 0) := "0000000000000000";

	--BiDirs
   signal Product : signed(15 downto 0) := "0000000000000000";

 	--Outputs
   signal Co : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clock_period : time := 10 ns;
	signal clk: std_logic;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          Ci => Ci,
          Co => Co,
          Mcand => Mcand,
          Product => Product
        );

   -- Clock process definitions
   clock_process :process
   begin
		clk <= '0';
		wait for clock_period/2;
		clk <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc_1: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		Mcand <= "0000000010001100";
      wait for clock_period*10;
		Mcand <= "0001000110000000";
      -- insert stimulus here 

      wait for clock_period*10;
   end process;
	
	stim_proc_2: process
   begin		
      -- hold reset state for 100 ns.
      wait for 200 ns;	
		Product <= "0000000000000000";
      wait for clock_period*20;
		Product <= "0000010001100000";
      -- insert stimulus here 

      wait for clock_period*20;
   end process;

END;
