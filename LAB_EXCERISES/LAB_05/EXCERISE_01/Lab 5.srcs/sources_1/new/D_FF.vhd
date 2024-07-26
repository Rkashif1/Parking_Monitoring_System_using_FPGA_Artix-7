library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FF is
    Port (
        D     : in  STD_LOGIC;
        CLK   : in  STD_LOGIC;
        RESET : in  STD_LOGIC;
        Q     : out STD_LOGIC
    );
end D_FF;

architecture Behavioral of D_FF is
begin
    process (CLK, RESET)
    begin
        if (RESET = '1') then  -- asynchronous reset
            Q <= '0';
        elsif rising_edge(CLK) then  -- positive edge-triggered clock
            Q <= D;
        end if;
    end process;
end Behavioral;
