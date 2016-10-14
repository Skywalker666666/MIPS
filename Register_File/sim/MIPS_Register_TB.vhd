----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/26/2016 12:48:48 PM
-- Design Name: 
-- Module Name: MIPS_Register_TB - Behavioral
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

entity MIPS_Register_TB is
end MIPS_Register_TB;

architecture Behavioral of MIPS_Register_TB is

component Register_File is
    port(
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
end component;

--
signal s_i_Clk : std_logic := '0';
signal s_i_rt  : std_logic_vector(4 downto 0);
signal s_i_rd  : std_logic_vector(4 downto 0);
signal s_i_w_dreg : std_logic_vector(31 downto 0);
signal s_i_w_reg  : std_logic_vector(4 downto 0);
signal s_i_RW   : std_logic;
signal s_i_Rst  : std_logic;
signal s_o_rt_data : std_logic_vector(31 downto 0);
signal s_o_rd_data : std_logic_vector(31 downto 0);
constant clk_period : time := 10 ns;

begin

UUT: Register_File
    port map(
        i_Clk    => s_i_Clk,
        i_Rst    => s_i_Rst,
        i_regwrite => s_i_RW,
        i_rt     => s_i_rt,
        i_rd     => s_i_rd,
        i_w_reg  => s_i_w_reg,
        i_w_data => s_i_w_dreg,
        o_rt_data => s_o_rt_data,
        o_rd_data => s_o_rd_data
        );

clk_process: process
begin
    s_i_Clk <= '1';
    wait for clk_period/2;
    s_i_Clk <= '0';
    wait for clk_period/2;
end process;

Tests: process
begin
    s_i_rt     <= "00110";
    s_i_rd     <= "00111";
    s_i_w_dreg <= X"ABCD1234";
    s_i_w_reg  <= "00111";
    s_i_RW     <= '1';
    s_i_Rst    <= '1';
    wait for 10 ns;    
    
    s_i_rt     <= "00111";
    s_i_rd     <= "00111";
    s_i_w_dreg <= X"ABCD1234";
    s_i_w_reg  <= "00110";
    s_i_RW     <= '1';
    s_i_Rst    <= '0';
    wait for 10 ns;
    
    s_i_rt     <= "00110";
    s_i_rd     <= "00110";
    s_i_w_dreg <= X"12345678";
    s_i_w_reg  <= "00111";
    s_i_RW     <= '0';
    s_i_Rst    <= '0';
    wait for 10 ns;
    
    s_i_rt     <= "00110";
    s_i_rd     <= "00111";
    s_i_w_dreg <= X"12335566";
    s_i_w_reg  <= "10110";
    s_i_RW     <= '1';
    s_i_Rst    <= '0';
    wait for 10 ns;  
    
    s_i_rt     <= "10110";
    s_i_rd     <= "00110";
    s_i_w_dreg <= X"12335566";
    s_i_w_reg  <= "01001";
    s_i_RW     <= '0';
    s_i_Rst    <= '0';
    wait for 10 ns;  
    
    s_i_rt     <= "10110";
    s_i_rd     <= "00111";
    s_i_w_dreg <= X"FACEBEEF";
    s_i_w_reg  <= "10001";
    s_i_RW     <= '1';
    s_i_Rst    <= '0';
    wait for 10 ns;
    
    s_i_rt     <= "10001";
    s_i_rd     <= "00111";
    s_i_w_dreg <= X"FFFAABBB";
    s_i_w_reg  <= "00111";
    s_i_RW     <= '0';
    s_i_Rst    <= '0';
    wait for 10 ns;
    
    s_i_rt     <= "00110";
    s_i_rd     <= "00111";
    s_i_w_dreg <= X"FFFAABBB";
    s_i_w_reg  <= "10111";
    s_i_RW     <= '1';
    s_i_Rst    <= '0';
    wait for 10 ns;
    
    s_i_rt     <= "10001";
    s_i_rd     <= "10111";
    s_i_w_dreg <= X"FFFAABBB";
    s_i_w_reg  <= "00111";
    s_i_RW     <= '0';
    s_i_Rst    <= '0';
    wait for 10 ns;
    
    s_i_rt     <= "00001";
    s_i_rd     <= "00111";
    s_i_w_dreg <= X"FFFAABBB";
    s_i_w_reg  <= "00111";
    s_i_RW     <= '1';
    s_i_Rst    <= '1';
    wait for 10 ns;
    wait;
end process; 
end Behavioral;
