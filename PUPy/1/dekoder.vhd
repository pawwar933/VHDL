library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity dekoder is
    Port ( kod_klawisza : in  STD_LOGIC_vector(10 downto 0);
				trans:in STD_LOGIC;
           s : out  STD_LOGIC_VECTOR(7 downto 0));
end dekoder;

architecture Behavioral of dekoder is
		--	signal tmp:std_logic_vector(10 downto 0);
			
begin

				--tmp<=kod_klawisza when trans'event;
dekoder7:	process
			begin 
			wait until (trans'event);
							
					case kod_klawisza is 
				when "11000101100"=> s<="01001000";-- jedynka 
				when "11000111100"=> s<="10111010"; --dwójka
				when "11001001100"=> s<="11011010";--itd
				when "11001001010"=> s<="01011100";
				when "11001011100"=> s<="11010110";
				when "11001101100"=> s<="11110110";
				when "11001111010"=> s<="01001110";
				when "11001111100"=> s<="11111110";
				when "11010001100"=> s<="11011110";
				when "11010001010"=> s<="11101110";
				when others=> s<="00010000";
				end case;
			end process dekoder7;
end Behavioral;
