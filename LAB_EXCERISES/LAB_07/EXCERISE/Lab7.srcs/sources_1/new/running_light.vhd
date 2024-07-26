entity running_light is
    Port (
        clk : in bit;
        rst : in bit;
        enable : in bit;
        leds : out bit_vector(11 downto 0)
    );
end running_light;

architecture Behavioral of running_light is
    signal shift_reg : bit_vector(11 downto 0) := "000000000001";
begin
    process(clk, rst)
    begin
        if rst = '1' then
            shift_reg <= "000000000001";
        elsif clk'event and clk = '1' then
            if enable = '1' then
                shift_reg <= shift_reg(10 downto 0) & shift_reg(11);
            end if;
        end if;
    end process;

    leds <= shift_reg;
end Behavioral;
