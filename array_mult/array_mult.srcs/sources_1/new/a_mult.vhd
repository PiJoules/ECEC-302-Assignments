
-- le'o is sad

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity a_mult is
generic (N: natural:=4);
port (a, b : in std_logic_vector (n-1 downto 0);
             p : out std_logic_vector(2*n - 1 downto 0));
end a_mult;

architecture struc of a_mult is

    component PE
        port (x_in, y_in, ps_in, c_in : in std_logic;
            x_out, y_out, ps_out, c_out: out std_logic);
    end component;

    type two_d is array (natural range <>, natural range <>) of std_logic;
    signal x, y, p_s, c: two_d(n-1 downto 0, n-1 downto 0);

    begin

    init1: for j in 0 to N-1 generate
        x(0,j) <= a(j); p_s(0,j) <= '0';
    end generate init1;
    init2: for i in 0 to N-1 generate
        y(i,0) <= b(i); c(i,0) <= '0';
    end generate init2;

    g1: for i in 0 to N-1 generate
        g2: for j in 0 to N-1 generate

            g3: if i<n-1 and j=0 generate
                cell: PE port map(x(i,j), y(i,j), p_s(i,j), c(i,j), x(i+1,j), y(i,j+1), p(i), c(i,j+1));
            end generate g3;
            
            g4: if i=n-1 and j<n-1 generate
                cell: PE port map(x(i,j), y(i,j), p_s(i,j), c(i,j), open, y(i,j+1), p(i+j), c(i,j+1));
            end generate g4;
            
            g5: if i<n-1 and j=n-1 generate
                cell : PE port map(x(i,j),y(i,j),p_s(i,j), c(i,j), x(i+1,j), open, p_s(i+1,j-1), p_s(i+1,j));
            end generate g5;
            
            g6: if i<n-1 and j<n-1 and j>0 generate
                cell : PE port map(x(i,j),y(i,j),p_s(i,j), c(i,j), x(i+1,j), y(i,j+1), p_s(i+1,j-1), c(i,j+1));
            end generate g6;

            g7: if i=n-1 and j=n-1 generate
                cell : PE port map(x(i,j),y(i,j),p_s(i,j), c(i,j), open, open, p(i+j), p(i+j+1));
            end generate g7;

        end generate g2;
    end generate g1;
end struc;