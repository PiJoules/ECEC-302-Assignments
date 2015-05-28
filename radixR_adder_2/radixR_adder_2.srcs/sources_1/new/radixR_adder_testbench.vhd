
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity radixR_adder_testbench is
    Port (
        x, y: in std_logic_vector(n-1 downto 0);
        ck, btn0, btn1, reset: in std_logic;
        z: out std_logic_vector(n-1 downto 0)
    );
end radixR_adder_testbench;

architecture Behavioral of radixR_adder_testbench is

begin


end Behavioral;
