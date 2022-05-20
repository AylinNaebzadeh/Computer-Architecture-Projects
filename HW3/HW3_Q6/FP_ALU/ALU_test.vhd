--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY ALU_test IS
END ALU_test;
 
ARCHITECTURE behavior OF ALU_test IS 
 
 
    COMPONENT TopModule
    PORT(
         Opcode : IN  std_logic;
         clock : IN  std_logic;
         reset : IN  std_logic;
         first_number : IN  std_logic_vector(15 downto 0);
         second_number : IN  std_logic_vector(15 downto 0);
         final_result : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal tb_Opcode : std_logic := '0';
   signal tb_clock : std_logic := '0';
   signal tb_reset : std_logic := '0';
   signal tb_first_number : std_logic_vector(15 downto 0) := (others => '0');
   signal tb_second_number : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal tb_final_result : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
	signal clk: bit;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TopModule PORT MAP (
          Opcode => tb_Opcode,
          clock => tb_clock,
          reset => tb_reset,
          first_number => tb_first_number,
          second_number => tb_second_number,
          final_result => tb_final_result
        );

   -- Clock process definitions
   clock_process : process
   begin
		tb_clock <= '0';
		wait for clock_period/2;
		tb_clock <= '1';
		wait for clock_period/2;
   end process;
	
	reset_process : process
	begin
		tb_reset <= '0';
		wait for 10 * clock_period;
		tb_reset <= '1';
	end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		-- Multiplier
		tb_Opcode <= '1';
		tb_first_number <= "1000010010001000";
      tb_second_number <= "0111000011100011";
      wait for clock_period*10;
		-- Adder
		tb_Opcode <= '0';
      tb_first_number <= "1000010010001000";
      tb_second_number <= "0111000011100011";

      wait;
   end process;

END;
