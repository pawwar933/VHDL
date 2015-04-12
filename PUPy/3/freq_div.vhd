library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity freq_div is
    Port ( clk_in : in  STD_LOGIC;
           clk_out : out  STD_LOGIC);
end freq_div;

architecture Behavioral of freq_div is
		signal licznik:std_logic_vector(10 downto 0):=(others=>'0');
		signal tmp :std_logic:='0';
begin
			process(clk_in)
				begin
					if(clk_in'event and clk_in = '1') then
						if licznik ="00000000011" then -- "10100010110" then
							licznik <= (others=>'0');
							tmp<= not tmp;
						else licznik <= licznik + '1';
						end if;
					end if;
				end process;
			clk_out <= tmp;

end Behavioral;

