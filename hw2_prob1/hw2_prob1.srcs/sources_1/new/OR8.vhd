----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/27/2015 03:05:36 PM
-- Design Name: 
-- Module Name: OR8 - Behavioral
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

entity OR8 is
Port (
    v: in std_logic_vector(1 to 4);
    y: out std_logic
);
end OR8;

architecture Behavioral of OR8 is
    component OR_gate
        generic (n: natural := 4);
        Port (
            x: in std_logic_vector(1 to n);
            z: out std_logic
        );
    end component;

    begin

    U2: OR_gate generic map (4) port map (z => y, x => v);
end Behavioral;
