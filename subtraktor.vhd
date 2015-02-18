library ieee;
use ieee.std_logic_1164.all;

entity subtraktor is
	port(
	 a,b,c :in std_logic;
	 r		:out std_logic
	 );
end subtraktor;

architecture subtraktor of subtraktor is
	signal tmp: std_logic;
begin
	tmp <= a xor b;
	r <= tmp xor c;
end subtraktor;
