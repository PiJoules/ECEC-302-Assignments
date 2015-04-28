----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/27/2015 03:49:22 PM
-- Design Name: 
-- Module Name: t_gate - Behavioral
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

entity t_gate is
    generic (n: natural; k: natural);
    Port (
        x: in std_logic_vector(1 to n);
        z: out std_logic
    );
end t_gate;

architecture Behavioral of t_gate is
    begin

    process(x)
        variable temp : integer := 0;
        
        begin
        
        for i in 1 to n loop
            if x(i) = '1' then
                temp := temp + 1;
            end if;
        end loop;
        if temp >= k then
            z <= '1';
        else
            z <= '0';
        end if;
        temp := 0;
    end process;
end Behavioral;
