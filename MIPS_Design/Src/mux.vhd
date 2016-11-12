library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_32bit is
    port (
        SEL: in STD_LOGIC;
        A:  in STD_LOGIC_VECTOR (31 downto 0);
        B:  in STD_LOGIC_VECTOR (31 downto 0);
        OUTPUT: out STD_LOGIC_VECTOR (31 downto 0)
    );
    end mux_32bit;
    
 architecture Behavioral of mux_32bit is
 begin
    OUTPUT <= A when (SEL = '0') else B;
 end Behavioral;