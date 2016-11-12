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
-- Create Date: 09/25/2016 06:20:23 PM
-- Design Name: 
-- Module Name: ConnectionBuffer1Bit - CBuffer1
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

entity ConnectionBuffer1Bit is  --used for connection 
    Port ( A : in STD_LOGIC;
           B : out STD_LOGIC);
end ConnectionBuffer1Bit;

architecture CBuffer1 of ConnectionBuffer1Bit is
begin
B <= A;
end CBuffer1;
