----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2015 06:07:34 PM
-- Design Name: 
-- Module Name: sm2 - Behavioral
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

entity sm2 is
Port (ck, sel: in std_logic; -- make sel a switch
    z: out std_logic_vector(15 downto 0));
end sm2;

architecture Behavioral of sm2 is
    signal ck1: std_logic;
    shared variable ledIndex: integer := 0; -- 0 to 15

    begin
    
    process(ck)
        constant delay: integer := 10000000;
        variable count: integer := 0;
        variable direction: integer := 1; -- 1 for r to l, -1 for l to r
        variable blinks: integer := 0; -- number of times led changes state (on/off); change once reaches 2
        
        begin
        
        if ck='1' and ck'event then -- on every clock cycle
                if sel = '0' then -- moves r to l if off; l to r if on
                    direction := 1;
                else
                    direction := -1;
                end if;
                
                if count >= delay then
                    ck1 <= not ck1;
                    count := 0;
                    blinks := blinks + 1;
                    if blinks >= 2 then
                        ledIndex := ledIndex + direction;
                        if ledIndex < 0 then
                            ledIndex := 15;
                        elsif ledIndex > 15 then
                            ledIndex := 0;
                        else
                            null;
                        end if;
                        blinks := 0;
                    end if;
                else
                    count := count + 1;
                end if;
        end if;
    end process;

    process(ck1) -- use ck1 to drive another process
        begin
        if ck1 = '1' then
            z <= "0000000000000000";
            z(ledIndex) <= '1';
        elsif ck1 = '0' then
            z(ledIndex) <= '0';
        else
            null;
        end if;
    end process;

end Behavioral;
