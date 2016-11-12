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
-- Create Date: 09/25/2016 04:11:31 PM
-- Design Name: 
-- Module Name: AE - AE_Func
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

entity AE is
    Port (
    P3     :    in  STD_LOGIC;                      -- Control signal 3
    P2     :    in  STD_LOGIC;                      -- Conrtol signal 2
    P1     :    in  STD_LOGIC;                      -- Conrtol signal 1
    P0     :    in  STD_LOGIC;                      -- Conrtol signal 0
    A      :    in  STD_LOGIC;
    B      :    in  STD_LOGIC;
    Y      :    out STD_LOGIC);
end AE;

architecture AE_Func of AE is
signal Temp1 : STD_LOGIC;
signal Temp2 : STD_LOGIC;
begin
-- P1(P2 xor B)
Temp1 <= P2 and P1 and (not B);
Temp2 <= (not P2) and P1 and B; 
Y <= Temp1 or Temp2;
end AE_Func;
