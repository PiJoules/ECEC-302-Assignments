----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/30/2015 04:03:38 PM
-- Design Name: 
-- Module Name: permutation - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity permutation is
    generic (N: natural := 4);
    Port (
        x: in std_logic_vector(n-1 downto 0);
        z: out std_logic_vector(n-1 downto 0);
        sel: in std_logic_vector(1 downto 0)
    );
end permutation;

architecture Behavioral of permutation is
    begin

    process(sel, x)
       -- variable counter : integer := 0;
        variable oddeven : integer := 0;
        begin
        case sel is
            when "00" =>
                z <= x;
            when "01" =>
                for i in 0 to n-1 loop
                    z(i) <= x(n-1-i);
                end loop;
            when "10" =>
                for i in 1 to n-1 loop
                    z(i) <= x(i-1);
                end loop;
                z(0) <= x(n-1);
            when "11" =>
--                for i in 0 to n-1 loop
--                    if i%2 = '0' then
--                        counter := counter + 1;
--                        z(i/2) <= x(i);
--                    end if;
--                end loop;
--                for i in 0 to n-1 loop
--                    if i%2 = '1' then
--                        z(counter) <= x(i);
--                        counter := counter + 1;
--                    end if;
--                end loop;
                  for i in 0 to n-1 loop
                    if oddeven = 0 then
                        -- is even
                        z(i/2) <= x(i);
                        
                        oddeven := 1;
                    else
                        -- is odd
                        z(i/2+n/2) <= x(i);
                        
                        oddeven := 0;
                    end if;
                  end loop;
            when others => null;
        end case;
    end process;
end Behavioral;
