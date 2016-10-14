----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/30/2016 01:27:29 PM
-- Design Name: 
-- Module Name: RFC - Behavioral
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

signal d_in : std_logic;
signal q_out : std_logic;

component DFlipFlop is
  Port (
    iClk : in std_logic;
    D    : in std_logic;
    iRst : in std_logic;
    Q    : out std_logic
    );
end component;

begin

inst_DFlipFlop: DFlipFlop
    port map(
        iClk => iClk,
        D    => d_in,
        iRst => i_Rst,
        Q    => q_out
        );

d_in <= (w_sel AND i_data) OR (not(w_sel) AND q_out);

A <= q_out when (R_sel_A = '1') else 'Z';
B <= q_out when (R_sel_B = '1') else 'Z';

end Behavioral;
