--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY HMLogic_test IS
END HMLogic_test;
 
ARCHITECTURE behavior OF HMLogic_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT HMLogic
    PORT(
         tag : IN  std_logic_vector(3 downto 0);
         w0 : IN  std_logic_vector(4 downto 0);
         w1 : IN  std_logic_vector(4 downto 0);
         hit : OUT  std_logic;
         w0_valid : OUT  std_logic;
         w1_valid : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal tag : std_logic_vector(3 downto 0) := (others => '0');
   signal w0 : std_logic_vector(4 downto 0) := (others => '0');
   signal w1 : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal hit : std_logic;
   signal w0_valid : std_logic;
   signal w1_valid : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   -- constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: HMLogic PORT MAP (
          tag => tag,
          w0 => w0,
          w1 => w1,
          hit => hit,
          w0_valid => w0_valid,
          w1_valid => w1_valid
        );

   -- Clock process definitions
   --clock_process :process
   --begin
		--clock <= '0';
		--wait for clock_period/2;
		--clock <= '1';
		--wait for clock_period/2;
   --end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      --wait for clock_period*10;

      -- insert stimulus here 

		tag <= "0000";
		w0 <= "10101";
		w1 <= "10010";
		
      wait;
   end process;

END;
