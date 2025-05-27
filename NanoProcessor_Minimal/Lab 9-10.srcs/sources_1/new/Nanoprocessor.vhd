----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/18/2025 12:03:25 PM
-- Design Name: 
-- Module Name: Nanoprocessor - Behavioral
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

entity Nano_Processor is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Flags : out STD_LOGIC_VECTOR( 3 downto 0);
           Dis_LED : out STD_LOGIC_VECTOR (3 downto 0);
           Dis_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
           AnodeSelector : out STD_LOGIC_VECTOR (3 downto 0)
           );
end Nano_Processor;

architecture Behavioral of Nano_Processor is

component Register_Bank 
    Port (Reg_EN : in STD_LOGIC_VECTOR (2 downto 0);
          Clk : in STD_LOGIC;
          MUX_Out : in STD_LOGIC_VECTOR (3 downto 0);
          Reset : in STD_LOGIC;
          R0_Out : out STD_LOGIC_VECTOR (3 downto 0);
          R1_Out : out STD_LOGIC_VECTOR (3 downto 0);
          R2_Out : out STD_LOGIC_VECTOR (3 downto 0);
          R3_Out : out STD_LOGIC_VECTOR (3 downto 0);
          R4_Out : out STD_LOGIC_VECTOR (3 downto 0);
          R5_Out : out STD_LOGIC_VECTOR (3 downto 0);
          R6_Out : out STD_LOGIC_VECTOR (3 downto 0);
          R7_Out : out STD_LOGIC_VECTOR (3 downto 0)
          );                
end component;

component ALU 
    port ( 
          A : in std_logic_vector (3 downto 0);
          B : in std_logic_vector (3 downto 0);
          Flag_EN : in std_logic;
          Selector : in std_logic_vector (2 downto 0);
          Y : out std_logic_vector (3 downto 0);
          Flag_Reg : out STD_LOGIC_VECTOR (3 downto 0));         
end component;

component Adder_3 
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           S : out STD_LOGIC_VECTOR (2 downto 0);
           C_out : out STD_LOGIC);
end component;

