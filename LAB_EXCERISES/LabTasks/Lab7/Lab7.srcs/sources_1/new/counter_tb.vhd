entity counter_tb is
end counter_tb;

architecture Behavioral of counter_tb is
    signal clk_tb : bit := '0';
    signal rst_tb : bit := '0';
    signal en_tb : bit := '0';
    signal UpDown_tb : bit := '0';
    signal Q_tb : integer range 0 to 9;
    signal segments_tb : bit_vector(6 downto 0);

    component top_module
        Port (
            clk : in bit;
            rst : in bit;
            en : in bit;
            UpDown : in bit;
            segments : out bit_vector(6 downto 0)
        );
    end component;
begin

    -- Instantiate the top module
    UUT: top_module
        Port map (
            clk => clk_tb,
            rst => rst_tb,
            en => en_tb,
            UpDown => UpDown_tb,
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
        -- Initialize reset
        rst_tb <= '1';
        wait for 20 ns;
        rst_tb <= '0';

        -- Enable counting up
        en_tb <= '1';
        UpDown_tb <= '1';
        wait for 200 ns;

        -- Enable counting down
        UpDown_tb <= '0';
        wait for 200 ns;

        -- Disable counting
        en_tb <= '0';
        wait for 100 ns;

        -- End simulation
        wait;
    end process;

end Behavioral;
