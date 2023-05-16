module rca_w_regs
#(
    parameter width = 4
)
(
    input clk,rstn,
    input wire [width-1:0] data_ina,
    input wire [width-1:0] data_inb,
    output reg [width:0] data_out
);

    reg [width-1:0] a,b;
    wire [width:0] sum;

    rca #(.width(width)) adder (.a_i(a), .b_i(b), .sum_o(sum));


    always @(posedge clk, negedge rstn) begin
        if (!rstn) begin
            a <= 0;
            b <= 0;
            data_out <=0;
        end
        else begin
            a <= data_ina;
            b <= data_inb;
            data_out <= sum;
        end
    end


endmodule