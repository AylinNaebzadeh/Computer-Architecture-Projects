----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity TLB is
    Port ( VirtualAddress : in  STD_LOGIC_VECTOR (15 downto 0);
           clock : in  STD_LOGIC;
           PPNIn : in  STD_LOGIC_VECTOR (3 downto 0);
           miss_hit : out  STD_LOGIC;
           PPNOut : out  STD_LOGIC_VECTOR (3 downto 0));
end TLB;

architecture FullyAssociative of TLB is
	signal pageOffset : std_logic_vector (6 downto 0);
	signal VPN : std_logic_vector (8 downto 0);
	type TLBdata is array (0 to 47) of std_logic_vector (4 downto 0); -- V PPN
	signal TLBmem : TLBdata := (5 => "11110",13 => "10110",29 => "11000",308 => "10001",
											489 => "11111",500 => "10101",65 => "11111",70 => "11000",
											83 =>"10101", 91 => "10001", 100 => "11000",110 => "11000",
											12 => "10001",13 => "11110",
											147 => "11000",156 => "11000",165 => "10101",178 => "10001",
											184 => "1100",191 => "10101",201 => "11111",211 => "11000",
											22 => "10101",237 => "10001",241 => "10001",251 => "11111",
											263 => "10001",272 => "10101",280 => "10001",295 => "01111",
											306 => "10101",318 => "11111",327 => "11110",330 => "01110",
											345 => "1100",355 => "10001",364 => "00111",373 => "10101",
											387 => "10110",397 => "01011",400 => "01010",410 => "10001",
											425 => "1100",435 => "10101",443 => "01111",456 => "10110",
											46 => "10101",47 => "10110");


begin
	VPN <= VirtualAddress(15 downto 7);
	pageOffset <= VirtualAddress(6 downto 0);
	
	process (clock)
	begin
		if (rising_edge(clock)) then
			if ()
		end if;
	end process;
	
end FullyAssociative;


architecture FourwaySetAssociative of TLB is

begin

	process (clock)
	begin
	end process;

end FourwaySetAssociative;
