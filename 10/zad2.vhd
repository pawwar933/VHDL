
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
 signal clk_p : std_logic;
signal CLK_licznik: integer range 0 to n;
signal pwm_licznik: integer range 0 to 20;
signal tmp:std_logic;
 signal pom:integer range 0 to n;
 signal wypelnienie:integer range 0 to 20;
begin
  


CLK_ustaw: process (clk)
begin
 
if  Clk'event and Clk='1' then
	if (CLK_licznik >= n) then
		CLK_licznik <= 0;
		clk_p <= not clk_p;
	else
		CLK_licznik <= CLK_licznik + 1;
	end if;
 end if;
 end process;



klawisz: process(clk)
begin
	tmp<=we;
if  Clk'event and Clk='1' then
	if  (pom >= n)  then 
		pom<=0;
		
		if(tmp and we)='1' then wypelnienie <=wypelnienie+1;
				if(wypelnienie>= 20) then wypelnienie <=0;
				end if;
		end if;
		
	else
		pom <= pom + 1;
	end if;
end if;
end process;





pwm: process (clk_p)
begin
 
if  Clk_p'event and Clk_p='1' then
	if (pwm_licznik >= 20) then
		pwm_licznik <= 0;
		wyj <='0';
	elsif(pwm_licznik>=wypelnienie) then
		wyj <='1';
		pwm_licznik <= pwm_licznik + 1;
	else
		pwm_licznik <= pwm_licznik + 1;
	end if;
 end if;
 end process;

end Behavioral;

