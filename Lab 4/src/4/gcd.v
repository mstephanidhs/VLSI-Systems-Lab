module gcd #(
    parameter word = 8
) (
    input [word-1:0] x_i,
    input [word-1:0] y_i,
    input clk,
    input rst,
    output [word-1:0] data_o
);

wire x_eq_y, x_gt_y, x_lt_y;
wire data_en, x_ld, y_ld;
wire x_sel, y_sel, keep_x, keep_y;


gcd_fsm dut1 (.x_eq_y(x_eq_y), 
.x_gt_y(x_gt_y), 
.x_lt_y(), 
.clk(clk), 
.rst(rst),
.data_en(),
.x_sel(x_sel),
.y_sel(y_sel),
.keep_x(keep_x),
.keep_y(keep_y),
.x_ld(x_ld),
.y_ld(y_ld));

gcd_dataflow dut2 (.x_i(x_i), 
.y_i(y_i), 
.x_sel(x_sel), 
.y_sel(y_sel), 
.keep_x(keep_x), 
.keep_y(keep_y), 
.y_ld(x_ld), 
.x_ld(y_ld), 
.data_en(), 
.data_o(data_o),
.x_eq_y(x_eq_y),
.x_gt_y(x_gt_y),
.x_lt_y(x_lt_y));

    
endmodule