library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity echo_processor is
    Port (
        clk         : in  STD_LOGIC;
        echo        : in  STD_LOGIC;
        distance    : out unsigned(15 downto 0)
    );
end echo_processor;

architecture Behavioral of echo_processor is
    signal pulse_width  : unsigned(31 downto 0) := (others => '0');
    signal echo_d       : STD_LOGIC := '0';
    constant SOUND_SPEED_DIV: integer := 58;     -- Conversion factor for pulse width to cm

begin
    -- Echo Signal Processing
    process(clk)
    begin
        if rising_edge(clk) then
            echo_d <= echo;
            if echo = '1' and echo_d = '0' then
                pulse_width <= (others => '0'); -- Echo rising edge detected
            elsif echo = '1' then
                pulse_width <= pulse_width + 1; -- Accumulate pulse width
            elsif echo = '0' and echo_d = '1' then
                -- Calculate distance in cm (pulse_width / SOUND_SPEED_DIV)
                distance <= resize(pulse_width / SOUND_SPEED_DIV, distance'length); -- Echo falling edge detected
            end if;
        end if;
    end process;
end Behavioral;
