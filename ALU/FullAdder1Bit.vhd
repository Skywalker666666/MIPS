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
-- Create Date: 09/25/2016 02:34:03 PM
-- Design Name: 
-- Module Name: FullAdder1Bit - FA1Func
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:



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

entity FullAdder1Bit is
    Port ( A    : in  STD_LOGIC;
           B    : in  STD_LOGIC;
           CIN  : in  STD_LOGIC;
           SUM  : out STD_LOGIC;
           COUT : out STD_LOGIC);
end FullAdder1Bit;

architecture FA1Func of FullAdder1Bit is
begin
SUM  <= (A xor B) xor CIN;
COUT <= (A and B) or ((A xor B) and CIN);
end FA1Func;