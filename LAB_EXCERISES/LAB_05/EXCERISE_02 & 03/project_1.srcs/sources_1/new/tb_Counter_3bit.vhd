entity tb_Counter_3bit is
end tb_Counter_3bit;

architecture Behavioral of tb_Counter_3bit is

    -- Component Declaration for the Unit Under Test (UUT)
    component Counter_3bit
        Port (
            CLK : in  bit;
            Q   : out bit_vector (2 downto 0)
        );
    end component;

    -- Signals to connect to the UUT
    signal CLK : bit := '0';
    signal Q   : bit_vector (2 downto 0);

    -- Clock period definition
    constant CLK_PERIOD : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: Counter_3bit
        Port map (
            CLK => CLK,
            Q   => Q
        );

    -- Clock process definitions
    CLK_process :process
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
        -- Allow the counter to run for some time
        wait for 200 ns;

        -- End the simulation
        wait;
    end process;

end Behavioral;
