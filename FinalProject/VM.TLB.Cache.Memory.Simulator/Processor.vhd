----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:19:59 07/07/2022 
-- Design Name: 
-- Module Name:    Processor - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.math_real.uniform;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Processor is Port( --outputData : out  STD_LOGIC_VECTOR (31 downto 0);
								  --outputData2 : out  STD_LOGIC_VECTOR (31 downto 0);
								  index : in INTEGER; 
								  virtualAddress : out STD_LOGIC_VECTOR (15 downto 0); -- 9 bit for VPN, 7 bit for page offset
								  --virtualAddress : in  STD_LOGIC_VECTOR (15 downto 0); -- 9 bit for VPN, 7 bit for page offset
								  clock : in STD_LOGIC);
end Processor;

architecture Behavioral of Processor is
	type VirtualAdressInput is array (0 to 99) of std_logic_vector (15 downto 0);
	signal VAdressInput : VirtualAdressInput := (0 => "1111111011011111", 1 => "1111110010111101", 2 => "1111110101100110",3 => "1111111110111010", 4 => "1111111110011011"
																	,5 => "1111100110011111",6 => "1000001011111110", 7 => "0110011111101110", 8 => "1110111111111011", 9 => "1001011100111110",10 => "1111110011111111",
																	11 => "1111100110011111", 12 => "1111000111111101",13 => "1111001111100111",14 => "1111000001000100",15 => "1111001010101101",16 => "1111001000011101",
																	17 => "1111100000001111",18 => "1111000011101000",19 => "1111000000011110", 20 => "1111000101101111",21 => "1111001001001111",22 => "1111001001011010", 23 => "1111001110010011"
																	,24 => "1111001100011001", 25 => "0000011000011111", 26 => "0000011010011010", 27 => "0000000000111010", 28 => "0000010011111100", 29 => "0000000011100101", 30 => "0000000111111101", 31 => "0000011100000001"
																   ,32 => "1000101111010011",33 => "1011011111100111",34 => "1011001111101000",35 => "1010110110111111",36 => "1011111110110110",37 => "0111110111110111",38 => "1011111100110110"
																	,39 => "1111101001111111",40 => "1001111110001101",41 => "1011111001110111" ,42 => "0011011111100010",43 => "0010010111111001",44 =>"1011001111101010", 45 =>"1010111011111101",46 =>"1110100111110010"
																	,47 => "1111110000111001", 48 => "1010111111001000", 49 => "0111110111111010", 50 => "0101111110111000", 51 => "1101110111111111", 52 =>"0110110111111010",53 => "0011111111111100"
																	,54 => "1111110010001101",55 => "1111111111111011",56 => "1011111101010010",57 => "0001111111010010", 58 => "0001111111100010", 59 => "1111111010001010", 60 => "1111110111110000"
																	,61 => "1111101100001111", 62 => "0011100111110101", 63 => "1101101110011111", 64 => "1111010111111110", 65 => "1111011111111010", 66 => "1111111010101111", 67 => "0110111111100111"
																	,68 => "1111100010011100",69 => "1111001111111010", 70 => "0011111100111110", 71 => "1100101100111011", 72 => "0011111001110100", 73 => "1001111001111101", 74 => "1110000011001100"
																	,75 => "0011001101101011",76 => "0000111101111010", 77 => "0001110011100000", 78 => "1000000011100110", 79 => "0101111100111000", 80 => "1100111100111011", 81 => "1101100000010110"
																	,82 => "1101000010011000",83 => "0010110110101100", 84 => "1000011100111001", 85 => "0010011001100001", 86 => "0101101001101010", 87 => "0111101111001111", 88 => "0110111100111001"
																	,89 => "1101011100111100", 90 => "0010011100111000", 91 => "1111001110011011", 92 => "1110100111011100", 93 => "0101110011100001", 94 => "0111100110010100", 95 =>"0011001100001000"
																	,96 => "0110110110011110", 97 => "0100100110000001", 98 => "0000100110000111",99 => "0111110011100001");
begin
		virtualAddress<=  VAdressInput(index);		
end Behavioral;
