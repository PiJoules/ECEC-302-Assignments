


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
    
    function radix_to_int(r: integer, num: integer) return integer is
        
        begin
    
        
    end radix_to_int;

    begin

    temp_x <= '0' & x; -- extend operands to
    temp_y <= '0' & y; -- n+1 bits
    
    process (en)
        variable temp: std_logic_vector(n downto 0); -- n+1 bit vector
        
        begin
        
        if en='1' and en'event then
            if reset='1' then
                n_s <= no_carry;
            else
                
            end if;
        end if;
    end process;

end Behavioral;
