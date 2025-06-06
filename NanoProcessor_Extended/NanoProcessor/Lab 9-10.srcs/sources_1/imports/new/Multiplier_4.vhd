----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2025 02:43:20 PM
-- Design Name: 
-- Module Name: Multiplier_4 - Behavioral
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

entity Multiplier_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end Multiplier_4;

architecture Behavioral of Multiplier_4 is

component FA is
    Port (
        A : in std_logic;
        B : in std_logic;
        C_in : in std_logic;
        S : out std_logic;
        C_out : out std_logic
    );
end component;

signal a0b0, a0b1, a0b2, a0b3, a1b0, a1b1, a1b2, a1b3, a2b0, a2b1, a2b2, a2b3, a3b0, a3b1, a3b2, a3b3 : STD_LOGIC;
signal c_1_1, c_1_2, c_1_3, c_1_4, c_2_1, c_2_2, c_2_3, c_2_4, c_3_1, c_3_2, c_3_3, c_3_4 : STD_LOGIC;
signal s_1_1, s_1_2, s_1_3, s_1_4, s_2_1, s_2_2, s_2_3, s_2_4, s_3_1, s_3_2, s_3_3, s_3_4 : STD_LOGIC;

begin
    
    a0b0 <= A(0) AND B(0); a0b1 <= A(0) AND B(1); a0b2 <= A(0) AND B(2); a0b3 <= A(0) AND B(3);
    a1b0 <= A(1) AND B(0); a1b1 <= A(1) AND B(1); a1b2 <= A(1) AND B(2); a1b3 <= A(1) AND B(3);
    a2b0 <= A(2) AND B(0); a2b1 <= A(2) AND B(1); a2b2 <= A(2) AND B(2); a2b3 <= A(2) AND B(3);
    a3b0 <= A(3) AND B(0); a3b1 <= A(3) AND B(1); a3b2 <= A(3) AND B(2); a3b3 <= A(3) AND B(3);
    
    FA_1_1 : FA
        port map (
        A => a1b0,
        B => a0b1,
        S => s_1_1,
        C_in => '0',
        C_out => c_1_1);
        
    FA_1_2 : FA
        port map (
        A => a2b0,
        B => a1b1,
        S => s_1_2,
        C_in => c_1_1,
        C_out => c_1_2);     

    FA_1_3 : FA
        port map (
        A => a3b0,
        B => a2b1,
        S => s_1_3,
        C_in => c_1_2,
        C_out => c_1_3);
        
    FA_1_4 : FA
        port map (
        A => c_1_3,
        B => a3b1,
        S => s_1_4,
        C_in => '0',
        C_out => c_1_4); 
            
    FA_2_1 : FA
        port map (
        A => s_1_2,
        B => a0b2,
        S => s_2_1,
        C_in => '0',
        C_out => c_2_1);
            
    FA_2_2 : FA
        port map (
        A => s_1_3,
        B => a1b2,
        S => s_2_2,
        C_in => c_2_1,
        C_out => c_2_2);     
    
    FA_2_3 : FA
        port map (
        A => s_1_4,
        B => a2b2,
        S => s_2_3,
        C_in => c_2_2,
        C_out => c_2_3);
            
    FA_2_4 : FA
        port map (
        A => c_1_4,
        B => a3b2,
        S => s_2_4,
        C_in => c_2_3,
        C_out => c_2_4);

    FA_3_1 : FA
        port map (
        A => s_2_2,
        B => a0b3,
        S => s_3_1,
        C_in => '0',
        C_out => c_3_1);
            
    FA_3_2 : FA
        port map (
        A => s_2_3,
        B => a1b3,
        S => s_3_2,
        C_in => c_3_1,
        C_out => c_3_2);     
    
    FA_3_3 : FA
        port map (
        A => s_2_4,
        B => a2b3,
        S => s_3_3,
        C_in => c_3_2,
        C_out => c_3_3);
            
    FA_3_4 : FA
        port map (
        A => c_2_4,
        B => a3b3,
        S => s_3_4,
        C_in => c_3_3,
        C_out => c_3_4); 

    Y(0) <= a0b0;
    Y(1) <= s_1_1;
    Y(2) <= s_2_1;
    Y(3) <= s_3_1;
    --Y(4) <= s_3_2;
    --Y(5) <= s_3_3;
    --Y(6) <= s_3_4;
    --Y(7) <= c_3_4;
         

end Behavioral;
