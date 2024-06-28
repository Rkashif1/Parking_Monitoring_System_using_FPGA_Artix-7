library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Clock_Divider is
    Port (
        clk : in STD_LOGIC;
        refresh_clk : out STD_LOGIC
    );
end Clock_Divider;

architecture Behavioral of Clock_Divider is
    signal refresh_clk_internal : STD_LOGIC := '0';
begin
    process(clk)
        variable count : INTEGER := 0;
    begin
        if rising_edge(clk) then
            if count = 50000 then
                refresh_clk_internal <= not refresh_clk_internal;
                count := 0;
            else
                count := count + 1;
            end if;
        end if;
    end process;

    refresh_clk <= refresh_clk_internal;
end Behavioral;
