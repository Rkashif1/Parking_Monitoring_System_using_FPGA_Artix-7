


# IR Sensor Inputs
set_property PACKAGE_PIN E6 [get_ports ir_sensor0]
set_property IOSTANDARD LVCMOS33 [get_ports ir_sensor0]

set_property PACKAGE_PIN G6 [get_ports ir_sensor1]
set_property IOSTANDARD LVCMOS33 [get_ports ir_sensor1]

set_property PACKAGE_PIN G3 [get_ports ir_sensor2]
set_property IOSTANDARD LVCMOS33 [get_ports ir_sensor2]

set_property PACKAGE_PIN F3 [get_ports ir_sensor3]
set_property IOSTANDARD LVCMOS33 [get_ports ir_sensor3]

# Seven-segment anode control
set_property PACKAGE_PIN J17 [get_ports {an[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]

set_property PACKAGE_PIN J18 [get_ports {an[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]

set_property PACKAGE_PIN T9 [get_ports {an[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]

# Set the remaining anode pins to inactive (not used)
set_property PACKAGE_PIN J14 [get_ports {an[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]

set_property PACKAGE_PIN P14 [get_ports {an[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[4]}]

set_property PACKAGE_PIN T14 [get_ports {an[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[5]}]

set_property PACKAGE_PIN K2 [get_ports {an[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[6]}]

set_property PACKAGE_PIN U13 [get_ports {an[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[7]}]

# Seven-segment cathode control
set_property PACKAGE_PIN T10 [get_ports {seg[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[0]}]

set_property PACKAGE_PIN R10 [get_ports {seg[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[1]}]

set_property PACKAGE_PIN K16 [get_ports {seg[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[2]}]

set_property PACKAGE_PIN K13 [get_ports {seg[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[3]}]

set_property PACKAGE_PIN P15 [get_ports {seg[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[4]}]

set_property PACKAGE_PIN T11 [get_ports {seg[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[5]}]

set_property PACKAGE_PIN L18 [get_ports {seg[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[6]}]

set_property PACKAGE_PIN H15 [get_ports {seg[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[7]}]

# Clock Input

set_property PACKAGE_PIN E3 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

# Leds


set_property PACKAGE_PIN H17 [get_ports led0]
set_property PACKAGE_PIN K15 [get_ports led1]
set_property PACKAGE_PIN J13 [get_ports led2]
set_property PACKAGE_PIN N14 [get_ports led3]
set_property IOSTANDARD LVCMOS33 [get_ports led0]
set_property IOSTANDARD LVCMOS33 [get_ports led1]
set_property IOSTANDARD LVCMOS33 [get_ports led2]
set_property IOSTANDARD LVCMOS33 [get_ports led3]

# Buzzer


set_property IOSTANDARD LVCMOS33 [get_ports buzzer]
set_property IOSTANDARD LVCMOS33 [get_ports echo]
set_property IOSTANDARD LVCMOS33 [get_ports trig]
set_property PACKAGE_PIN D14 [get_ports echo]
set_property PACKAGE_PIN F16 [get_ports trig]
set_property PACKAGE_PIN G16 [get_ports buzzer]
