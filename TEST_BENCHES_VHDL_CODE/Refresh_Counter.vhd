library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Refresh_Counter_tb is
-- Testbench has no ports
end Refresh_Counter_tb;

architecture Behavioral of Refresh_Counter_tb is

    -- Component declaration for the Unit Under Test (UUT)
    component Refresh_Counter
        Port (
            refresh_clk : in STD_LOGIC;
            refresh_counter : out STD_LOGIC_VECTOR(2 downto 0)
        );
    end component;

    -- Signals to connect to UUT
    signal refresh_clk : STD_LOGIC := '0';
    signal refresh_counter_signal : STD_LOGIC_VECTOR(2 downto 0);

    -- Clock period
    constant clk_period : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: Refresh_Counter
        Port map (
            refresh_clk => refresh_clk,
            refresh_counter => refresh_counter_signal
        );

    -- Clock generation process
    clk_process :process
    begin
        refresh_clk <= '0';
        wait for clk_period/2;
        refresh_clk <= '1';
        wait for clk_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Insert stimulus here

        -- Wait for 100 ns to observe the output
        wait for 100 ns;

        -- Stop simulation
        wait;
    end process;

end Behavioral;

