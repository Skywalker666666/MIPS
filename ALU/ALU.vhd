----------------------------------------------------------------------------------
-- Clarkson University 
-- CAMEL INTEREST GROUP
-- Project Name: MIPS, 32-Bit ALU Design 
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
-- Module Name: ALU - ALU_Func
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

entity ALU is
Port ( A        : in  STD_LOGIC_VECTOR (31 downto 0); -- operands 1
       B        : in  STD_LOGIC_VECTOR (31 downto 0); -- operands 2
       P3       : in  STD_LOGIC;                      -- Control signal 3
       P2       : in  STD_LOGIC;                      -- Conrtol signal 2
       P1       : in  STD_LOGIC;                      -- Conrtol signal 1
       P0       : in  STD_LOGIC;                      -- Conrtol signal 0
       F        : out STD_LOGIC_VECTOR (31 downto 0); -- ALU result
       COUT     : out STD_LOGIC;                      -- carry out
       Overflow : out STD_LOGIC;                      -- overflow flag, which masks the overflow caused by slt
       ZERO     : out STD_LOGIC);                     -- zero flag
end ALU;


architecture ALU_Func of ALU is

signal C             : STD_LOGIC_VECTOR (32 downto 0);
signal F_pre         : STD_LOGIC_VECTOR (31 downto 0);
signal F_wire        : STD_LOGIC_VECTOR (31 downto 0);
signal Overflow_wire : STD_LOGIC;                      -- overflow before mask,used to connect with Overflow module and slt mux module
signal SltOpVal_wire : STD_LOGIC;                      -- from slt mux module to overflow module

component ALU1Bit is  --component declaration of 1 bit ALU
Port ( A        : in  STD_LOGIC;
       B        : in  STD_LOGIC;
       P3       : in  STD_LOGIC;
       P2       : in  STD_LOGIC;
       P1       : in  STD_LOGIC;
       P0       : in  STD_LOGIC;
       CIN      : in  STD_LOGIC;
       F        : out STD_LOGIC;
       COUT     : out STD_LOGIC);
end component ALU1Bit;
    
component CarryinAnd is  --component declaration of carry in
    Port (
       P2       : in  STD_LOGIC;
       P1       : in  STD_LOGIC;
       C0       : out STD_LOGIC);
end component CarryinAnd;
    
component Overflow_gen is  --component declaration of overflow
    Port (
       C31          : in   STD_LOGIC;
       C32          : in   STD_LOGIC;
       SltOpVal     : in   STD_LOGIC;
       Overflow_slt : out  STD_LOGIC;
       Overflow     : out  STD_LOGIC);
end component Overflow_gen;

component ConnectionBuffer1Bit is
    Port ( A : in STD_LOGIC;
           B : out STD_LOGIC);
end component ConnectionBuffer1Bit;

component ConnectionBuffer32Bit is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : out STD_LOGIC_VECTOR (31 downto 0));
end component ConnectionBuffer32Bit;

component SLT_MUX is 
    Port ( F_pre    : in  STD_LOGIC_VECTOR (31 downto 0); -- before merge in the slt
	   P3       : in  STD_LOGIC;
           P2       : in  STD_LOGIC;
           P1       : in  STD_LOGIC;
           P0       : in  STD_LOGIC;
           Overflow : in  STD_LOGIC;
           SltOpVal : out STD_LOGIC;
	   F        : out STD_LOGIC_VECTOR (31 downto 0)); --after merge in the slt
end component SLT_MUX;

component Zero_Flag_Gen is
    Port ( F    : in  STD_LOGIC_VECTOR (31 downto 0);
           ZERO : out STD_LOGIC);
end component Zero_Flag_Gen;

begin
ALU1_0 : ALU1Bit port map(
      A    => A(0),
      B    => B(0),
      CIN  => C(0),
      P3   => P3  ,
      P2   => P2  ,
      P1   => P1  ,
      P0   => P0  ,
      F    => F_pre(0),
      COUT => C(1));

ALU1_1 : ALU1Bit port map(
      A    => A(1),
      B    => B(1),
      CIN  => C(1),
      P3   => P3  ,
      P2   => P2  ,
      P1   => P1  ,
      P0   => P0  ,
      F    => F_pre(1),
      COUT => C(2));

ALU1_2 : ALU1Bit port map(
      A    => A(2),
      B    => B(2),
      CIN  => C(2),
      P3   => P3  ,
      P2   => P2  ,
      P1   => P1  ,
      P0   => P0  ,
      F    => F_pre(2),
      COUT => C(3));

