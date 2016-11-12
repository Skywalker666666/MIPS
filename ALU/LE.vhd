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
-- Create Date: 09/25/2016 04:10:39 PM
-- Design Name: 
-- Module Name: LE - LE_Func
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

entity LE is
    Port (
    P3     :    in  STD_LOGIC;
    P2     :    in  STD_LOGIC;
    P1     :    in  STD_LOGIC;
    P0     :    in  STD_LOGIC;
    A      :    in  STD_LOGIC;
    B      :    in  STD_LOGIC;
    X      :    out STD_LOGIC);
end LE;

architecture LE_Func of LE is

signal Temp1 : STD_LOGIC;
signal Temp2 : STD_LOGIC;
signal Temp3 : STD_LOGIC;
signal Temp4 : STD_LOGIC;
signal Temp5 : STD_LOGIC;

begin
Temp1 <= P3 and (not A) and (not B);
Temp2 <= P0 and A; 
Temp3 <= P1 and A;
Temp4 <= (not P3) and A and B;
Temp5 <= (not P1) and P0 and B;
X     <= (((Temp1 or Temp2) or Temp3) or Temp4) or Temp5;
end LE_Func;
