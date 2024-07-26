library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ShiftRegister_8bit is
    Port (
        D     : in  STD_LOGIC;  -- Serial input
        CLK   : in  STD_LOGIC;
        RESET : in  STD_LOGIC;
        Q     : out STD_LOGIC_VECTOR(7 downto 0)
    );
end ShiftRegister_8bit;

architecture Structural of ShiftRegister_8bit is
    component D_FF
        Port (
            D     : in  STD_LOGIC;
            CLK   : in  STD_LOGIC;
            RESET : in  STD_LOGIC;
            Q     : out STD_LOGIC
        );
    end component;

    signal Q_int : STD_LOGIC_VECTOR(7 downto 0);
    signal D_int : STD_LOGIC_VECTOR(7 downto 0);

begin
    -- Connect the serial input to the first flip-flop
    D_int(0) <= D;

    -- Connect the output of each flip-flop to the input of the next one
    gen_dff: for i in 1 to 7 generate
        D_int(i) <= Q_int(i-1);
    end generate;

    -- Instantiate 8 D flip-flops
    gen_dff_inst: for i in 0 to 7 generate
        dff_inst: D_FF
            Port map (
                D     => D_int(i),
                CLK   => CLK,
                RESET => RESET,
                Q     => Q_int(i)
            );
    end generate;

    Q <= Q_int;
end Structural;
