library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register_8bit is
    Port (
        D     : in  STD_LOGIC_VECTOR(7 downto 0);
        CLK   : in  STD_LOGIC;
        RESET : in  STD_LOGIC;
        Q     : out STD_LOGIC_VECTOR(7 downto 0)
    );
end Register_8bit;

architecture Structural of Register_8bit is
    component D_FF
        Port (
            D     : in  STD_LOGIC;
            CLK   : in  STD_LOGIC;
            RESET : in  STD_LOGIC;
            Q     : out STD_LOGIC
        );
    end component;

    signal Q_int : STD_LOGIC_VECTOR(7 downto 0);

begin
    -- Instantiate 8 D flip-flops
    gen_dff: for i in 0 to 7 generate
        dff_inst: D_FF
            Port map (
                D     => D(i),
                CLK   => CLK,
                RESET => RESET,
                Q     => Q_int(i)
            );
    end generate;

    Q <= Q_int;
end Structural;
