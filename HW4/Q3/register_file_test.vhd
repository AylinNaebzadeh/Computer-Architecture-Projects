--------------------------------------------------------------------------------
-- Create Date:   19:16:05 06/04/2022
  
-- Module Name:   D:/CA/HW4_implementations/Q3/RegisterFile/register_file_test.vhd
-- Project Name:  RegisterFile

-- Description:   

--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY register_file_test IS
END register_file_test;
 
ARCHITECTURE behavior OF register_file_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Register_File
    PORT(
         clk : IN  std_logic;
         ReadReg1 : IN  std_logic_vector(7 downto 0);
         ReadReg2 : IN  std_logic_vector(7 downto 0);
         WriteReg : IN  std_logic_vector(7 downto 0);
         WriteData : IN  std_logic_vector(7 downto 0);
         WriteEnable : IN  std_logic;
         AsynchRST : IN  std_logic;
         ReadData1 : OUT  std_logic_vector(7 downto 0);
         ReadData2 : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal ReadReg1 : std_logic_vector(7 downto 0) := (others => '0');
   signal ReadReg2 : std_logic_vector(7 downto 0) := (others => '0');
   signal WriteReg : std_logic_vector(7 downto 0) := (others => '0');
   signal WriteData : std_logic_vector(7 downto 0) := (others => '0');
   signal WriteEnable : std_logic := '0';
   signal AsynchRST : std_logic := '0';

 	--Outputs
   signal ReadData1 : std_logic_vector(7 downto 0);
   signal ReadData2 : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Register_File PORT MAP (
          clk => clk,
          ReadReg1 => ReadReg1,
          ReadReg2 => ReadReg2,
          WriteReg => WriteReg,
          WriteData => WriteData,
          WriteEnable => WriteEnable,
          AsynchRST => AsynchRST,
          ReadData1 => ReadData1,
          ReadData2 => ReadData2
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
		
		AsynchRST <= '0';
		WriteEnable <= '1';
		ReadReg1 <= "00001001";
		ReadReg2 <= "00000011";
		WriteReg <= "10001001";
		WriteData <= "01100001";
		
		wait for 100 ns;
		AsynchRST <= '0';
		WriteEnable <= '0';
		ReadReg1 <= "00001001";
		ReadReg2 <= "00000011";
		WriteReg <= "10001001";
		WriteData <= "01100001";
      wait;
   end process;

END;
