


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fifo16x4 is
    Port (
        ck, btn0, btn1, reset, wen, ren: in std_logic;
        x: in std_logic_vector(3 downto 0);
        z: out std_logic_vector(3 downto 0);
        empty_flag, full_flag: out std_logic
    );
end fifo16x4;

architecture Behavioral of fifo16x4 is
    component fifo_generator_0
        port (
            clk: in std_logic;
            rst: in std_logic;
            din: in std_logic_vector(3 downto 0);
            wr_en: in std_logic;
            rd_en: in std_logic;
            dout: out std_logic_vector(3 downto 0);
            full: out std_logic;
            empty: out std_logic
        );
    end component;
    
    signal en: std_logic; -- single step signal
    signal empty_flag_temp, full_flag_temp, wen_temp, ren_temp: std_logic; -- for reading and setting the empty_flag
    shared variable counter: integer := 0;
    signal did_reach_full: std_logic := '0';

    begin

    U1: fifo_generator_0
        port map (
            clk => en,
            rst => reset,
            din => x,
            wr_en => wen_temp,
            rd_en => ren_temp,
            dout => z,
            full => full_flag_temp,
            empty => empty_flag_temp
        );
        
    -- single step, debounce (db)
    -- btn0 to enter and btn1 to reset
    process (ck)
        type db_state is (not_rdy, rdy, pulse);
        variable db_ns: db_state;
        
        begin
        
        if ck='1' and ck'event then
            wen_temp <= wen;
            ren_temp <= ren;

            case db_ns is
                when not_rdy =>
                    en <= '0';
                    if btn1='1' then
                        db_ns := rdy;
                    end if;
                when rdy =>
                    en <= '0';
                    if btn0='1' then
                        db_ns := pulse;
                    end if;
                when pulse =>
                    if did_reach_full='1' then
                        -- set to remove the first value from the queue
                        wen_temp <= '0';
                        ren_temp <= '1';

                        -- automatically read out fifo until empty flag is given
                        -- clock speed is 10**8
                        if empty_flag_temp='1' then
                            db_ns := not_rdy; -- switch state machine
                            did_reach_full <= '0';
                        else
                            counter := counter + 1;
                            en <= '0';
                            if counter >= 100000000 then
                                -- 1 second has passed in this block
                                en <= '1';
                                
                                counter := 0;
                            end if;
                        end if;

                    else
                        -- do just as normally would
                        db_ns := not_rdy;
                        en <= '1';
                    end if;

                    if full_flag_temp='1' then
                        did_reach_full <= '1';
                        db_ns := pulse; -- override any other assignments to db_ns
                    end if;
                when others => null;
            end case;
        end if;
    end process;
    
    -- wire temporary variables
    empty_flag <= empty_flag_temp;
    full_flag <= full_flag_temp;
end Behavioral;
