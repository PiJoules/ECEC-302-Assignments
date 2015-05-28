


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity radixR_adder is
    generic (
        r : natural := 2; -- r radix
        n : natural := 1  -- n is the least integer > log r
    );
    port (
        x, y : in std_logic_vector(n-1 downto 0);
        ck,btn0,btn1,reset: in std_logic;
        z : out std_logic_vector(n-1 downto 0)
    );
end radixR_adder;

architecture Behavioral of radixR_adder is
    signal temp_x, temp_y : std_logic_vector(n downto 0) ; -- n+1 bit vector

    -- Loop convert the num in a given base to the decimal reporesentation 
    function radix_to_int(r: integer; num: integer) return integer is
        variable i: integer:= 0;
        variable sum: integer := 0;
        variable digit: integer;
        variable num_copy: integer;
        begin
        num_copy := num;
        while num_copy > 0 Loop
            digit := num_copy mod 10;
            sum := sum + digit * (r**i);
            num_copy := num_copy/10;
            i := i + 1;
        end loop;
        return sum;
    end radix_to_int;

    begin

    temp_x <= '0' & x; -- extend operands to
    temp_y <= '0' & y; -- n+1 bits
    
    process (ck)        
        variable x_temp, y_temp: integer;
        variable i: integer:= 0;
        variable sum: integer := 0;
        variable digit: integer;
        variable num_copy: integer;
    
        begin
        
        if ck='1' and ck'event then
            if reset='1' then
                x_temp := 0;
                y_temp := 0;
                z <= std_logic_vector(to_unsigned(0, z'length));
            else
                if btn0='1' then 
                    -- load values for x and y
                    --x_temp := radix_to_int(r, to_integer(unsigned(x)));
                    --y_temp := radix_to_int(r, to_integer(unsigned(y)));
                    
                    sum := 0;
                    i := 0;
                    num_copy := to_integer(unsigned(x))+0;
                    while num_copy > 0 loop
                        --digit := num_copy mod 10;
                        --sum := sum + (digit * (r**i));
                        num_copy := num_copy/10;
                        i := i + 1;
                    end loop;
                    x_temp := sum;
                    
                    sum := 0;
                    i := 0;
                    num_copy := to_integer(unsigned(y));
                    while num_copy > 0 loop
                        digit := num_copy mod 10;
                        sum := sum + (digit * (r**i));
                        num_copy := num_copy/10;
                        i := i + 1;
                    end loop;
                    y_temp := sum;
                elsif btn1='1' then
                    -- find and display the sum
                    z <= std_logic_vector(to_unsigned(x_temp+y_temp, z'length));
                end if;
            end if;
        end if;
    end process;

end Behavioral;
