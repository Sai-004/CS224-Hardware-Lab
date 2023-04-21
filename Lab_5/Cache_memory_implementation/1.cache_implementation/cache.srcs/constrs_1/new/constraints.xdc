set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports clk]
create_clock -period 10.000 -waveform {0.000 5.000} [get_ports clk]

set_property IOSTANDARD LVCMOS33 [get_ports hit]
set_property IOSTANDARD LVCMOS33 [get_ports rx_pin]
set_property PACKAGE_PIN C4 [get_ports rx_pin]
set_property PACKAGE_PIN V11 [get_ports hit]

