entity clock_divider_tb is
end clock_divider_tb;

architecture Behavioral of clock_divider_tb is
    signal clk_tb : bit := '0';
    signal rst_tb : bit := '0';
    signal clk_n_tb : bit;

    constant N : integer := 4; -- Specify the division factor for the testbench

    component clock_divider
        Generic (
            N : integer := 4
        );
        Port (
            clk : in bit;
            rst : in bit;
            clk_n : out bit
        );
    end component;
begin

    -- Instantiate the clock divider
    UUT: clock_divider
        Generic map (
            N => N
        )
        Port map (
            clk => clk_tb,
            rst => rst_tb,
            clk_n => clk_n_tb
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

        -- Allow the clock divider to operate
        wait for 1000 ns;

        -- End simulation
        wait;
    end process;

end Behavioral;
