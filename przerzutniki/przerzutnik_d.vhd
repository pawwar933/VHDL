entity przerzutnik_d is
	port(C,D :in bit;
		 Q:out bit);
end przerzutnik_d;

architecture przerzutnik of przerzutnik_d is
	begin
		process(C)
		 begin
		  if C'event and C='1' then  Q<=D;									
		 end if;
	end process;
end przerzutnik;
