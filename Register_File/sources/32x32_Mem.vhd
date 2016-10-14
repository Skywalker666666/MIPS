----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/30/2016 01:49:52 PM
-- Design Name: 
-- Module Name: 32x32_Mem - Behavioral
-- Project Name: 
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

entity Reg_Depth is
  Port ( 
    i_Clk  : in std_logic;
    i_Data : in std_logic_vector(31 downto 0);
    i_Rst  : in std_logic;
    i_w_en : in std_logic;
    i_rA_sel : in std_logic;
    i_rB_sel : in std_logic;
    o_Data_A : out std_logic_vector(31 downto 0);
    o_Data_B : out std_logic_vector(31 downto 0)
  );
end Reg_Depth;

architecture structural of Reg_Depth is

component RFC is
  Port (
  iClk   : in std_logic;
  i_Rst  : in std_logic;
  w_sel  : in std_logic;
  i_data : in std_logic;
  R_sel_A : in std_logic;
  R_sel_B : in std_logic;
  A       : out std_logic;
  B       : out std_logic
  );
end component;

begin

Inst_RFC31: RFC
    port map(
        iClk => i_Clk,
        i_Rst => i_Rst,
        w_sel => i_w_en,
        i_data => i_Data(31),
        R_sel_A => i_rA_sel,
        R_sel_B => i_rB_sel,
        A       => o_Data_A(31),
        B       => o_Data_B(31)
        );

Inst_RFC30: RFC
    port map(
        iClk => i_Clk,
        i_Rst => i_Rst,
        w_sel => i_w_en,
        i_data => i_Data(30),
        R_sel_A => i_rA_sel,
        R_sel_B => i_rB_sel,
        A       => o_Data_A(30),
        B       => o_Data_B(30)
        );

Inst_RFC29: RFC
    port map(
        iClk => i_Clk,
        i_Rst => i_Rst,
        w_sel => i_w_en,
        i_data => i_Data(29),
        R_sel_A => i_rA_sel,
        R_sel_B => i_rB_sel,
        A       => o_Data_A(29),
        B       => o_Data_B(29)
        );

Inst_RFC28: RFC
    port map(
        iClk => i_Clk,
        i_Rst => i_Rst,
        w_sel => i_w_en,
        i_data => i_Data(28),
        R_sel_A => i_rA_sel,
        R_sel_B => i_rB_sel,
        A       => o_Data_A(28),
        B       => o_Data_B(28)
        );

Inst_RFC27: RFC
    port map(
        iClk => i_Clk,
        i_Rst => i_Rst,
        w_sel => i_w_en,
        i_data => i_Data(27),
        R_sel_A => i_rA_sel,
        R_sel_B => i_rB_sel,
        A       => o_Data_A(27),
        B       => o_Data_B(27)
        );

Inst_RFC26: RFC
    port map(
        iClk => i_Clk,
        i_Rst => i_Rst,
        w_sel => i_w_en,
        i_data => i_Data(26),
        R_sel_A => i_rA_sel,
        R_sel_B => i_rB_sel,
        A       => o_Data_A(26),
        B       => o_Data_B(26)
        );

Inst_RFC25: RFC
    port map(
        iClk => i_Clk,
        i_Rst => i_Rst,
        w_sel => i_w_en,
        i_data => i_Data(25),
        R_sel_A => i_rA_sel,
        R_sel_B => i_rB_sel,
        A       => o_Data_A(25),
        B       => o_Data_B(25)
        );

Inst_RFC24: RFC
    port map(
        iClk => i_Clk,
        i_Rst => i_Rst,
        w_sel => i_w_en,
        i_data => i_Data(24),
        R_sel_A => i_rA_sel,
        R_sel_B => i_rB_sel,
        A       => o_Data_A(24),
        B       => o_Data_B(24)
        );
        
Inst_RFC23: RFC
     port map(
         iClk => i_Clk,
         i_Rst => i_Rst,
         w_sel => i_w_en,
         i_data => i_Data(23),
         R_sel_A => i_rA_sel,
         R_sel_B => i_rB_sel,
         A       => o_Data_A(23),
         B       => o_Data_B(23)
                );

