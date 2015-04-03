library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity jonson is
    Port ( c: in std_logic;
				y : out  STD_LOGIC_VECTOR (3 downto 0));
end jonson;

architecture Behavioral of jonson is
component jk is
Port( j,k,clk	:	in std_logic;
		q,nq	:	out std_logic);
end component;
signal tmp:std_logic_vector(7 downto 0);
begin
p1: jk port map(clk=>c,j=>tmp(7),k=>tmp(6),q=>tmp(0),nq=>tmp(1));
p2: jk port map(clk=>c,j=>tmp(0),k=>tmp(1),q=>tmp(2),nq=>tmp(3));
p3: jk port map(clk=>c,j=>tmp(2),k=>tmp(3),q=>tmp(4),nq=>tmp(5));
p4: jk port map(clk=>c,j=>tmp(4),k=>tmp(5),q=>tmp(6),nq=>tmp(7));
y(0)<=tmp(0);
y(1)<=tmp(2);
y(2)<=tmp(4);
y(3)<=tmp(6);

end Behavioral;

