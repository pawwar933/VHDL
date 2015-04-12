library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity freq_div2 is
    Port ( clk_in : in  STD_LOGIC;
           clk_out : out  STD_LOGIC);
end freq_div2;

architecture Behavioral of freq_div2 is
		signal licznik:std_logic_vector(11 downto 0):=(others=>'0');
		signal tmp :std_logic:='0';
begin
			process(clk_in)
				begin
					if(clk_in'event) then
						if licznik = "000000000111" then -- "101000101100" then
							licznik <= (others=>'0');
							tmp<= not tmp;
						else licznik <= licznik + '1';
						end if;
					end if;
				end process;
			clk_out <= tmp;

end Behavioral;

