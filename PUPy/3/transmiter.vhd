library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity transmiter is
    Port ( dataIn : in  STD_LOGIC_VECTOR (7 downto 0);
           CLK9600,RST,SEND_VALID : in  STD_LOGIC;
           TXOUT : out  STD_LOGIC);
end transmiter;

architecture Behavioral of transmiter is
type state_rs is (start, 			--rozpoczecie transmisji bit po bicie
						przesyl,			--przesył danych
						stop,
						idle); 			--oczekiwanie na rozpoczęcie
signal state :state_rs:=idle;
signal nextstate: state_rs:=idle;--stan aktualny, stan nastepny
signal licznik:integer range 0 to 7:=0;
begin
 process(CLK9600,RST,SEND_VALID) -- proces czuly na zmiane clk i rst
  begin
	if RST = '0' then
	 state <= idle;
	elsif SEND_VALID'event and SEND_VALID = '0' then
		state <= start;
	elsif SEND_VALID'event and SEND_VALID = '1' then
		state <= idle;
	elsif CLK9600'event and CLK9600 = '1' then
	 state <= nextstate;
	end if;
  end process;
  
 process(state,CLK9600)
	begin
		case state is 
	when start =>
		TXOUT <= '0';--bit startu
		nextstate <= przesyl;
	when przesyl =>
		if CLK9600'event and CLK9600 = '1' and state = przesyl then
		TXOUT <= dataIn(licznik);
		licznik <= licznik + 1;
			if licznik = 6 then
				nextstate <= stop;
			elsif licznik = 7 then
				licznik <= 0;
			end if;
		end if;
	when stop =>
		TXOUT <= '1';
	when idle => licznik <= 0;
		end case;
	end process;
		
		
	

end Behavioral;

