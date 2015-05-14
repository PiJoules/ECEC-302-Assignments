----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/07/2015 02:46:16 PM
-- Design Name: 
-- Module Name: multiplier_test - Behavioral
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

entity multiplier_test is
    port (a, b : in std_logic_vector (4 downto 0);
             p : out std_logic_vector(9 downto 0));
end multiplier_test;

architecture Behavioral of multiplier_test is
    component Multiplier
        generic (N: natural := 5);
        port (a, b : in std_logic_vector (n-1 downto 0);
                     p : out std_logic_vector(2*n - 1 downto 0));
    end component;

    begin

    m1: Multiplier generic map (5) port map (a, b, p);
end Behavioral;
