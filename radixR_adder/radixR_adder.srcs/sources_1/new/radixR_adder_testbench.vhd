


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity radixR_adder_testbench is
    port (
        x, y : in std_logic_vector(2 downto 0);
        ck,btn0,btn1,reset: in std_logic;
        z : out std_logic_vector(2 downto 0)
    );
end radixR_adder_testbench;

architecture Behavioral of radixR_adder_testbench is
component radixR_adder
    generic (
        r : natural := 2; -- r radix
        n : natural := 1  -- n is the least integer > log r
    );
    port (
        x, y : in std_logic_vector(n-1 downto 0);
        ck,btn0,btn1,reset: in std_logic;
        z : out std_logic_vector(n-1 downto 0)
    );
end component;
begin

U1: radixR_adder generic map (5, 3) port map (x, y, ck, btn0, btn1, reset, z);
end Behavioral;
