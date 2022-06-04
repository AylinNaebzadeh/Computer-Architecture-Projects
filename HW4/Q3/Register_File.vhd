----------------------------------------------------------------------------------
-- Create Date:    13:17:04 06/04/2022 
-- Design Name: 
-- Module Name:    Register_File - Behavioral 
-- Project Name: 
-- https://stackoverflow.com/questions/19942067/writing-a-register-file-in-vhdl :)
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Register_File is
    Port ( clk : in STD_LOGIC;
			  ReadReg1 : in  STD_LOGIC_VECTOR (7 downto 0);
           ReadReg2 : in  STD_LOGIC_VECTOR (7 downto 0);
           WriteReg : in  STD_LOGIC_VECTOR (7 downto 0);
           WriteData : in  STD_LOGIC_VECTOR (7 downto 0);
           WriteEnable : in  STD_LOGIC;
           AsynchRST : in  STD_LOGIC;
           ReadData1 : out  STD_LOGIC_VECTOR (7 downto 0);
           ReadData2 : out  STD_LOGIC_VECTOR (7 downto 0));
end Register_File;

architecture Behavioral of Register_File is
	type registerFile is array (0 to 63) of std_logic_vector(7 downto 0);
	signal registers : registerFile;
	
begin

	process (clk, AsynchRSt)
	begin
		if AsynchRST = '1' then
			registers <= (others => (others => '0'));
		
		elsif rising_edge(clk) then
			ReadData1 <= registers(to_integer(unsigned(ReadReg1)));
			ReadData2 <= registers(to_integer(unsigned(ReadReg2)));
			
			if WriteEnable = '1' then
				registers(to_integer(unsigned(writeReg))) <= WriteData;
				if ReadReg1 = WriteReg then
					ReadData1 <= WriteData;
				end if;
			  if ReadReg2 = WriteReg then 
					ReadData2 <= WriteData;
			  end if;
			end if;

		end if;
	end process;

end Behavioral;

