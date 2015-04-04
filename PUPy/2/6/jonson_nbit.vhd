library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity jonson is
		generic( n:integer range 0 to 10:=4);
    Port ( c: in std_logic;
				y : out  STD_LOGIC_VECTOR (n-1 downto 0));
end jonson;

architecture Behavioral of jonson is
component jk is
Port( j,k,clk	:	in std_logic;
		q,nq	:	out std_logic);
end component;
signal tmp:std_logic_vector(2*n-1 downto 0);
begin
p1: jk port map(clk=>c,j=>tmp((n-1)*2+1),k=>tmp((n-1)*2),q=>tmp(0),nq=>tmp(1));

Petla:   for i in 1 to n-1 generate
      begin
         p2: jk port map(clk=>c,j=>tmp(2*(i-1)),k=>tmp(i*2-1),q=>tmp(i*2),nq=>tmp(i*2+1));
   end generate;
Petlap:   for j in 0 to n-1 generate
      begin
          y(j)<=tmp(2*j);
   end generate;

end Behavioral;

