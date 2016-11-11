library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity extender_32bit is
port (
    INPUT_16  :in std_logic_vector( 15 downto 0);
    OUTPUT_32 :out std_logic_vector(31 downto 0)
);
end extender_32bit;

architecture Behavioral of extender_32bit is
begin
    OUTPUT_32 <= std_logic_vector(resize(signed(INPUT_16), OUTPUT_32'length));
end Behavioral;
