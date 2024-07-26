entity clock_divider is
    Generic (
        N : integer := 4 -- Specify the division factor as 2^N
    );
    Port (
        clk : in bit;
        rst : in bit;
        clk_n : out bit
    );
end clock_divider;

architecture Behavioral of clock_divider is
    signal counter : integer range 0 to (2**N - 1) := 0;
    signal clk_n_internal : bit := '0';
begin

    -- Process to divide the clock
    process(clk, rst)
    begin
        if rst = '1' then
            counter <= 0;
            clk_n_internal <= '0';
        elsif clk'event and clk = '1' then
            if counter = (2**N - 1) then
                counter <= 0;
                clk_n_internal <= not clk_n_internal;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;

    -- Assign internal signal to output
    clk_n <= clk_n_internal;

end Behavioral;
