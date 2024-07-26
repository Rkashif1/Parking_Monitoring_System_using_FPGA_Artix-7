entity top_module1 is
    Port (
        clk : in bit;
        rst : in bit;
        en : in bit;
        UpDown : in bit;
        segments : out bit_vector(6 downto 0)
    );
end top_module1;

architecture Behavioral of top_module1 is
    signal Q : integer range 0 to 9;

    component counter
        Port (
            clk : in bit;
            rst : in bit;
            en : in bit;
            UpDown : in bit;
            Q : out integer range 0 to 9
        );
    end component;

    component seg7_decoder
        Port (
            digit : in integer range 0 to 9;
            segments : out bit_vector(6 downto 0)
        );
    end component;
begin

    -- Instantiate the counter
    U1: counter
        Port map (
            clk => clk,
            rst => rst,
            en => en,
            UpDown => UpDown,
            Q => Q
        );

    -- Instantiate the 7-segment display decoder
    U2: seg7_decoder
        Port map (
            digit => Q,
            segments => segments
        );

end Behavioral;
