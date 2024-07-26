entity counter_tb is
end counter_tb;

architecture Behavioral of counter_tb is
    signal clk_tb : bit := '0';
    signal reset_tb : bit := '0';
    signal increment_tb : bit := '0';
    signal segments_tb : bit_vector(6 downto 0);

    component counter
        Port (
            clk : in bit;
            reset : in bit;
            increment : in bit;
            segments : out bit_vector(6 downto 0)
        );
    end component;
begin
    UUT: counter
        Port map (
            clk => clk_tb,
            reset => reset_tb,
            increment => increment_tb,
            segments => segments_tb
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
        -- Reset
        reset_tb <= '1';
        wait for 20 ns;
        reset_tb <= '0';

        -- Increment the counter
        increment_tb <= '1';
        wait for 100 ns;
        increment_tb <= '0';
        wait for 20 ns;

        -- Another increment
        increment_tb <= '1';
        wait for 100 ns;
        increment_tb <= '0';
        wait for 20 ns;

        -- End simulation
        wait;
    end process;

end Behavioral;
