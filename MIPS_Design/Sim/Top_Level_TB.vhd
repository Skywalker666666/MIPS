----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/11/2016 01:36:23 PM
-- Design Name: 
-- Module Name: Top_Level_TB - Behavioral
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

entity Top_Level_TB is
--  Port ( );
end Top_Level_TB;

architecture Behavioral of Top_Level_TB is

component Top_Level is
  Port (
    iClk       : in std_logic;
    iRst       : in std_logic;
    iCommand32 : in std_logic_vector(31 downto 0);
    oResult1    : out std_logic_vector(31 downto 0);
    oResult2    : out std_logic_vector(31 downto 0)
   );
end component;

signal s_Clk : std_logic := '1';
signal s_Rst : std_logic;
signal s_Command32 : std_logic_vector(31 downto 0);
signal s_Result1   : std_logic_vector(31 downto 0);
signal s_Result2   : std_logic_vector(31 downto 0);

begin

s_Clk <= not s_Clk after 10 ns;

DUT: Top_Level
    port map(
        iClk => s_Clk,
        iRst => s_Rst,
        iCommand32 => s_Command32,
        oResult1 => s_Result1,
        oResult2 => s_Result2
        );
        
Test: process
begin
    s_Rst <= '1';
    wait for 10 ns;
    
    s_Rst <= '0';
    s_Command32 <= "00000010001100100100000000100000";
    wait for 10 ns;
    wait;
    
end process;

end Behavioral;