ALU1_3 : ALU1Bit port map(
      A    => A(3),
      B    => B(3),
      CIN  => C(3),
      P3   => P3  ,
      P2   => P2  ,
      P1   => P1  ,
      P0   => P0  ,
      F    => F_pre(3),
      COUT => C(4));

ALU1_4 : ALU1Bit port map(
      A    => A(4),
      B    => B(4),
      CIN  => C(4),
      P3   => P3  ,
      P2   => P2  ,
      P1   => P1  ,
      P0   => P0  ,
      F    => F_pre(4),
      COUT => C(5));

ALU1_5 : ALU1Bit port map(
      A    => A(5),
      B    => B(5),
      CIN  => C(5),
      P3   => P3  ,
      P2   => P2  ,
      P1   => P1  ,
      P0   => P0  ,
      F    => F_pre(5),
      COUT => C(6));

ALU1_6 : ALU1Bit port map(
      A    => A(6),
      B    => B(6),
      CIN  => C(6),
      P3   => P3  ,
      P2   => P2  ,
      P1   => P1  ,
      P0   => P0  ,
      F    => F_pre(6),
      COUT => C(7));

ALU1_7 : ALU1Bit port map(
      A    => A(7),
      B    => B(7),
      CIN  => C(7),
      P3   => P3  ,
      P2   => P2  ,
      P1   => P1  ,
      P0   => P0  ,
      F    => F_pre(7),
      COUT => C(8));

ALU1_8 : ALU1Bit port map(
      A    => A(8),
      B    => B(8),
      CIN  => C(8),
      P3   => P3  ,
      P2   => P2  ,
      P1   => P1  ,
      P0   => P0  ,
      F    => F_pre(8),
      COUT => C(9));

ALU1_9 : ALU1Bit port map(
      A    => A(9),
      B    => B(9),
      CIN  => C(9),
      P3   => P3  ,
      P2   => P2  ,
      P1   => P1  ,
      P0   => P0  ,
      F    => F_pre(9),
      COUT => C(10));

ALU1_10 : ALU1Bit port map(
      A    => A(10),
      B    => B(10),
      CIN  => C(10),
      P3   => P3  ,
      P2   => P2  ,
      P1   => P1  ,
      P0   => P0  ,
      F    => F_pre(10),
      COUT => C(11));

ALU1_11 : ALU1Bit port map(
      A    => A(11),
      B    => B(11),
      CIN  => C(11),
      P3   => P3  ,
      P2   => P2  ,
      P1   => P1  ,
      P0   => P0  ,
      F    => F_pre(11),
      COUT => C(12));

ALU1_12 : ALU1Bit port map(
      A    => A(12),
      B    => B(12),
      CIN  => C(12),
      P3   => P3  ,
      P2   => P2  ,
      P1   => P1  ,
      P0   => P0  ,
      F    => F_pre(12),
      COUT => C(13));

ALU1_13 : ALU1Bit port map(
      A    => A(13),
      B    => B(13),
      CIN  => C(13),
      P3   => P3  ,
      P2   => P2  ,
      P1   => P1  ,
      P0   => P0  ,
      F    => F_pre(13),
      COUT => C(14));

ALU1_14 : ALU1Bit port map(
      A    => A(14),
      B    => B(14),
      CIN  => C(14),
      P3   => P3  ,
      P2   => P2  ,
      P1   => P1  ,
      P0   => P0  ,
      F    => F_pre(14),
      COUT => C(15));

ALU1_15 : ALU1Bit port map(
      A    => A(15),
      B    => B(15),
      CIN  => C(15),
      P3   => P3  ,
      P2   => P2  ,
      P1   => P1  ,
      P0   => P0  ,
      F    => F_pre(15),
      COUT => C(16));

ALU1_16 : ALU1Bit port map(
      A    => A(16),
      B    => B(16),
      CIN  => C(16),
      P3   => P3  ,
      P2   => P2  ,
      P1   => P1  ,
      P0   => P0  ,
      F    => F_pre(16),
      COUT => C(17));

ALU1_17 : ALU1Bit port map(
      A    => A(17),
      B    => B(17),
      CIN  => C(17),
      P3   => P3  ,
      P2   => P2  ,
      P1   => P1  ,
      P0   => P0  ,
      F    => F_pre(17),
      COUT => C(18));

ALU1_18 : ALU1Bit port map(
      A    => A(18),
      B    => B(18),
      CIN  => C(18),
      P3   => P3  ,
      P2   => P2  ,
      P1   => P1  ,
      P0   => P0  ,
      F    => F_pre(18),
      COUT => C(19));

ALU1_19 : ALU1Bit port map(
      A    => A(19),
      B    => B(19),
      CIN  => C(19),
      P3   => P3  ,
      P2   => P2  ,
      P1   => P1  ,
      P0   => P0  ,
      F    => F_pre(19),
      COUT => C(20));

