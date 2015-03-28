library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity przerzutnik_t is
port(T,C,R :in std_logic;
	Q  : out std_logic);
end przerzutnik_t;

architecture przerzutnik of przerzutnik_t is
	begin 
		process(c,r)
			variable tq:std_logic;
		begin
			if R = '1' then tq:='0';		--C'event and C='1'  -wykrywa narastające zbocze sygnału C
			elsif C'event and C='1' and T='1' then  --  można też elsif C'event and C='1' then
			tq:= not tq;				--tq:=tq xor T;
		end if;
        	Q<=tq;
	end process;
end przerzutnik;

	
