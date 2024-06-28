library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LED_Controller is
    Port (
        ir_sensor0 : in STD_LOGIC;
        ir_sensor1 : in STD_LOGIC;
        ir_sensor2 : in STD_LOGIC;
        ir_sensor3 : in STD_LOGIC;
        led0 : out STD_LOGIC;
        led1 : out STD_LOGIC;
        led2 : out STD_LOGIC;
        led3 : out STD_LOGIC
    );
end LED_Controller;

architecture Behavioral of LED_Controller is
begin
    process(ir_sensor0, ir_sensor1, ir_sensor2, ir_sensor3)
    begin
        if ir_sensor0 = '1' then
            led0 <= '1';  -- LED 0 on
        else
            led0 <= '0';  -- LED 0 off
        end if;

        if ir_sensor1 = '1' then
            led1 <= '1';  -- LED 1 on
        else
            led1 <= '0';  -- LED 1 off
        end if;

        if ir_sensor2 = '1' then
            led2 <= '1';  -- LED 2 on
        else
            led2 <= '0';  -- LED 2 off
        end if;

        if ir_sensor3 = '1' then
            led3 <= '1';  -- LED 3 on
        else
            led3 <= '0';  -- LED 3 off
        end if;
    end process;
end Behavioral;
