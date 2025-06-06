----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/18/2025 11:02:35 AM
-- Design Name: 
-- Module Name: Mux_2_3 - Behavioral
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

entity Mux_2_3 is
    Port ( A1 : in STD_LOGIC_VECTOR (2 downto 0);
           A2 : in STD_LOGIC_VECTOR (2 downto 0);
           Selector : in STD_LOGIC;
           Output : out STD_LOGIC_VECTOR (2 downto 0));
end Mux_2_3;

architecture Behavioral of Mux_2_3 is

begin

    Output <= A1 when Selector = '0' else A2;
           
end Behavioral;