ALU1_20 : ALU1Bit port map(
      A    => A(20),
      B    => B(20),
      CIN  => C(20),
      P3   => P3  ,
      P2   => P2  ,
      P1   => P1  ,
      P0   => P0  ,
      F    => F_pre(20),
      COUT => C(21));

ALU1_21 : ALU1Bit port map(
      A    => A(21),
      B    => B(21),
      CIN  => C(21),
      P3   => P3  ,
      P2   => P2  ,
      P1   => P1  ,
      P0   => P0  ,
      F    => F_pre(21),
      COUT => C(22));

ALU1_22 : ALU1Bit port map(
      A    => A(22),
      B    => B(22),
      CIN  => C(22),
      P3   => P3  ,
      P2   => P2  ,
      P1   => P1  ,
      P0   => P0  ,
      F    => F_pre(22),
      COUT => C(23));

ALU1_23 : ALU1Bit port map(
      A    => A(23),
      B    => B(23),
      CIN  => C(23),
      P3   => P3  ,
      P2   => P2  ,
      P1   => P1  ,
      P0   => P0  ,
      F    => F_pre(23),
      COUT => C(24));

ALU1_24 : ALU1Bit port map(
      A    => A(24),
      B    => B(24),
      CIN  => C(24),
      P3   => P3  ,
      P2   => P2  ,
      P1   => P1  ,
      P0   => P0  ,
      F    => F_pre(24),
      COUT => C(25));

ALU1_25 : ALU1Bit port map(
      A    => A(25),
      B    => B(25),
      CIN  => C(25),
      P3   => P3  ,
      P2   => P2  ,
      P1   => P1  ,
      P0   => P0  ,
      F    => F_pre(25),
      COUT => C(26));

ALU1_26 : ALU1Bit port map(
      A    => A(26),
      B    => B(26),
      CIN  => C(26),
      P3   => P3  ,
      P2   => P2  ,
      P1   => P1  ,
      P0   => P0  ,
      F    => F_pre(26),
      COUT => C(27));

ALU1_27 : ALU1Bit port map(
      A    => A(27),
      B    => B(27),
      CIN  => C(27),
      P3   => P3  ,
      P2   => P2  ,
      P1   => P1  ,
      P0   => P0  ,
      F    => F_pre(27),
      COUT => C(28));

ALU1_28 : ALU1Bit port map(
      A    => A(28),
      B    => B(28),
      CIN  => C(28),
      P3   => P3  ,
      P2   => P2  ,
      P1   => P1  ,
      P0   => P0  ,
      F    => F_pre(28),
      COUT => C(29));

ALU1_29 : ALU1Bit port map(
      A    => A(29),
      B    => B(29),
      CIN  => C(29),
      P3   => P3  ,
      P2   => P2  ,
      P1   => P1  ,
      P0   => P0  ,
      F    => F_pre(29),
      COUT => C(30));

ALU1_30 : ALU1Bit port map(
      A    => A(30),
      B    => B(30),
      CIN  => C(30),
      P3   => P3  ,
      P2   => P2  ,
      P1   => P1  ,
      P0   => P0  ,
      F    => F_pre(30),
      COUT => C(31));

ALU1_31 : ALU1Bit port map(
      A    => A(31),
      B    => B(31),
      CIN  => C(31),
      P3   => P3  ,
      P2   => P2  ,
      P1   => P1  ,
      P0   => P0  ,
      F    => F_pre(31),
      COUT => C(32));

CA : CarryinAnd port map(
      P2   => P2  ,
      P1   => P1  ,
      C0   => C(0));

OFXS : Overflow_gen port map(
      C31  => C(31),
      C32  => C(32),
      SltOpVal => SltOpVal_wire,
      Overflow_slt => Overflow_wire, --connect between the overflow and slt
      Overflow => Overflow);          --output to outside of ALU

CBuffer1 : ConnectionBuffer1Bit port map( 
      A   => C(32),
      B   => COUT);

SLTM : SLT_MUX Port map( 
      F_pre    => F_pre(31 downto 0),
      P3       => P3,
      P2       => P2,
      P1       => p1, 
      P0       => P0, 
      Overflow => Overflow_wire, 
      SltOpVal => SltOpVal_wire,  
      F        => F_wire(31 downto 0));

ZFG  :Zero_Flag_Gen Port map( 
      F    => F_wire(31 downto 0),  -- use F will be better.
      ZERO => ZERO);


FBuffer32 : ConnectionBuffer32Bit port map( 
      A   => F_wire(31 downto 0),
      B   => F(31 downto 0));      

      
end ALU_Func;
