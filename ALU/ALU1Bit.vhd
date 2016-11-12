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
-- Create Date: 09/25/2016 05:35:42 PM
-- Design Name: 
-- Module Name: ALU1Bit - ALU1_Func
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU1Bit is
Port ( A        : in  STD_LOGIC;
       B        : in  STD_LOGIC;
       CIN      : in  STD_LOGIC;
       P3       : in  STD_LOGIC;                      -- Control signal 3
       P2       : in  STD_LOGIC;                      -- Conrtol signal 2
       P1       : in  STD_LOGIC;                      -- Conrtol signal 1
       P0       : in  STD_LOGIC;                      -- Conrtol signal 0
       F        : out STD_LOGIC;
       COUT     : out STD_LOGIC);
end ALU1Bit;

architecture ALU1_Func of ALU1Bit is
component LE is       --component declaration of Logic Extender 
    Port (     
           P3   : in  STD_LOGIC;                      
           P2   : in  STD_LOGIC;                      
           P1   : in  STD_LOGIC;                      
           P0   : in  STD_LOGIC;                       
           A    : in  STD_LOGIC;
           B    : in  STD_LOGIC;
           X    : out STD_LOGIC);
end component LE;
    
component AE is      --component declaration of Arithmetic Extender
    Port (
           P3   : in  STD_LOGIC;                      
           P2   : in  STD_LOGIC;                      
           P1   : in  STD_LOGIC;                      
           P0   : in  STD_LOGIC;                       
           A    : in  STD_LOGIC;
           B    : in  STD_LOGIC;
           Y    : out STD_LOGIC);
end component AE;

component FullAdder1Bit is  --component declaration of 1 bit full adder
    Port ( A    : in  STD_LOGIC;
           B    : in  STD_LOGIC;
           CIN  : in  STD_LOGIC;
           SUM  : out STD_LOGIC;
           COUT : out STD_LOGIC);
end component FullAdder1Bit; 

signal X_LE_Adder  : STD_LOGIC;
signal Y_AE_Adder  : STD_LOGIC;

begin
LE1 : LE port map(
P3    => P3,
P2    => P2,
P1    => P1,
P0    => P0,
A     => A ,
B     => B ,
X     => X_LE_Adder);


AE1 : AE port map(
P3    => P3,
P2    => P2,
P1    => P1,
P0    => P0,
A    => A ,
B    => B ,
Y    => Y_AE_Adder);

FA1 : FullAdder1Bit port map(
A    => X_LE_Adder,
B    => Y_AE_Adder, 
CIN  => CIN       , 
SUM  => F         ,
COUT => COUT);

end ALU1_Func;
