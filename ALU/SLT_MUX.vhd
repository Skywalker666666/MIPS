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
-- Create Date: 09/25/2016 04:25:05 PM
-- Design Name: 
-- Module Name: ALU4Bit - ALU_Func
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

entity SLT_MUX is 
    Port ( F_pre    : in  STD_LOGIC_VECTOR (31 downto 0); -- before merge in the slt
           P3       : in  STD_LOGIC;
           P2       : in  STD_LOGIC;
           P1       : in  STD_LOGIC;
           P0       : in  STD_LOGIC;
           Overflow : in  STD_LOGIC;
           SltOpVal : out STD_LOGIC;
	   F        : out STD_LOGIC_VECTOR (31 downto 0)); --after merge in the slt
end SLT_MUX;

architecture SLTM_Func of SLT_MUX is

signal SltOpVal_wire : STD_LOGIC;  -- set less than operation valid, valid is 1 
signal Set           : STD_LOGIC;  -- set when the sign of the F_pre xor overflow is 1 
--Because 0 in 32bit is 0000_0000_0000_0000_0000_0000_0000_0000, sign bit is 0. 
--When A = B, result of subject is 0, will not Set.

begin
    SltOpVal_wire <= (not P3) and P2 and P1 and P0;
    SltOpVal <= SltOpVal_wire;  
    Set      <= F_pre(31) xor Overflow; -- operand A less than operand B
    F(31)    <= (not SltOpVal_wire) and F_pre(31);
    F(30)    <= (not SltOpVal_wire) and F_pre(30);
    F(29)    <= (not SltOpVal_wire) and F_pre(29);
    F(28)    <= (not SltOpVal_wire) and F_pre(28);
    F(27)    <= (not SltOpVal_wire) and F_pre(27);
    F(26)    <= (not SltOpVal_wire) and F_pre(26);
    F(25)    <= (not SltOpVal_wire) and F_pre(25);
    F(24)    <= (not SltOpVal_wire) and F_pre(24);
    F(23)    <= (not SltOpVal_wire) and F_pre(23);
    F(22)    <= (not SltOpVal_wire) and F_pre(22);
    F(21)    <= (not SltOpVal_wire) and F_pre(21);
    F(20)    <= (not SltOpVal_wire) and F_pre(20);
    F(19)    <= (not SltOpVal_wire) and F_pre(19);
    F(18)    <= (not SltOpVal_wire) and F_pre(18);
    F(17)    <= (not SltOpVal_wire) and F_pre(17);
    F(16)    <= (not SltOpVal_wire) and F_pre(16);
    F(15)    <= (not SltOpVal_wire) and F_pre(15);
    F(14)    <= (not SltOpVal_wire) and F_pre(14);
    F(13)    <= (not SltOpVal_wire) and F_pre(13);
    F(12)    <= (not SltOpVal_wire) and F_pre(12);
    F(11)    <= (not SltOpVal_wire) and F_pre(11);
    F(10)    <= (not SltOpVal_wire) and F_pre(10);
    F(9)     <= (not SltOpVal_wire) and F_pre(9);
    F(8)     <= (not SltOpVal_wire) and F_pre(8);
    F(7)     <= (not SltOpVal_wire) and F_pre(7);
    F(6)     <= (not SltOpVal_wire) and F_pre(6);
    F(5)     <= (not SltOpVal_wire) and F_pre(5);
    F(4)     <= (not SltOpVal_wire) and F_pre(4);
    F(3)     <= (not SltOpVal_wire) and F_pre(3);
    F(2)     <= (not SltOpVal_wire) and F_pre(2);
    F(1)     <= (not SltOpVal_wire) and F_pre(1);

    F(0)    <= (SltOpVal_wire and Set) or ((not SltOpVal_wire) and F_pre(0));

end SLTM_Func;
