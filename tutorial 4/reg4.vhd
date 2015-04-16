----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/07/2015 02:05:59 PM
-- Design Name: 
-- Module Name: reg4 - Behavioral
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

entity reg4 is
Port (ck, ld_en : in std_logic;
    x : in std_logic_vector(3 downto 0);
    z : out std_logic_vector(3 downto 0));
end reg4;

architecture Behavioral of reg4 is
component reg
generic (n : natural);
Port (ck, ld_en : in std_logic;
    x : in std_logic_vector(3 downto 0);
    z : out std_logic_vector(3 downto 0));
end component;

begin
U1: reg generic map (4)
port map (x => x, z => z, ld_en => ld_en, ck => ck);

end Behavioral;
