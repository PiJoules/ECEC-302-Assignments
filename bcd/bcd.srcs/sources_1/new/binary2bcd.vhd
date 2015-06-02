library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.binary2bcdpack.all;

entity binary2bcd is
    port (--x: in std_logic_vector(6 downto 0);
    x: in std_logic_vector(5 downto 0);
     z: out std_logic_vector(7 downto 0));
end binary2bcd;


architecture struc of binary2bcd is
    --type bcd2_vector is array (natural range <>) of bcd_vector(1 downto 0);
    type bcd2_vector is array (natural range <>) of bcd_vector(3 downto 0);
   -- signal p_s, temp, bcd2_template : bcd2_vector(6 downto 0);
   signal p_s, temp, bcd2_template : bcd2_vector(5 downto 0);
    --signal carry : std_logic_vector(6 downto 0);
    signal carry : std_logic_vector(5 downto 0);
    --signal tempz : bcd_vector(1 downto 0);--temporary signal for output ports
    signal tempz : bcd_vector(3 downto 0);--temporary signal for output ports
    
    component bcd2
        port (--a, b: in bcd_vector(1 downto 0);
        a, b: in bcd_vector(3 downto 0);
        -- c: out bcd_vector(1 downto 0);
        c: out bcd_vector(3 downto 0);
         cin: in std_logic;
        cout: out std_logic);
    end component;
    
    begin
    
    -- 2**i as 2-digit BCD
    -- binary to decimal conversions
--    bcd2_template(0) <= ("0000","0001"); bcd2_template(1) <= ("0000","0010");
--    bcd2_template(2) <= ("0000","0100"); bcd2_template(3) <= ("0000","1000");
--    bcd2_template(4) <= ("0001","0110"); bcd2_template(5) <= ("0011","0010");
--    bcd2_template(6) <= ("0110","0100");
    -- binary to base-3 conversions
    bcd2_template(0) <= ("00","00","00","01"); bcd2_template(1) <= ("00","00","00","10");
    bcd2_template(2) <= ("00","00","01","01"); bcd2_template(3) <= ("00","00","10","10");
    bcd2_template(4) <= ("00","01","10","01"); bcd2_template(5) <= ("01","00","01","10");
    -- AND gating power of two 2**i with x(i)
    
    process(x)
        begin
        
        --for i in 0 to 6 loop
        for i in 0 to 5 loop
            if x(i) = '0' then
                temp(i) <= ("00","00","00","00");
            else
                temp(i) <= bcd2_template(i);
            end if;
        end loop;
    end process;
    
    -- initial signals for partial sum and wires to output ports
    --p_s(0) <= ("0000","0000");
    p_s(0) <= ("00","00","00","00");
    carry(0) <= '0';
    
    --z(7 downto 4) <= tempz(1); z(3 downto 0) <= tempz(0);
    z(7 downto 6) <= tempz(3); z(5 downto 4) <= tempz(2); z(3 downto 2) <= tempz(1); z(1 downto 0) <= tempz(0);
    
    -- wire the array
    --G1: for i in 0 to 6 generate
    G1: for i in 0 to 5 generate
        --G2: if i < 6 generate
        G2: if i < 5 generate
            U2: bcd2 port map (temp(i), p_s(i), p_s(i+1), carry(i), carry(i+1));
        end generate G2;
        --G3: if i = 6 generate
        G3: if i = 5 generate
            U2: bcd2 port map (temp(i), p_s(i), tempz, carry(i), open);
        end generate G3;
    end generate G1;
end struc;
