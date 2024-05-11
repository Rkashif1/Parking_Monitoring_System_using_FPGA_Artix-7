

entity FULLADDER is
    Port (
        A, B, Cin : in  bit;
        Sum, Cout : out bit
    );
end FULLADDER;

architecture Behavioral of FULLADDER is
    signal Sum1, Sum2, Cout1, Cout_1 : bit;  
    component HALFADDER is
        Port (
            A, B : in  bit;
            Sum, Cout : out bit
        );
    end component;

begin
  
  	HA1: HALFADDER 
	port map(
	A => A, 
	B => B, 
	Sum => Sum1, 
	Cout => Cout_1);  
    
   
    HA2: HALFADDER 
	port map(
	A => Sum1, 
	B => Cin, 
	Sum => Sum2, 
	Cout => Cout1);
     
    
    Sum <= Sum2;
    Cout <= Cout1 or Cout_1;  
    
end Behavioral;

