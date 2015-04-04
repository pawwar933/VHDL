 library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity zad4 is
	generic( n:integer range 0 to 10:=4);
Port( clk: in std_logic;
		y: out std_logic_vector(n-1 downto 0));
end zad4;

architecture Behavioral of zad4 is
component przerzutnikd is
    Port ( clk,zd : in  STD_LOGIC;
           q,nq : out  STD_LOGIC);
end component;
signal tmp:std_logic_vector(2*n+1 downto 0);

begin
 licznik0:przerzutnikd port map(clk=>clk,zd=>tmp(0),q=>tmp(1),nq=>tmp(0));
	
Petla:
	   for i in 1 to n-1 generate
      begin
     licznik:przerzutnikd port map(clk=>tmp(2*i-1),zd=>tmp(2*i),q=>tmp(2*i+1),nq=>tmp(2*i));
   end generate; 
		
Petla2:
   for j in 0 to n-1 generate
			begin
		y(j)<=tmp(2*j+1);
   end generate;
		
end Behavioral;

