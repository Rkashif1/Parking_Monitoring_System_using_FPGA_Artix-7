entity counter is
    Port (
        clk : in bit;
        rst : in bit;
        en : in bit;
        UpDown : in bit;
        Q : out integer range 0 to 9
    );
end counter;

architecture Behavioral of counter is
    signal count : integer range 0 to 9 := 0;
begin
    process(clk, rst)
    begin
        if rst = '1' then
            count <= 0;
        elsif clk'event and clk = '1' then
            if en = '1' then
                if UpDown = '1' then
                    if count = 9 then
                        count <= 0;
                    else
                        count <= count + 1;
                    end if;
                else
                    if count = 0 then
                        count <= 9;
                    else
                        count <= count - 1;
                    end if;
                end if;
            end if;
        end if;
    end process;

    Q <= count;
end Behavioral;
