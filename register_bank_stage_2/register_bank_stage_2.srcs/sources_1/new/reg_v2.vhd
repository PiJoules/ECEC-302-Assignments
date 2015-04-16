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

entity reg_v2 is
Port (SW: in std_logic_vector(7 downto 0);
    Z: out std_logic_vector(7 downto 0);
    Btns: in std_logic_vector(3 downto 0);
    Disp_en: out std_logic_vector(3 downto 0));
end reg_v2;

architecture Behavioral of reg_v2 is
begin

process(SW, Btns) -- selective load controlled by buttons
variable temp: std_logic_vector(1 downto 0);
begin

case Btns is --select logic
    when "1000" =>
        temp := SW(7 downto 6);
        disp_en <= "0111";
    when "0100" =>
        temp := SW(5 downto 4);
        disp_en <= "1011";
    when "0010" =>
        temp := SW(3 downto 2);
        disp_en <= "1101";
    when "0001" =>
        temp := SW(1 downto 0);
        disp_en <= "1110";
    when others =>
        temp := "00";
        disp_en <= "1111";
    -- For other cases disable displays, assign temp with "00"
    -- Combinational circuits the code fully specifies all cases else
    -- the sysnthesis tool puts storages to retain old values.
end case;

case temp is -- "ABCDEFG(DP)" temp to 7-seg display, a decoder
    when "00" =>
        Z <= "00000011"; -- |-A-|  segments A B C D E F G DP
    when "01" =>
        Z <= "10011111"; -- F   B and     z(7) ....     z(1)z(0)
    when "10" =>
        Z <= "00100101"; -- |-G-|
    when "11" =>
        Z <= "00001101"; -- E   C
    when others =>
        null;            -- |-D-| .DP
    -- temp is fully specified here, decoder will be current circuit without storage
end case;

end process;

end Behavioral;
