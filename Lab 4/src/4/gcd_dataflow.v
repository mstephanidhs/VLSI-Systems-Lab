module gcd_dataflow #(
    parameter word = 8
) (
    input [word-1:0] x_i, y_i,
    input x_sel, y_sel, keep_x, keep_y, y_ld, x_ld, data_en,
    output reg [word-1:0] data_o,
    output x_eq_y, x_gt_y, x_lt_y
);


reg [word-1:0] x_reg, y_reg;

wire [word-1:0] x_sub, y_sub;

assign x_eq_y = x_reg == y_reg;
assign x_gt_y = x_reg > y_reg;
assign x_lt_y = x_reg < y_reg; 

assign x_sub = x_reg - y_reg;

assign y_sub = y_reg - x_reg;

always @(posedge x_ld) begin
    x_reg = x_sel? x_i : keep_x? x_reg : x_sub;
end

always @(posedge y_ld) begin
    y_reg = y_sel? y_i : keep_y? y_reg : y_sub;
end

always @(posedge data_en) data_o = x_reg;
    
endmodule