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
			signal tmp:std_logic_vector(7 downto 0):=(others=>'0');
			
begin

				--tmp<=kod_klawisza when trans'event;
dekoder7:	process(trans)
			begin 
			--wait until (trans'event);
							
				if (kod_klawisza(8 downto 1)= x"16" and (tmp /=	 "01001000")) then 
						 s<="01001000";
						 tmp<="01001000";
				elsif (kod_klawisza(8 downto 1)= x"1E" and (tmp /=	 "10111010")) then 
						 s<="10111010";
						 tmp<="10111010";
				elsif (kod_klawisza(8 downto 1)= x"26" and (tmp /=	 "11011010")) then 
						 s<="11011010";
						 tmp<="11011010";
				elsif (kod_klawisza(8 downto 1)= x"25" and (tmp /=	 "01011100")) then 
						 s<="01011100";
						 tmp<="01011100";
				elsif (kod_klawisza(8 downto 1)= x"2E" and (tmp /=	 "11010110")) then 
						 s<="11010110";
						 tmp<="11010110";
				elsif (kod_klawisza(8 downto 1)= x"36" and (tmp /=	 "11110110")) then 
						 s<="11110110";
						 tmp<="11110110";
				elsif (kod_klawisza(8 downto 1)= x"3D" and (tmp /=	 "01001110")) then 
						 s<="01001110";
						 tmp<="01001110";
				elsif (kod_klawisza(8 downto 1)= x"3E" and (tmp /=	 "11111110")) then 
						 s<="11111110";
						 tmp<="11111110";
				elsif (kod_klawisza(8 downto 1)= x"46" and (tmp /=	 "11011110")) then 
						 s<="11011110";
						 tmp<="11011110";
				elsif (kod_klawisza(8 downto 1)= x"45" and (tmp /=	 "11101110")) then 
						 s<="11101110";
						 tmp<="11101110";
				elsif (kod_klawisza(8 downto 1)= x"F0" and (tmp /=	 "01001000")) then 
						 NULL;
				else s<="00010000";
			end if;
		end process dekoder7;

end Behavioral;
