entity top_module is
    Port (
        clk : in bit;
        rst : in bit;
        enable : in bit;
        leds : out bit_vector(11 downto 0)
    );
end top_module;

architecture Behavioral of top_module is
    signal divided_clk : bit;

    component clock_divider
        Generic (
            N : integer := 24 -- Adjust N to achieve a noticeable running light speed
        );
        Port (
            clk : in bit;
            rst : in bit;
            clk_n : out bit
        );
    end component;

    component running_light
        Port (
            clk : in bit;
            rst : in bit;
            enable : in bit;
            leds : out bit_vector(11 downto 0)
        );
    end component;
begin

    -- Instantiate the clock divider
    clk_div: clock_divider
        Generic map (
            N => 24 -- Adjust N as needed
        )
        Port map (
            clk => clk,
            rst => rst,
            clk_n => divided_clk
        );

    -- Instantiate the running light
    run_light: running_light
        Port map (
            clk => divided_clk,
            rst => rst,
            enable => enable,
            leds => leds
        );

end Behavioral;
