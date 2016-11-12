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
-- Create Date: 09/25/2016 04:23:17 PM
-- Design Name: 
-- Module Name: OverflowXor - OX_Func
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

entity Overflow_gen is
    Port (
    C31          : in   STD_LOGIC;
    C32          : in   STD_LOGIC;
    SltOpVal     : in   STD_LOGIC;
    Overflow_slt : out  STD_LOGIC;
    Overflow     : out  STD_LOGIC);
end Overflow_gen;

architecture OXS_Func of Overflow_gen is
signal Temp1 : STD_LOGIC; --overflow before mask
begin
Temp1        <= C31 xor C32;
Overflow_slt <= Temp1;   --in order to do the slt, no mask
Overflow     <= Temp1 and (not(SltOpVal)); --Masked overflow for output
end OXS_Func;
