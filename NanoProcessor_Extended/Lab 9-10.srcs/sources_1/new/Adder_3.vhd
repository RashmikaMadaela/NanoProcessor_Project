----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: Adder_3 - Behavioral
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

entity Adder_3 is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           S : out STD_LOGIC_VECTOR (2 downto 0);
           C_out : out STD_LOGIC);
end Adder_3;

architecture Behavioral of Adder_3 is

component FA
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC);
end component;

signal C1,C2,C3 : std_logic;
signal OutSum : std_logic_vector (2 downto 0);
signal B : std_logic := '1';

begin
    FA_0 : FA
        port map(
            A => A(0),
            B => B,
            C_in => '0',
            S => OutSum(0),
            C_out => C1
        );

    FA_1 : FA
        port map(
            A => A(1),
            B => '0',
            C_in => C1,
            S => OutSum(1),
            C_out => C2
        );
        
    FA_2 : FA
        port map(
            A => A(2),
            B => '0',
            C_in => C2,
            S => OutSum(2),
            C_out => C3
        ); 

 S <= OutSum;
 C_out <= C3;
                 
            
end Behavioral;