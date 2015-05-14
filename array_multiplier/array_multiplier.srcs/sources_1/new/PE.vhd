
-- object containing
-- xout, yout, carry, and partial sum

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PE is -- Processing Element
    port (x_in, y_in, ps_in, c_in : in std_logic;
            x_out, y_out, ps_out, c_out: out std_logic);
end PE;

architecture concurrent of PE is
    signal temp: std_logic;
    
    begin
    
    temp <= x_in and y_in; -- product of the 2 bits
    x_out <= x_in; y_out <= y_in;
    c_out <= (ps_in and temp) or (temp and c_in) or (c_in and ps_in); -- carry between the 2 bits
    ps_out <= ps_in xor temp xor c_in; -- partial sum output
end concurrent;
