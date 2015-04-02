library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity dekoder is
    Port ( kod_klawisza : in  STD_LOGIC_vector(7 downto 0);
		s : out  STD_LOGIC_VECTOR(7 downto 0));
end dekoder;

architecture Behavioral of dekoder is
		begin

dekoder7:	process(kod_klawisza)
			begin 
			
			if (kod_klawisza= x"16") then 
						 s<="01001000";
			  elsif (kod_klawisza= x"1E") then 
						 s<="10111010";
				elsif (kod_klawisza= x"26") then 
						 s<="11011010";
				elsif (kod_klawisza= x"25") then 
						 s<="01011100";
				elsif (kod_klawisza= x"2E") then 
						 s<="11010110";
				elsif (kod_klawisza= x"36") then 
						 s<="11110110";
				elsif (kod_klawisza= x"3D") then 
						 s<="01001110";
				elsif (kod_klawisza= x"3E") then 
						 s<="11111110";
				elsif (kod_klawisza= x"46") then 
						 s<="11011110";
				elsif (kod_klawisza= x"45") then 
						 s<="11101110";
				else s<="00010000";
			end if;
		end process dekoder7;

end Behavioral;
