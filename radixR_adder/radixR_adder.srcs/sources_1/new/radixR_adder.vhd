


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity radixR_adder is
    generic (
        r : natural := 2; -- r radix
        n : natural := 1  -- n is the least integer > log r
    );
    port (
        x, y : in std_logic_vector(n-1 donwto 0);
        ck,btn0,btn1,reset: in std_logic;
        z : out std_logic_vector(n-1 donwto 0)
    );
end radixR_adder;

architecture Behavioral of radixR_adder is
    signal temp_x, temp_y : std_logic_vector(n downto 0) ; -- n+1 bit vector
    
    --get_Nth_digit(123, 10, 1) -> 3
    --get_Nth_digit(123, 10, 2) -> 2
    --get_Nth_digit(123, 10, 3) -> 1
    function get_Nth_digit(number: integer, base: integer, n: integer) return integer is
        begin
        return (number / base ** (n-1)) mod base;
    end get_Nth_digit;

    -- Loop convert the num in a given base to the decimal reporesentation 
    function radix_to_int(r: integer, num: integer) return integer is
        variable i: integer:= 0;
        variable sum: integer := 0;
        variable digit: integer;
        begin
        while num > 0 Loop
            digit := num mod 10;
            sum := sum + digit * (r**i);
            num := num - digit * 10;
            i := i + 1;
        end loop;
        return sum;
    end radix_to_int;

    begin

    temp_x <= '0' & x; -- extend operands to
    temp_y <= '0' & y; -- n+1 bits
    
    process (ck)        
        begin
        
        if ck='1' and ck'event then
            if reset='1' then
                temp_x <= '0' & x;
                temp_y <= '0' & y;
                z <= std_logic_vector(to_unsigned(0, z'length));
            else
                if btn1='1' then 
                    -- load values for x and y
                    
                elsif btn2='1'
                    -- find and display the sum
                end if;
            end if;
        end if;
    end process;

end Behavioral;
