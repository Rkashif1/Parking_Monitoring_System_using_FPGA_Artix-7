library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_Clock_Divider is
end tb_Clock_Divider;

architecture Behavioral of tb_Clock_Divider is

    -- Component Declaration for the Unit Under Test (UUT)
    component Clock_Divider
        Port (
            clk : in STD_LOGIC;
            refresh_clk : out STD_LOGIC
        );
    end component;

    -- Signals to connect to UUT
    signal clk : STD_LOGIC := '0';
    signal refresh_clk : STD_LOGIC;

    -- Clock period definition
    constant clk_period : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: Clock_Divider
        Port map (
            clk => clk,
            refresh_clk => refresh_clk
        );

    -- Clock process definitions
    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for clk_period/2;
            clk <= '1';
            wait for clk_period/2;
        end loop;
        wait;  -- Process will never reach this wait statement
    end process;

    -- Test process
    stim_proc: process
    begin
        -- Wait for a longer period to observe refresh_clk toggling
        wait for 2000000 * clk_period;  -- Adjust this value to be long enough to see the refresh_clk toggle

        -- Stop simulation
        assert false report "Simulation ended" severity note;
        wait;
    end process;

end Behavioral;

