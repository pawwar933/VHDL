
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity przerzutnikd is
    Port ( clk,zd : in  STD_LOGIC;
           q,nq : out  STD_LOGIC);
end przerzutnikd;

architecture Behavioral of przerzutnikd is

begin
		process(clk)
		variable tmp:std_logic;
		begin
			if(clk'event and clk='1') then
			tmp:=zd;
			end if;
		q<=tmp;
		nq<=not tmp;
	end process;
		

end Behavioral;

