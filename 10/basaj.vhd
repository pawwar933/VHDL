library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity debouncer is
    Port ( clock_100hz,pb : in  STD_LOGIC;
           pb_debounced : out  STD_LOGIC);
end debouncer;

architecture Behavioral of debouncer is
signal shift_pb : std_logic_vector(3 downto 0) := (others => '0');
signal state : std_logic;
begin
-- pb to wejscie (przycisk)
-- pb_debounced to stan przycisku (po filtracji drgań)
process
	 begin
	 wait until (clock_100hz'event) and (clock_100hz = '1');
	 shift_pb(2 downto 0) <= shift_pb(3 downto 1);
	 shift_pb(3) <= pb;
	 case shift_pb is
		 when "0000" =>
		 state <= '0';
		 when "1111" =>
		 state <= '1';
		 when others =>
		 state <= state;
	 end case;
	 pb_debounced <= state;
	 end process;
	 
end Behavioral;

-----------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity preskaler is
    Port ( clk_in : in  STD_LOGIC;
           clk_out : out  STD_LOGIC);
end preskaler;

architecture Behavioral of preskaler is
signal licznik : std_logic_vector(20 downto 0) := (others => '0');
signal wy : std_logic; --sygnal wyjsciowy

begin
-- pb to wejscie (przycisk)
-- pb_debounced to stan przycisku (po filtracji drgań)
process(clk_in)
	 begin
		if (clk_in = '1' and clk_in'event) then
			if (licznik = 1000000) then
				licznik <= (others => '0');
				wy <= not wy;
			else 
				licznik <= licznik + '1';
			end if;	
		end if;
	 end process;
clk_out <= wy;	 
end Behavioral;

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
