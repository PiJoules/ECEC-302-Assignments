----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/28/2015 02:04:12 PM
-- Design Name: 
-- Module Name: serial_adder - Behavioral
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

ENTITY serial_adder IS
    PORT (
        SIGNAL a , b , ck , en, b1, b2 : IN std_logic ;
        SIGNAL s : OUT std_logic_vector (4 DOWNTO 0);
        SIGNAL cout, done : OUT std_logic
    );
END serial_adder;

ARCHITECTURE behav OF serial_adder IS
    SIGNAL state , carry, sum, clk : std_logic ;
    SIGNAL temp : std_logic_vector (4 DOWNTO 0) ;
    type db_state is (not_rdy, rdy, pulse);
    signal db_ns: db_state;
    
    BEGIN
    
    PROCESS ( clk , en )
        VARIABLE counter : INTEGER := 0;
        
        BEGIN
        
        IF (en = '0') THEN -- reset.
            state <= '0';
            counter := 0;
            temp <= (others => '0');
            done <= '0';
        ELSIF clk = '1' and clk'event THEN
            IF (counter < 5) THEN -- move to next bit
                state <= carry;
                counter := counter + 1;
                temp(4) <= sum;
                done <= '1';
                FOR i IN 3 DOWNTO 0 LOOP
                    temp(i) <= temp(i+1);
                END LOOP;
            ELSE -- the addition is done.
                done <= '1';
            END IF;
        END IF ;
    END PROCESS;
    
    -- wire state (storage for carry synch with clk) to Port cout
    cout <= state;
    
    -- full adder computing sum and carry
    PROCESS ( a , b , state )
        BEGIN
        sum <= a XOR b XOR state;
        carry <= (a AND b) OR (a AND state) OR (b AND state);
    END PROCESS;
    
    s <= temp; --wire to output
    
    -- single-step
    process(ck, b1, b2)
        begin
        
        if ck='1' and ck'event then
            case db_ns is
                when not_rdy =>
                    if b2 = '1' then db_ns <= rdy; end if;
                    CLK <= '0';
                when rdy =>
                    if b1 = '1' then db_ns <= pulse; end if;
                    CLK <= '0';
                when pulse =>
                    db_ns <= not_rdy;
                    CLK <= '1';
                when others => null;
            end case;
        end if;
    end process;
END behav;
