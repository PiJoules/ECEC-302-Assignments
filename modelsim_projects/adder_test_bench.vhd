
Library ieee;
Use ieee.std_logic_1164.all, work.p1_pack.all, ieee.std_logic_arith.all, ieee.std_logic_unsigned.all;

entity adder_test_bench is
  constant number_of_tests: natural := 3;
  constant n: natural := 4;
end adder_test_bench;

architecture beh of adder_test_bench is
  -- declaration phase
  -- wires
  signal go, reset, cout : std_logic;
  signal ck: std_logic := '0'; -- initial value needed as seed for clock generation
  signal a, b, c: std_logic_vector(n-1 downto 0);
  -- test vectors
  type test_array is array (natural range <>) of std_logic_vector(n-1 downto 0);
  signal A_test : test_array(0 to number_of_tests-1) := ("1101", "1100", "0110");
  signal B_test : test_array(0 to number_of_tests-1) := ("0101", "1001", "0111");
  -- state machine (tester)
  type tester_state is (init, test, check);
  signal n_s : tester_state;
  
  component adder is
    Generic (k: natural := 4); -- k will be mapped onto the components used
    Port ( a, b : in std_logic_vector(k-1 downto 0);
      C : out std_logic_vector(k-1 downto 0);
      C_out : out std_logic;
      Go,reset,ck : in std_logic);
  End component;
  
  begin
  
  -- instantiate device-under-test
  dut: adder generic map (n) port map (a, b, c, cout, go, reset, ck);
  -- clock generation
  ck <= not ck after 50 ns;
  -- test procedure
  process (ck)
    variable count_vector: integer := 0;
    variable count_cycle: integer;
    
    begin
      
    if ck'event and ck='1' then
      case n_s is
        when init =>
          count_cycle := 0;
          a <= A_test(count_vector);
          b <= B_test(count_vector);
          n_s <= test;
          go <= '1';
          reset <= '0'; -- upon leaving init set go and don't reset
        when test =>
          count_cycle := count_cycle + 1;
          if count_cycle = n+5 then
            n_s <= check;
            go <= '0';
            reset <= '0'; -- lower the go flag and don't reset
          end if;
        when check =>
          assert
            conv_integer(unsigned(cout & c)) = conv_integer(unsigned(a)) + conv_integer(unsigned(b)) 
            report "Incorrect result"
            severity ERROR;
          count_vector := count_vector + 1;
          assert
            count_vector /= number_of_tests
            report "Test completed"
            severity FAILURE;
          go <= '0';
          reset <= '1'; -- don't go and reset when leaving this state to init
          n_s <= init;
      end case;
    end if;
  end process;
end beh;