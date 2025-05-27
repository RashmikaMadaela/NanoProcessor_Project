----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/18/2025 12:53:48 PM
-- Design Name: 
-- Module Name: TB_ALU - Behavioral
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

entity TB_ALU is
--  Port ( );
end TB_ALU;

architecture Behavioral of TB_ALU is

component ALU
    port ( 
            A : in std_logic_vector (3 downto 0);
            B : in std_logic_vector (3 downto 0);
            Flag_EN : in std_logic;
            Selector : in std_logic_vector (2 downto 0);
            Y : out std_logic_vector (3 downto 0);
            Flag_Reg : out STD_LOGIC_VECTOR (3 downto 0)
          );         
end component;

signal A, B, Y, Flag_Reg : STD_LOGIC_VECTOR (3 downto 0);
signal Selector : STD_LOGIC_VECTOR (2 downto 0);
signal Flag_EN : STD_LOGIC;

begin
    UUT : ALU
        port map(
           A => A, 
           B => B, 
           Flag_EN => Flag_EN,
           Selector => Selector, 
           Y => Y, 
           Flag_Reg => Flag_Reg
         );

process begin

--Index Numbers
    --230381	111 000 001 111 111 101 
    --230334	111 000 001 101 111 110
    --230595	111 000 010 111 000 011
    --230621	111 000 011 000 110 101
    
--230381	111 000 001 111 111 101   using this for the following test cases
    A <= "0101"; 
    B <= "0111"; 
    Flag_EN <= '0';
    
    Selector <= "111";
    wait for 100 ns;
    
    Selector <= "001";
    wait for 100 ns;
    
    Flag_EN <= '1';
    Selector <= "000";
    wait for 100 ns;
    
    Flag_EN <= '0';
    Selector <= "111";
    wait for 100 ns;

--230595	111 000 010 111 000 011   using this for the following test cases    
    A <= "0011"; 
    B <= "0000";    
    Selector <= "111";
    wait for 100 ns;
    
    Selector <= "010";
    wait for 100 ns;

--230621	111 000 011 000 110 101   using this for the following test cases
    A <= "0101"; 
    B <= "0110";
    Flag_EN <= '1';        
    Selector <= "000";
    wait for 100 ns; 
    
    A <= "0011"; 
    B <= "0000";  
    Flag_EN <= '0';    
    Selector <= "111";
    wait;
    
end process;
                 
end Behavioral;
