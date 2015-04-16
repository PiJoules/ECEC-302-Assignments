-- Description: Two 4-bit registers R1, R2 cascading using copies of reg component.
-- Output of R1 and R2 wired to LEDs
-- en (load enable) wired to button

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cascade_reg4 is
port (X : in std_logic_vector(3 downto 0);
    Z1 : out std_logic_vector(3 downto 0);
    Z2 : out std_logic_vector(3 downto 0);
    en, ck : in std_logic);
end cascade_reg4;

architecture struc of cascade_reg4 is

component reg
generic (n: natural);
port (ck, ld_en : in std_logic;
    x : in std_logic_vector(n-1 downto 0);
    z : out std_logic_vector(n-1 downto 0));
end component;

signal w : std_logic_vector(3 downto 0);

begin
R1: reg generic map (4)
    port map(x => X, z => w, ck => ck, ld_en => en); -- CASE INSENSITIVE VARIABLES !!!!!
R2: reg generic map (4)
    port map(x => w, z => Z2, ck => ck, ld_en => en);
Z1 <= w; -- wire w to output port
    
end struc;