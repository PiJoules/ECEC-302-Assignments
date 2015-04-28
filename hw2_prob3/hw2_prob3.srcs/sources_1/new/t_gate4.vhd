----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/27/2015 04:05:23 PM
-- Design Name: 
-- Module Name: t_gate4 - Behavioral
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

entity t_gate4 is
    Port (
        x: in std_logic_vector(1 to 4);
        z: out std_logic
    );
end t_gate4;

architecture Behavioral of t_gate4 is
    component t_gate
        generic (n: natural := 4; k: natural := 2);
        Port (
            x: in std_logic_vector(1 to n);
            z: out std_logic
        );
    end component;

    begin

    U2: t_gate generic map (4,2) port map (x => x, z => z);
end Behavioral;
