entity Exercise4_Counter_tb is
end Exercise4_Counter_tb;

architecture Behavioral of Exercise4_Counter_tb is
    signal clk_tb : bit := '0';
    signal rst_tb : bit := '0';
    signal en_tb : bit := '0';
    signal Q_tb : bit_vector(7 downto 0);

    constant N : integer := 8; -- Define the number of bits

    component Exercise4_Counter
        Generic ( N : integer := 8 );
        Port (
            clk : in bit;
            rst : in bit;
            en : in bit;
            Q : out bit_vector(N-1 downto 0)
        );
    end component;
begin

    -- Instantiate the Unit Under Test (UUT)
    UUT: Exercise4_Counter
        Generic map ( N => N )
        Port map (
            clk => clk_tb,
            rst => rst_tb,
            en => en_tb,
            Q => Q_tb
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

        -- Enable counting
        en_tb <= '1';
        wait for 200 ns;

        -- Disable counting
        en_tb <= '0';
        wait for 100 ns;

        -- Enable counting again
        en_tb <= '1';
        wait for 200 ns;

        -- Reset the counter
        rst_tb <= '1';
        wait for 20 ns;
        rst_tb <= '0';

        -- Disable counting
        en_tb <= '0';
        wait;

    end process;

end Behavioral;
