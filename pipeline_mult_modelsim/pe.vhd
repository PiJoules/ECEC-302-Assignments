
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pe is
    Port(
        x_i,y_i,c_in,ps_in: in std_logic;
        y_out,c_out,ps_out: out  std_logic;
        ck, reset: in std_logic
    );
end pe;

Architecture beh of pe is
    signal tmp1, tmp2, tmp3,a,sum,carry: std_logic;
    
    begin
    
    -- synchronous state storages
    process(ck)
        begin
        
        if ck='1' and ck'event then
            if reset='1' then
                tmp1 <= '0';
                tmp2 <= '0';
                tmp3 <= '0';
            else
                tmp1 <= Y_i;
                tmp2 <= carry;
                tmp3 <= sum;
            end if;
        end if;
    end process;
    
    -- concurrrent statements for wiring
    carry <= (c_in and a) or (a and ps_in) or (ps_in and c_in);
    sum <= ps_in xor c_in xor a;
    a <= x_i and y_i;
    y_out <= tmp1;
    c_out <= tmp2;
    ps_out <= tmp3;
end beh;