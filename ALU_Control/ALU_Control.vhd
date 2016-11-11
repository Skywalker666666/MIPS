library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity o_ALU_Control is
    Port ( 
       -- inputs  
           i_ALUOp       : in STD_LOGIC_VECTOR(1 downto 0); -- From Main Control Unit
           i_Inst_Funct  : in STD_LOGIC_VECTOR(5 downto 0); -- From Instruction memory
       -- outputs  
           o_ALU_Control : out STD_LOGIC_VECTOR(3 downto 0) -- Control lines to ALU
          );
 end o_ALU_Control;

architecture Behavioral of o_ALU_Control is
begin

o_ALU_Control(0) <= i_ALUOp(1) and ((not(i_Inst_Funct(3)) and not(i_Inst_Funct(1)) and i_Inst_Funct(2) and i_Inst_Funct(0)) or (i_Inst_Funct(3) and i_Inst_Funct(1) and not(i_Inst_Funct(2)) and not(i_Inst_Funct(0))));
o_ALU_Control(1) <= not(i_ALUOp(1)) or (not(i_Inst_Funct(2)) and not(i_Inst_Funct(0)));
o_ALU_Control(2) <= (not(i_ALUOp(1)) and i_ALUOp(0)) or (i_ALUOp(1) and not(i_Inst_Funct(2)) and i_Inst_Funct(1) and not(i_Inst_Funct(0)));
o_ALU_Control(3) <= '0';

end Behavioral;
