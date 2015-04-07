library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity jons is
generic( n:integer range 0 to 10:=4);
    Port ( clk : in  STD_LOGIC;
           y : out  STD_LOGIC_VECTOR (4 downto 0));
end jons;

architecture Behavioral of jons is
component przerzutnikd is
    Port ( clk,zd : in  STD_LOGIC;
           q,nq : out  STD_LOGIC);
end component;
signal tmp : std_logic_vector(n-1 downto 0);
begin

map1:przerzutnikd port map(clk=>clk,nq=>open,q=>tmp(0),zd=>not(tmp(n-1)));
Petla:   for i in 1 to n-1 generate
begin
map2:przerzutnikd port map(clk=>clk,nq=>open,q=>tmp(i),zd=>tmp(i-1));
end generate;
Petla2:   for j in 0 to n-1 generate
begin
y(j)<=tmp(j);
end generate;

end Behavioral;

