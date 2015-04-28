----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2015 04:07:49 PM
-- Design Name: 
-- Module Name: q1 - Behavioral
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

entity q1 is
Port (
    L, R, C, ck: in std_logic;
    z: out std_logic_vector(3 downto 0)
);
end q1;

architecture Behavioral of q1 is
    --signal z: std_logic_vector(3 downto 0) := "0001";

    begin 
    
    process(ck)
        variable state: integer := 0; -- 0(S0),1,2,3(S3),4(C0),5,6,7(C3)
    
        begin
        
        if ck = '1' and ck'event then
            case state is
                when 0 =>
                    if C = '1' then
                        state := 4;
                        z <= "0001";
                    end if;
                when 1 =>
                    if C = '1' then
                        state := 5;
                        z <= "0010";
                    end if;
                when 2 =>
                    if C = '1' then
                        state := 6;
                        z <= "0100";
                    end if;
                when 3 =>
                    if C = '1' then
                        state := 7;
                        z <= "1000";
                    end if;
                when 4 =>
                    if L = '1' then
                        state := 1;
                        z <= "0010";
                    elsif R = '1' then
                        state := 3;
                        z <= "1000";
                    end if;
                when 5 =>
                    if L = '1' then
                        state := 2;
                        z <= "0100";
                    elsif R = '1' then
                        state := 0;
                        z <= "0001";
                    end if;
                when 6 =>
                    if L = '1' then
                        state := 3;
                        z <= "1000";
                    elsif R = '1' then
                        state := 1;
                        z <= "0010";
                    end if;
                when 7 =>
                    if L = '1' then
                        state := 0;
                        z <= "0001";
                    elsif R = '1' then
                        state := 2;
                        z <= "0100";
                end if;
                when others =>
                    state := 0;
                    z <= "0001";
            end case;
        end if;
    end process;


end Behavioral;
