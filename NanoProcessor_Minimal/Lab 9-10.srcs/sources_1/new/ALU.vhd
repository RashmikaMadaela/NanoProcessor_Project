----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/18/2025 11:45:52 AM
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
    port ( 
          A : in std_logic_vector (3 downto 0);
          B : in std_logic_vector (3 downto 0);
          Flag_EN : in std_logic;
          Selector : in std_logic_vector (2 downto 0);
          Y : out std_logic_vector (3 downto 0);
          Flag_Reg : out STD_LOGIC_VECTOR (3 downto 0)
          );         
end ALU;

architecture Behavioral of ALU is  


component Add_Sub_4
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           M : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Flag_Reg : out STD_LOGIC_VECTOR (3 downto 0));           
end component;

signal A_plus_B : std_logic_vector (3 downto 0);
signal Flags : std_logic_vector (3 downto 0);

begin
   
    ADD_SUB_UNIT : Add_Sub_4
        port map(
            A => A,
            B => B,
            M => Selector(2),
            S => A_plus_B,
            Flag_Reg => Flags
        );

             

Flag_Reg(0) <= Flags(0) AND Flag_EN;
Flag_Reg(1) <= Flags(1) AND Flag_EN;
Flag_Reg(2) <= Flags(2) AND Flag_EN;
Flag_Reg(3) <= Flags(3) AND Flag_EN;
Y <= A_plus_B;

end Behavioral;
