library ieee;
use ieee.std_logic_1164.all;

entity DFF is
  port (
    x, ck: in std_logic;
    z: out std_logic
  );
end DFF;

architecture beh of DFF is
  signal temp: std_logic;
  
  begin
    
  process(ck)
    begin
      
    if ck='1' and ck'event then
      temp <= x;
    end if;
  end process;
  
  z <= temp;
end beh;