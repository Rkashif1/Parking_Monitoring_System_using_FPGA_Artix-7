entity counter is
    Port (
        clk : in bit;
        reset : in bit;
        increment : in bit;
        segments : out bit_vector(6 downto 0)
    );
end counter;

architecture Behavioral of counter is
    signal count : integer range 0 to 9 := 0;
    component seg7_decoder
        Port (
            digit : in integer range 0 to 9;
            segments : out bit_vector(6 downto 0)
        );
    end component;
begin
    process(clk, reset)
    begin
        if reset = '1' then
            count <= 0;
        elsif clk'event and clk = '1' then
            if increment = '1' then
                if count = 9 then
                    count <= 0;
                else
                    count <= count + 1;
                end if;
            end if;
        end if;
    end process;

    U1: seg7_decoder
        Port map (
            digit => count,
            segments => segments
        );
end Behavioral;
