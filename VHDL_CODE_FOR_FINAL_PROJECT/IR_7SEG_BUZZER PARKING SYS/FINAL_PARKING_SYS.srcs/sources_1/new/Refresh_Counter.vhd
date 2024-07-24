library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Refresh_Counter is
    Port (
        refresh_clk : in STD_LOGIC;
        refresh_counter : out STD_LOGIC_VECTOR(2 downto 0)
    );
end Refresh_Counter;

architecture Behavioral of Refresh_Counter is
    signal counter : STD_LOGIC_VECTOR(2 downto 0) := "000";
begin
    process(refresh_clk)
    begin
        if rising_edge(refresh_clk) then
            counter <= counter + 1;
        end if;
    end process;
    refresh_counter <= counter;
end Behavioral;
