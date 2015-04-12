library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity synchronizer is
    Port ( SEND_BUF : in std_logic;				--switch - rozpoczyna transmisje znaku (zbocze opadajace)
           CLK9600 : in std_logic;				--zegar 9600 Hz
           RST : in std_logic;					--resetuje (stan niski)
           SEND_VALID : out std_logic);		--poziomem niskim rozpoczyna transmisję znaku (sygnał dla maszyny stanów)
end synchronizer;

architecture Behavioral of synchronizer is
signal tmp, END_SEND : std_logic;
signal counter : std_logic_vector(3 downto 0);
begin

process (RST, SEND_BUF, END_SEND)
begin
	if (RST='0') or (END_SEND='1') then
		tmp <= '1';
	elsif (SEND_BUF='0' and SEND_BUF'event)then
		tmp <= '0';
	end if;
end process;

process (CLK9600, tmp)
begin
	if (tmp = '1') then				--warunek prawdziwy po resecie lub po zakonczeniu wysylania znaku	dopoki nie nastapi 
   	SEND_VALID <= '1';			--zbocze opadajace na SEND_BUF
		END_SEND <= '0';
		counter <= "0000";
	elsif (CLK9600='1' and CLK9600'event) then		--synchronizuje do narastajacego zbocza na CLK9600
		counter <= counter+1;
		if (counter="1010") then							--po czasie wystarczajacym na wyslanie 10 bitow
			END_SEND <= '1';									--koniec transmisji								
		else
			SEND_VALID <= '0';
		end if;
	end if;
end process;

end Behavioral;
