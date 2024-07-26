entity Counter_3bit is
    Port (
        CLK : in  bit;
        Q   : out bit_vector(2 downto 0)
    );
end Counter_3bit;

architecture Structural of Counter_3bit is
    component JK_FF
        Port (
            J   : in  bit;
            K   : in  bit;
            CLK : in  bit;
            Q   : out bit;
            nQ  : out bit
        );
    end component;

    signal Q0, Q1, Q2 : bit;
    signal nQ0, nQ1, nQ2 : bit;
begin
    -- Instantiate JK Flip-Flops
    jkff0: JK_FF Port map (J => '1', K => '1', CLK => CLK, Q => Q0, nQ => nQ0);
    jkff1: JK_FF Port map (J => '1', K => '1', CLK => nQ0, Q => Q1, nQ => nQ1);
    jkff2: JK_FF Port map (J => '1', K => '1', CLK => nQ1, Q => Q2, nQ => nQ2);

    Q(0) <= Q0;
    Q(1) <= Q1;
    Q(2) <= Q2;
end Structural;
