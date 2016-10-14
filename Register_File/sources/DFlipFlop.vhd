----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/30/2016 01:32:07 PM
-- Design Name: 
-- Module Name: DFlipFlop - Behavioral
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

entity DFlipFlop is
  Port (
    iClk : in std_logic;
    D    : in std_logic;
    iRst : in std_logic;
    Q    : out std_logic
   );
end DFlipFlop;

architecture Behavioral of DFlipFlop is

begin
process(iRst, iClk, D)
begin
    if (iRst = '1') then
        Q <= '0';
    elsif (rising_edge(iCLK) and iRst = '0') then
        Q <= D;
    end if;
end process;

end Behavioral;
