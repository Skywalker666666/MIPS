----------------------------------------------------------------------------------
--MIPS Register File Test Bench
--By: Kevin Mottler
--Camel Clarkson 32 Bit MIPS Design Group
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity W_Decoder is
    Port (
        i_w_Addr : in std_logic_vector(5 downto 0);
        o_w_Addr : out std_logic_vector(31 downto 0)
     );
end W_Decoder;

architecture Behavioral of W_Decoder is

begin
process(i_w_Addr)
begin
case i_w_Addr is
    when "100000" =>
        o_w_Addr <= "00000000000000000000000000000001";
    when "100001" =>
        o_w_Addr <= "00000000000000000000000000000010";
    when "100010" =>
        o_w_Addr <= "00000000000000000000000000000100";     
    when "100011" =>
        o_w_Addr <= "00000000000000000000000000001000";
    when "100100" =>
        o_w_Addr <= "00000000000000000000000000010000";
    when "100101" =>
        o_w_Addr <= "00000000000000000000000000100000";
    when "100110" =>
        o_w_Addr <= "00000000000000000000000001000000";
    when "100111" =>
        o_w_Addr <= "00000000000000000000000010000000";
    when "101000" =>
        o_w_Addr <= "00000000000000000000000100000000";
    when "101001" =>
        o_w_Addr <= "00000000000000000000001000000000";
    when "101010" =>
        o_w_Addr <= "00000000000000000000010000000000";     
    when "101011" =>
        o_w_Addr <= "00000000000000000000100000000000";
    when "101100" =>
        o_w_Addr <= "00000000000000000001000000000000";
    when "101101" =>
        o_w_Addr <= "00000000000000000010000000000000";
    when "101110" =>
        o_w_Addr <= "00000000000000000100000000000000";
    when "101111" =>
        o_w_Addr <= "00000000000000001000000000000000";
    when "110000" =>
        o_w_Addr <= "00000000000000010000000000000000";
    when "110001" =>
        o_w_Addr <= "00000000000000100000000000000000";
    when "110010" =>
        o_w_Addr <= "00000000000001000000000000000000";    
    when "110011" =>
        o_w_Addr <= "00000000000010000000000000000000";
    when "110100" =>
        o_w_Addr <= "00000000000100000000000000000000";
    when "110101" =>
        o_w_Addr <= "00000000001000000000000000000000";
    when "110110" =>
        o_w_Addr <= "00000000010000000000000000000000";
    when "110111" =>
        o_w_Addr <= "00000000100000000000000000000000";
    when "111000" =>
        o_w_Addr <= "00000001000000000000000000000000";
    when "111001" =>
        o_w_Addr <= "00000010000000000000000000000000";
    when "111010" => 
        o_w_Addr <= "00000100000000000000000000000000";  
    when "111011" =>
        o_w_Addr <= "00001000000000000000000000000000";
    when "111100" =>
        o_w_Addr <= "00010000000000000000000000000000";
    when "111101" =>
        o_w_Addr <= "00100000000000000000000000000000";
    when "111110" =>
        o_w_Addr <= "01000000000000000000000000000000";
    when "111111" =>
        o_w_Addr <= "10000000000000000000000000000000";
    when others =>
        o_w_Addr <= "00000000000000000000000000000000";
end case;
end process;

end Behavioral;
