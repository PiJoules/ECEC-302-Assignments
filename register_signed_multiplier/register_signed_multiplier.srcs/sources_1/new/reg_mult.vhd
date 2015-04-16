package reg_mult_pack is
constant n: natural := 4;
end reg_mult_pack;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2015 02:05:43 PM
-- Design Name: 
-- Module Name: reg_mult - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description:  inputs x, y buffered in Rx, Ry
-- outputs Rx*Ry buffered and wired to output z
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
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;
-- reg_mult_pack package defines
-- contant n: natural := 4
use work.reg_mult_pack.all;

entity reg_mult is
Port (
    x,y: in std_logic_vector(n-1 downto 0);
    rx,ry: out std_logic_vector(n-1 downto 0);
    z: out std_logic_vector(2*n-1 downto 0);
    ck,en: in std_logic;
    btnL,btnR: in std_logic
);
end reg_mult;

architecture Behavioral of reg_mult is
-- n-bit register
-- for input registers and output register

component reg
generic (n: natural);
Port (ck,ld_en: in std_logic;
    x: in std_logic_vector(n-1 downto 0);
    z: out std_logic_vector(n-1 downto 0));
end component;

-- wires input registers outputs
signal w1, w2: std_logic_vector(n-1 downto 0);

-- signal for the multiply result and
-- input to the output register
signal w3: std_logic_vector(2*n-1 downto 0);

-- single step clock
signal ck_step: std_logic;

begin
-- instantiate registers
x_reg: reg generic map(n)
    port map(x => x, z => w1, ck => ck_step, ld_en => en);
y_reg: reg generic map(n)
    port map(x => y, z => w2, ck => ck_step, ld_en => en);
z_reg: reg generic map(2*n)
    port map(x => w3, z => z, ck => ck_step, ld_en => en);

-- signed multiply module
process(w1,w2)
begin
w3 <= signed(w1) * signed(w2);
end process;

-- woring w1 and w2 to Rx, Ry outputs
rx <= w1;
ry <= w2;

-- single step clock pulse (debounce)
-- btn0 to enter and btn1 to reset
-- ck_step signal drives components
process(ck)
type state is (not_rdy, rdy, pulse);
variable ns: state;
begin
if ck='1' and ck'event then
    case ns is
        when not_rdy =>
            ck_step <= '0';
            if btnR = '1' then
                ns := rdy;
            end if;
        when rdy =>
            ck_step <= '0';
            if btnL = '1' then
                ns := pulse;
            end if;
        when pulse => 
            ck_step <= '1';
            ns := not_rdy;
        when others =>
            null;
    end case;
end if;
end process;

end Behavioral;
