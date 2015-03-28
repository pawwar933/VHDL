library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity przerzutnik_d is
	port(C,D :in std_logic;
		 Q:out std_logic);
end przerzutnik_d;

architecture przerzutnik of przerzutnik_d is
	begin
		process(C)
		 begin
		  if C'event and C='1' then  Q<=D;									
		 end if;
	end process;
end przerzutnik;
