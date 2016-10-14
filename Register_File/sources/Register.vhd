library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register32X32 is
  Port(    
    i_Clk  : in std_logic;
    i_Data : in std_logic_vector(31 downto 0);
    i_Rst  : in std_logic;
    i_w_en : in std_logic_vector(31 downto 0);
    i_rA_sel : in std_logic_vector(31 downto 0);
    i_rB_sel : in std_logic_vector(31 downto 0);
    o_Data_A : out std_logic_vector(31 downto 0);
    o_Data_B : out std_logic_vector(31 downto 0)
    );
end Register32X32;

architecture Behavioral of Register32X32 is

component Reg_Depth is
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
end component;

begin

Inst_Reg_Depth31: Reg_Depth
    port map(
        i_Clk  => i_Clk,
        i_Data => i_Data,
        i_Rst => i_Rst,
        i_w_en => i_w_en(31),
        i_rA_sel => i_rA_sel(31),
        i_rB_sel => i_rB_sel(31),
        o_Data_A => o_Data_A,
        o_Data_B => o_Data_B
        );

Inst_Reg_Depth30: Reg_Depth
    port map(
        i_Clk  => i_Clk,
        i_Data => i_Data,
        i_Rst => i_Rst,
        i_w_en => i_w_en(30),
        i_rA_sel => i_rA_sel(30),
        i_rB_sel => i_rB_sel(30),
        o_Data_A => o_Data_A,
        o_Data_B => o_Data_B
        );       

Inst_Reg_Depth29: Reg_Depth
    port map(
        i_Clk  => i_Clk,
        i_Data => i_Data,
        i_Rst => i_Rst,
        i_w_en => i_w_en(29),
        i_rA_sel => i_rA_sel(29),
        i_rB_sel => i_rB_sel(29),
        o_Data_A => o_Data_A,
        o_Data_B => o_Data_B
        );

Inst_Reg_Depth28: Reg_Depth
    port map(
        i_Clk  => i_Clk,
        i_Data => i_Data,
        i_Rst => i_Rst,
        i_w_en => i_w_en(28),
        i_rA_sel => i_rA_sel(28),
        i_rB_sel => i_rB_sel(28),
        o_Data_A => o_Data_A,
        o_Data_B => o_Data_B
        );

Inst_Reg_Depth27: Reg_Depth
    port map(
        i_Clk  => i_Clk,
        i_Data => i_Data,
        i_Rst => i_Rst,
        i_w_en => i_w_en(27),
        i_rA_sel => i_rA_sel(27),
        i_rB_sel => i_rB_sel(27),
        o_Data_A => o_Data_A,
        o_Data_B => o_Data_B
        );       

Inst_Reg_Depth26: Reg_Depth
    port map(
        i_Clk  => i_Clk,
        i_Data => i_Data,
        i_Rst => i_Rst,
        i_w_en => i_w_en(26),
        i_rA_sel => i_rA_sel(26),
        i_rB_sel => i_rB_sel(26),
        o_Data_A => o_Data_A,
        o_Data_B => o_Data_B
        );

Inst_Reg_Depth25: Reg_Depth
    port map(
        i_Clk  => i_Clk,
        i_Data => i_Data,
        i_Rst => i_Rst,
        i_w_en => i_w_en(25),
        i_rA_sel => i_rA_sel(25),
        i_rB_sel => i_rB_sel(25),
        o_Data_A => o_Data_A,
        o_Data_B => o_Data_B
        );

Inst_Reg_Depth24: Reg_Depth
    port map(
        i_Clk  => i_Clk,
        i_Data => i_Data,
        i_Rst => i_Rst,
        i_w_en => i_w_en(24),
        i_rA_sel => i_rA_sel(24),
        i_rB_sel => i_rB_sel(24),
        o_Data_A => o_Data_A,
        o_Data_B => o_Data_B
        );       

Inst_Reg_Depth23: Reg_Depth
    port map(
        i_Clk  => i_Clk,
        i_Data => i_Data,
        i_Rst => i_Rst,
        i_w_en => i_w_en(23),
        i_rA_sel => i_rA_sel(23),
        i_rB_sel => i_rB_sel(23),
        o_Data_A => o_Data_A,
        o_Data_B => o_Data_B
        );

Inst_Reg_Depth22: Reg_Depth
    port map(
        i_Clk  => i_Clk,
        i_Data => i_Data,
        i_Rst => i_Rst,
        i_w_en => i_w_en(22),
        i_rA_sel => i_rA_sel(22),
        i_rB_sel => i_rB_sel(22),
        o_Data_A => o_Data_A,
        o_Data_B => o_Data_B
        );