Inst_RFC22: RFC
    port map(
        iClk => i_Clk,
        i_Rst => i_Rst,
        w_sel => i_w_en,
        i_data => i_Data(22),
        R_sel_A => i_rA_sel,
        R_sel_B => i_rB_sel,
        A       => o_Data_A(22),
        B       => o_Data_B(22)
        );

Inst_RFC21: RFC
    port map(
        iClk => i_Clk,
        i_Rst => i_Rst,
        w_sel => i_w_en,
        i_data => i_Data(21),
        R_sel_A => i_rA_sel,
        R_sel_B => i_rB_sel,
        A       => o_Data_A(21),
        B       => o_Data_B(21)
        );

Inst_RFC20: RFC
    port map(
        iClk => i_Clk,
        i_Rst => i_Rst,
        w_sel => i_w_en,
        i_data => i_Data(20),
        R_sel_A => i_rA_sel,
        R_sel_B => i_rB_sel,
        A       => o_Data_A(20),
        B       => o_Data_B(20)
        );

Inst_RFC19: RFC
    port map(
        iClk => i_Clk,
        i_Rst => i_Rst,
        w_sel => i_w_en,
        i_data => i_Data(19),
        R_sel_A => i_rA_sel,
        R_sel_B => i_rB_sel,
        A       => o_Data_A(19),
        B       => o_Data_B(19)
        );

Inst_RFC18: RFC
    port map(
        iClk => i_Clk,
        i_Rst => i_Rst,
        w_sel => i_w_en,
        i_data => i_Data(18),
        R_sel_A => i_rA_sel,
        R_sel_B => i_rB_sel,
        A       => o_Data_A(18),
        B       => o_Data_B(18)
        );

Inst_RFC17: RFC
    port map(
        iClk => i_Clk,
        i_Rst => i_Rst,
        w_sel => i_w_en,
        i_data => i_Data(17),
        R_sel_A => i_rA_sel,
        R_sel_B => i_rB_sel,
        A       => o_Data_A(17),
        B       => o_Data_B(17)
        );

Inst_RFC16: RFC
    port map(
        iClk => i_Clk,
        i_Rst => i_Rst,
        w_sel => i_w_en,
        i_data => i_Data(16),
        R_sel_A => i_rA_sel,
        R_sel_B => i_rB_sel,
        A       => o_Data_A(16),
        B       => o_Data_B(16)
        );

Inst_RFC15: RFC
    port map(
        iClk => i_Clk,
        i_Rst => i_Rst,
        w_sel => i_w_en,
        i_data => i_Data(15),
        R_sel_A => i_rA_sel,
        R_sel_B => i_rB_sel,
        A       => o_Data_A(15),
        B       => o_Data_B(15)
        );

Inst_RFC14: RFC
    port map(
        iClk => i_Clk,
        i_Rst => i_Rst,
        w_sel => i_w_en,
        i_data => i_Data(14),
        R_sel_A => i_rA_sel,
        R_sel_B => i_rB_sel,
        A       => o_Data_A(14),
        B       => o_Data_B(14)
        );

Inst_RFC13: RFC
    port map(
        iClk => i_Clk,
        i_Rst => i_Rst,
        w_sel => i_w_en,
        i_data => i_Data(13),
        R_sel_A => i_rA_sel,
        R_sel_B => i_rB_sel,
        A       => o_Data_A(13),
        B       => o_Data_B(13)
        );

Inst_RFC12: RFC
    port map(
        iClk => i_Clk,
        i_Rst => i_Rst,
        w_sel => i_w_en,
        i_data => i_Data(12),
        R_sel_A => i_rA_sel,
        R_sel_B => i_rB_sel,
        A       => o_Data_A(12),
        B       => o_Data_B(12)
        );

