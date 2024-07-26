entity running_light_tb is
end running_light_tb;

architecture Behavioral of running_light_tb is
    signal clk_tb : bit := '0';
    signal rst_tb : bit := '0';
    signal enable_tb : bit := '1';
    signal leds_tb : bit_vector(11 downto 0);

    component top_module
        Port (
            clk : in bit;
            rst : in bit;
            enable : in bit;
            leds : out bit_vector(11 downto 0)
        );
    end component;
begin
    -- Instantiate the top module
    UUT: top_module
        Port map (
            clk => clk_tb,
            rst => rst_tb,
            enable => enable_tb,
            leds => leds_tb
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
        -- Initialize reset
        rst_tb <= '1';
        wait for 20 ns;
        rst_tb <= '0';

        -- Allow the running light to operate
        wait for 1000 ns;

        -- End simulation
        wait;
    end process;

end Behavioral;
