----------------------------------------------------------------------------------
--MIPS Register File Test Bench
--By: Kevin Mottler
--Camel Clarkson 32 Bit MIPS Design Group
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--Top Level Register_File entity
entity Register_File is
  Port (
   i_Clk      : in std_logic;
   i_Rst      : in std_logic;
   i_regwrite : in std_logic;
   i_rt       : in std_logic_vector(4 downto 0);
   i_rs       : in std_logic_vector(4 downto 0);
   i_rd       : in std_logic_vector(4 downto 0);
   i_rd_data   : in std_logic_vector(31 downto 0);
   o_rt_data  : out std_logic_vector(31 downto 0);
   o_rs_data  : out std_logic_vector(31 downto 0)
   );
end Register_File;

architecture Structural of Register_File is

--Creates signals for addresses for the Decoder/Muxiplier
signal s_rd_addr  : std_logic_vector(31 downto 0);
signal s_rt_addr : std_logic_vector(31 downto 0);
signal s_rs_addr : std_logic_vector(31 downto 0);

--Declares 32 registers with a 32 bit depth
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

--Decodes the 6 bit write address to a 32 bit binary value to enable writing to a register
Inst_Decoder_W: W_Decoder
    port map(
        i_w_Addr => i_regwrite & i_rd,
        o_w_Addr => s_rd_Addr
    );

--Decodes the 5 bit rt address to a 32 bit binary value used to enable the i_rA_sel input of the Register32X32 instatiation
Inst_Decoder_rt: Decoder
    port map(
        i_w_Addr => i_rt,
        o_w_Addr => s_rt_addr    
    );
    
--Decodes the 5 bit rd address to a 32 bit binary value used to enable the i_rB_sel input of the Register32X32 instatiation
Inst_Decoder_rd: Decoder
    port map(
        i_w_Addr => i_rs,
        o_w_Addr => s_rs_addr    
    );

--Instatiates the Register32X32 component, a 32 address register, 32 bit depth memory
Inst_Register32X32: Register32X32
    port map(
        i_Clk    => i_Clk,
        i_Data   => i_rd_data,
        i_Rst    => i_Rst,
        i_w_en   => s_rd_Addr,
        i_rA_sel => s_rt_addr,
        i_rB_sel => s_rs_addr,
        o_Data_A => o_rt_Data,
        o_Data_B => o_rs_Data
        );
        
end Structural;
