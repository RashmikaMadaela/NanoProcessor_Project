----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/18/2025 11:03:19 AM
-- Design Name: 
-- Module Name: Mux_8_4 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mux_8_4 is
    Port (
        A1 : in STD_LOGIC_VECTOR (3 downto 0); 
        A2 : in STD_LOGIC_VECTOR (3 downto 0); 
        A3 : in STD_LOGIC_VECTOR (3 downto 0); 
        A4 : in STD_LOGIC_VECTOR (3 downto 0);
        A5 : in STD_LOGIC_VECTOR (3 downto 0);
        A6 : in STD_LOGIC_VECTOR (3 downto 0);
        A7 : in STD_LOGIC_VECTOR (3 downto 0);
        A8 : in STD_LOGIC_VECTOR (3 downto 0);
        Selector : in STD_LOGIC_VECTOR (2 downto 0);
        Output : out STD_LOGIC_VECTOR (3 downto 0)
        );
end Mux_8_4;

architecture Behavioral of Mux_8_4 is


begin
   
   process(Selector, A1, A2, A3, A4, A5, A6, A7, A8)
    begin
        case Selector is
            when "000" => Output <= A1;
            when "001" => Output <= A2;
            when "010" => Output <= A3;
            when "011" => Output <= A4;
            when "100" => Output <= A5;
            when "101" => Output <= A6;
            when "110" => Output <= A7;
            when others => Output <= A8; -- covers "111"
        end case;
    end process;
end Behavioral;