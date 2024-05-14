
entity RCA is
    Port ( A,B : in bit_vector (3 downto 0);
           Ci : in bit;
           S : out bit_vector (3 downto 0);
           Co : out bit);
end RCA;

architecture Behavioral of RCA is

component FA is
   
    Port ( x,y,cin : in bit;
           cout,sum : out bit);
end component ;

signal c : bit_vector(3 downto 0);

begin

FA0 : FA Port map (A(0),B(0),Ci,S(0),c(1));
FA1 : FA Port map (A(1),B(1),Ci,S(1),c(2));
FA3 : FA Port map (A(2),B(2),Ci,S(2),c(3));
FA4 : FA Port map (A(3),B(3),Ci,S(3),Co);


end Behavioral;