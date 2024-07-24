

entity FULLADDER_TB is
end FULLADDER_TB;

architecture Behavioral of FULLADDER_TB is

    component FULLADDER is
        Port (
            A, B, Cin : in bit;
            Sum, Cout : out bit
        );
    end component;

   
    signal A_tb, B_tb, Cin_tb : bit;
    signal Sum_tb, Cout_tb : bit;

begin

    
    UUT: FULLADDER port map (
        A => A_tb,
        B => B_tb,
        Cin => Cin_tb,
        Sum => Sum_tb,
        Cout => Cout_tb
    );

  
    stimulus: process
    begin
        -- Test Case 1
        A_tb <= '0';
        B_tb <= '0';
        Cin_tb <= '0';
        wait for 10 ns;

        -- Test Case 2
        A_tb <= '0';
        B_tb <= '0';
        Cin_tb <= '1';
        wait for 10 ns;

        -- Test Case 3
        A_tb <= '0';
        B_tb <= '1';
        Cin_tb <= '0';
        wait for 10 ns;

        -- Test Case 4
        A_tb <= '0';
        B_tb <= '1';
        Cin_tb <= '1';
        wait for 10 ns;

        -- Test Case 5
        A_tb <= '1';
        B_tb <= '0';
        Cin_tb <= '0';
        wait for 10 ns;

        -- Test Case 6
        A_tb <= '1';
        B_tb <= '0';
        Cin_tb <= '1';
        wait for 10 ns;

        -- Test Case 7
        A_tb <= '1';
        B_tb <= '1';
        Cin_tb <= '0';
        wait for 10 ns;

        -- Test Case 8
        A_tb <= '1';
        B_tb <= '1';
        Cin_tb <= '1';
        wait for 10 ns;

        
        wait;
    end process;

end Behavioral;