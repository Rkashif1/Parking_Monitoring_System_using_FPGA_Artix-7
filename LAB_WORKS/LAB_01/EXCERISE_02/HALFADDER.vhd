
entity HALFADDER is
    Port (
        A, B : in bit;
        Sum, Cout : out bit
    );
end HALFADDER;

architecture Behavioral of HALFADDER is
begin
    Sum <= A xor B;
    Cout <= A and B;
end Behavioral;