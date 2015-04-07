
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity synch is
	generic(n:integer range 0 to 10:=5);
    Port ( clk: in  STD_LOGIC;
				y : out std_logic_vector(n-1 downto 0));
end synch;

architecture Behavioral of synch is
component jk is
Port( j,k,clk	:	in std_logic;
		q,nq	:	out std_logic);
end component;
		signal  	tmp:std_logic_vector(2*n-1 downto 0);
		
begin
	
	map1:jk port map(j=>'1',k=>'1',clk=>clk,q=>tmp(0),nq=>OPEN);

	Petla1:	   for i in 1 to n-1 generate
      begin
		map2:jk port map(clk=>clk,j=>tmp((i-1)*2),k=>tmp((i-1)*2),q=>tmp(2*i-1),nq=>open);
	tmp(2*i)<=tmp((i-1)*2) and tmp(2*i-1);
	
		end generate;
	
		
		

	
	
	
	
	y(0)<=tmp(0);
	y(1)<=tmp(1);
	y(2)<=tmp(3);
	y(3)<=tmp(5);
	y(4)<=tmp(7);
end Behavioral;

