library ieee;
use ieee.std_logic_1164.all;

entity serial_adder is
  generic (n: natural := 8);
  port(
    signal a, b, clk, en: in std_logic;
    signal s: out std_logic_vector(n-1 downto 0);
    signal cout, done: out std_logic
  );
end serial_adder;

architecture beh of serial_adder is
  signal state, carry, sum: std_logic;
  signal temp: std_logic_vector(n-1 downto 0);
  
  begin
    
  trans_and_count: process(clk, en)
    variable counter: integer := 0;
    
    begin
      
    if en = '0' then -- reset
      state <= '0';
      counter := 0;
      temp <= (others => '0');
      done <= '0';
    elsif clk = '1' and clk'event then
      if counter < n then -- move to next bit
        done <= '0';
        state <= carry;
        counter := counter + 1;
        temp(n-1) <= sum;
        for i in n-2 downto 0 loop
          temp(i) <= temp(i+1);
        end loop;
      else -- the addition is done
        done <= '1';
      end if;
    end if;
    
  end process trans_and_count;
  
  -- wire state (storage for carry synch with ck) to Port cout
  cout <= state;
  
  output: Process(a, b, state)
    begin
      
    sum <= a XOR b XOR state;
    carry <= (a AND b) OR (a AND state) OR (b AND state);
  end process output;
  
  s <= temp; -- wire to output
  
end beh;