----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:09:44 03/27/2015 
-- Design Name: 
-- Module Name:    bla - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dekoder is
    Port ( clk : in  STD_LOGIC;
				odczyt_klawisza : in  STD_LOGIC_vector(10 downto 0);
           s : out  STD_LOGIC_VECTOR(7 downto 0));
end dekoder;

architecture Behavioral of dekoder is

begin
dekoder7:	process(odczyt_klawisza)
			begin 
				case odczyt_klawisza is 
				when "00001011011"=> s<="01001000";-- jedynka 
				when "00001111011"=> s<="10111010"; --dwójka
				when "00010011011"=> s<="11011010";--itd
				when "00010010111"=> s<="01011100";
				when "00010111011"=> s<="11010110";
				when "00011011011"=> s<="11110110";
				when "00011110111"=> s<="01001110";
				when "00011111011"=> s<="11111110";
				when "00100011011"=> s<="11011110";
				when "00100010111"=> s<="11101110";
				when others=> s<="00010000";
				end case;
			end process dekoder;
		
end Behavioral;

