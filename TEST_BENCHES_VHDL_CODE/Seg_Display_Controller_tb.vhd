library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Seg_Display_Controller_tb is
end Seg_Display_Controller_tb;

architecture Behavioral of Seg_Display_Controller_tb is
    signal refresh_counter : STD_LOGIC_VECTOR(2 downto 0) := "000";
    signal digit0 : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal digit1 : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal digit2 : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal digit3 : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal digit4 : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal an : STD_LOGIC_VECTOR(7 downto 0);
    signal seg : STD_LOGIC_VECTOR(7 downto 0);

    -- Component Declaration for the Unit Under Test (UUT)
    component Seg_Display_Controller is
        Port (
            refresh_counter : in STD_LOGIC_VECTOR(2 downto 0);
            digit0 : in STD_LOGIC_VECTOR(3 downto 0);
            digit1 : in STD_LOGIC_VECTOR(3 downto 0);
            digit2 : in STD_LOGIC_VECTOR(3 downto 0);
            digit3 : in STD_LOGIC_VECTOR(3 downto 0);
            digit4 : in STD_LOGIC_VECTOR(3 downto 0);
            an : out STD_LOGIC_VECTOR(7 downto 0);
            seg : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: Seg_Display_Controller port map (
        refresh_counter => refresh_counter,
        digit0 => digit0,
        digit1 => digit1,
        digit2 => digit2,
        digit3 => digit3,
        digit4 => digit4,
        an => an,
        seg => seg
    );

    -- Testbench process
    process
    begin
        -- Test case 1: Display 0 on all digits
        digit0 <= "0000";  -- 0
        digit1 <= "0000";  -- 0
        digit2 <= "0000";  -- 0
        digit3 <= "0000";  -- 0
        digit4 <= "0000";  -- 0
        for i in 0 to 7 loop
            refresh_counter <= CONV_STD_LOGIC_VECTOR(i, 3);
            wait for 10 ns;
        end loop;

        -- Test case 2: Display 1 on all digits
        digit0 <= "0001";  -- 1
        digit1 <= "0001";  -- 1
        digit2 <= "0001";  -- 1
        digit3 <= "0001";  -- 1
        digit4 <= "0001";  -- 1
        for i in 0 to 7 loop
            refresh_counter <= CONV_STD_LOGIC_VECTOR(i, 3);
            wait for 10 ns;
        end loop;

        -- Test case 3: Display a sequence of numbers
        digit0 <= "0010";  -- 2
        digit1 <= "0011";  -- 3
        digit2 <= "0100";  -- 4
        digit3 <= "0001";  -- 1
        digit4 <= "0000";  -- 0
        for i in 0 to 7 loop
            refresh_counter <= CONV_STD_LOGIC_VECTOR(i, 3);
            wait for 10 ns;
        end loop;

        -- Test case 4: Test display E, R, F
        refresh_counter <= "101";  -- Test E
        wait for 10 ns;
        refresh_counter <= "110";  -- Test R
        wait for 10 ns;
        refresh_counter <= "111";  -- Test F
        wait for 10 ns;

        wait;
    end process;

end Behavioral;

