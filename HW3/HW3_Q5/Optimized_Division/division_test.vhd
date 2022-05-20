--------------------------------------------------------------------------------

--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


 

 
ENTITY division_test IS
END division_test;
 
ARCHITECTURE behavior OF division_test IS 
 
    
 
    COMPONENT Division
    PORT(
         divisor : IN  signed(31 downto 0);
         dividend : IN  signed(31 downto 0);
         remainder : OUT  signed(31 downto 0);
         quotient : OUT  signed(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal divisor : signed(31 downto 0) := (others => '0');
   signal dividend : signed(31 downto 0) := (others => '0');

 	--Outputs
   signal remainder : signed(31 downto 0);
   signal quotient : signed(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clock_period : time := 10 ns;
	signal clk : bit;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Division PORT MAP (
          divisor => divisor,
          dividend => dividend,
          remainder => remainder,
          quotient => quotient
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
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		dividend <= "00000000000000000000000000001001"; --9
		divisor <= "00000000000000000000000000000011"; --3
		
		
      wait for clock_period*10;
		
		dividend <= "00000000000000000000000000001111"; --15
		divisor <= "00000000000000000000000000000010"; --2
		


      wait;
   end process;

END;
