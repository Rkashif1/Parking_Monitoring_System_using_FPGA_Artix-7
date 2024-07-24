library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_LED_Controller is
    -- No ports for a testbench
end tb_LED_Controller;

architecture Behavioral of tb_LED_Controller is
    -- Component declaration for the Unit Under Test (UUT)
    component LED_Controller is
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
    end component;

    -- Inputs
    signal ir_sensor0 : STD_LOGIC := '0';
    signal ir_sensor1 : STD_LOGIC := '0';
    signal ir_sensor2 : STD_LOGIC := '0';
    signal ir_sensor3 : STD_LOGIC := '0';

    -- Outputs
    signal led0 : STD_LOGIC;
    signal led1 : STD_LOGIC;
    signal led2 : STD_LOGIC;
    signal led3 : STD_LOGIC;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: LED_Controller
        Port map (
            ir_sensor0 => ir_sensor0,
            ir_sensor1 => ir_sensor1,
            ir_sensor2 => ir_sensor2,
            ir_sensor3 => ir_sensor3,
            led0 => led0,
            led1 => led1,
            led2 => led2,
            led3 => led3
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test case 1: All sensors off
        ir_sensor0 <= '0';
        ir_sensor1 <= '0';
        ir_sensor2 <= '0';
        ir_sensor3 <= '0';
        wait for 10 ns;

        -- Test case 2: Sensor 0 on
        ir_sensor0 <= '1';
        wait for 10 ns;

        -- Test case 3: Sensor 1 on
        ir_sensor0 <= '0';
        ir_sensor1 <= '1';
        wait for 10 ns;

        -- Test case 4: Sensor 2 on
        ir_sensor1 <= '0';
        ir_sensor2 <= '1';
        wait for 10 ns;

        -- Test case 5: Sensor 3 on
        ir_sensor2 <= '0';
        ir_sensor3 <= '1';
        wait for 10 ns;

        -- Test case 6: All sensors on
        ir_sensor0 <= '1';
        ir_sensor1 <= '1';
        ir_sensor2 <= '1';
        ir_sensor3 <= '1';
        wait for 10 ns;

        -- Test case 7: Random pattern
        ir_sensor0 <= '0';
        ir_sensor1 <= '1';
        ir_sensor2 <= '0';
        ir_sensor3 <= '1';
        wait for 10 ns;

        -- Test case 8: Another random pattern
        ir_sensor0 <= '1';
        ir_sensor1 <= '0';
        ir_sensor2 <= '1';
        ir_sensor3 <= '0';
        wait for 10 ns;

        -- Stop simulation
        wait;
    end process;
end Behavioral;
