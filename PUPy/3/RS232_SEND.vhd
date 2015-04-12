library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
Library UNISIM;
use UNISIM.vcomponents.all;

entity RS232_SEND is
    Port ( CLK : in std_logic;    --sygnal z generatora wzorcowego 25 MHz
           RST : in std_logic;    --reset (stan niski resetuje)
            SEND : in std_logic;     --rozpoczyna transmisje (zbocze opadajace)
           DIP : in std_logic_vector(3 downto 0);   --okresla 4 mniej znaczace bity znaku
           RXD_OUT : out std_logic);             --wyjscie asynchronicznej transmisji danych
end RS232_SEND;

architecture Behavioral of RS232_SEND is

component IBUF
    port (I: in std_ulogic; O: out std_ulogic);
end component;   

--dzieli czestotliwosc    
component freq_div 
    port (CLK_IN : in std_logic; CLK_OUT : out std_logic);
end component freq_div;

--synchronizuje zbocze na SEND_BUF do zbocza na CLK9600 i rozpoczyna transmisję znaku
component synchronizer
    port (SEND_BUF : in std_logic;
          CLK9600 : in std_logic;
          RST : in std_logic;
          SEND_VALID : out std_logic);
end component synchronizer;

--realizuje transmisje (automat stanow) 
component transmiter 
    port (dataIn: in std_logic_vector (7 downto 0);
           CLK9600: in std_logic;                
           SEND_VALID : in std_logic;
           RST : in std_logic;
           TXOUT: out std_logic               
    );
end component transmiter;

signal zegar9600 :std_logic;
signal wyslij :std_logic;
signal dane :std_logic_vector( 7 downto 0);
begin

	dane<= "0000"&DIP;

czestotliwosc: freq_div  port map( CLK_IN=>CLK,CLK_OUT=>zegar9600);
synchronizacja: synchronizer port map(SEND_BUF=>SEND,CLK9600=>clk,RST=>RST,SEND_VALID=>wyslij);
transmisja: transmiter port map( dataIn=>dane,CLK9600=>clk,SEND_VALID=>wyslij,RST=>RST,TXOUT=>RXD_OUT);



end Behavioral;
