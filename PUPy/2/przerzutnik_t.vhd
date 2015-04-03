library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity przerzutnik_t is
    Port ( t,clk : in  STD_LOGIC;
           q,nq : out  STD_LOGIC);
end przerzutnik_t;

architecture Behavioral of przerzutnik_t	 is
			signal tmp:std_logic;
begin

	process(clk)
			variable pom:std_logic;
	begin
			if clk'event and clk='1' then
				pom:=(t xor tmp);
			end if;
			q<=pom;
			nq<=not pom;
			tmp<=pom;
			
	end process;
end Behavioral;

