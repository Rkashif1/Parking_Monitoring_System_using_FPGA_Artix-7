library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BCD_Adder_7Segment_tb is
end BCD_Adder_7Segment_tb;

architecture Behavioral of BCD_Adder_7Segment_tb is

    -- Component declaration for the DUT (Design Under Test)
    component BCD_Adder_7Segment is
        Port (
            A, B : in BIT_VECTOR(3 downto 0);
            Cin : in BIT;
            Sum : out BIT_VECTOR(3 downto 0);
            Cout : out BIT;
            SEG_A, SEG_B, SEG_Sum : out STD_LOGIC_VECTOR(6 downto 0)
        );
    end component;

    -- Testbench signals
    signal A_tb, B_tb, Sum_tb : BIT_VECTOR(3 downto 0);
    signal Cin_tb, Cout_tb : BIT;
    signal SEG_A_tb, SEG_B_tb, SEG_Sum_tb : STD_LOGIC_VECTOR(6 downto 0);

   type TableArrayType is array (0 to 15) of BIT_VECTOR (3 downto 0);

         constant  TableArray : TableArrayType := (
        "0000", "0001", "0010", "0011",
        "0100", "0101", "0110", "0111",
        "1000", "1001", "1010", "1011",
        "1100", "1101", "1110", "1111" );

begin

    -- Instantiate the DUT
    DUT : BCD_Adder_7Segment
        port map (
            A => A_tb,
            B => B_tb,
            Cin => Cin_tb,
            Sum => Sum_tb,
            Cout => Cout_tb,
            SEG_A => SEG_A_tb,
            SEG_B => SEG_B_tb,
            SEG_Sum => SEG_Sum_tb
        );

   -- Stimulus process
    stimulus_process: process
        variable F1 : bit;
    begin
        -- Initialize inputs
        A_tb <= "0000";
        B_tb <= "0000";
        Cin_tb <= '0';

        -- Test all possible combinations of A, B, and Cin
        for i in 0 to 15 loop
            for j in 0 to 15 loop
                for k in 0 to 1 loop
                    case k is
                        when 0 =>
                            F1 := '0';
                        when 1 =>
                            F1 := '1';
                    end case;

                    A_tb <=  TableArray (i);
                    B_tb <=  TableArray (j);
                    Cin_tb <= F1;

                    -- Apply stimulus
                    wait for 10 ns;
                end loop;
            end loop;
        end loop;

        wait;
    end process stimulus_process;

end Behavioral;

