library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity mapowanie is
    Port ( kod_klaw,clk_klaw: in  STD_LOGIC;
           wyswietlacz : out  STD_LOGIC_vector(7 downto 0));
end mapowanie;

architecture Behavioral of mapowanie is
component dekoder is
     Port ( kod_klawisza : in  STD_LOGIC_vector(10 downto 0);
				trans:in STD_LOGIC;
           s : out  STD_LOGIC_VECTOR(7 downto 0));
end component;
component odczyt is
    Port ( clk_klaw,bit_klaw : in  STD_LOGIC;
           odczyt_klawisz : out  STD_LOGIC_vector(10 downto 0);
			  koniec_transmisji:out std_logic);
end component;
	signal kod_klawisz:std_logic_vector(10 downto 0);
	signal koniec: std_logic;

begin
 map1: odczyt port map(clk_klaw=>clk_klaw,bit_klaw=>kod_klaw,koniec_transmisji=>koniec,odczyt_klawisz=>kod_klawisz);
 map2: dekoder port map(kod_klawisza=>kod_klawisz,trans=>koniec,s=>wyswietlacz);

end Behavioral;
