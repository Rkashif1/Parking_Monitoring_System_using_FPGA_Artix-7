entity sensor_fsm_tb is
end sensor_fsm_tb;

architecture Behavioral of sensor_fsm_tb is
    signal clk_tb : bit := '0';
    signal rst_tb : bit := '0';
    signal ir_sensors_tb : bit_vector(3 downto 0) := "0000";
    signal ultrasonic_trigger_tb : bit := '0';
    signal segments_tb : bit_vector(6 downto 0);
    signal buzzer_tb : bit;

    component sensor_fsm
        Port (
            clk : in bit;
            rst : in bit;
            ir_sensors : in bit_vector(3 downto 0);
            ultrasonic_trigger : in bit;
            segments : out bit_vector(6 downto 0);
            buzzer : out bit
        );
    end component;
begin
    -- Instantiate the UUT
    UUT: sensor_fsm
        Port map (
            clk => clk_tb,
            rst => rst_tb,
            ir_sensors => ir_sensors_tb,
            ultrasonic_trigger => ultrasonic_trigger_tb,
            segments => segments_tb,
            buzzer => buzzer_tb
        );

    -- Clock generation
    clk_process : process
    begin
        while true loop
            clk_tb <= '0';
            wait for 10 ns;
            clk_tb <= '1';
            wait for 10 ns;
        end loop;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Initialize inputs
        rst_tb <= '1';
        wait for 20 ns;
        rst_tb <= '0';

        -- Test IR sensor input
        ir_sensors_tb <= "0010";
        wait for 20 ns;
        ir_sensors_tb <= "0000";
        wait for 20 ns;

        -- Test ultrasonic sensor input
        ultrasonic_trigger_tb <= '1';
        wait for 20 ns;
        ultrasonic_trigger_tb <= '0';

        -- Test both sensors
        ir_sensors_tb <= "1001";
        ultrasonic_trigger_tb <= '1';
        wait for 20 ns;
        ir_sensors_tb <= "0000";
        ultrasonic_trigger_tb <= '0';

        wait;
    end process;

end Behavioral;
