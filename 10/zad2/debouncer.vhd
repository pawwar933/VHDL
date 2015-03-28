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
