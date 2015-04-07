
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity rewers is
	generic(n:integer range 0 to 10:=4);
    Port ( clk,ster : in  STD_LOGIC;
				y : out std_logic_vector(n-1 downto 0));
end rewers;

architecture Behavioral of rewers is
component jk is
Port( j,k,clk	:	in std_logic;
		q,nq	:	out std_logic);
end component;
		signal  	tmp:std_logic_vector(2*n-1 downto 0);
		signal pom:std_logic_vector(n-1 downto 1);
begin
	
	map1:jk port map(j=>'1',k=>'1',clk=>clk,q=>tmp(0),nq=>tmp(1));
	Petla1:	   for i in 1 to n-1 generate
	begin 
	pom(i)<=((tmp(2*i-2) nand ster) nand (tmp(2*i-1) nand (not ster)));
	map2:jk port map(j=>'1',k=>'1',q=>tmp(2*i),nq=>tmp(2*i+1),clk=>pom(i));
	end generate;

Petla2:	   for j in 0 to n-1 generate
      begin
	y(j)<=tmp(2*j);
	end generate;
	
end Behavioral;

