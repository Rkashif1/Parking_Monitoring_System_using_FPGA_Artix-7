

entity RCA_tb is
end RCA_tb;

architecture Behavioral of RCA_tb is

   
    component RCA is
        Port ( A,B : in bit_vector (3 downto 0);
               Ci : in bit;
               S : out bit_vector (3 downto 0);
               Co : out bit);
    end component;

   
    signal A, B : bit_vector (3 downto 0);
    signal Ci : bit;
    signal S : bit_vector (3 downto 0);
    signal Co : bit;

begin

   
    UUT: RCA port map (
        A => A,
        B => B,
        Ci => Ci,
        S => S,
        Co => Co
    );


   stimulus_proc: process
begin
    
    wait for 100 ns;

    -- Test Case 1
    A <= "0001";
    B <= "0001";
    Ci <= '0';
    wait for 10 ns;

    -- Test Case 2
    A <= "0011";
    B <= "0011";
    Ci <= '0';
    wait for 10 ns;

    -- Test Case 3
    A <= "1111";
    B <= "0000";
    Ci <= '0';
    wait for 10 ns;

    -- Test Case 4
    A <= "1100";
    B <= "0010";
    Ci <= '1';
    wait for 10 ns;

    -- Test Case 5
    A <= "0000";
    B <= "0000";
    Ci <= '0';
  wait;

end process stimulus_proc;
end Behavioral;
