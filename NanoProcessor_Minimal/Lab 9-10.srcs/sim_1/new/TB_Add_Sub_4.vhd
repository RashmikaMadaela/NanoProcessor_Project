----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: TB_Add_Sub_4 - Behavioral
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

entity TB_Add_Sub_4 is
--  Port ( );
end TB_Add_Sub_4;

architecture Behavioral of TB_Add_Sub_4 is

component Add_Sub_4 
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           M : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
--           Overflow_Flag : out STD_LOGIC;
--           C_out : out STD_LOGIC;
--           Zero_Flag : out STD_LOGIC;
--           Sign_Flag : out STD_LOGIC
           Flag_Reg : out STD_LOGIC_VECTOR (3 downto 0));
end component;

--signal A,B,S : std_logic_vector (3 downto 0);
--signal M, Overflow_Flag, C_out, Zero_Flag, Sign_Flag: std_logic;
signal A,B,S, Flag_reg : std_logic_vector (3 downto 0);
signal M: std_logic;

begin 
    UUT: Add_Sub_4 port map(
        A => A,
        B => B,
        M => M,
        S => S,
        Flag_Reg => Flag_Reg
        );

process begin
   
--   Index Numbers
--    230381	11 1000 0001 1111 1101
--    230334	11 1000 0001 1011 1110
--    230595	11 1000 0010 1110 0011
--    230621	11 1000 0011 0001 1011
     
    A <= "1101";
    B <= "1111";
    M <= '0';
    wait for 100 ns;
    
    A <= "0001";
    B <= "1000";
    M <= '0';
    wait for 100 ns;
    
    A <= "1110";
    B <= "1011";
    M <= '1';
    wait for 100 ns;

    A <= "0011";
    B <= "1110";
    M <= '0';
    wait for 100 ns;
    
    A <= "0011";
    B <= "1110";
    M <= '1';
    wait ;
    
end process;
end Behavioral;