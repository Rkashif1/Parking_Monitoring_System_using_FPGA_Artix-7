entity JK_FF is
    Port (
        J   : in  bit;
        K   : in  bit;
        CLK : in  bit;
        Q   : out bit;
        nQ  : out bit
    );
end JK_FF;

architecture Behavioral of JK_FF is
    signal Q_int : bit := '0';
begin
    process (CLK)
    begin
        if (CLK'event and CLK = '1') then
            if J = '0' and K = '0' then
                Q_int <= Q_int;  -- No change
            elsif J = '0' and K = '1' then
                Q_int <= '0';  -- Reset
            elsif J = '1' and K = '0' then
                Q_int <= '1';  -- Set
            elsif J = '1' and K = '1' then
                Q_int <= not Q_int;  -- Toggle
            end if;
        end if;
    end process;

    Q <= Q_int;
    nQ <= not Q_int;
end Behavioral;
