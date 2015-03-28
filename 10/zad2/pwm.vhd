
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity pwm is
    Port ( klawisz : in  STD_LOGIC;
           pwmm: out  STD_LOGIC_vector(4 downto 0):=(others=>'0'));
end pwm;

architecture Behavioral of pwm is
		
begin

 process (klawisz)
	variable wypelnienie:std_logic_vector(4 downto 0);
begin
 
if  klawisz'event and klawisz='1' then
		if(wypelnienie < 20) then 
				wypelnienie:=wypelnienie+'1';
		else wypelnienie:="00000";
		end if;
	end if;
	pwmm<=wypelnienie;
end process;

end Behavioral;

