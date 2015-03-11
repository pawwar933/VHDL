library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use WORK.pakiet.ALL;


entity sumator_nbit is
generic(n:integer:=4);
    Port ( A : in  STD_LOGIC_VECTOR(n-1 downto 0);
           B : in  STD_LOGIC_VECTOR(n-1 downto 0);
           Cn : out  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR(n downto 0));
end sumator_nbit;

architecture Behavioral of sumator_nbit is

signal tmp : STD_LOGIC_VECTOR(n-1 downto 0);

begin
		bit1: polsumator port map(A=>A(0), B=>B(0), Co=>tmp(0), S=>S(0));
PETLA:
   for i in 1 to n-1 generate
      begin
         
			resztabitow: sumatorpelny port map(A=>A(i), B=>B(i), Ci=>tmp(i-1), S=>S(i), Cn=>tmp(i));
      end generate;
	S(n)<=tmp(n-1);
	Cn<=tmp(n-1);

end Behavioral;

