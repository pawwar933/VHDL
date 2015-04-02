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

dekoder7:	process
			begin 
			wait until (kod_klawisza'event);
							
					case kod_klawisza is 
				when x"16"=> s<="01001000";-- jedynka 
				when x"1E"=> s<="10111010"; --dwójka
				when x"26"=> s<="11011010";--itd
				when x"25"=> s<="01011100";
				when x"2E"=> s<="11010110";
				when x"36"=> s<="11110110";
				when x"3D"=> s<="01001110";
				when x"3E"=> s<="11111110";
				when x"46"=> s<="11011110";
				when x"45"=> s<="11101110";
				when others=> s<="00010000";
					end case;
		end process dekoder7;

end Behavioral;
