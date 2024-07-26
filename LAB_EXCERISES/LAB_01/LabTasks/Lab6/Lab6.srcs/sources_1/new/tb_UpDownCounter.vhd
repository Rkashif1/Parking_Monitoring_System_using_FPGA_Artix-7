entity tb_UpDownCounter is
end tb_UpDownCounter;

architecture Behavioral of tb_UpDownCounter is
    signal CLK    : bit := '0';
    signal RESET  : bit := '0';
    signal MODE   : bit := '1';  -- '1' for Up, '0' for Down
    signal Q      : bit_vector(2 downto 0);

    constant CLK_PERIOD : time := 10 ns;
begin

    -- Instantiate the Unit Under Test (UUT)
    UUT: entity work.UpDownCounter
        port map (
            CLK    => CLK,
            RESET  => RESET,
            MODE   => MODE,
            Q      => Q
        );

    -- Clock generation
    CLK_process : process
    begin
        while True loop
            CLK <= '0';
            wait for CLK_PERIOD / 2;
            CLK <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Initialize Reset
        RESET <= '1';
        wait for CLK_PERIOD * 2;
        RESET <= '0';

        -- Test Up Counting
        wait for CLK_PERIOD * 20;

        -- Test Down Counting
        MODE <= '0';
        wait for CLK_PERIOD * 20;

        -- End the simulation
        wait;
    end process;

end Behavioral;
