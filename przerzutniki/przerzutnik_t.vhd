entity przerzutnik_t is
port(T,C,R :in bit;
	Q  : out bit);
end przerzutnik_t;

architecture przerzutnik of przerzutnik_t is
	begin 
		process(c,r)
			variable tq:bit;
		begin
			if R = '1' then tq:='0';
			elsif C'event and C='1' and T='1' then 
			tq:= not tq;
		end if;
        	Q<=tq;
	end process;
end przerzutnik;

	
