library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Parking_System is
    Port (

        trig        : out STD_LOGIC;
        echo        : in  STD_LOGIC;
        buzzer      : out STD_LOGIC;
        clk : in STD_LOGIC;          -- Clock input
        ir_sensor0 : in STD_LOGIC;   -- IR sensor 0 input
        ir_sensor1 : in STD_LOGIC;   -- IR sensor 1 input
        ir_sensor2 : in STD_LOGIC;   -- IR sensor 2 input
        ir_sensor3 : in STD_LOGIC;   -- IR sensor 3 input
        an : out STD_LOGIC_VECTOR (7 downto 0);  -- Seven-segment anode control
        seg : out STD_LOGIC_VECTOR (7 downto 0);  -- Seven-segment cathode control
        led0 : out STD_LOGIC;        -- LED 0 output
        led1 : out STD_LOGIC;        -- LED 1 output
        led2 : out STD_LOGIC;        -- LED 2 output
        led3 : out STD_LOGIC         -- LED 3 output
    );
end Parking_System;

architecture Behavioral of Parking_System is

    signal distance : unsigned(15 downto 0) := (others => '0');
    signal digit0, digit1, digit2, digit3, digit4 : STD_LOGIC_VECTOR(3 downto 0);
    signal refresh_counter : STD_LOGIC_VECTOR(2 downto 0) := "000";  -- 3-bit counter for 8 displays
    signal refresh_clk : STD_LOGIC := '0';

    

begin

-- Instantiate Clock Divider
    clk_divider_inst : entity work.Clock_Divider
        port map (
            clk => clk,
            refresh_clk => refresh_clk
        );

    -- Instantiate Refresh Counter
    refresh_counter_inst : entity work.Refresh_Counter
        port map (
            refresh_clk => refresh_clk,
            refresh_counter => refresh_counter
        );

    -- Instantiate Digit Value Controller
    digit_value_ctrl_inst : entity work.Digit_Value_Controller
        port map (
            ir_sensor0 => ir_sensor0,
            ir_sensor1 => ir_sensor1,
            ir_sensor2 => ir_sensor2,
            ir_sensor3 => ir_sensor3,
            digit0 => digit0,
            digit1 => digit1,
            digit2 => digit2,
            digit3 => digit3,
            digit4 => digit4
        );

    -- Instantiate Seven Segment Display Controller
    seg_display_ctrl_inst : entity work.Seg_Display_Controller
        port map (
            refresh_counter => refresh_counter,
            digit0 => digit0,
            digit1 => digit1,
            digit2 => digit2,
            digit3 => digit3,
            digit4 => digit4,
            an => an,
            seg => seg
        );

    -- Instantiate LED Controller
    led_ctrl_inst : entity work.LED_Controller
        port map (
            ir_sensor0 => ir_sensor0,
            ir_sensor1 => ir_sensor1,
            ir_sensor2 => ir_sensor2,
            ir_sensor3 => ir_sensor3,
            led0 => led0,
            led1 => led1,
            led2 => led2,
            led3 => led3
        );
    -- Instantiate Trigger Generator
    trig_gen_inst : entity work.trig_gen
        Port map (
            clk => clk,
            trig => trig
        );

    -- Instantiate Echo Processor
    echo_processor_inst : entity work.echo_processor
        Port map (
            clk => clk,
            echo => echo,
            distance => distance
        );

    -- Instantiate Buzzer Control
    buzzer_control_inst :  entity work.buzzer_control
        Port map (
            clk => clk,
            distance => distance,
            buzzer => buzzer
        );
end Behavioral;
