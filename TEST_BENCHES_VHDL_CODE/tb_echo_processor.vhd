library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_echo_processor is
-- Testbench entity has no ports
end tb_echo_processor;

architecture Behavioral of tb_echo_processor is
    -- Component declaration for the Unit Under Test (UUT)
    component echo_processor
        Port (
            clk         : in  STD_LOGIC;
            echo        : in  STD_LOGIC;
            distance    : out unsigned(15 downto 0)
        );
    end component;

    -- Signals to connect to the UUT
    signal clk         : STD_LOGIC := '0';
    signal echo        : STD_LOGIC := '0';
    signal distance    : unsigned(15 downto 0);

    -- Clock period definition
    constant clk_period : time := 10 ns;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: echo_processor
        Port map (
            clk => clk,
            echo => echo,
            distance => distance
        );

    -- Clock process definitions
    clk_process :process
    begin
        while true loop
            clk <= '0';
            wait for clk_period/2;
            clk <= '1';
            wait for clk_period/2;
        end loop;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- hold reset state for 100 ns
        wait for 100 ns;    

        -- Generate echo pulse with 580 clock cycles width (approx. 10 cm)
        echo <= '1';
        wait for 580 * clk_period;
        echo <= '0';
        wait for 100 ns;

        -- Generate echo pulse with 1160 clock cycles width (approx. 20 cm)
        echo <= '1';
        wait for 1160 * clk_period;
        echo <= '0';
        wait for 100 ns;

        -- Generate echo pulse with 290 clock cycles width (approx. 5 cm)
        echo <= '1';
        wait for 290 * clk_period;
        echo <= '0';
        wait for 100 ns;

        -- Generate echo pulse with 870 clock cycles width (approx. 15 cm)
        echo <= '1';
        wait for 870 * clk_period;
        echo <= '0';
        wait for 100 ns;

        -- Stop simulation
        wait;
    end process;

end Behavioral;

