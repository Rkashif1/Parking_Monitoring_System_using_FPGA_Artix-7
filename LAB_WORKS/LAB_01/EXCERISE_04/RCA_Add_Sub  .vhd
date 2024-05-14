

entity RCA_Add_Sub  is
    Port (
        X, Y : in  bit_vector(3 downto 0); 
        SUB : in bit;                      
        SUM : out bit_vector(3 downto 0);  
        COUT : out bit                    
    );
end RCA_Add_Sub ;

architecture Behavioral of RCA_Add_Sub  is

   
    component RCA is
        Port ( A, B : in bit_vector(3 downto 0);
               Ci : in bit;
               S : out bit_vector(3 downto 0);
               Co : out bit
        );
    end component;

   
    signal RCA_Sum : bit_vector(3 downto 0);
    signal RCA_Cout : bit;

begin
   
    RCA_Unit: RCA port map (
        A => X,
        B => Y,
        Ci => '0',  -- Initialize carry-in as zero
        S => RCA_Sum,
        Co => RCA_Cout
    );

    -- Output of the RCA
    SUM <= RCA_Sum;

   
    process (SUB, RCA_Cout)
    begin
        if SUB = '1' then          -- Perform subtraction
            COUT <= not RCA_Cout;  -- Invert the carry-out of the RCA
        else                       -- Perform addition
            COUT <= RCA_Cout;      -- Carry-out of the RCA remains unchanged
        end if;
    end process;
end Behavioral;
