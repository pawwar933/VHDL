library ieee;
use ieee.std_logic_1164.all;

entity sumatortest is
	port(
	a,b,cp :in std_logic;
	s,cn   :out std_logic
	);
	end sumatortest;
	
architecture sumator of sumatortest is
  signal tmp,tmp1,tmp2:std_logic;
  begin
   tmp <= a xor b;
   s <=cp xor tmp;
   tmp1 <= cp and tmp;
   tmp2 <= a and b;
   cn <= tmp1 or tmp2;
 end sumator;
