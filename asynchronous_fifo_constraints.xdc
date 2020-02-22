

create_clock -period 10.000 -name wr_clk [get_ports wr_clk]
create_clock -period 20.000 -name rd_clk [get_ports rd_clk]
set_clock_groups -asynchronous -group wr_clk -group rd_clk

set_input_delay -clock wr_clk 3.000 [all_inputs]
set_input_delay -clock wr_clk -min 2.000 [all_inputs]

set_output_delay -clock rd_clk 0.500 [all_outputs]
set_output_delay -clock rd_clk -min 0.200 [all_outputs]
