entity seg7_decoder is
    Port (
        digit : in  integer range 0 to 9;
        segments : out bit_vector(6 downto 0)
    );
end seg7_decoder;

architecture Behavioral of seg7_decoder is
begin
    process(digit)
    begin
        case digit is
            when 0 => segments <= "0000001"; -- 0
            when 1 => segments <= "1001111"; -- 1
            when 2 => segments <= "0010010"; -- 2
            when 3 => segments <= "0000110"; -- 3
            when 4 => segments <= "1001100"; -- 4
            when 5 => segments <= "0100100"; -- 5
            when 6 => segments <= "0100000"; -- 6
            when 7 => segments <= "0001111"; -- 7
            when 8 => segments <= "0000000"; -- 8
            when 9 => segments <= "0000100"; -- 9
            when others => segments <= "1111111"; -- Default to all off
        end case;
    end process;
end Behavioral;
