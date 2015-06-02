library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity bcd is
    port (a, b: in std_logic_vector(1 downto 0);
     c: out std_logic_vector(1 downto 0);
    cin: in std_logic;
    cout: out std_logic);
end bcd;

architecture Behavioral of bcd is
    begin
    
    process(a, b, cin)
        variable temp, tempa, tempb: std_logic_vector(2 downto 0);
        
        begin
        
         tempa := '0'&a;
         tempb := '0'&b;
         temp := tempa + tempb;
         if cin = '1' then
            temp := temp + "001";
         end if;
         --if temp > "01001" then
         if temp > "010" then
            temp := temp + "001"; cout <= '1';
         else
            cout <= '0';
         end if;
         c <= temp(1 downto 0);
    end process;
end Behavioral;