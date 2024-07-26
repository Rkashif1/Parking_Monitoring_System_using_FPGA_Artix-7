entity UpDownCounter is
    Port (
        CLK      : in  bit;
        RESET    : in  bit;
        MODE     : in  bit;  -- '1' for Up, '0' for Down
        Q        : out bit_vector (2 downto 0)
    );
end UpDownCounter;

architecture Behavioral of UpDownCounter is
    type state_type is (S0, S1, S2, S3, S4, S5, S6, S7);
    signal state, next_state : state_type;
    signal count : bit_vector (2 downto 0);
begin

    -- State Register Process
    process (CLK, RESET)
    begin
        if RESET = '1' then
            state <= S0;
            count <= "000";
        elsif (CLK = '1' and CLK'event) then
            state <= next_state;
            if MODE = '1' then
                count <= std_logic_vector(unsigned(count) + 1);
            else
                count <= std_logic_vector(unsigned(count) - 1);
            end if;
        end if;
    end process;

    -- Next State Logic Process
    process (state, MODE)
    begin
        case state is
            when S0 => if MODE = '1' then next_state <= S1; else next_state <= S7; end if;
            when S1 => if MODE = '1' then next_state <= S2; else next_state <= S0; end if;
            when S2 => if MODE = '1' then next_state <= S3; else next_state <= S1; end if;
            when S3 => if MODE = '1' then next_state <= S4; else next_state <= S2; end if;
            when S4 => if MODE = '1' then next_state <= S5; else next_state <= S3; end if;
            when S5 => if MODE = '1' then next_state <= S6; else next_state <= S4; end if;
            when S6 => if MODE = '1' then next_state <= S7; else next_state <= S5; end if;
            when S7 => if MODE = '1' then next_state <= S0; else next_state <= S6; end if;
            when others => next_state <= S0;
        end case;
    end process;

    -- Output Logic Process
    process (state)
    begin
        case state is
            when S0 => Q <= "000";
            when S1 => Q <= "001";
            when S2 => Q <= "010";
            when S3 => Q <= "011";
            when S4 => Q <= "100";
            when S5 => Q <= "101";
            when S6 => Q <= "110";
            when S7 => Q <= "111";
            when others => Q <= "000";
        end case;
    end process;

end Behavioral;
