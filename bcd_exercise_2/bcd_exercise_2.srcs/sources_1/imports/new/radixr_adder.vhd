


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all; 

entity radixr_adder is
    generic (
        r: natural := 12; -- r radix (base)
        n: natural := 4 -- n is the least integer >= log2(r)
        -- example: log2(15) ~ 3.9... -> n = 4 b/c it takes 4 bits to represent the largest digit in a base 15 number in binary
        -- example: log2(16) = 4 -> n = 4 b/c it takes 5 its to represent the largest digit in a base 16 number in binary
        -- example: log2(17) ~ 4.01 -> n = 5 b/c smallest digit is equal to 16 in base 10 and it takes at least 5 bits to give 16 in binary
    );
    Port (
        x, y: in std_logic_vector(n-1 downto 0);
        ck, btn0, btn1, reset: in std_logic;
        z: out std_logic_vector(2*n-1 downto 0)
    );
end radixr_adder;

architecture Behavioral of radixr_adder is
    type state is (no_carry, carry);
    signal n_s: state := no_carry;
    
    type clk_state is (not_ready, ready, shift);
    signal clk_s: clk_state := not_ready;
    
    signal temp_x, temp_y: std_logic_vector(n downto 0); -- n+1 bit vector
    signal temp: std_logic_vector(n downto 0);
    signal en: std_logic;
    
    begin
    
    temp_x <= '0' & x; -- extend operands to n+1 bits
    temp_y <= '0' & y;
    
    temp <= std_logic_vector(unsigned(temp_x) + unsigned(temp_y));
    z(2*n-1 downto n) <= std_logic_vector(to_unsigned(to_integer(unsigned(temp))/r, n));
    z(n-1 downto 0) <= std_logic_vector(to_unsigned(to_integer(unsigned(temp)) mod r, n));
end Behavioral;
