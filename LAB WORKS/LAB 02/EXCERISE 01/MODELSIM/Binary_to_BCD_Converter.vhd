

entity Binary_to_BCD_Converter is
    port (
        binary_input : in  bit_vector(3 downto 0);
        bcd_output   : out bit_vector(7 downto 0)
    );
end entity Binary_to_BCD_Converter;

architecture Behavioral of Binary_to_BCD_Converter is
begin

    process (binary_input)
    begin
       case binary_input is
            when "0000" => bcd_output <= "00000000";
            when "0001" => bcd_output <= "00000001";
            when "0010" => bcd_output <= "00000010";
            when "0011" => bcd_output <= "00000011";
            when "0100" => bcd_output <= "00000100";
            when "0101" => bcd_output <= "00000101";
            when "0110" => bcd_output <= "00000110";
            when "0111" => bcd_output <= "00000111";
            when "1000" => bcd_output <= "00001000";
            when "1001" => bcd_output <= "00001001";
            when "1010" => bcd_output <= "00010000";
            when "1011" => bcd_output <= "00010001";
            when "1100" => bcd_output <= "00010010";
            when "1101" => bcd_output <= "00010011";
            when "1110" => bcd_output <= "00010100";
            when "1111" => bcd_output <= "00010101";
            when others => bcd_output <= "00000000"; -- Default case
        end case;
    end process;
end architecture Behavioral;

