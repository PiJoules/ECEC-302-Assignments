----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2015 03:33:32 PM
-- Design Name: 
-- Module Name: reg_v1 - Behavioral
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

entity reg_v1 is
Port (X: in std_logic_vector(1 downto 0);
    LEDS: out std_logic_vector(7 downto 0);
    Btns: in std_logic_vector(3 downto 0);
    ck: in std_logic);
end reg_v1;

architecture Behavioral of reg_v1 is
signal R0,R1,R2,R3: std_logic_vector(1 downto 0);
begin
LEDS(7 downto 6) <= R3; -- wire register contents to outputs
LEDS(5 downto 4) <= R2;
LEDS(3 downto 2) <= R1;
LEDS(1 downto 0) <= R0;

process(ck) -- selective load controlled by buttons
begin
if ck='1' and ck'event then
    case Btns is
        when "1000" =>
            R0 <= X;
        when "0100" =>
            R1 <= X;
        when "0010" =>
            R2 <= X;
        when "0001" =>
            R3 <= X;
        when others =>
            null;
    end case;
end if;
end process;

end Behavioral;
