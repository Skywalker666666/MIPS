library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_Ctrl_top is
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
           
end ALU_Ctrl_top;



architecture Behavioral of ALU_Ctrl_top is

    signal R_format : std_logic;
    signal lw : std_logic;
    signal sw : std_logic;
    signal beq : std_logic;

begin

    R_format <= ( (not(Op5)) and (not(Op4)) and (not(Op3)) and (not(Op2)) and (not(Op1)) and (not(Op0)) );
    lw <= ( (Op5) and (not(Op4)) and (not(Op3)) and (not(Op2)) and (Op1) and (Op0) );
    sw <= ( (Op5) and (not(Op4)) and (Op3) and (not(Op2)) and (Op1) and (Op0) );
    beq <= ( (not(Op5)) and (not(Op4)) and (not(Op3)) and (Op2) and (not(Op1)) and (not(Op0)) );
    
    
    RegDst <= R_format;
    ALUSrc <= lw or sw;
    MemtoReg <= lw;
    RegWrite <= R_format or lw;
    MemRead <= lw;
    MemWrite <= sw;
    Branch <= beq;
    ALUOp1 <= R_format;
    ALUOp0 <= beq;

end Behavioral;