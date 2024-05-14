

entity RCA_Add_Sub_TB is
end RCA_Add_Sub_TB;

architecture Behavioral of RCA_Add_Sub_TB is
    
    constant A_val: bit_vector(3 downto 0) := "0101";
    constant B_val: bit_vector(3 downto 0) := "0011";
    constant Sub_val: bit := '0';  -- For addition, set Sub to '0'

    
    signal X_tb, Y_tb: bit_vector(3 downto 0);
    signal SUB_tb: bit;
    signal SUM_tb: bit_vector(3 downto 0);
    signal COUT_tb: bit;

    
    component RCA_Add_Sub is
        Port (
            X, Y : in  bit_vector(3 downto 0);
            SUB : in bit;
            SUM : out bit_vector(3 downto 0);
            COUT : out bit
        );
    end component;

begin
    
    UUT: RCA_Add_Sub port map (
        X => X_tb,
        Y => Y_tb,
        SUB => SUB_tb,
        SUM => SUM_tb,
        COUT => COUT_tb
    );

    -- Stimulus process
    stimulus_proc: process
    begin
        -- Test Case 1
        X_tb <= A_val;
        Y_tb <= B_val;
        SUB_tb <= Sub_val;
        wait for 100 ns;

        -- Test Case 2
        
        X_tb <= "1010";
        Y_tb <= "0110";
        SUB_tb <= '1';
         wait for 100 ns;

	-- Test Case 3
        X_tb <= "0010";
        Y_tb <= "1011";
        SUB_tb <= '0';
        wait for 100 ns;

        -- Test Case 4
        X_tb <= "1001";
        Y_tb <= "1101";
        SUB_tb <= '1';
        wait for 100 ns;

        

      
        wait;
    end process stimulus_proc;
end Behavioral;

