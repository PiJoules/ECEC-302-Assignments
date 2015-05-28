----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2015 04:08:33 PM
-- Design Name: 
-- Module Name: pe - Behavioral
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
use IEEE.STD_LOGIC_1164.ALL, ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pe is
    generic (n: natural := 8);
    Port (
        x, y: in std_logic_vector(n-1 downto 0);
        z: out std_logic_vector(n-1 downto 0)
        ;ck: in std_logic
    );
end pe;

architecture Behavioral of pe is
    --variable xsum: integer := 0;
    --variable ysum: integer := 0;
    signal temp: std_logic_vector(n-1 downto 0);

    begin

    process (ck)
        begin
        if ck='1' and ck'event then
            if to_integer(unsigned(x)) > to_integer(unsigned(y)) then
                --temp <= x;
                z <= x;
            else
                z <= y;
                --temp <= y;
            end if;
        end if;
    end process;
    
     --z <= temp;
--    z <= y;
    --z <= max(unsigned(x), unsigned(y));
end Behavioral;
