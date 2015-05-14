


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pipe_mult is
    generic (N: natural := 4);
    Port (
        x: in std_logic_vector(n-1 downto 0);
        y: in std_logic;
        z: out std_logic;
        ck, reset: in std_logic
        --;b1, b2: in std_logic -- b1 and b2 not needed in simulation
    );
end pipe_mult;

architecture struc of pipe_mult is
    
    component pe
        port(
            x_i,y_i,c_in,ps_in: in std_logic;
            y_out,c_out,ps_out: out std_logic;
            ck, reset: in std_logic
        );
    end component;
    
    component DFF
        port(
            x, reset, ck: in std_logic;
            Q: out std_logic
        );
    end component;
    
    -- wires declaration
    signal yy, c, ps: std_logic_vector(n-1 downto 0);
    signal w, en: std_logic;
    
    -- state machine for b1 and b2
    type state is (idle, loading, shifting);
    signal n_s : state := idle;
    
    begin
    
    D: DFF port map(w, reset, ck, ps(n-1)); -- what wire is w in Fig. 2?
    
    g1: for i in 0 to n-1 generate
        g2: if i=0 generate
            cell: pe port map(x(i), yy(i), c(i), ps(i), yy(i+1), c(i+1), z, ck, reset); 
        end generate g2;
        g3: if i > 0 and i < n-1 generate
            cell: pe port map(x(i), yy(i), c(i), ps(i), yy(i+1), c(i+1), ps(i-1), ck, reset);
        end generate g3;
        g4: if i=n-1 generate
            cell: pe port map(x(i), yy(i), c(i), ps(i),  open,   w,  ps(i-1), ck, reset);
        end generate g4;
    end generate g1;
    
    -- Wire Input Ports c(0) <= ?; yy(0) <= ?
    c(0) <= '0'; -- try 0 next
    yy(0) <= y;

    
end struc;