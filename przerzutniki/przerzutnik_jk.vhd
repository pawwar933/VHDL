entity przerzutnik_jk is
	port( J,K,R,S,C :in bit;
			Q	  :out bit);
end przerzutnik_jk;

architecture przerzutnik of przerzutnik_jk is
	begin
		process(C,R,S)
	variable p:bit;
			begin
		if S='1' then p:='1';
			elsif R='1' then p:='0';
			elsif C'event and C='1' and J='0' and K='1'
			then p:='0';
			elsif C'event and C='1' and J='1' and K='0'
			then p:='1';
			elsif C'event and C='1' and J='1' and K='1'
			then p:=not p;
		end if;
		Q<=p;
	end process;
end przerzutnik;
