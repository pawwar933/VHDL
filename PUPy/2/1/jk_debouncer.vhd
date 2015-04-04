library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity zad1_mapowanie is
    Port ( clk,we_j,we_k : in  STD_LOGIC;
           q,nq : out  STD_LOGIC);
end zad1_mapowanie;

architecture Behavioral of zad1_mapowanie is
component debouncer is
    Port ( clock_100hz,pb : in  STD_LOGIC;
           pb_debounced : out  STD_LOGIC);
end component;
component preskaler is
    Port ( clk_in : in  STD_LOGIC;
           clk_out : out  STD_LOGIC);
end component;
component jk is
Port( j,k,clk	:	in std_logic;
		q,nq	:	out std_logic);
end component;

signal clk_low:std_logic;
signal kl_j,kl_k:std_logic;
begin

pre: preskaler port map(clk_in=>clk,clk_out=>clk_low);
klawisz_j: debouncer port map(clock_100hz=>clk_low,pb=> we_j,pb_debounced=>kl_j);
klawisz_k: debouncer port map(clock_100hz=>clk_low,pb=> we_k,pb_debounced=>kl_k);
przerzutnik: jk port map(j=>kl_j,k=>kl_k,clk=>clk,q=>q,nq=>nq);


end Behavioral;

