----------------------------------------------------------------------------------
--MIPS Register File Test Bench
--By: Kevin Mottler
--Camel Clarkson 32 Bit MIPS Design Group
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RFC is
  Port (
    iClk   : in std_logic;
    i_Rst  : in std_logic;
    w_sel  : in std_logic;
    i_data : in std_logic;
    R_sel_A : in std_logic;
    R_sel_B : in std_logic;
    A       : out std_logic;
    B       : out std_logic
    );
end RFC;

architecture Behavioral of RFC is

--Declares signals in processing the input logic
signal d_in : std_logic;
signal q_out : std_logic;

--Declares the D Flip Flop to be used
component DFlipFlop is
  Port (
    iClk : in std_logic;
    D    : in std_logic;
    iRst : in std_logic;
    Q    : out std_logic
    );
end component;

begin

 --Instatiates the component D Flip Flop
inst_DFlipFlop: DFlipFlop
    port map(
        iClk => iClk,
        D    => d_in,
        iRst => i_Rst,
        Q    => q_out
        );

--Creates input logic to the D Flip Flop, which is the d_in for the flip flop
d_in <= (w_sel AND i_data) OR (not(w_sel) AND q_out);

--Creates a tri state buffer based on the select bit.  If the either of the select bits are high, the entity outputs data
A <= q_out when (R_sel_A = '1') else 'Z';
B <= q_out when (R_sel_B = '1') else 'Z';

end Behavioral;
