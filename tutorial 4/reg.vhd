library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg is
generic (n : natural);
Port (ck, ld_en : in std_logic;
    x : in std_logic_vector(n-1 downto 0);
    z : out std_logic_vector(n-1 downto 0));
end reg;

architecture beh of reg is
signal temp: std_logic_vector(n-1 downto 0);

begin
process(ck)
begin

if ck='1' and ck'event then
    if ld_en = '1' then
        temp <= x;
    end if;
end if;

end process;
z <= temp; -- write temp to output
end beh;