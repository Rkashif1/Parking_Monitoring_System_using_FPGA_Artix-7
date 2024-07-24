
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity trig_gen is
    Port (
        clk         : in  STD_LOGIC;
        trig        : out STD_LOGIC
    );
end trig_gen;

architecture Behavioral of trig_gen is
    signal cnt          : unsigned(31 downto 0) := (others => '0');
    signal trig_signal  : STD_LOGIC := '0';

    constant CLK_FREQ   : integer := 50_000_000; -- 50 MHz
    constant TRIG_PERIOD: integer := 2_500_000;  -- 50 ms in clock cycles (50ms / 20ns = 2,500,000 clock cycles)
    constant TRIG_PULSE_WIDTH : integer := 500; -- 10us at 50MHz (10us / 20ns = 500 clock cycles)

begin
    -- Trigger Signal Generation (10us Pulse)
    process(clk)
    begin
        if rising_edge(clk) then
            if cnt < to_unsigned(TRIG_PERIOD, cnt'length) then
                cnt <= cnt + 1;
            else
                cnt <= (others => '0');
                trig_signal <= '1';
            end if;

            if cnt < to_unsigned(TRIG_PULSE_WIDTH, cnt'length) then
                trig_signal <= '1';
            else
                trig_signal <= '0';
            end if;
        end if;
    end process;

    trig <= trig_signal;
end Behavioral;
