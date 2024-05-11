library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BCD_to_7seg_decoder is
    port (
        bcd_input   : in  std_logic_vector(3 downto 0);
        seg_output  : out std_logic_vector(6 downto 0) 
    );
end entity BCD_to_7seg_decoder;

architecture Behavioral of BCD_to_7seg_decoder is
begin
    process (bcd_input)
    begin
        case bcd_input is
            when "0000" => seg_output <= "1000000"; -- 0
            when "0001" => seg_output <= "1111001"; -- 1
            when "0010" => seg_output <= "0100100"; -- 2
            when "0011" => seg_output <= "0110000"; -- 3
            when "0100" => seg_output <= "0011001"; -- 4
            when "0101" => seg_output <= "0010010"; -- 5
            when "0110" => seg_output <= "0000010"; -- 6
            when "0111" => seg_output <= "1111000"; -- 7
            when "1000" => seg_output <= "0000000"; -- 8
            when "1001" => seg_output <= "0010000"; -- 9
            when others => seg_output <= "1111111"; -- Invalid input
        end case;
    end process;
end architecture Behavioral;

