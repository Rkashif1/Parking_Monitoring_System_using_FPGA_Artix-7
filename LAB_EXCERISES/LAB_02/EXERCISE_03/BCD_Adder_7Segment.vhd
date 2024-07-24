
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BCD_Adder_7Segment is
    Port (
        A, B : in BIT_VECTOR(3 downto 0); -- Inputs for the 4-bit BCD Adder
        Cin : in BIT;                      -- Carry-in for the adder
        Sum : out BIT_VECTOR(3 downto 0); -- Sum output of the adder
        Cout : out BIT;                   -- Carry-out from the adder
        SEG_A, SEG_B, SEG_Sum : out STD_LOGIC_VECTOR (6 downto 0) -- 7-segment display outputs
    );
end BCD_Adder_7Segment;

architecture Behavioral of BCD_Adder_7Segment is

    component BCD_Adder is
        Port (
            A, B : in BIT_VECTOR(3 downto 0);
            Cin : in BIT;
            Sum : out BIT_VECTOR(3 downto 0);
            Cout : out BIT
        );
    end component;

    component BCD_to_7seg_decoder is
        Port (
            BCD : in BIT_VECTOR(3 downto 0);
            SEG : out STD_LOGIC_VECTOR(6 downto 0)
        );
    end component;

    signal adder_sum : BIT_VECTOR(3 downto 0);
    signal adder_cout : BIT;




begin

    Adder: BCD_Adder
        port map (
            A => A,
            B => B,
            Cin => Cin,
            Sum => adder_sum,
            Cout => adder_cout
        );

    Decoder_A: BCD_to_7seg_decoder
        port map (
            BCD => A,
            SEG => SEG_A
        );
    
    Decoder_B: BCD_to_7seg_decoder
        port map (
            BCD => B,
            SEG => SEG_B
        );

    Decoder_Sum: BCD_to_7seg_decoder
        port map (
            BCD => adder_sum,
            SEG => SEG_Sum
        );

    Sum <= adder_sum;
    Cout <= adder_cout;

end Behavioral;
