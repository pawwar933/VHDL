library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


package pakiet is
component polsumator is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           S : out  STD_LOGIC;
           Co : out  STD_LOGIC);
end component;

component sumatorpelny is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
			  Ci: in  STD_LOGIC;
           S : out  STD_LOGIC;
           Cn : out  STD_LOGIC);
end component;

end package pakiet;
--------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity polsumator is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           S : out  STD_LOGIC;
           Co : out  STD_LOGIC);
end polsumator;

architecture Behavioral of polsumator is

signal tmp : STD_LOGIC_VECTOR(1 downto 0);

begin
tmp <= A & B;
S <= '0' when a=b else '1';
Co <= '1' when tmp="11" else '0';

end Behavioral;
-----------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sumatorpelny is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
			  Ci: in  STD_LOGIC;
           S : out  STD_LOGIC;
           Cn : out  STD_LOGIC);
end sumatorpelny;

architecture Behavioral of sumatorpelny is

signal tmp : STD_LOGIC_VECTOR(2 downto 0);

begin

tmp <= A & B & Ci;

S <= '0' when (tmp="000" or tmp="011" or tmp="101" or tmp="110") else '1';
Cn <= '0' when (tmp="000" or tmp="001" or tmp="010" or tmp="100") else '1';

end Behavioral;



