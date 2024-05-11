

entity HALFADDER_TB is
end HALFADDER_TB;

architecture Behavioral of HALFADDER_TB is

   
    component HALFADDER
        Port (
            A, B : in bit;
            Sum, Cout : out bit
        );
    end component;

   
    signal A_TB, B_TB, Sum_TB, Cout_TB : bit;

begin

   
    UUT: HALFADDER port map (
        A => A_TB,
        B => B_TB,
        Sum => Sum_TB,
        Cout => Cout_TB
    );

  
    stimulus: process
    begin
        -- Test case 1
        A_TB <= '0';
        B_TB <= '0';
        wait for 10 ns;
        
        -- Test case 2
        A_TB <= '0';
        B_TB <= '1';
        wait for 10 ns;
        
        -- Test case 3
        A_TB <= '1';
        B_TB <= '0';
        wait for 10 ns;
        
        -- Test case 4
        A_TB <= '1';
        B_TB <= '1';
        wait for 10 ns;
        
     
        wait;
    end process stimulus;

end Behavioral;
