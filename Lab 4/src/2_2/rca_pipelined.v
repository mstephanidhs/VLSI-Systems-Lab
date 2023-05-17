module rca_pipelined
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
    reg [6:0] pipeline;
    wire [width:0] sum;
    wire [width/2:0] temp_sum;

    irca #(.width(width/2)) first_stage (.a_i(a[1:0]), .b_i(b[1:0]), .c_i(0), .sum_o(temp_sum));

    irca #(.width(width/2)) second_stage (.a_i(pipeline[6:5]), .b_i(pipeline[4:3]), .c_i(pipeline[2]), .sum_o(sum[4:2]));

    assign sum[1:0] = pipeline[1:0];


    always @(posedge clk, negedge rstn) begin
        if (!rstn) begin
            a <= 0;
            b <= 0;
            pipeline <=0;
            data_out <=0;
        end
        else begin
            a <= data_ina;
            b <= data_inb;
            data_out <= sum;
            pipeline <= {a[3:2],b[3:2],temp_sum};
        end
    end


endmodule