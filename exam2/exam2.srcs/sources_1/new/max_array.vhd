----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2015 04:06:26 PM
-- Design Name: 
-- Module Name: max_array - Behavioral
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

entity max_array is
    generic (L: natural := 10; N: natural := 8); 
    Port (
        x: in std_logic_vector(N*L-1 downto 0);
        z: out std_logic_vector(N-1 downto 0);
        ck: in  std_logic
    );
end max_array;

architecture Behavioral of max_array is
    component pe
        generic (n: natural := 8);
        Port (
            x, y: in std_logic_vector(n-1 downto 0);
            z: out std_logic_vector(n-1 downto 0);
            ck: in std_logic
        );
    end component;
    
    signal yy: std_logic_vector(n*l-1 downto 0);

    begin   

    g1: for i in 0 to L-1 generate
        g2: if i=0 generate 
            cell: pe generic map(n) port map ( x(n*(i)+N-1 downto n*i), yy(n*(i)+N-1 downto n*i), z, ck );
        end generate g2;
        g3: if i>0 and i < l-1 generate
            cell: pe generic map(n) port map ( x(n*(i)+N-1 downto n*i), yy(n*(i)+N-1 downto n*i), yy(n*(i-1)+N-1 downto n*(i-1)), ck );
        end generate g3;
        g4: if i=l-1 generate
            cell: pe generic map(n) port map ( x(n*(i)+N-1 downto n*i), yy(n*(i)+N-1 downto n*i), yy(n*(i-1)+N-1 downto n*(i-1)), ck );
        end generate g4;
    end generate g1;
    
    --yy(n*l-1 downto n*(l-1)) <= std_logic_vector(n-1);
end Behavioral;
