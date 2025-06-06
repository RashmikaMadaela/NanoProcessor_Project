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

component Tri_State_Buffer_4 is
    Port ( I : in STD_LOGIC_VECTOR (3 downto 0);
       EN : in STD_LOGIC;
       Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Decoder_3_8 is
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal enable_signal : STD_LOGIC_VECTOR (7 downto 0);

begin
   
    Decoder_3_8_0 : Decoder_3_8
        port map(
            I => Selector,
            EN => '1',
            Y => enable_signal
    );
    
    buffer_1 : Tri_State_Buffer_4
        port map(
            I => A1,
            EN => enable_signal(0),
            Q  => Output
    );
    
    buffer_2 : Tri_State_Buffer_4
        port map(
            I => A2,
            EN => enable_signal(1),
            Q  => Output
    );
    
    buffer_3 : Tri_State_Buffer_4
        port map(
            I => A3,
            EN => enable_signal(2),
            Q  => Output
    );
    
    buffer_4 : Tri_State_Buffer_4
        port map(
            I => A4,
            EN => enable_signal(3),
            Q  => Output
    );
    
    buffer_5 : Tri_State_Buffer_4
        port map(
            I => A5,
            EN => enable_signal(4),
            Q  => Output
    );
    
    buffer_6 : Tri_State_Buffer_4
        port map(
            I => A6,
            EN => enable_signal(5),
            Q  => Output
    );      
    
    buffer_7 : Tri_State_Buffer_4
        port map(
            I => A7,
            EN => enable_signal(6),
            Q  => Output
    );  
    
    buffer_8 : Tri_State_Buffer_4
        port map(
            I => A8,
            EN => enable_signal(7),
            Q  => Output
    );                     
   
end Behavioral;