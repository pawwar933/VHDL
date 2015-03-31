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
			signal tmp,pom:std_logic_vector(7 downto 0);
			
begin

				--tmp<=kod_klawisza when trans'event;
dekoder7:	process
			begin 
			wait until (trans'event);
							
					case kod_klawisza(8 downto 1) is 
				when x"16"=> tmp<="01001000";-- jedynka 
				when x"1E"=> tmp<="10111010"; --dwójka
				when x"26"=> tmp<="11011010";--itd
				when x"25"=> tmp<="01011100";
				when x"2E"=> tmp<="11010110";
				when x"36"=> tmp<="11110110";
				when x"3D"=> tmp<="01001110";
				when x"3E"=> tmp<="11111110";
				when x"46"=> tmp<="11011110";
				when x"45"=> tmp<="11101110";
				when x"F0"=> NULL;
				when others=> s<="00010000";
				end case;
				
--			
--			if tmp= "11000101100" then s<="01001000";
--			else s<="00010000";
--			end if;
--			s<="00010000";
--			kicz<=kicz+1;
			end process dekoder7;
	przypisanie:	process (tmp)
	begin 
	if not(tmp=pom) then
	pom<=tmp;
	s<=tmp;
	end if;
		
			
	end process przypisanie;
			
			
			
end Behavioral;
