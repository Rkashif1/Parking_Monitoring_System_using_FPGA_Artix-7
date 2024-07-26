entity tb_JK_FF is
end tb_JK_FF;

architecture Behavioral of tb_JK_FF is

    -- Component Declaration for the Unit Under Test (UUT)
    component JK_FF
        Port (
            J   : in  bit;
            K   : in  bit;
            CLK : in  bit;
            Q   : out bit;
            nQ  : out bit
        );
    end component;

    -- Signals to connect to the UUT
    signal J   : bit := '0';
    signal K   : bit := '0';
    signal CLK : bit := '0';
    signal Q   : bit;
    signal nQ  : bit;

    -- Clock period definition
    constant CLK_PERIOD : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: JK_FF
        Port map (
            J   => J,
            K   => K,
            CLK => CLK,
            Q   => Q,
            nQ  => nQ
        );

    -- Clock process definitions
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
        -- Hold J and K at '0' to ensure no change
        J <= '0';
        K <= '0';
        wait for 2 * CLK_PERIOD;
        
        -- Set condition: J = '1', K = '0'
        J <= '1';
        K <= '0';
        wait for 2 * CLK_PERIOD;
        
        -- Reset condition: J = '0', K = '1'
        J <= '0';
        K <= '1';
        wait for 2 * CLK_PERIOD;
        
        -- Toggle condition: J = '1', K = '1'
        J <= '1';
        K <= '1';
        wait for 2 * CLK_PERIOD;
        
        -- No change condition again: J = '0', K = '0'
        J <= '0';
        K <= '0';
        wait for 2 * CLK_PERIOD;

        -- End the simulation
        wait;
    end process;

end Behavioral;
