library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity preskaler is
    Port ( clk_in : in  STD_LOGIC;
			 podzial: in std_logic_vector(19 downto 0);
           clk_out : out  STD_LOGIC);
end preskaler;
--100000000
architecture Behavioral of preskaler is
signal licznik : std_logic_vector(19 downto 0) := (others => '0');
signal wy : std_logic; --sygnal wyjsciowy

begin
-- pb to wejscie (przycisk)
-- pb_debounced to stan przycisku (po filtracji drgań)
process(clk_in)
	 begin
		if (clk_in = '1' and clk_in'event) then
			if (licznik = podzial) then				--do 1hz
				licznik <= (others => '0');
				wy <= not wy;
			else 
				licznik <= licznik + '1';
			end if;	
		end if;
	 end process;
clk_out <= wy;	 
end Behavioral;
