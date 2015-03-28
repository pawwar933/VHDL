PROC_WRITE: process(fsw5, fsw6, reset)
begin
	if(reset='0' or fsw6='1')then
		cr<=(others => '0');
		clkb<='0';
		dioder<='0';
		dispw<='0';
	elsif(fsw5'event and fsw5='1')then
		if(cr="000")then
			cr<=cr+'1';
			dioder<='1';
			clkb<='0';
			dispw<='1';
		elsif(cr="001")then
			cr<=cr+'1';
			ab(7 downto 0)<=sw4;
			ab(10 downto 8)<="000";
			dispw<='0';
			dispw<='0';
		elsif(cr="010")then
			cr<=cr+'1';
			clkb<='1';
			dispw<='1';
		elsif(cr="011")then
			cr<=cr+'1';
			dispw<='0';
		elsif(cr="100")then
			cr<=(others=>'0');
			clkb<='0';
			dioder<='0';
		end if;
	end if;
end process;
