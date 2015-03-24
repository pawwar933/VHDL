
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pog is
generic(n:integer:=3);
    Port ( we,clk : in  STD_LOGIC;
           wyj : out  STD_LOGIC:='0');
end pog;

architecture Behavioral of pog is
 signal tmp:std_logic;
 signal pom:integer range 0 to n;
begin
  
process(clk)
begin
	

	tmp<=we;
if  Clk'event and Clk='1' then
	if  (pom >= n)  then 
		pom<=0;
		
		wyj<=tmp and we;
		
	else
		pom <= pom + 1;
	end if;
end if;
end process;

end Behavioral;

