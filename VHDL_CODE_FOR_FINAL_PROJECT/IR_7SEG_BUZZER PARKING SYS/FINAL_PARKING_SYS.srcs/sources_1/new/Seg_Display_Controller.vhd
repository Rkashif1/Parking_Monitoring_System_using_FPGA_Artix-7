library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Seg_Display_Controller is
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
end Seg_Display_Controller;

architecture Behavioral of Seg_Display_Controller is
    -- Seven-segment encoding
    constant SEG_0 : STD_LOGIC_VECTOR(7 downto 0) := "11000000";  -- Display 0
    constant SEG_1 : STD_LOGIC_VECTOR(7 downto 0) := "11111001";  -- Display 1
    constant SEG_2 : STD_LOGIC_VECTOR(7 downto 0) := "10100100";  -- Display 2
    constant SEG_3 : STD_LOGIC_VECTOR(7 downto 0) := "10110000";  -- Display 3
    constant SEG_4 : STD_LOGIC_VECTOR(7 downto 0) := "10011001";  -- Display 4
    constant SEG_F : STD_LOGIC_VECTOR(7 downto 0) := "10001110";  -- Display F
    constant SEG_R : STD_LOGIC_VECTOR(7 downto 0) := "10101111";  -- Display R 
    constant SEG_E : STD_LOGIC_VECTOR(7 downto 0) := "10000110";  -- Display E
    constant SEG_NONE : STD_LOGIC_VECTOR(7 downto 0) := "11111111";  -- Display nothing
begin
    process(refresh_counter, digit0, digit1, digit2, digit3, digit4)
    begin
        case refresh_counter is
            when "000" =>
                an <= "11111110";  -- Activate first display
                case digit0 is
                    when "0000" => seg <= SEG_0;
                    when "0001" => seg <= SEG_1;
                    when others => seg <= SEG_NONE;
                end case;
            when "001" =>
                an <= "11111101";  -- Activate second display
                case digit1 is
                    when "0000" => seg <= SEG_0;
                    when "0001" => seg <= SEG_1;
                    when others => seg <= SEG_NONE;
                end case;
            when "010" =>
                an <= "11111011";  -- Activate third display
                case digit2 is
                    when "0000" => seg <= SEG_0;
                    when "0001" => seg <= SEG_1;
                    when others => seg <= SEG_NONE;
                end case;
            when "011" =>
                an <= "11110111";  -- Activate fourth display
                case digit3 is
                    when "0000" => seg <= SEG_0;
                    when "0001" => seg <= SEG_1;
                    when others => seg <= SEG_NONE;
                end case;
            when "100" =>
                an <= "11101111";  -- Activate fifth display
                case digit4 is
                    when "0000" => seg <= SEG_0;
                    when "0001" => seg <= SEG_1;
                    when "0010" => seg <= SEG_2;
                    when "0011" => seg <= SEG_3;
                    when "0100" => seg <= SEG_4;
                    when others => seg <= SEG_NONE;
                end case;
            when "101" =>
                an <= "11011111";  -- Activate sixth display
                seg <= SEG_E;  -- Display E
            when "110" =>
                an <= "10111111";  -- Activate seventh display
                seg <= SEG_R;  -- Display R
            when "111" =>
                an <= "01111111";  -- Activate eighth display
                seg <= SEG_F;  -- Display F
            when others =>
                an <= "11111111";  -- Deactivate all displays
                seg <= SEG_NONE;
        end case;
    end process;
end Behavioral;
