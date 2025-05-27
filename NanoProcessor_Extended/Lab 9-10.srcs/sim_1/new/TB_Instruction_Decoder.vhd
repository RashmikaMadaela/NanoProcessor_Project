----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/18/2025 01:01:43 PM
-- Design Name: 
-- Module Name: TB_Instruction_Decoder - Behavioral
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

entity TB_Instruction_Decoder is
--  Port ( );
end TB_Instruction_Decoder;

architecture Behavioral of TB_Instruction_Decoder is

component Instruction_Decoder
    Port ( Instruction_Bus : in STD_LOGIC_VECTOR (11 downto 0);
           Reg_Check_Jump : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_Sele1 : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_Sele2 : out STD_LOGIC_VECTOR (2 downto 0);
           Immediate_Value : out STD_LOGIC_VECTOR (3 downto 0);
           Func : out STD_LOGIC_VECTOR (2 downto 0);
           Load_Sele : out STD_LOGIC;
           Reg_EN : out STD_LOGIC_VECTOR (2 downto 0);
           Flag_EN : out STD_LOGIC; -- Enable the Flags in ALU
           Comp_EN : out STD_LOGIC; -- Enable the Comparator in ALU           
           Jump_Flag : out STD_LOGIC;
           Address_to_Jump : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal Instruction_Bus : STD_LOGIC_VECTOR (11 downto 0);
signal Reg_Check_Jump, Immediate_Value : STD_LOGIC_VECTOR (3 downto 0);
signal Reg_Sele1, Reg_Sele2, Reg_EN, Address_to_Jump, Func : STD_LOGIC_VECTOR (2 downto 0);
signal Flag_EN,Comp_EN, Load_Sele, Jump_Flag : STD_LOGIC;

begin
UUT : Instruction_Decoder port map(
        Instruction_Bus => Instruction_Bus,
        Reg_Check_Jump => Reg_Check_Jump,
        Flag_EN => Flag_EN,
        Func => Func,
        Comp_EN => Comp_EN,
        Reg_Sele1 => Reg_Sele1,
        Reg_Sele2 => Reg_Sele2,
        Immediate_Value => Immediate_Value,
        Load_Sele => Load_Sele,
        Reg_EN => Reg_EN,
        Jump_Flag => Jump_Flag,
        Address_to_Jump => Address_to_Jump
     );

        
stimulus_process: process
     begin
     
     Instruction_Bus <= "101110000011";  
     wait for 100 ns;
 
     Instruction_Bus <= "100100000011";  
     wait for 100 ns;
 
     Instruction_Bus <= "100010000001";  
     wait for 100 ns;
 
     Instruction_Bus <= "010010000000";  
     wait for 100 ns;
      
     Instruction_Bus <= "000100010010";  
     wait for 100 ns;
 
     Instruction_Bus <= "001110100111";  
     wait for 100 ns;
 
     Instruction_Bus <= "110100000100";  
     Reg_Check_Jump <= "0010";
     wait for 100 ns;

     Reg_Check_Jump <= "0010";
     wait for 100 ns;             
     
     end process stimulus_process;
     
     end Behavioral;     