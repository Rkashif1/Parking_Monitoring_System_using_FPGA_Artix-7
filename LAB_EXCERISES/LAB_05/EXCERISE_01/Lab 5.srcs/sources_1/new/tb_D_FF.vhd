library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_D_FF is
end tb_D_FF;

architecture testbench of tb_D_FF is

    component D_FF
        Port (
            D     : in  STD_LOGIC;
            CLK   : in  STD_LOGIC;
            RESET : in  STD_LOGIC;
            Q     : out STD_LOGIC
        );
    end component;

    -- Signals to connect to the UUT
    signal D     : STD_LOGIC := '0';
    signal CLK   : STD_LOGIC := '0';
    signal RESET : STD_LOGIC := '0';
    signal Q     : STD_LOGIC;

    -- Clock period definition
    constant CLK_PERIOD : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: D_FF
        Port map (
            D     => D,
            CLK   => CLK,
            RESET => RESET,
            Q     => Q
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
        -- Hold reset state for 20 ns
        RESET <= '1';
        wait for 20 ns;    
        RESET <= '0';
        wait for 40 ns;

        -- Apply input stimulus
        D <= '1';
        wait for CLK_PERIOD;
        D <= '0';
        wait for CLK_PERIOD;

        -- Add more stimulus here if needed
        wait;
    end process;

end testbench;
