library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity dioda is
    Port ( clk : in  STD_LOGIC;
				wypelnienie:in std_logic_vector(4 downto 0);
				wyjscie : out  STD_LOGIC);
end dioda;

architecture Behavioral of dioda is
			signal licznik:std_logic_vector(4 downto 0):=(others=> '0');
			signal dioda_out:std_logic;
begin
		process(clk,wypelnienie)
		begin
				if(clk'event and clk='1') then
					if(licznik< wypelnienie) then
							dioda_out<='1';
					else	dioda_out<='0';
					end if;
				licznik<=licznik+'1';
				end if;
			if(licznik=20) then
				licznik<=(others=>'0');
				end if;
		end process;
	wyjscie<=dioda_out;


end Behavioral;
