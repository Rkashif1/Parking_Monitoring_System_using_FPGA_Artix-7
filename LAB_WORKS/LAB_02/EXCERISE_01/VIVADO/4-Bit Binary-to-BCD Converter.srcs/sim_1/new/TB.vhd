library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is
end entity testbench;

architecture sim of testbench is
    signal binary_input : std_logic_vector(3 downto 0) := (others => '0');
    signal bcd_output   : std_logic_vector(7 downto 0);

begin
    -- Instantiate the DUT
    dut: entity work.Binary_to_BCD_Converter
        port map (
            binary_input => binary_input,
            bcd_output   => bcd_output
        );

    -- Stimulus process
    stimulus_proc: process
    begin
        -- Test all possible binary inputs
        for i in 0 to 15 loop
            binary_input <= std_logic_vector(to_unsigned(i, binary_input'length));
            wait for 10 ns;
            -- Add assertions here if needed to verify the correctness of bcd_output
        end loop;
        wait;
    end process;

end architecture sim;
