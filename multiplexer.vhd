
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity multilex is
    Port ( we : in  STD_LOGIC_VECTOR (7 downto 0);
           s : in  STD_LOGIC_VECTOR (2 downto 0);
           wy : out  STD_LOGIC);
end multilex;

architecture Behavioral of multilex is

begin
		with s select 
		wy <= we(0) when "000",
		we(1) when "001",
		we(2) when "010",
		we(3) when "011",
		we(4) when "100",
		we(5) when "101",
		we(6) when "110",
		we(7) when others;
		

end Behavioral;

