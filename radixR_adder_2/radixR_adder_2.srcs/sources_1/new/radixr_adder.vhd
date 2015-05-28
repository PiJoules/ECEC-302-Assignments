


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all; 

entity radixr_adder is
    generic (
        r: natural := 5; -- r radix (base)
        n: natural := 3 -- n is the least integer >= log2(r)
        -- example: log2(15) ~ 3.9... -> n = 4 b/c it takes 4 bits to represent the largest digit in a base 15 number in binary
        -- example: log2(16) = 4 -> n = 4 b/c it takes 5 its to represent the largest digit in a base 16 number in binary
        -- example: log2(17) ~ 4.01 -> n = 5 b/c smallest digit is equal to 16 in base 10 and it takes at least 5 bits to give 16 in binary
    );
    Port (
        x, y: in std_logic_vector(n-1 downto 0);
        ck, btn0, btn1, reset: in std_logic;
        z: out std_logic_vector(n-1 downto 0)
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
    
    -- i honestly dont even
    process (en)
        
        begin
        
        if en='1' and en'event then
            if reset='1' then
                n_s <= no_carry;
                z <= std_logic_vector(to_unsigned(0, z'length));
            else
                case n_s is
                    when no_carry =>
                        temp <= std_logic_vector(unsigned(temp_x) + unsigned(temp_y));
                        if unsigned(temp) < r then
                            z <= temp(n-1 downto 0);
                        elsif unsigned(temp) > r-1 then
                            n_s <= carry;
                            z <= std_logic_vector(to_unsigned(to_integer(unsigned(temp))/r, z'length));
                        end if;
                    when carry =>
                        z <= std_logic_vector(to_unsigned(to_integer(unsigned(temp)) mod r, z'length));
                end case;
            end if;
        end if;
    end process;
   
    process (ck)
        begin
        
        if ck='1' and ck'event then
            case clk_s is
                when not_ready =>
                    if btn0='1' then
                        clk_s <= ready;
                    end if;
                    en <= '0';
                when ready =>
                    if btn1='1' then
                        clk_s <= shift;
                    end if;
                    en <= '0';
                when shift =>
                    en <= '1';
                    clk_s <= not_ready;
            end case;
        end if;
    end process;
    
    temp_x <= '0' & x; -- extend operands to n+1 bits
    temp_y <= '0' & y;
end Behavioral;
