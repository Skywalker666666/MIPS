----------------------------------------------------------------------------------
-- Clarkson University 
-- EE466/566 Computer Architecture Fall 2016
-- Project Name: Project1, 4-Bit ALU Design 
--
-- Student Name   : Zhiliu Yang
-- Student ID     : 0754659 
-- Major          : Electrical and Computer Engineering
-- Email          : zhilyan@clarkson.edu
-- Instructor Name: Dr. Chen Liu
-- Date           : 09-25-2016
-- 
-- Create Date: 09/25/2016 03:14:09 PM
-- Design Name: 
-- Module Name: ALU_testbench - ALU_TB_FUNC
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
   
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU_testbench is
end ALU_testbench;

architecture ALU_TB_FUNC of ALU_testbench is

component ALU is
Port (        A        : in  STD_LOGIC_VECTOR (31 downto 0); -- operands 1
              B        : in  STD_LOGIC_VECTOR (31 downto 0); -- operands 2
              P3       : in  STD_LOGIC;                      -- Control signal 3
              P2       : in  STD_LOGIC;                      -- Conrtol signal 2
              P1       : in  STD_LOGIC;                      -- Conrtol signal 1
              P0       : in  STD_LOGIC;                      -- Conrtol signal 0
              F        : out STD_LOGIC_VECTOR (31 downto 0); -- ALU result
              COUT     : out STD_LOGIC;                      -- carry out
              Overflow : out STD_LOGIC;                      -- overflow flag
              ZERO     : out STD_LOGIC);                     -- zero flag
end component ALU;

signal A        : STD_LOGIC_VECTOR (31 downto 0); 
signal B        : STD_LOGIC_VECTOR (31 downto 0); 
signal P3       : STD_LOGIC;
signal P2       : STD_LOGIC;
signal P1       : STD_LOGIC;
signal P0       : STD_LOGIC;
signal F        : STD_LOGIC_VECTOR (31 downto 0);
signal COUT     : STD_LOGIC;
signal Overflow : STD_LOGIC; --local signal declaration
signal ZERO     : STD_LOGIC; 
begin
DUT : ALU port map(--Design under test
                             A        => A ,
                             B        => B ,
                             P3       => P3 ,
                             P2       => P2,
                             P1       => P1, 
			                 P0       => P0,
                             F        => F ,
                             COUT     => COUT,
                             Overflow => Overflow,
                             ZERO     => ZERO);
process
begin
--cycle 1: AND
    A   <= "11010000000000000000000000001011"; -- 
    B   <= "11110000000000000000000000000010"; -- 
    P3  <= '0';
    P2  <= '0';
    P1  <= '0';    
    P0  <= '0';    
    wait for 10ns;

--cycle 2: OR
    A   <= "00000000000000001111000000001011"; -- 
    B   <= "00000111110000000000000000000010"; -- 
    P3  <= '0';
    P2  <= '0';
    P1  <= '0';    
    P0  <= '1';    
    wait for 10ns;

--cycle 3: Add
    A   <= "00000000000000000000000000001011"; -- 
    B   <= "00000000000000000001111100000010"; -- 
    P3  <= '0';
    P2  <= '0';
    P1  <= '1';    
    P0  <= '0';    
    wait for 10ns;

--cycle 4: Substract
    A   <= "01110000000000000000000000001011"; -- 
    B   <= "01110000000000000000000000000010"; -- 
    P3  <= '0';
    P2  <= '1';
    P1  <= '1';    
    P0  <= '0';    
    wait for 10ns;

--cycle 5: set on less than    A < B
    A   <= "11110000000000000000000000001011"; -- 
    B   <= "01110000000000000000000000001110"; -- 
    P3  <= '0';
    P2  <= '1';
    P1  <= '1';    
    P0  <= '1';    
    wait for 10ns;

--cycle 6: NOR
    A   <= "11110000000000011100000000001011"; -- 
    B   <= "11110000000000000000000000011010"; -- 
    P3  <= '1';
    P2  <= '1';
    P1  <= '0';    
    P0  <= '0';    
    wait for 10ns;    

--cycle 7: Substract ,which ZERO is 1
    A   <= "01110000000000000000000000001011"; -- 
    B   <= "01110000000000000000000000001011"; -- 
    P3  <= '0';
    P2  <= '1';
    P1  <= '1';    
    P0  <= '0';    
    wait for 10ns;

--cycle 8: Set on less than ,A > B
    A   <= "01110000000000000000001110001011"; -- 
    B   <= "01110000000000000000000000000011"; -- 
    P3  <= '0';
    P2  <= '1';
    P1  <= '1';    
    P0  <= '1';    
    wait for 10ns;
                
--cycle 9: Set on less than ,A = B
    A   <= "00000000000000000000001110000011"; -- 
    B   <= "00000000000000000000001110000011"; -- 
    P3  <= '0';
    P2  <= '1';
    P1  <= '1';    
    P0  <= '1';    
    wait for 10ns;
    
  --cycle 10:  Add to overflow
  A   <= "01100000000000000000000000001011"; -- 
  B   <= "01111111111111111101111100000010"; -- 
  P3  <= '0';
  P2  <= '0';
  P1  <= '1';    
  P0  <= '0';    
  wait for 10ns;        
                
 -- end
    A   <= "00000000000000000000000000000000"; -- 
    B   <= "11111111111111111111111111111111"; --
    P3  <= '0';
    P2  <= '0';
    P1  <= '0';    
    P0  <= '0';
    wait for 10ns;     
    
    wait;
end process;

end ALU_TB_FUNC;