Inst_Reg_Depth21: Reg_Depth
    port map(
        i_Clk  => i_Clk,
        i_Data => i_Data,
        i_Rst => i_Rst,
        i_w_en => i_w_en(21),
        i_rA_sel => i_rA_sel(21),
        i_rB_sel => i_rB_sel(21),
        o_Data_A => o_Data_A,
        o_Data_B => o_Data_B
        );       

Inst_Reg_Depth20: Reg_Depth
    port map(
        i_Clk  => i_Clk,
        i_Data => i_Data,
        i_Rst => i_Rst,
        i_w_en => i_w_en(20),
        i_rA_sel => i_rA_sel(20),
        i_rB_sel => i_rB_sel(20),
        o_Data_A => o_Data_A,
        o_Data_B => o_Data_B
        );

Inst_Reg_Depth19: Reg_Depth
    port map(
        i_Clk  => i_Clk,
        i_Data => i_Data,
        i_Rst => i_Rst,
        i_w_en => i_w_en(19),
        i_rA_sel => i_rA_sel(19),
        i_rB_sel => i_rB_sel(19),
        o_Data_A => o_Data_A,
        o_Data_B => o_Data_B
        );

Inst_Reg_Depth18: Reg_Depth
    port map(
        i_Clk  => i_Clk,
        i_Data => i_Data,
        i_Rst => i_Rst,
        i_w_en => i_w_en(18),
        i_rA_sel => i_rA_sel(18),
        i_rB_sel => i_rB_sel(18),
        o_Data_A => o_Data_A,
        o_Data_B => o_Data_B
        );       

Inst_Reg_Depth17: Reg_Depth
    port map(
        i_Clk  => i_Clk,
        i_Data => i_Data,
        i_Rst => i_Rst,
        i_w_en => i_w_en(17),
        i_rA_sel => i_rA_sel(17),
        i_rB_sel => i_rB_sel(17),
        o_Data_A => o_Data_A,
        o_Data_B => o_Data_B
        );

Inst_Reg_Depth16: Reg_Depth
    port map(
        i_Clk  => i_Clk,
        i_Data => i_Data,
        i_Rst => i_Rst,
        i_w_en => i_w_en(16),
        i_rA_sel => i_rA_sel(16),
        i_rB_sel => i_rB_sel(16),
        o_Data_A => o_Data_A,
        o_Data_B => o_Data_B
        );

Inst_Reg_Depth15: Reg_Depth
    port map(
        i_Clk  => i_Clk,
        i_Data => i_Data,
        i_Rst => i_Rst,
        i_w_en => i_w_en(15),
        i_rA_sel => i_rA_sel(15),
        i_rB_sel => i_rB_sel(15),
        o_Data_A => o_Data_A,
        o_Data_B => o_Data_B
        );       

Inst_Reg_Depth14: Reg_Depth
    port map(
        i_Clk  => i_Clk,
        i_Data => i_Data,
        i_Rst => i_Rst,
        i_w_en => i_w_en(14),
        i_rA_sel => i_rA_sel(14),
        i_rB_sel => i_rB_sel(14),
        o_Data_A => o_Data_A,
        o_Data_B => o_Data_B
        );

Inst_Reg_Depth13: Reg_Depth
    port map(
        i_Clk  => i_Clk,
        i_Data => i_Data,
        i_Rst => i_Rst,
        i_w_en => i_w_en(13),
        i_rA_sel => i_rA_sel(13),
        i_rB_sel => i_rB_sel(13),
        o_Data_A => o_Data_A,
        o_Data_B => o_Data_B
        );

Inst_Reg_Depth12: Reg_Depth
    port map(
        i_Clk  => i_Clk,
        i_Data => i_Data,
        i_Rst => i_Rst,
        i_w_en => i_w_en(12),
        i_rA_sel => i_rA_sel(12),
        i_rB_sel => i_rB_sel(12),
        o_Data_A => o_Data_A,
        o_Data_B => o_Data_B
        );       

Inst_Reg_Depth11: Reg_Depth
    port map(
        i_Clk  => i_Clk,
        i_Data => i_Data,
        i_Rst => i_Rst,
        i_w_en => i_w_en(11),
        i_rA_sel => i_rA_sel(11),
        i_rB_sel => i_rB_sel(11),
        o_Data_A => o_Data_A,
        o_Data_B => o_Data_B
        );

