

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;   

entity and_or_top_Testbench is
end and_or_top_Testbench; 

architecture behavior of and_or_top_Testbench is
 
  
 
 component ALU_Ctrl_top is
    Port ( 
           Op5 : in  STD_LOGIC;
           Op4 : in  STD_LOGIC;
	       Op3 : in  STD_LOGIC;
           Op2 : in  STD_LOGIC;
           Op1 : in  STD_LOGIC;
           Op0 : in  STD_LOGIC;
           
           RegDst  : out STD_LOGIC;
           ALUSrc  : out STD_LOGIC;
           MemtoReg  : out STD_LOGIC;
           RegWrite  : out STD_LOGIC;
           MemRead  : out STD_LOGIC;
           MemWrite  : out STD_LOGIC;
           Branch  : out STD_LOGIC;
           ALUOp1  : out STD_LOGIC;
           ALUOp0  : out STD_LOGIC
          );        
end component;
 
 
 signal Op5: std_logic := '0'; 
 signal Op4: std_logic := '0'; 
 signal Op3: std_logic := '0'; 
 signal Op2: std_logic := '0'; 
 signal Op1: std_logic := '0'; 
 signal Op0: std_logic := '0';
  
 signal RegDst : STD_LOGIC;
 signal ALUSrc  : STD_LOGIC;
 signal MemtoReg  : STD_LOGIC;
 signal RegWrite  : STD_LOGIC;
 signal MemRead  : STD_LOGIC;
 signal MemWrite  : STD_LOGIC;
 signal Branch  : STD_LOGIC;
 signal ALUOp1  : STD_LOGIC;
 signal ALUOp0  : STD_LOGIC;
 
 begin
 -- Component Instantiation
 UUT : ALU_Ctrl_top port map(Op5 => Op5,
							 Op4 => Op4, 
							 Op3 => Op3, 
							 Op2 => Op2, 
							 Op1 => Op1, 
							 Op0 => Op0, 
							 RegDst => RegDst,
                             ALUSrc => ALUSrc,
                             MemtoReg => MemtoReg,
                             RegWrite => RegWrite,
                             MemRead => MemRead,
                             MemWrite => MemWrite,
                             Branch => Branch,
                             ALUOp1 => ALUOp1,
                             ALUOp0 => ALUOp0);
 
  -- Cycle through test vectors and evaluate the results
  -- the four cases in the Truth Table
process
 begin
 	    Op5 <= '0';
		Op4 <= '0';
		Op3 <= '0';
		Op2 <= '0';
		Op1 <= '0';
		Op0 <= '0';
		
		wait for 10 ns;
		
        Op5 <= '1';
        Op4 <= '0';
        Op3 <= '0';
        Op2 <= '0';
        Op1 <= '1';
        Op0 <= '1';
		
		wait for 10 ns;
		
		Op5 <= '1';
        Op4 <= '0';
        Op3 <= '1';
        Op2 <= '0';
        Op1 <= '1';
        Op0 <= '1';
		
		wait for 10 ns;
		
		Op5 <= '0';
        Op4 <= '0';
        Op3 <= '0';
        Op2 <= '1';
        Op1 <= '0';
        Op0 <= '0';
		
		wait for 10 ns;
		
	        
	wait;
	
   end process;

END; 	
