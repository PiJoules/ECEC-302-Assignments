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

entity reg_v4 is
Port (X: in std_logic_vector(3 downto 0); -- the 4 switches
    Z: out std_logic_vector(7 downto 0); -- leds of the 7-seg disp
    Disp_en: out std_logic_vector(3 downto 0);
    Btns: in std_logic_vector(3 downto 0);
    ck: in std_logic);
end reg_v4;

architecture Behavioral of reg_v4 is
signal ck_div: std_logic; -- timing for switching data to displays (for some reason)
type my_state is (s0, s1, s2, s3); -- states for each of the 4 areas in the 7-seg display (essentially an enum)
signal n_s: my_state;
signal R0,R1,R2,R3: std_logic_vector(3 downto 0);

function setLEDS(val: std_logic_vector(3 downto 0)) return std_logic_vector(7 downto 0) is
    --signal nextLEDS: std_logic_vector(7 downto 0);
    begin
    case val is
        when "0000" => return "00000011";
        when "0001" => return "10011111";
        when "0010" => return "00100101";
        when "0011" => return "00001101";
        when "0100" => return "10011001";
        when "0101" => return "01001001";
        when "0110" => return "01000001";
        when "0111" => return "00011111";
        when "1000" => return "00000001";
        when "1001" => return "00001001";
        when "1010" => return "00010001";
        when "1011" => return "11000001";
        when "1100" => return "01100011";
        when "1101" => return "10000101";
        when "1110" => return "01100001";
        when "1111" => return "01110001";
        when others => return "00000011";
    end case;
    --return nextLEDS;
end setLEDS;

begin

process(Btns)
    begin
    
    case Btns is
        when "0001" => R0 <= X;
        when "0010" => R1 <= X;
        when "0100" => R2 <= X;
        when "1000" => R3 <= X;
        when others => null;
    end case;
end process;

process(ck_div) -- state machine for TMD: Control for switch
    begin
    
    if ck_div'event and ck_div='1' then
        case n_s is
            when s0 =>
                Z <= setLEDS(R3);
                disp_en <= "0111"; -- change only the first led
                n_s <= s1; -- prepare to change the next led
            when s1 =>
                Z <= setLEDS(R2);
                disp_en <= "1011";
                n_s <= s2;
            when s2 =>
                Z <= setLEDS(R1);
                disp_en <= "1101";
                n_s <= s3;
            when s3 =>
                Z <= setLEDS(R0);
                disp_en <= "1110";
                n_s <= s0;
        end case;
    end if;
end process;

process(ck) -- add a delay between switching between leds in the 7-seg display for some reason
    variable count: integer := 0;

    begin
    if ck='1' and ck'event then
        if count = 99999 then
            ck_div <= not ck_div;
            count := 0;
        else
            count := count + 1;
        end if;
    end if;
end process;

end Behavioral;
