----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/18/2025 03:50:44 PM
-- Design Name: 
-- Module Name: Comp_1 - Behavioral
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

entity Comp_1 is
        Port ( num1 : in STD_LOGIC;
               num2 : in STD_LOGIC;
               EN : in STD_LOGIC;
               equal : out STD_LOGIC;       --num1 = num2
               greater : out STD_LOGIC;     --num1 > num2
               lesser : out STD_LOGIC );    --num1 < num2    
end Comp_1;

architecture Behavioral of Comp_1 is

begin
    equal <= (num1 XNOR num2) AND EN;
    greater <= (num1 AND (NOT num2)) AND EN;
    lesser <= (num2 AND (NOT num1)) AND EN;
end Behavioral;
