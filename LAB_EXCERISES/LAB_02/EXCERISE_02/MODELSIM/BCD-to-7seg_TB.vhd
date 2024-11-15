library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BCD_to_7seg_TB is
end entity BCD_to_7seg_TB;

architecture sim of BCD_to_7seg_TB is
    signal bcd_input : std_logic_vector(3 downto 0) := (others => '0');
    signal seg_output : std_logic_vector(6 downto 0);

    -- Instantiate the BCD-to-7 segment decoder
    component BCD_to_7seg_decoder
        port (
            bcd_input  : in  std_logic_vector(3 downto 0);
            seg_output : out std_logic_vector(6 downto 0)
        );
    end component;

begin
    -- Connect the DUT
    DUT : BCD_to_7seg_decoder
        port map (
            bcd_input  => bcd_input,
            seg_output => seg_output
        );

    -- Stimulus process
    stimulus_process : process
    begin
        for i in 0 to 9 loop
            bcd_input <= std_logic_vector(to_unsigned(i, bcd_input'length));
            wait for 10 ns;
        end loop;

        wait;
    end process;
end architecture sim;

