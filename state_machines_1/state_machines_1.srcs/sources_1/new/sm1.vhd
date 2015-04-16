----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2015 04:55:22 PM
-- Design Name: 
-- Module Name: sm1 - Behavioral
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

entity sm1 is
Port (b1, b2, reset, ck: in std_logic;
    z: out std_logic);
end sm1;

architecture Behavioral of sm1 is
    signal ck1: std_logic;
    shared variable limitFast: integer := 10000000;
    shared variable limitSlow: integer := 100000000;
    shared variable limit: integer := limitFast; -- fast blinking at first
    begin
    
    process(ck)
        variable count: integer := 0;
        
        begin
        
        if ck='1' and ck'event then -- on every clock cycle
            if b1 = '1' and b2 = '0' then
                limit := limitFast;
            elsif b1 = '0' and b2 = '1' then
                limit := limitSlow;
            else
                null;
            end if;
        
            if reset = '1' then -- reset pressed
                count := 0;
                ck1 <= '0';
            else -- reset not pressed
                if count >= limit then
                    ck1 <= not ck1;
                    count := 0;
                else
                    count := count + 1;
                end if;
            end if;
        end if;
    end process;
    
    process(ck1) -- use ck1 to drive another process
        begin
        if ck1 = '1' then
            z <= '1';
        elsif ck1 = '0' then
            z <= '0';
        else
            null;
        end if;
    end process;
    
end Behavioral;
