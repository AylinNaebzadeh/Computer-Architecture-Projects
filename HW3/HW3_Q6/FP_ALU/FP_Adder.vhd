----------------------------------------------------------------------------------
-- This is the floating point adder for ALU
-- It has been used a finite state machine with 5 states (except others) in this part :)
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;



entity FP_Adder is
    Port ( number_a : in  STD_LOGIC_VECTOR (15 downto 0);
           number_b : in  STD_LOGIC_VECTOR (15 downto 0);
			  clk : in std_logic;
			  reset : in std_logic;
			  start : in std_logic;
			  done : out std_logic;
           result : out  STD_LOGIC_VECTOR (15 downto 0));
end FP_Adder;

architecture Behavioral of FP_Adder is
	type T is (wait_state, align_state, addition_state, normalize_state, output_state);
	signal state : T := wait_state;
	-- add 2 bits to fraction and 1 bit to exponent
	signal a_fraction : std_logic_vector(9 downto 0);
	signal a_exponent : std_logic_vector(7 downto 0);
	signal a_sign : std_logic;
	
	signal b_fraction : std_logic_vector(9 downto 0);
	signal b_exponent : std_logic_vector(7 downto 0);
	signal b_sign : std_logic;
	
	signal res_fraction : std_logic_vector(9 downto 0);
	signal res_exponent : std_logic_vector(7 downto 0);
	signal res_sign : std_logic;
	
begin
	
	process (clk, reset)
		variable subtraction : signed(7 downto 0);
	begin
		if (reset = '1') then
			state <= wait_state;
			done <= '0';
		-- Initializing the signals
		elsif rising_edge(clk) then
			case state is
				when wait_state =>
					if (start = '1') then
						a_sign <= number_a(15);
						a_exponent <= '0' & number_a(14 downto 8);
						a_fraction <= "01" & number_a(7 downto 0);
						
						b_sign <= number_b(15);
						b_exponent <= '0' & number_b(14 downto 8);
						b_fraction <= "01" & number_b(7 downto 0);
						
						state <= align_state;
					else
						state <= wait_state;
					end if;
				
				when align_state =>
					if (unsigned(a_exponent) > unsigned(b_exponent)) then
						subtraction := signed(a_exponent) - signed(b_exponent);
						
						if subtraction > 8 then
							res_fraction <= a_fraction;
							res_exponent <= a_exponent;
							res_sign <= a_sign;
							state <= output_state;
						else
							res_exponent <= a_exponent;
							b_fraction((9 - to_integer(subtraction)) downto 0) <= b_fraction(9 downto to_integer(subtraction));
							b_fraction(9 downto (10 - to_integer(subtraction))) <= (others => '0');
							
							state <= addition_state;
						end if;
					elsif (unsigned(a_exponent) < unsigned(b_exponent)) then
						subtraction := signed(b_exponent) - signed(a_exponent);
						if subtraction > 8 then
							res_fraction <= b_fraction;
							res_exponent <= b_exponent;
							res_sign <= b_sign;
							state <= output_state;
						else
							res_exponent <= b_exponent;
							a_fraction((9 - to_integer(subtraction)) downto 0) <= a_fraction(9 downto to_integer(subtraction));
							a_fraction(9 downto (10 - to_integer(subtraction))) <= (others => '0');
							
							state <= addition_state;
						end if;
					else
						res_exponent <= a_exponent;
						state <= addition_state;
					end if;
				-- adding fractions
				when addition_state =>
					state <= normalize_state;
					if (a_sign xor b_sign) = '0' then
						res_fraction <= std_logic_vector(unsigned(a_fraction) + unsigned(b_fraction));
						res_sign <= a_sign;
					elsif unsigned(a_fraction) >= unsigned(b_fraction) then
						res_fraction <= std_logic_vector(unsigned(a_fraction) - unsigned(b_fraction));
						res_sign <= a_sign;
					else
						res_fraction <= std_logic_vector(unsigned(b_fraction) - unsigned(a_fraction));
						res_sign <= b_sign;
					end if;
				
				when normalize_state =>
					if (unsigned(res_fraction) = to_unsigned(0, 25)) then
						res_fraction <= (others => '0');
						res_exponent <= (others => '0');
						state <= output_state;
					elsif (res_fraction(9) = '1') then -- checking for overflow
						res_fraction <= '0' & res_fraction(9 downto 1); -- shifting to right
						res_exponent <= std_logic_vector(unsigned(res_exponent) + 1);
						state <= output_state;
					elsif (res_fraction(8) = '0') then
						res_fraction <= res_fraction(8 downto 0) & '0'; -- shifting to left
						res_exponent <= std_logic_vector(unsigned(res_exponent) - 1);
						state <= normalize_state;
					else
						state <= output_state;
					end if;
				
				when output_state =>
					result(7 downto 0) <= res_fraction(7 downto 0);
					result(14 downto 8) <= res_exponent(6 downto 0);
					result(15) <= res_sign;
					
					done <= '1';
					
					if (start = '0') then
						done <= '0';
						state <= wait_state;
					end if;
				
				when others =>
					state <= wait_state;
			end case;
		end if;
	end process;

end Behavioral;

