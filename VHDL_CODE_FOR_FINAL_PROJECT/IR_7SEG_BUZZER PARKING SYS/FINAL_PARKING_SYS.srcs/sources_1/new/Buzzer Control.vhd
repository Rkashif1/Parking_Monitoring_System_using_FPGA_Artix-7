library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity buzzer_control is
    Port (
        clk         : in  STD_LOGIC;
        distance    : in  unsigned(15 downto 0);
        buzzer      : out STD_LOGIC
    );
end buzzer_control;

architecture Behavioral of buzzer_control is
    signal buzzer_signal: STD_LOGIC := '0';

begin
    -- Buzzer Signal Control
    process(clk)
    begin
        if rising_edge(clk) then
            if distance < to_unsigned(20, distance'length) then
                buzzer_signal <= '1'; -- Turn on buzzer if distance is less than 20 cm
            else
                buzzer_signal <= '0';
            end if;
        end if;
    end process;

    buzzer <= buzzer_signal;
end Behavioral;
