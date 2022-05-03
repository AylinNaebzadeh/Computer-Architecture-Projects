--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY new_alu_test IS
END new_alu_test;
 
ARCHITECTURE behavior OF new_alu_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         Ci : IN  std_logic;
         Co : OUT  std_logic;
         Mcand : IN  signed(15 downto 0);
         Product : IN  signed(15 downto 0);
         NewProduct : OUT  signed(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Ci : std_logic := '0';
   signal Mcand : signed(15 downto 0) := (others => '0');
   signal Product : signed(15 downto 0) := (others => '0');

 	--Outputs
   signal Co : std_logic;
   signal NewProduct : signed(15 downto 0);

 
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          Ci => Ci,
          Co => Co,
          Mcand => Mcand,
          Product => Product,
          NewProduct => NewProduct
        );

	tb1: process
	constant period: time:= 20ns;
	begin
		Ci <= '0';
		Mcand <= "0000000010001100";
		Product <= "0000000000000000";
		wait for period;
		assert ( NewProduct = "0000000010001100" )
		report "First test failed:(" severity error;
		
		Ci <= '0';
		Mcand <= "0001000110000000";
		Product <= "0000010001100000";
		wait for period;
		assert ( NewProduct = "0001010111100000" )
		report "Second test failed:(" severity error;		
	end process;

END;
