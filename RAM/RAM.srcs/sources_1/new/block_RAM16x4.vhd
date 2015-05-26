----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2015 02:41:04 PM
-- Design Name: 
-- Module Name: block_RAM16x4 - Behavioral
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

entity block_RAM16x4 is
    Port (
        ck, output_en: in std_logic;
        wen: in std_logic_vector(0 downto 0);
        addr: in std_logic_vector(3 downto 0);
        din: in std_logic_vector(3 downto 0);
        dout: out std_logic_vector(3 downto 0)
    );
end block_RAM16x4;

architecture Behavioral of block_RAM16x4 is
    component blk_mem_gen_0 is
        port (
            clka: in std_logic;
            ena: in std_logic;
            wea: in std_logic_vector(0 downto 0);
            addra: in std_logic_vector(3 downto 0);
            dina: in std_logic_vector(3 downto 0);
            douta: out std_logic_vector(3 downto 0)
        );
    end component;

    begin

    U2: blk_mem_gen_0 port map (clka => ck, ena => output_en, wea => wen, addra => addr, dina => din, douta => dout);
end Behavioral;
