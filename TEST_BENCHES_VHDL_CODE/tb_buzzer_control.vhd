
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_buzzer_control is
end tb_buzzer_control;

architecture Behavioral of tb_buzzer_control is
    -- Component Declaration for the Unit Under Test (UUT)
    component buzzer_control
    Port (
        clk         : in  STD_LOGIC;
        distance    : in  unsigned(15 downto 0);
        buzzer      : out STD_LOGIC
    );
    end component;

    -- Testbench signals
    signal clk         : STD_LOGIC := '0';
    signal distance    : unsigned(15 downto 0) := (others => '0');
    signal buzzer      : STD_LOGIC;

    -- Clock period definition
    constant clk_period : time := 10 ns;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: buzzer_control
    Port map (
        clk => clk,
        distance => distance,
        buzzer => buzzer
    );

    -- Clock process definitions
    clk_process :process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Test Case 1: Distance greater than 20 cm
        distance <= to_unsigned(25, 16);
        wait for clk_period * 10;
        
        -- Test Case 2: Distance less than 20 cm
        distance <= to_unsigned(15, 16);
        wait for clk_period * 10;
        
        -- Test Case 3: Distance exactly 20 cm
        distance <= to_unsigned(20, 16);
        wait for clk_period * 10;
        
        -- Test Case 4: Distance less than 20 cm again
        distance <= to_unsigned(10, 16);
        wait for clk_period * 10;

        -- Test Case 5: Distance greater than 20 cm again
        distance <= to_unsigned(30, 16);
        wait for clk_period * 10;
        
        -- Stop simulation
        wait;
    end process;

end Behavioral;
