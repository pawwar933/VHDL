library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity przerzutnik_jk is
	port( J,K,Rst,Clk :in std_logic;
			Q	  :out std_logic);
end przerzutnik_jk;

architecture przerzutnik of przerzutnik_jk is
	begin
		process(Clk,Rst)
	variable p:std_logic;
			begin
		
			if Rst='1' then 
				p:='0';
			elsif Clk'event and Clk='1' then
			if(J='0' and K='1')	then p:='0';
			elsif (J='1' and K='0')
			then p:='1';
			elsif (J='1' and K='1')
			then p:=not p;
			end if;
		end if;
		Q<=p;
	end process;
end przerzutnik;
