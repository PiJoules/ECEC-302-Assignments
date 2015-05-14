
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplier is
    generic (N: natural := 5);
    port (
        a, b : in std_logic_vector (n-1 downto 0);
        p : out std_logic_vector(2*n - 1 downto 0)
    );
end Multiplier;

architecture struc of Multiplier is
    
    component PE
        port (x_in, y_in, ps_in, c_in : in std_logic;
                x_out, y_out, ps_out, c_out: out std_logic);
    end component;
    
    type two_d is array (natural range <>, natural range <>) of std_logic;
    signal x, y, p_s, c: two_d(n-1 downto 0, n-1 downto 0);
    
    begin
    
--    init1: for i in 0 to N-1 generate
--        x(0,i) <= a(i);
--        p_s(i,0) <= '0';
--    end generate init1;
--    init2: for j in 0 to N-1 generate
--        y(j,0) <= b(j);
--        c(j,0) <= '0';
--    end generate init2;
    init1: for i in 0 to n-1 generate
      init2: for j in 0 to n-1 generate
        p_s(i,j) <= '0';
        c(i,j) <= '0';
      end generate init2;
    end generate init1;
    
    --      x(0)  x(1)    x(2)
    -- y(0) y,x   y,x+1   y,x+2   
    -- y(1) y+1,x y+1,x+1 y+1,x+2    
    -- y(2) y+2,x y+2,x+1 y+2,x+2 
    
    -- multiplying an n-bit number will require n^2 processing elements
    -- y -> y (rows)
    -- x -> x (cols)
    
    g1: for dy in 0 to N-1 generate
        g2: for dx in 0 to N-1 generate
        
            --   x   o   o
            --   x   o   o
            --   o   o   o
            g3: if dy<n-1 and dx=0 generate
                --               x_in    y_in   ps_in       c_in      x_out y_out ps_out    c_out
                cell: PE port map(a(dx), b(dy), p_s(dx,dy), c(dx,dy), open, open, p(dx+dy), c(dx+1,dy));
            end generate g3;
            
            --   o   o   o
            --   o   o   o
            --   x   x   o
            g4: if dy=n-1 and dx<n-1 generate
                --                x_in      y_in      ps_in       c_in      x_out       y_out ps_out    c_out
                cell: PE port map(a(dx), b(dy), p_s(dx,dy), c(dx,dy), open, open, p(dx+dy), c(dx+1,dy));
            end generate g4;
            
            --   o   o   x
            --   o   o   x
            --   o   o   o
            g5: if dx=n-1 and dy<n-1 generate
                --                x_in   y_in   ps_in       c_in      x_out y_out ps_out          c_out
                cell: PE port map(a(dx), b(dy), p_s(dx,dy), c(dx,dy), open, open, p_s(dx-1,dy+1), p_s(dx,dy+1));
            end generate g5;
                    
            --   o   x   o
            --   o   o   o
            --   o   o   o
            g6: if dx>0 and dx<n-1 and dy=0 generate
                cell: PE port map(a(dx), b(dy), p_s(dx,dy), c(dx,dy), open, open, p_s(dx-1,dy+1), c(dx+1,dy));
            end generate g6;
            
            --   o   o   o
            --   o   o   o
            --   o   o   x
            g7: if dx=n-1 and dy=n-1 generate
                cell: PE port map(a(dx), b(dy), p_s(dx,dy), c(dx,dy), open, open, p(dx+dy), p(2*n-1));
            end generate g7;
        
            -- middle
            g8: if dx>0 and dx<n-1 and dy>0 and dy<n-1 generate
                cell: PE port map(a(dx), b(dy), p_s(dx,dy), c(dx,dy), open, open, p_s(dx-1,dy+1), c(dx+1,dy));
            end generate g8;
        
        end generate g2;
    end generate g1;
end struc;