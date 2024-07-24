library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_echo_processor is
-- Testbench does not have any ports
end tb_echo_processor;

architecture Behavioral of tb_echo_processor is

    -- Component declaration for the unit under test (UUT)
    component echo_processor
        Port (
            clk      : in  STD_LOGIC;
            echo     : in  STD_LOGIC;
            distance : out unsigned(15 downto 0)
        );
    end component;

    -- Signals to connect to UUT
    signal clk      : STD_LOGIC := '0';
    signal echo     : STD_LOGIC := '0';
    signal distance : unsigned(15 downto 0);

    -- Clock period definitions
    constant clk_period : time := 20 ns; -- 50 MHz

begin

    -- Instantiate the UUT
    uut: echo_processor
        Port map (
            clk      => clk,
            echo     => echo,
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
        -- Initial delay
        wait for 100 ns;	

        -- Generate an echo pulse of 1 ms (corresponds to a distance of approximately 17.24 cm)
        echo <= '1';
        wait for 1 ms;
        echo <= '0';
        wait for 100 ns;

        -- Generate an echo pulse of 2 ms (corresponds to a distance of approximately 34.48 cm)
        echo <= '1';
        wait for 2 ms;
        echo <= '0';
        wait for 100 ns;

        -- End simulation after sufficient observation time
        wait for 10 ms; 
        wait;
    end process;

end Behavioral;
