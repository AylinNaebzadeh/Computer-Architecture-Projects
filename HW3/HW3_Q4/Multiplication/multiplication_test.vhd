--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

 
ENTITY multiplication_test IS
END multiplication_test;
 
ARCHITECTURE behavior OF multiplication_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT multiplication
    PORT(
         multiplicand : IN  std_logic_vector(15 downto 0);
         multiplier : IN  std_logic_vector(5 downto 0);
         product : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal multiplicand : std_logic_vector(15 downto 0) := (others => '0');
   signal multiplier : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal product : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clock_period : time := 10 ns;
	signal clk : bit;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: multiplication PORT MAP (
          multiplicand => multiplicand,
          multiplier => multiplier,
          product => product
        );

   -- Clock process definitions
   --clock_process :process
   --begin
		--clk <= '0';
		--wait for clock_period/2;
		--clk <= '1';
		--wait for clock_period/2;
   --end process;
 

   -- Stimulus process
   --stim_proc: process
   --begin		
      -- hold reset state for 100 ns.
      --wait for 100 ns;	

		--multiplicand <= "0000000000000111";
		--multiplier <= "000111";
		
		
      --wait for clock_period*10;
		
		--multiplicand <= "0000000000000011";
		--multiplier <= "000011";
		
		
		--wait for clock_period*10;
		
		--multiplicand <= "0000000000001011";
		--multiplier <= "000111";
		
		--wait for clock_period*10;
		
		--multiplicand <= "0000000000001011";
		--multiplier <= "000000";

      --wait;
   --end process;
	
	test_case1 : process
		constant period : time := 20 ns;
		begin
			multiplicand <= "0000000000000111";
			multiplier <= "000111";
			wait for period;
			assert (product = "0000000000110001")
			report " test 1 failed :( ";
			
			multiplicand <= "0000000000000011";
			multiplier <= "000011";
			wait for period;
			assert (product = "0000000000001001")
			report " test 2 failed :( ";
			
			
			multiplicand <= "0000000000001011";
			multiplier <= "000111";
			wait for period;
			assert (product = "0000000001001101")
			report " test 3 failed :( ";
			
			
			multiplicand <= "0000000000001011";
			multiplier <= "000000";
			wait for period;
			assert (product = "0000000000000000")
			report " test 4 failed :( ";
			
			wait;
		end process;
END;
