----------------------------------------------------------------------------------
--MIPS Register File Test Bench
--By: Kevin Mottler
--Camel Clarkson 32 Bit MIPS Design Group
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MIPS_Register_TB is
end MIPS_Register_TB;

architecture Behavioral of MIPS_Register_TB is

component Register_File is
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
end component;

signal s_i_Clk : std_logic := '0';
signal s_i_rt  : std_logic_vector(4 downto 0);
signal s_i_rs  : std_logic_vector(4 downto 0);
signal s_i_rd_data : std_logic_vector(31 downto 0);
signal s_i_rd  : std_logic_vector(4 downto 0);
signal s_i_RW   : std_logic;
signal s_i_Rst  : std_logic;
signal s_o_rt_data : std_logic_vector(31 downto 0);
signal s_o_rs_data : std_logic_vector(31 downto 0);
constant clk_period : time := 10 ns;

begin

UUT: Register_File
    port map(
        i_Clk    => s_i_Clk,
        i_Rst    => s_i_Rst,
        i_regwrite => s_i_RW,
        i_rt     => s_i_rt,
        i_rs     => s_i_rs,
        i_rd     => s_i_rd,
        i_rd_data => s_i_rd_data,
        o_rt_data => s_o_rt_data,
        o_rs_data => s_o_rs_data
        );

s_i_Clk <= not s_i_Clk after 5 ns;

Tests: process
begin
    s_i_rt     <= "00110";
    s_i_rs     <= "00111";
    s_i_rd_data <= X"ABCD1234";
    s_i_rd <= "00111";
    s_i_RW     <= '0';
    s_i_Rst    <= '1';
    wait for 5 ns; 
    
    s_i_rt     <= "00111";
    s_i_rs     <= "00111";
    s_i_rd_data <= X"22223333";
    s_i_rd  <= "00110";
    s_i_RW     <= '0';
    s_i_Rst    <= '0';
    wait for 5 ns;
    
    s_i_rt     <= "00111";
    s_i_rs     <= "00111";
    s_i_rd_data <= X"ABCD1234";
    s_i_rd  <= "00110";
    s_i_RW     <= '1';
    s_i_Rst    <= '0';
    wait for 5 ns;
    
    s_i_rt     <= "00110";
    s_i_rs     <= "00110";
    s_i_rd_data <= X"12345678";
    s_i_rd  <= "00110";
    s_i_RW     <= '0';
    s_i_Rst    <= '0';
    wait for 5 ns;  
    
    s_i_rt     <= "00110";
    s_i_rs     <= "00110";
    s_i_rd_data <= X"FFFFEEEE";
    s_i_rd  <= "00101";
    s_i_RW     <= '1';
    s_i_Rst    <= '0';
    wait for 5 ns;  

    s_i_rt     <= "00101";
    s_i_rs     <= "00101";
    s_i_rd_data <= X"ABCD1234";
    s_i_rd  <= "00110";
    s_i_RW     <= '0';
    s_i_Rst    <= '0';
    wait for 5 ns;  
    
    s_i_rt     <= "00101";
    s_i_rs     <= "00101";
    s_i_rd_data <= X"FFFFFFFF";
    s_i_rd  <= "00111";
    s_i_RW     <= '1';
    s_i_Rst    <= '0';
    wait for 5 ns;  
    
    s_i_rt     <= "00101";
    s_i_rs     <= "00111";
    s_i_rd_data <= X"FFFFFFFF";
    s_i_rd  <= "00111";
    s_i_RW     <= '0';
    s_i_Rst    <= '0';
    wait for 5 ns; 
    
    s_i_rt     <= "01100";
    s_i_rs     <= "00101";
    s_i_rd_data <= X"FEEDBEEF";
    s_i_rd  <= "01100";
    s_i_RW     <= '1';
    s_i_Rst    <= '0';
    wait for 5 ns; 
    
    s_i_rt     <= "01100";
    s_i_rs     <= "00111";
    s_i_rd_data <= X"FFFFFFFF";
    s_i_rd  <= "00111";
    s_i_RW     <= '1';
    s_i_Rst    <= '0';
    wait for 5 ns;   
    
    s_i_rt     <= "00110";
    s_i_rs     <= "00111";
    s_i_rd_data <= X"ABCD1234";
    s_i_rd <= "00111";
    s_i_RW     <= '0';
    s_i_Rst    <= '1';
    wait for 5 ns; 
    
    s_i_rt     <= "01100";
    s_i_rs     <= "00101";
    s_i_rd_data <= X"FEEDBEEF";
    s_i_rd  <= "01100";
    s_i_RW     <= '1';
    s_i_Rst    <= '0';
    wait for 5 ns; 
    wait;
end process; 
end Behavioral;
