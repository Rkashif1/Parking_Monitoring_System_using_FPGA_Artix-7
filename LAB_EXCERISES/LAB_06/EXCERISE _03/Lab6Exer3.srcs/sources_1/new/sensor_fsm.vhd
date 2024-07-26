entity sensor_fsm is
    Port (
        clk : in bit;
        rst : in bit;
        ir_sensors : in bit_vector(3 downto 0);
        ultrasonic_trigger : in bit;
        segments : out bit_vector(6 downto 0);
        buzzer : out bit
    );
end sensor_fsm;

architecture Behavioral of sensor_fsm is
    type state_type is (IDLE, DETECT_IR, DETECT_ULTRASONIC);
    signal state, next_state : state_type;
    signal ir_value : integer range 0 to 15;

    component seg7_decoder
        Port (
            digit : in integer range 0 to 15;
            segments : out bit_vector(6 downto 0)
        );
    end component;
begin

    -- State transition process
    process(state, ir_sensors, ultrasonic_trigger)
    begin
        case state is
            when IDLE =>
                if ir_sensors /= "0000" then
                    next_state <= DETECT_IR;
                elsif ultrasonic_trigger = '1' then
                    next_state <= DETECT_ULTRASONIC;
                else
                    next_state <= IDLE;
                end if;
            when DETECT_IR =>
                next_state <= IDLE;
            when DETECT_ULTRASONIC =>
                next_state <= IDLE;
            when others =>
                next_state <= IDLE;
        end case;
    end process;

    -- State register process
    process(clk, rst)
    begin
        if rst = '1' then
            state <= IDLE;
        elsif clk'event and clk = '1' then
            state <= next_state;
        end if;
    end process;

    -- Output logic process
    process(state, ir_sensors, ultrasonic_trigger)
    begin
        ir_value <= conv_integer(ir_sensors);
        buzzer <= '0';

        case state is
            when IDLE =>
                -- Display "0" when idle
                ir_value <= 0;
            when DETECT_IR =>
                -- Display IR sensor value
                ir_value <= conv_integer(ir_sensors);
            when DETECT_ULTRASONIC =>
                -- Activate buzzer
                buzzer <= '1';
            when others =>
                -- Default state
                ir_value <= 0;
                buzzer <= '0';
        end case;
    end process;

    -- Instantiate the 7-segment decoder
    U1: seg7_decoder
        Port map (
            digit => ir_value,
            segments => segments
        );

end Behavioral;