Inst_Reg_Depth10: Reg_Depth
    port map(
        i_Clk  => i_Clk,
        i_Data => i_Data,
        i_Rst => i_Rst,
        i_w_en => i_w_en(10),
        i_rA_sel => i_rA_sel(10),
        i_rB_sel => i_rB_sel(10),
        o_Data_A => o_Data_A,
        o_Data_B => o_Data_B
        );

Inst_Reg_Depth9: Reg_Depth
    port map(
        i_Clk  => i_Clk,
        i_Data => i_Data,
        i_Rst => i_Rst,
        i_w_en => i_w_en(9),
        i_rA_sel => i_rA_sel(9),
        i_rB_sel => i_rB_sel(9),
        o_Data_A => o_Data_A,
        o_Data_B => o_Data_B
        );       

Inst_Reg_Depth8: Reg_Depth
    port map(
        i_Clk  => i_Clk,
        i_Data => i_Data,
        i_Rst => i_Rst,
        i_w_en => i_w_en(8),
        i_rA_sel => i_rA_sel(8),
        i_rB_sel => i_rB_sel(8),
        o_Data_A => o_Data_A,
        o_Data_B => o_Data_B
        );

Inst_Reg_Depth7: Reg_Depth
    port map(
        i_Clk  => i_Clk,
        i_Data => i_Data,
        i_Rst => i_Rst,
        i_w_en => i_w_en(7),
        i_rA_sel => i_rA_sel(7),
        i_rB_sel => i_rB_sel(7),
        o_Data_A => o_Data_A,
        o_Data_B => o_Data_B
        );

Inst_Reg_Depth6: Reg_Depth
    port map(
        i_Clk  => i_Clk,
        i_Data => i_Data,
        i_Rst => i_Rst,
        i_w_en => i_w_en(6),
        i_rA_sel => i_rA_sel(6),
        i_rB_sel => i_rB_sel(6),
        o_Data_A => o_Data_A,
        o_Data_B => o_Data_B
        );       

Inst_Reg_Depth5: Reg_Depth
    port map(
        i_Clk  => i_Clk,
        i_Data => i_Data,
        i_Rst => i_Rst,
        i_w_en => i_w_en(5),
        i_rA_sel => i_rA_sel(5),
        i_rB_sel => i_rB_sel(5),
        o_Data_A => o_Data_A,
        o_Data_B => o_Data_B
        );

Inst_Reg_Depth4: Reg_Depth
    port map(
        i_Clk  => i_Clk,
        i_Data => i_Data,
        i_Rst => i_Rst,
        i_w_en => i_w_en(4),
        i_rA_sel => i_rA_sel(4),
        i_rB_sel => i_rB_sel(4),
        o_Data_A => o_Data_A,
        o_Data_B => o_Data_B
        );       


Inst_Reg_Depth3: Reg_Depth
    port map(
        i_Clk  => i_Clk,
        i_Data => i_Data,
        i_Rst => i_Rst,
        i_w_en => i_w_en(3),
        i_rA_sel => i_rA_sel(3),
        i_rB_sel => i_rB_sel(3),
        o_Data_A => o_Data_A,
        o_Data_B => o_Data_B
        );

Inst_Reg_Depth2: Reg_Depth
    port map(
        i_Clk  => i_Clk,
        i_Data => i_Data,
        i_Rst => i_Rst,
        i_w_en => i_w_en(2),
        i_rA_sel => i_rA_sel(2),
        i_rB_sel => i_rB_sel(2),
        o_Data_A => o_Data_A,
        o_Data_B => o_Data_B
        );       

Inst_Reg_Depth1: Reg_Depth
    port map(
        i_Clk  => i_Clk,
        i_Data => i_Data,
        i_Rst => i_Rst,
        i_w_en => i_w_en(1),
        i_rA_sel => i_rA_sel(1),
        i_rB_sel => i_rB_sel(1),
        o_Data_A => o_Data_A,
        o_Data_B => o_Data_B
        );

Inst_Reg_Depth0: Reg_Depth
    port map(
         i_Clk  => i_Clk,
         i_Data => i_Data,
         i_Rst => i_Rst,
         i_w_en => i_w_en(0),
         i_rA_sel => i_rA_sel(0),
         i_rB_sel => i_rB_sel(0),
         o_Data_A => o_Data_A,
         o_Data_B => o_Data_B
         );        
        
end Behavioral;
