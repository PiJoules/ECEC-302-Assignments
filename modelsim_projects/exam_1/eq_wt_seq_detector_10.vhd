

Library ieee;
Use ieee.std_logic_1164.all;

Entity eq_wt_seq_detector_10 is
  Port (
        x, y : in std_logic_vector(3 downto 0);
        z: out std_logic_vector(1 downto 0);
        reset, ck: in std_logic
  );
End eq_wt_seq_detector_10;

Architecture struc of eq_wt_seq_detector_10 is
  -- Component declaration (copy-paste of entity declaration)
  -- For example you need to declare the serial_adder
  component eq_wt_seq_detector
    generic(N : natural := 4);
    Port (
          x, y : in std_logic_vector(n-1 downto 0);
          z: out std_logic_vector(1 downto 0);
          reset, ck: in std_logic
    );
  end component;
  
  begin
  -- instantiation and wiring
  U3: eq_wt_seq_detector generic map(4) port map(x => x, y => y, z => z, reset => reset, ck => ck);
end struc;
