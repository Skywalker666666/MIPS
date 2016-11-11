----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/11/2016 12:58:50 PM
-- Design Name: 
-- Module Name: Top_Level - Behavioral
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

entity Top_Level is
  Port (
    iClk       : in std_logic;
    iRst       : in std_logic;
    iCommand32 : in std_logic_vector(31 downto 0);
    oResult1    : out std_logic_vector(31 downto 0);
    oResult2    : out std_logic_vector(31 downto 0)
   );
end Top_Level;

architecture Structural of Top_Level is

component Register_File is
  Port (
   i_Clk      : in std_logic;
   i_Rst      : in std_logic;
   i_regwrite : in std_logic;
   i_rt       : in std_logic_vector(4 downto 0);
   i_rs       : in std_logic_vector(4 downto 0);
   i_rd       : in std_logic_vector(4 downto 0);
   i_rd_data   : in std_logic_vector(31 downto 0);
   o_rt_data  : out std_logic_vector(31 downto 0);
   o_rs_data  : out std_logic_vector(31 downto 0)
   );
end component;

component ALU_Ctrl_top is
    Port ( 
           Op5 : in  STD_LOGIC;	-- input of the ALU ctrl module
           Op4 : in  STD_LOGIC;	-- input of the ALU ctrl module
	       Op3 : in  STD_LOGIC;	-- input of the ALU ctrl module
           Op2 : in  STD_LOGIC;	-- input of the ALU ctrl module
           Op1 : in  STD_LOGIC;	-- input of the ALU ctrl module
           Op0 : in  STD_LOGIC;	-- input of the ALU ctrl module
           
           RegDst  : out STD_LOGIC;	-- output the ALU ctrl module
           ALUSrc  : out STD_LOGIC;	-- output the ALU ctrl module
           MemtoReg  : out STD_LOGIC;	-- output the ALU ctrl module
           RegWrite  : out STD_LOGIC;	-- output the ALU ctrl module
           MemRead  : out STD_LOGIC;	-- output the ALU ctrl module
           MemWrite  : out STD_LOGIC;	-- output the ALU ctrl module
           Branch  : out STD_LOGIC;	-- output the ALU ctrl module
           ALUOp1  : out STD_LOGIC;	-- output the ALU ctrl module
           ALUOp0  : out STD_LOGIC	-- output the ALU ctrl module
          );
end component;

component o_ALU_Control is
    Port ( 
       -- inputs  
           i_ALUOp       : in STD_LOGIC_VECTOR(1 downto 0); -- From Main Control Unit
           i_Inst_Funct  : in STD_LOGIC_VECTOR(5 downto 0); -- From Instruction memory
       -- outputs  
           o_ALU_Control : out STD_LOGIC_VECTOR(3 downto 0) -- Control lines to ALU
          );
 end component;

component mux_32bit is
    port (
        SEL: in STD_LOGIC;
        A:  in STD_LOGIC_VECTOR (31 downto 0);
        B:  in STD_LOGIC_VECTOR (31 downto 0);
        OUTPUT: out STD_LOGIC_VECTOR (31 downto 0)
    );
end component;

component extender_32bit is
port (
    INPUT_16  :in std_logic_vector( 15 downto 0);
    OUTPUT_32 :out std_logic_vector(31 downto 0)
);
end component;

component mux_5bit is
  Port (
    SEL: in STD_LOGIC;
    A:  in STD_LOGIC_VECTOR (4 downto 0);
    B:  in STD_LOGIC_VECTOR (4 downto 0);
    OUTPUT: out STD_LOGIC_VECTOR (4 downto 0)
   );
end component;

signal s_RegDst    : std_logic;
signal s_rd       : std_logic_vector(4 downto 0);
signal s_RegWrite : std_logic;
signal s_ALU_op   : std_logic_vector(1 downto 0);
signal s_ALU_Control : std_logic_vector(3 downto 0);
signal s_rd_data  : std_logic_vector(31 downto 0);
signal s_rt_data  : std_logic_vector(31 downto 0);
signal s_rs_data  : std_logic_vector(31 downto 0);
signal s_sign_ext   : std_logic_vector(31 downto 0);
signal s_ALU_Src  : std_logic;
signal s_B_ALU_data : std_logic_vector(31 downto 0);

begin

Inst_mux_32bit: mux_32bit
    port map(
    SEL => s_ALU_Src,
    A => s_rt_data,
    B => s_sign_ext,
    OUTPUT => s_B_ALU_data
    );
    
Inst_extender_32bit: extender_32bit
    port map(
    INPUT_16  => iCommand32(15 downto 0),
    OUTPUT_32 => s_sign_ext
    );
    

Inst_Register_File: Register_File
    port map(
    i_Clk      => iClk,
    i_Rst      => iRst,
    i_regwrite => s_RegWrite,
    i_rt       => iCommand32(20 downto 16),
    i_rs       => iCommand32(25 downto 21),
    i_rd       => s_rd,
    i_rd_data  => s_rd_data,
    o_rt_data  => s_rt_data,
    o_rs_data  => s_rs_data
    );
    
Inst_mux_5bit: mux_5bit
        port map(
        SEL    => s_RegDst,
        A      => iCommand32(20 downto 16),
        B      => iCommand32(15 downto 11),
        OUTPUT => s_rd
        );
            
Inst_ALU_Ctrl_top: ALU_Ctrl_top
    port map(
    Op5 => iCommand32(31),
    Op4 => iCommand32(30),
    Op3 => iCommand32(29),
    Op2 => iCommand32(28),
    Op1 => iCommand32(27),
    Op0 => iCommand32(26),
    
    RegDst   => s_RegDst,
    ALUSrc   => s_ALU_Src,
    MemtoReg => open,
    RegWrite => s_RegWrite,
    MemRead  => open,
    MemWrite => open,
    Branch   => open,
    ALUOp1   => s_ALU_op(1),
    ALUOp0   => s_ALU_op(0)
   );

Inst_o_ALU_Control: o_ALU_Control
    port map(
    i_ALUOp       => s_ALU_op,
    i_Inst_Funct  => iCommand32(5 downto 0),
-- outputs  
    o_ALU_Control => s_ALU_Control
   );

oResult1 <= s_rs_data;
oResult2 <= s_B_ALU_data;

end Structural;
