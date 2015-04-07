library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity licznik_wdol is
generic( n:integer range 0 to 10:=3);
    Port ( clk : in  STD_LOGIC;
           y : out  STD_LOGIC_vector(n-1 downto 0));
end licznik_wdol;

architecture Behavioral of licznik_wdol is
 signal licznik:std_logic_vector(n-1 downto 0):=(others=>'1');
begin
		process(clk)
		begin 
		if(clk'event and clk='1') then
		if licznik>0 then
			licznik<=licznik-'1';
			else licznik<=(others =>'1');
		end if;
		end if;
		end process;
	y<=licznik;

end Behavioral;

