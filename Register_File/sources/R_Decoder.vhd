----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/30/2016 02:38:42 PM
-- Design Name: 
-- Module Name: W_Decoder - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Decoder is
  Port (
    i_w_Addr : in std_logic_vector(4 downto 0);
    o_w_Addr : out std_logic_vector(31 downto 0)
  );
end Decoder;

architecture Behavioral of Decoder is

begin
process(i_w_Addr)
begin
case i_w_Addr is
    when "00000" =>
        o_w_Addr <= "00000000000000000000000000000001";
    when "00001" =>
        o_w_Addr <= "00000000000000000000000000000010";
    when "00010" =>
        o_w_Addr <= "00000000000000000000000000000100";    
    when "00011" =>
        o_w_Addr <= "00000000000000000000000000001000";
    when "00100" =>
        o_w_Addr <= "00000000000000000000000000010000";
    when "00101" =>
        o_w_Addr <= "00000000000000000000000000100000";
    when "00110" =>
        o_w_Addr <= "00000000000000000000000001000000";
    when "00111" =>
        o_w_Addr <= "00000000000000000000000010000000";
    when "01000" =>
        o_w_Addr <= "00000000000000000000000100000000";
    when "01001" =>
        o_w_Addr <= "00000000000000000000001000000000";
    when "01010" =>
        o_w_Addr <= "00000000000000000000010000000000";    
    when "01011" =>
        o_w_Addr <= "00000000000000000000100000000000";
    when "01100" =>
        o_w_Addr <= "00000000000000000001000000000000";
    when "01101" =>
        o_w_Addr <= "00000000000000000010000000000000";
    when "01110" =>
        o_w_Addr <= "00000000000000000100000000000000";
    when "01111" =>
        o_w_Addr <= "00000000000000001000000000000000";
    when "10000" =>
        o_w_Addr <= "00000000000000010000000000000000";
    when "10001" =>
        o_w_Addr <= "00000000000000100000000000000000";
    when "10010" =>
        o_w_Addr <= "00000000000001000000000000000000";    
    when "10011" =>
        o_w_Addr <= "00000000000010000000000000000000";
    when "10100" =>
        o_w_Addr <= "00000000000100000000000000000000";
    when "10101" =>
        o_w_Addr <= "00000000001000000000000000000000";
    when "10110" =>
        o_w_Addr <= "00000000010000000000000000000000";
    when "10111" =>
        o_w_Addr <= "00000000100000000000000000000000";
    when "11000" =>
        o_w_Addr <= "00000001000000000000000000000000";
    when "11001" =>
        o_w_Addr <= "00000010000000000000000000000000";
    when "11010" => 
        o_w_Addr <= "00000100000000000000000000000000";    
    when "11011" =>
        o_w_Addr <= "00001000000000000000000000000000";
    when "11100" =>
        o_w_Addr <= "00010000000000000000000000000000";
    when "11101" =>
        o_w_Addr <= "00100000000000000000000000000000";
    when "11110" =>
        o_w_Addr <= "01000000000000000000000000000000";
    when "11111" =>
        o_w_Addr <= "10000000000000000000000000000000";
    when others =>
        o_w_Addr <= "00000000000000000000000000000000";
end case;
end process;
end Behavioral;