Inst_RFC11: RFC
    port map(
        iClk => i_Clk,
        i_Rst => i_Rst,
        w_sel => i_w_en,
        i_data => i_Data(11),
        R_sel_A => i_rA_sel,
        R_sel_B => i_rB_sel,
        A       => o_Data_A(11),
        B       => o_Data_B(11)
        );

Inst_RFC10: RFC
    port map(
        iClk => i_Clk,
        i_Rst => i_Rst,
        w_sel => i_w_en,
        i_data => i_Data(10),
        R_sel_A => i_rA_sel,
        R_sel_B => i_rB_sel,
        A       => o_Data_A(10),
        B       => o_Data_B(10)
        );

Inst_RFC9: RFC
    port map(
        iClk => i_Clk,
        i_Rst => i_Rst,
        w_sel => i_w_en,
        i_data => i_Data(9),
        R_sel_A => i_rA_sel,
        R_sel_B => i_rB_sel,
        A       => o_Data_A(9),
        B       => o_Data_B(9)
        );

Inst_RFC8: RFC
    port map(
        iClk => i_Clk,
        i_Rst => i_Rst,
        w_sel => i_w_en,
        i_data => i_Data(8),
        R_sel_A => i_rA_sel,
        R_sel_B => i_rB_sel,
        A       => o_Data_A(8),
        B       => o_Data_B(8)
        );

Inst_RFC7: RFC
    port map(
        iClk => i_Clk,
        i_Rst => i_Rst,
        w_sel => i_w_en,
        i_data => i_Data(7),
        R_sel_A => i_rA_sel,
        R_sel_B => i_rB_sel,
        A       => o_Data_A(7),
        B       => o_Data_B(7)
        );

Inst_RFC6: RFC
    port map(
        iClk => i_Clk,
        i_Rst => i_Rst,
        w_sel => i_w_en,
        i_data => i_Data(6),
        R_sel_A => i_rA_sel,
        R_sel_B => i_rB_sel,
        A       => o_Data_A(6),
        B       => o_Data_B(6)
        );

Inst_RFC5: RFC
    port map(
        iClk => i_Clk,
        i_Rst => i_Rst,
        w_sel => i_w_en,
        i_data => i_Data(5),
        R_sel_A => i_rA_sel,
        R_sel_B => i_rB_sel,
        A       => o_Data_A(5),
        B       => o_Data_B(5)
        );

Inst_RFC4: RFC
    port map(
        iClk => i_Clk,
        i_Rst => i_Rst,
        w_sel => i_w_en,
        i_data => i_Data(4),
        R_sel_A => i_rA_sel,
        R_sel_B => i_rB_sel,
        A       => o_Data_A(4),
        B       => o_Data_B(4)
        );

Inst_RFC3: RFC
    port map(
        iClk => i_Clk,
        i_Rst => i_Rst,
        w_sel => i_w_en,
        i_data => i_Data(3),
        R_sel_A => i_rA_sel,
        R_sel_B => i_rB_sel,
        A       => o_Data_A(3),
        B       => o_Data_B(3)
        );

Inst_RFC2: RFC
    port map(
        iClk => i_Clk,
        i_Rst => i_Rst,
        w_sel => i_w_en,
        i_data => i_Data(2),
        R_sel_A => i_rA_sel,
        R_sel_B => i_rB_sel,
        A       => o_Data_A(2),
        B       => o_Data_B(2)
        );

Inst_RFC1: RFC
    port map(
        iClk => i_Clk,
        i_Rst => i_Rst,
        w_sel => i_w_en,
        i_data => i_Data(1),
        R_sel_A => i_rA_sel,
        R_sel_B => i_rB_sel,
        A       => o_Data_A(1),
        B       => o_Data_B(1)
        );

Inst_RFC0: RFC
    port map(
        iClk => i_Clk,
        i_Rst => i_Rst,
        w_sel => i_w_en,
        i_data => i_Data(0),
        R_sel_A => i_rA_sel,
        R_sel_B => i_rB_sel,
        A       => o_Data_A(0),
        B       => o_Data_B(0)
        );

end structural;
