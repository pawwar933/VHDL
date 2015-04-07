
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity wgore is
	generic(n:integer range 0 to 10:=4);
    Port ( clk : in  STD_LOGIC;
				y : out std_logic_vector(n-1 downto 0));
end wgore;

architecture Behavioral of wgore is
component jk is
Port( j,k,clk	:	in std_logic;
		q,nq	:	out std_logic);
end component;
		signal  	tmp:std_logic_vector(n-1 downto 0);
begin
	map1:jk port map(j=>'1',k=>'1',clk=>clk,q=>y(0),nq=>tmp(0));
Petla1:	   for i in 1 to n-1 generate
      begin
	map2:jk port map(j=>'1',k=>'1',clk=>tmp(i-1),q=>y(i),nq=>tmp(i));
	end generate;
	
end Behavioral;

