


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Entity  DFF is
    port(
        x, reset, ck: in std_logic;
        Q: out std_logic
    );
end DFF;

architecture Behavioral of DFF is

    begin

    process(ck)
        begin
        if ck='1' and ck'event then
            if reset='1' then
                Q <= '0';
            else
                Q <= x;
            end if;
        end if;
    end process;

end Behavioral;
