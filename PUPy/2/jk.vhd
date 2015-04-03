library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity jk is
Port( j,k,clk	:	in std_logic;
		q,nq	:	out std_logic);
end jk;

architecture Behavioral of jk is
			signal tmp:std_logic;
begin

	process(clk)
			variable jk:std_logic;
	begin
			if clk'event and clk='1' then
				jk:=(( (not k) and tmp) or (j and (not tmp)));
			end if;
			q<=jk;
			nq<=not jk;
			tmp<=jk;
			
	end process;
end Behavioral;


