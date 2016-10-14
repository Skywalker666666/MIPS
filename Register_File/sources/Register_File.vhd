library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register_File is
  Port (
   i_Clk      : in std_logic;
   i_Rst      : in std_logic;
   i_regwrite : in std_logic;
   i_rt       : in std_logic_vector(4 downto 0);
   i_rd       : in std_logic_vector(4 downto 0);
   i_w_reg    : in std_logic_vector(4 downto 0);
   i_w_data   : in std_logic_vector(31 downto 0);
   o_rt_data  : out std_logic_vector(31 downto 0);
   o_rd_data  : out std_logic_vector(31 downto 0)
   );
end Register_File;

architecture Structural of Register_File is

signal s_w_addr  : std_logic_vector(31 downto 0);
signal s_rt_addr : std_logic_vector(31 downto 0);
signal s_rd_addr : std_logic_vector(31 downto 0);
signal s_rt      : std_logic_vector(4 downto 0);
signal s_rd      : std_logic_vector(4 downto 0);
signal s_w_reg   : std_logic_vector(5 downto 0) := "000000";

component Register32X32 is
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
end component;

component Decoder is
  Port (
    i_w_Addr : in std_logic_vector(4 downto 0);
    o_w_Addr : out std_logic_vector(31 downto 0)
  );
end component;

component W_Decoder is
    Port (
        i_w_Addr : in std_logic_vector(5 downto 0);
        o_w_Addr : out std_logic_vector(31 downto 0)
     );
end component;

begin
Inst_Decoder_W: W_Decoder
    port map(
        i_w_Addr => s_w_reg,
        o_w_Addr => s_w_Addr
    );

Inst_Decoder_rt: Decoder
    port map(
        i_w_Addr => s_rt,
        o_w_Addr => s_rt_addr    
    );

Inst_Decoder_rd: Decoder
    port map(
        i_w_Addr => s_rd,
        o_w_Addr => s_rd_addr    
    );

Inst_Register32X32: Register32X32
    port map(
        i_Clk    => i_Clk,
        i_Data   => i_w_data,
        i_Rst    => i_Rst,
        i_w_en   => s_w_Addr,
        i_rA_sel => s_rt_addr,
        i_rB_sel => s_rd_addr,
        o_Data_A => o_rt_Data,
        o_Data_B => o_rd_Data
        );
process(i_Clk, i_regwrite, i_Rst) 
begin  
if (i_Rst = '0') then    
if (rising_edge(i_Clk) and i_regwrite = '1') then
    s_w_reg <= i_regwrite & i_w_reg;
end if;
if(falling_edge(i_Clk) and i_regwrite = '0') then
    s_rt <= i_rt;
    s_rd <= i_rd;
end if;
else
end if;
end process;
        
end Structural;
