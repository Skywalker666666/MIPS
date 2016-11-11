----------------------------------------------------------------------------------
--D Flip Flop
--By: Kevin Mottler
--Camel Clarkson 32 Bit MIPS Design Group
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--Declares the entity DFlipFlop
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
--This process statement models the behavior of a DFlipFlop
--This DFlipFLop design includes a asynchronous reset (Active High)
process(iRst, iClk, D)
begin
    if (iRst = '1') then
        Q <= '0';
    elsif (rising_edge(iCLK) and (iCLK = '1') and (iRst = '0')) then
        Q <= D;
    end if;
end process;

end Behavioral;
