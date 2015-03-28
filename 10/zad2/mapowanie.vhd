library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity zadanie is
    Port ( clk,button : in  STD_LOGIC;
           dioda_led : out  STD_LOGIC);
end zadanie;

architecture Behavioral of zadanie is
component preskaler is
    Port ( clk_in : in  STD_LOGIC;
				podzial: in std_logic_vector(19 downto 0);
           clk_out : out  STD_LOGIC);
end component;
component debouncer is
    Port ( clock_100hz,pb : in  STD_LOGIC;
           pb_debounced : out  STD_LOGIC);
end component;
component pwm is
    Port ( klawisz : in  STD_LOGIC;
           pwmm: out  STD_LOGIC_vector(4 downto 0):=(others=>'0'));
end component;
component dioda is
    Port ( clk : in  STD_LOGIC;
				wypelnienie:in std_logic_vector(4 downto 0);
				wyjscie : out  STD_LOGIC);
end component;

	signal clk_Hz:std_logic;
	signal clk_100Hz:std_logic;
	signal klawisz:std_logic;
	signal wypelnienie:std_logic_vector(4 downto 0);
begin
preskalowanie_100hz: preskaler port map(clk_in=>clk,clk_out=>clk_100Hz,podzial=>"11110100001001000000");
preskalowanie_1hz: preskaler port map(clk_in=>clk_100Hz,clk_out=>clk_Hz,podzial=>"00000000000001100100");
filtrowanie_klawisza: debouncer port map (clock_100hz=>clk_100Hz,pb=>button,pb_debounced=>klawisz);
pwwm:pwm port map(klawisz=>klawisz,pwmm=>wypelnienie);
mruganie:dioda port map(clk=>clk_Hz,wypelnienie=>wypelnienie,wyjscie=>dioda_led);

end Behavioral;

