----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/18/2025 11:25:58 AM
-- Design Name: 
-- Module Name: ROM - Behavioral
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

use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (12 downto 0));
end ROM;

architecture Behavioral of ROM is

type rom_type is array (0 to 7) of std_logic_vector(12 downto 0);
signal prosseser_ROM : rom_type := (

--        process => 3 MUL 2 = 6       
        "0101110000011", -- MOVI R7,3     R7 <- 3
        "0100010000010", -- MOVI R1,2     R1 <- 2
        "1101110010000", -- MUL  R7,R1    R7 <- R7 MUL R1
        "0110000000011", -- JZR  R0,3
        "0000000000000", 
        "0000000000000", 
        "0000000000000", 
        "0000000000000"
 
 --        process => 3 + 2 + 1 = 6   
        --        "0100010000100", -- MOVI R1,4        R1 <- 4             0
        --        "0100100000001", -- MOVI R2,1        R2 <- 1             1
        --        "0010100000000", -- NEG  R2          R2 <- -1            2
        --       "0000010100010", -- ADD  R1,R2       R1 <- R2 + R1       3
        --        "0110010000111", -- JZR  R1,7                            4
        --        "0001110010010", -- ADD  R7,R1       R7 <- R7 + R1       5
        --        "0110000000011", -- JZR  R0,3                            6
        --        "0110000000111" -- JZR  R0,7                             7 
         
        --        process => (-1) AND 5 = 5       
        --        "0101110001111", -- MOVI R7,-1     R7 <- -1
        --        "0100010000101", -- MOVI R1,5      R1 <- 5
        --        "0001110010000", -- AND  R7,R1     R7 <- R7 AND R1
        --        "0110000000011", -- JZR  R0,3
        --        "0000000000000", 
        --        "0000000000000", 
        --        "0000000000000", 
        --        "0000000000000"
        
        --        process => 1 OR 7 = 7       
        --        "0101110000001", -- MOVI R7,1     R7 <- 1
        --        "0100010000111", -- MOVI R1,7     R1 <- 7
        --        "0001110010001", -- OR  R7,R1     R7 <- R7 OR R1
        --        "0110000000011", -- JZR  R0,3
        --        "0000000000000", 
        --        "0000000000000", 
        --        "0000000000000", 
        --        "0000000000000"
        
        
        --        process => 1 SUB 7 = (-6)       
        --        "0101110000001", -- MOVI R7,1     R7 <- 1
        --        "0100010000111", -- MOVI R1,7     R1 <- 7
        --        "0001110010110", -- SUB  R7,R1    R7 <- R7 SUB R1
        --        "0110000000011", -- JZR  R0,3
        --        "0000000000000", 
        --        "0000000000000", 
        --        "0000000000000", 
        --        "0000000000000"  

          
    ); 

begin

data <= prosseser_ROM(to_integer(unsigned(address)));

end Behavioral;