component Program_Counter 
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Data_Bus: in STD_LOGIC_VECTOR (2 downto 0);
           Mem_Selector : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Instruction_Decoder 
    Port ( Instruction_Bus : in STD_LOGIC_VECTOR (11 downto 0);
           Reg_Check_Jump : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_Sele1 : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_Sele2 : out STD_LOGIC_VECTOR (2 downto 0);
           Immediate_Value : out STD_LOGIC_VECTOR (3 downto 0);
           Func : out STD_LOGIC_VECTOR (2 downto 0);
           Load_Sele : out STD_LOGIC;
           Reg_EN : out STD_LOGIC_VECTOR (2 downto 0);
           Flag_EN : out STD_LOGIC;
           Jump_Flag : out STD_LOGIC;
           Address_to_Jump : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component ROM 
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component Mux_2_3 
    Port ( A1 : in STD_LOGIC_VECTOR (2 downto 0);
           A2 : in STD_LOGIC_VECTOR (2 downto 0);
           Selector : in STD_LOGIC;
           Output : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Mux_2_4
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Selector : in STD_LOGIC;
           Mux_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Mux_8_4 
    Port ( A1 : in STD_LOGIC_VECTOR (3 downto 0);
           A2 : in STD_LOGIC_VECTOR (3 downto 0);
           A3 : in STD_LOGIC_VECTOR (3 downto 0);
           A4 : in STD_LOGIC_VECTOR (3 downto 0);
           A5 : in STD_LOGIC_VECTOR (3 downto 0);
           A6 : in STD_LOGIC_VECTOR (3 downto 0);
           A7 : in STD_LOGIC_VECTOR (3 downto 0);
           A8 : in STD_LOGIC_VECTOR (3 downto 0);
           Selector : in STD_LOGIC_VECTOR (2 downto 0);
           Output : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component LUT is
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component Slow_Clk
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;

signal Display_out : STD_LOGIC_VECTOR (3 downto 0);
signal SlowClk_out : std_logic;

signal Load_sele, Jump_Flag, Flag_EN_ALU : std_logic;

signal Mem_Selector, Output_2_3bit_MUX ,Address_to_Jump, Output_3bit_Adder : std_logic_vector(2 downto 0);
signal Selector_8_4bit_MUX_1, Selector_8_4bit_MUX_2, Reg_EN: std_logic_vector(2 downto 0);

signal Instruction_Bus: std_logic_vector(11 downto 0);

signal Output_8_4bit_MUX_1,Output_8_4bit_MUX_2, Immediate_Value ,Output_2_4bit_MUX : std_logic_vector(3 downto 0);
signal R0_Out,R1_Out,R2_Out,R3_Out,R4_Out,R5_Out,R6_Out,R7_Out : std_logic_vector (3 downto 0);

signal ALU_Output, Flag_Reg  : std_logic_vector (3 downto 0);
signal Func  : std_logic_vector (2 downto 0);


begin

    Slow_Clock : Slow_Clk
        Port map(
            Clk_in => Clk,
            Clk_out => SlowClk_out
         );
         
    Program_Counter_Unit : Program_Counter        
        Port map ( 
            Clk => SlowClk_out,
            Reset => Reset,
            Data_Bus => Output_2_3bit_MUX,
            Mem_Selector => Mem_Selector); 
            
     Program_ROM : ROM
         Port map ( 
            address => Mem_Selector,
            data => Instruction_Bus);
     
     Mux_2_3_Unit : Mux_2_3
         Port map ( 
            A1 => Output_3bit_Adder,
            A2 => Address_to_Jump,
            Selector => Jump_Flag,
            Output => Output_2_3bit_MUX);

    Inst_Decoder : Instruction_Decoder
        Port map (
            Instruction_Bus  => Instruction_Bus,
            Reg_Check_Jump => Output_8_4bit_MUX_1,
            Func => Func,
            Reg_Sele1 => Selector_8_4bit_MUX_1,
            Reg_Sele2 => Selector_8_4bit_MUX_2,
            Immediate_Value => Immediate_Value,
            Load_Sele => Load_sele,
            Reg_EN => Reg_EN,
            Flag_EN => Flag_EN_ALU,
            Jump_Flag => Jump_Flag,
            Address_to_Jump => Address_to_Jump);

    Reg_Bank : Register_Bank 
        Port map (
            Reg_EN => Reg_EN,
            Clk => SlowClk_out,
            MUX_Out => Output_2_4bit_MUX,
            Reset => Reset,
            R0_Out => R0_Out,
            R1_Out => R1_Out,
            R2_Out => R2_Out,
            R3_Out => R3_Out,
            R4_Out => R4_Out,
            R5_Out => R5_Out,
            R6_Out => R6_Out,
            R7_Out => R7_Out
            );
                            
    Mux_2_4_Unit : Mux_2_4 
        Port map (
            A => ALU_Output,
            B => Immediate_Value,
            Selector => Load_sele,
            Mux_out => Output_2_4bit_MUX );
   
     Mux_8_4_1 : Mux_8_4 
        Port map (
            A1=>R0_Out,
            A2=>R1_Out,
            A3=>R2_Out,
            A4=>R3_Out,
            A5=>R4_Out,
            A6=>R5_Out,
            A7=>R6_Out,
            A8=>R7_Out,
            Selector => Selector_8_4bit_MUX_1,
            Output => Output_8_4bit_MUX_1 );
            
     Mux_8_4_2 : Mux_8_4 
        Port map (
            A1=>R0_Out,
            A2=>R1_Out,
            A3=>R2_Out,
            A4=>R3_Out,
            A5=>R4_Out,
            A6=>R5_Out,
            A7=>R6_Out,
            A8=>R7_Out,
            Selector => Selector_8_4bit_MUX_2,
            Output => Output_8_4bit_MUX_2);            

     Arithmetic_Logic_Unit : ALU
        port map(
            A => Output_8_4bit_MUX_1,
            B => Output_8_4bit_MUX_2,
            Selector => Func,
            Flag_EN => Flag_EN_ALU,
            Y => ALU_Output,
            Flag_Reg => Flag_Reg
            ); 
         
                  
     Adder_3_bit : Adder_3 
        Port map (
            A => Mem_Selector,
            S => Output_3bit_Adder ); 
            
     LUT_Unit : LUT
        port map(
            address => Display_out, 
            data => Dis_7Seg
         );

Display_out <= R7_Out; 
Flags <= Flag_Reg;  
Dis_LED <= Display_out;
AnodeSelector <= "1110";              
                                          
end Behavioral;
