--dzielnik częstotliwości oparty na przerzutniku D

entity przerzutnik_d is
	port(C :in bit;
		 Q:out bit);
end przerzutnik_d;

architecture przerzutnik of przerzutnik_d is
		signal D:bit;
	begin
		process(C)
		variable tmp:bit;
		 begin
		 tmp:=D;
		 if C'event and C='1' then  Q<=tmp;
									D<=not tmp;
		 end if;
	end process;
end przerzutnik;
