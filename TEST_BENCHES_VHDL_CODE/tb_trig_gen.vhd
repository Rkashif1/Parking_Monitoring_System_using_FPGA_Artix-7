
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_trig_gen is
end tb_trig_gen;

architecture Behavioral of tb_trig_gen is
    signal clk         : STD_LOGIC := '0';
    signal trig        : STD_LOGIC;
    
    -- Clock period definition
    constant CLK_PERIOD : time := 20 ns; -- 50 MHz

    -- Component Declaration for the Unit Under Test (UUT)
    component trig_gen
    Port (
        clk         : in  STD_LOGIC;
        trig        : out STD_LOGIC
    );
    end component;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: trig_gen port map (
        clk => clk,
        trig => trig
    );

    -- Clock process definitions
    clk_process :process
    begin
        clk <= '0';
        wait for CLK_PERIOD/2;
        clk <= '1';
        wait for CLK_PERIOD/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin		
        -- wait for global reset
        wait for 100 ns;
        
        -- insert stimulus here
        wait for 100 ms; -- Run the simulation for 100 ms

        -- Stop simulation
        wait;
    end process;
end Behavioral;
