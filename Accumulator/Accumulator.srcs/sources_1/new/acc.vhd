


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity acc is
    Port (
        x: in std_logic_vector(3 downto 0);
        z: out std_logic_vector(7 downto 0);
        reset, ck, L, R: in std_logic
    );
end acc;

architecture Behavioral of acc is
   -- signal z_temp : std_logic_vector(15 downto 0) := "0000000000000000";
    component c_accum_0
    PORT (
      B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      CLK : IN STD_LOGIC;
      SCLR : IN STD_LOGIC;
      Q : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
    end component;
    
    signal en: std_logic;
    type state is (not_ready, ready, add);
    signal n_s : state := not_ready;
begin
--    process (ck)
--        begin
--        if reset='1' then
--            z_temp <= "0000000000000000";
--        elsif add='1' then
--            z_temp <= std_logic_vector(signed(z_temp) + signed(x));
--        end if;
--    end process;

--    process (reset)
--        begin
--        if reset='1' then
--            z_temp <= "0000000000000000";
--        end if;
--    end process;
    
--    process (add)
--        begin
--        if add='1' then
--            z_temp <= std_logic_vector(signed(z_temp) + signed(x));
--        end if;
--    end process;
    
    --z <= z_temp;
    
    process (ck)
        begin
        if ck='1' and ck'event then
            if reset='1' then
                
            else
                case n_s is
                    when not_ready =>
                        if R='1' then
                            n_s <= ready;
                        end if;
                        en <= '0';
                    when ready =>
                        if L='1' then
                            n_s <= add;
                        end if;
                        en <= '0';
                    when add =>
                        en <= '1';
                        n_s <= not_ready;
                end case;
            end if;
        end if;
    end process;
    
    U1: c_accum_0 port map (B => x, CLK => en, SCLR => reset, Q => z);
end Behavioral;
