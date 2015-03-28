--------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity uklad_1 is
    Port ( clk : in  STD_LOGIC; -- zegar 100 MHz
			  button : in  STD_LOGIC; -- przycisk, ktorego stan badamy
           led_out : out  STD_LOGIC); -- led na wyjsciu
end uklad_1;

architecture Behavioral of uklad_1 is

component debouncer Port 
	( clock_100hz,pb : in  STD_LOGIC;
       pb_debounced : out  STD_LOGIC);
end component debouncer;

component preskaler Port
	( clk_in : in  STD_LOGIC;
    clk_out : out  STD_LOGIC);
end component preskaler;	 

signal zegar: std_logic;
--signal przycisk: std_logic;
signal stan_led: std_logic;

begin
	prsc1: preskaler port map ( clk_in => clk, clk_out => zegar);
	dbnc1: debouncer port map (clock_100hz => zegar, pb => button, pb_debounced => stan_led);
	led_out <= stan_led;
end Behavioral;
