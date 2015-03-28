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

