library IEEE;
use IEEE.STD_LOGIC_1164.all;
package binary2bcdpack is
    type bcd_vector is array (natural range <>) of std_logic_vector(1 downto 0);
end binary2bcdpack;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL; use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.binary2bcdpack.all;

entity bcd2 is
    port (--a, b: in bcd_vector(1 downto 0);
        a, b: in bcd_vector(3 downto 0);
        -- c: out bcd_vector(1 downto 0);
        c: out bcd_vector(3 downto 0);
    cin: in std_logic;
    cout: out std_logic);
end bcd2;

architecture struc of bcd2 is
    signal carry: std_logic_vector(4 downto 0);
    component bcd
        port (a, b: in std_logic_vector(1 downto 0);
         c: out std_logic_vector(1 downto 0);
        cin: in std_logic;
        cout: out std_logic);
    end component;
    
    begin
    
    carry(0) <= cin; cout <= carry(4);
    G1: for i in 0 to 3 generate
        U1: bcd port map (a(i), b(i), c(i), carry(i), carry(i+1));
    end generate G1;
end struc;