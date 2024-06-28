library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Digit_Value_Controller is
    Port (
        ir_sensor0 : in STD_LOGIC;
        ir_sensor1 : in STD_LOGIC;
        ir_sensor2 : in STD_LOGIC;
        ir_sensor3 : in STD_LOGIC;
        digit0 : out STD_LOGIC_VECTOR(3 downto 0);
        digit1 : out STD_LOGIC_VECTOR(3 downto 0);
        digit2 : out STD_LOGIC_VECTOR(3 downto 0);
        digit3 : out STD_LOGIC_VECTOR(3 downto 0);
        digit4 : out STD_LOGIC_VECTOR(3 downto 0)
    );
end Digit_Value_Controller;

architecture Behavioral of Digit_Value_Controller is
begin
    process(ir_sensor0, ir_sensor1, ir_sensor2, ir_sensor3)
        variable zero_count : INTEGER := 0;
    begin
        zero_count := 0;

        if ir_sensor0 = '1' then
            digit0 <= "0000";  -- Set digit0 to 0
            zero_count := zero_count + 1;
        else
            digit0 <= "0001";  -- Set digit0 to 1
        end if;

        if ir_sensor1 = '1' then
            digit1 <= "0000";  -- Set digit1 to 0
            zero_count := zero_count + 1;
        else
            digit1 <= "0001";  -- Set digit1 to 1
        end if;

        if ir_sensor2 = '1' then
            digit2 <= "0000";  -- Set digit2 to 0
            zero_count := zero_count + 1;
        else
            digit2 <= "0001";  -- Set digit2 to 1
        end if;

        if ir_sensor3 = '1' then
            digit3 <= "0000";  -- Set digit3 to 0
            zero_count := zero_count + 1;
        else
            digit3 <= "0001";  -- Set digit3 to 1
        end if;

        -- Set digit4 to the count of zeros
        case zero_count is
            when 0 => digit4 <= "0000";  -- 0 zeros
            when 1 => digit4 <= "0001";  -- 1 zero
            when 2 => digit4 <= "0010";  -- 2 zeros
            when 3 => digit4 <= "0011";  -- 3 zeros
            when 4 => digit4 <= "0100";  -- 4 zeros
            when others => digit4 <= "0000";
        end case;
    end process;
end Behavioral;
