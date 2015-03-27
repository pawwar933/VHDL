library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity odczyt is
    Port ( clk_klaw,bit_klaw : in  STD_LOGIC;
           odczyt_klawisz : out  STD_LOGIC_vector(10 downto 0));
end odczyt;

architecture Behavioral of odczyt is
	signal licznik:integer range 0 to 10:=0;
	signal koniec_trans:std_logic:='0';
begin

odczyt_klawiatury: process(clk_klaw)
	begin
		if clk_klaw'event and clk_klaw='0' then
				odczyt_klawisz(licznik)<=bit_klaw;
				licznik<=licznik+1;
				if (licznik = 10) then licznik<=0;
				koniec_trans<= not koniec_trans;
				end if;
		end if;
	end process odczyt_klawiatury;
			

end Behavioral;

