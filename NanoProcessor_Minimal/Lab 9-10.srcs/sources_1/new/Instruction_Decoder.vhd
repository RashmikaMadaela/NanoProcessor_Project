----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/18/2025 11:40:32 AM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
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
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is

signal Operator : std_logic_vector (1 downto 0);
signal FuncValue : std_logic_vector (2 downto 0);

begin
    Operator <= Instruction_Bus(11 downto 10);

    process (Operator, Instruction_Bus, Reg_Check_Jump, FuncValue) begin
        Jump_Flag <= '0';
        Flag_EN <= '0';
        Comp_EN <= '0';
        Load_Sele <= '0';
        Reg_Sele1 <= "000"; 
        Reg_Sele2 <= "000";
        Immediate_Value <= "0000";
        Reg_EN <= "000";
        Address_to_Jump <= "000";
        Func <= "000";
        
        FuncValue <= Instruction_Bus(2 downto 0);
                      
        if Operator = "00" then --add
            Comp_EN <= '1';
            Reg_Sele1 <= Instruction_Bus(9 downto 7);
            Reg_Sele2 <= Instruction_Bus(6 downto 4);            
            Reg_EN <= Instruction_Bus(9 downto 7);
            Func <= FuncValue;
            if ( FuncValue = "010" or FuncValue = "110" ) then
                Flag_EN <= '1';
            end if;
         
        elsif Operator = "01" then --sub
            Comp_EN <= '1';
            Reg_EN <= Instruction_Bus(9 downto 7);
            Flag_EN <= '1';
            Reg_Sele2 <= Instruction_Bus(9 downto 7);
            Func <= "110";
                                            
        elsif Operator = "10" then --move
                        
            Immediate_Value <= Instruction_Bus(3 downto 0);
            Reg_EN <= Instruction_Bus(9 downto 7);
            Load_Sele <= '1'; 
               
        elsif Operator = "11" then --jump
            Address_to_Jump <= Instruction_Bus(2 downto 0);
            Reg_Sele1 <= Instruction_Bus(9 downto 7);
            if Reg_Check_Jump = "0000" then 
                Jump_Flag <= '1';              
            end if;      
                            
        end if;
    end process;
end Behavioral;
