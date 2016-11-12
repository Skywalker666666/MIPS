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


entity Zero_Flag_Gen is
    Port ( F    : in  STD_LOGIC_VECTOR (31 downto 0);
           ZERO : out STD_LOGIC);
end Zero_Flag_Gen;

architecture Zero_Flag_Func of Zero_Flag_Gen is
begin
ZERO <= not(F(31) or F(30) or F(29) or F(28) or F(27) or F(26) or F(25) or F(24) or F(23) or F(22) or F(21) or F(20) or F(19) or F(18) or F(17) or F(16) or F(15) or F(14) or F(13) or F(12) or F(11) or F(10) or F(9) or F(8) or F(7) or F(6) or F(5) or F(4) or F(3) or F(2) or F(1) or F(0));
end Zero_Flag_Func;

