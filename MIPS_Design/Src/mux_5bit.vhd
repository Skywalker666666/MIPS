library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_5bit is
  Port (
    SEL: in STD_LOGIC;
    A:  in STD_LOGIC_VECTOR (4 downto 0);
    B:  in STD_LOGIC_VECTOR (4 downto 0);
    OUTPUT: out STD_LOGIC_VECTOR (4 downto 0)
   );
end mux_5bit;

architecture Behavioral of mux_5bit is

begin

OUTPUT <= A when (SEL = '0') else B;

end Behavioral;
