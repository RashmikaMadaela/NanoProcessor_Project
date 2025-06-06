----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/18/2025 01:09:40 PM
-- Design Name: 
-- Module Name: TB_Mux_2_4 - Behavioral
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

entity TB_Mux_2_4 is
--  Port ( );
end TB_Mux_2_4;

architecture Behavioral of TB_Mux_2_4 is

component Mux_2_4 
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Selector : in STD_LOGIC;
           Mux_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal A,B,Mux_out:std_logic_vector(3 downto 0);
signal Selector: std_logic;

begin
    UUT:Mux_2_4
        PORT MAP(
        A=>A,
        B=>B,
        Mux_out=>Mux_out,
        Selector=>Selector
    );

process begin

    A<="0000";
    B<="0001";
    Selector<='0';    
    wait for 100ns;
    
    Selector<='1';    
    wait for 100ns;
    
    A<="0010";
    B<="0011";
    Selector<='0';    
    wait for 100ns;
    
    Selector<='1';    
    wait for 100ns;
    
    wait;
end process;

end Behavioral;
