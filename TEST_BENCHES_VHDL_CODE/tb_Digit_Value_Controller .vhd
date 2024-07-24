
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_Digit_Value_Controller is
end tb_Digit_Value_Controller;

architecture Behavioral of tb_Digit_Value_Controller is

    -- Component Declaration for the Unit Under Test (UUT)
    component Digit_Value_Controller
    Port (
        ir_sensor0 : in STD_LOGIC;
        ir_sensor1 : in STD_LOGIC;
        ir_sensor2 : in STD_LOGIC;
        ir_sensor3 : in STD_LOGIC;
        digit0 : out STD_LOGIC_VECTOR(3 downto 0);
        digit1 : out STD_LOGIC_VECTOR(3 downto 0);
        digit2 : out STD_LOGIC_VECTOR(3 downto 0);
        digit3 : out STD_LOGIC_VECTOR(3 downto 0);
        digit4 : out STD_LOGIC_VECTOR(3 downto 0)
    );
    end component;

    -- Signals for connecting to UUT
    signal ir_sensor0 : STD_LOGIC := '0';
    signal ir_sensor1 : STD_LOGIC := '0';
    signal ir_sensor2 : STD_LOGIC := '0';
    signal ir_sensor3 : STD_LOGIC := '0';
    signal digit0 : STD_LOGIC_VECTOR(3 downto 0);
    signal digit1 : STD_LOGIC_VECTOR(3 downto 0);
    signal digit2 : STD_LOGIC_VECTOR(3 downto 0);
    signal digit3 : STD_LOGIC_VECTOR(3 downto 0);
    signal digit4 : STD_LOGIC_VECTOR(3 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: Digit_Value_Controller Port Map (
        ir_sensor0 => ir_sensor0,
        ir_sensor1 => ir_sensor1,
        ir_sensor2 => ir_sensor2,
        ir_sensor3 => ir_sensor3,
        digit0 => digit0,
        digit1 => digit1,
        digit2 => digit2,
        digit3 => digit3,
        digit4 => digit4
    );

    -- Stimulus process
    stim_proc: process
    begin        
        -- Initialize Inputs
        ir_sensor0 <= '0';
        ir_sensor1 <= '0';
        ir_sensor2 <= '0';
        ir_sensor3 <= '0';
        wait for 10 ns;
        
        -- Test case 1: All sensors inactive
        ir_sensor0 <= '0';
        ir_sensor1 <= '0';
        ir_sensor2 <= '0';
        ir_sensor3 <= '0';
        wait for 10 ns;
        
        -- Test case 2: ir_sensor0 active
        ir_sensor0 <= '1';
        ir_sensor1 <= '0';
        ir_sensor2 <= '0';
        ir_sensor3 <= '0';
        wait for 10 ns;
        
        -- Test case 3: ir_sensor0 and ir_sensor1 active
        ir_sensor0 <= '1';
        ir_sensor1 <= '1';
        ir_sensor2 <= '0';
        ir_sensor3 <= '0';
        wait for 10 ns;
        
        -- Test case 4: ir_sensor0, ir_sensor1, and ir_sensor2 active
        ir_sensor0 <= '1';
        ir_sensor1 <= '1';
        ir_sensor2 <= '1';
        ir_sensor3 <= '0';
        wait for 10 ns;
        
        -- Test case 5: All sensors active
        ir_sensor0 <= '1';
        ir_sensor1 <= '1';
        ir_sensor2 <= '1';
        ir_sensor3 <= '1';
        wait for 10 ns;
        
        -- End of simulation
        wait;
    end process;

end Behavioral;
