----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/30/2015 04:21:15 PM
-- Design Name: 
-- Module Name: permutation_10 - Behavioral
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

entity permutation_10 is
    Port (
        x: in std_logic_vector(9 downto 0);
        z: out std_logic_vector(9 downto 0);
        sel: in std_logic_vector(1 downto 0)
    );
end permutation_10;

architecture Behavioral of permutation_10 is

    component permutation
        generic (n: natural := 10);
        Port (
            x: in std_logic_vector(n-1 downto 0);
            z: out std_logic_vector(n-1 downto 0);
            sel: in std_logic_vector(1 downto 0)
        );
    end component;

begin

    U2: permutation generic map (10) port map (x => x, z => z, sel => sel);
end Behavioral;
