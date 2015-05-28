


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity max_array_5x3 is
    Port (
        x: in std_logic_vector(14 downto 0);
        z: out std_logic_vector(2 downto 0);
        ck: in std_logic
    );
end max_array_5x3;

architecture Behavioral of max_array_5x3 is
    component max_array
        generic (L: natural := 10; N: natural := 8); 
        Port (
            x: in std_logic_vector(N*L-1 downto 0);
            z: out std_logic_vector(N-1 downto 0);
            ck: in std_logic
        );
    end component;
    
    begin

    U1: max_array generic map (L =>5, N=> 3) port map (x => x, z => z, ck => ck);
end Behavioral;
