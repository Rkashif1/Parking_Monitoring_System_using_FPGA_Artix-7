library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_Register_8bit is
end tb_Register_8bit;

architecture testbench of tb_Register_8bit is

    -- Component Declaration for the Unit Under Test (UUT)
    component Register_8bit
        Port (
            D     : in  STD_LOGIC_VECTOR(7 downto 0);
            CLK   : in  STD_LOGIC;
            RESET : in  STD_LOGIC;
            Q     : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    -- Signals to connect to the UUT
    signal D     : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal CLK   : STD_LOGIC := '0';
    signal RESET : STD_LOGIC := '0';
    signal Q     : STD_LOGIC_VECTOR(7 downto 0);

    -- Clock period definition
    constant CLK_PERIOD : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: Register_8bit
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
        wait for CLK_PERIOD;

        -- Apply input stimulus
        D <= "00000001";
        wait for CLK_PERIOD;
        D <= "00000010";
        wait for CLK_PERIOD;
        D <= "00000100";
        wait for CLK_PERIOD;
        D <= "00001000";
        wait for CLK_PERIOD;
        D <= "00010000";
        wait for CLK_PERIOD;

        -- Add more stimulus here if needed
        wait;
    end process;

end testbench;