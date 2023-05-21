module gcd_tb 

parameter word = 8;

reg [word-1:0] x_i, y_i;

reg clk, rst;

wire [word-1:0] data_o;

gcd #(.word(word)) dut (.x_i(x_i), .y_i(y_i), .clk(clk), .rst(rst), data_o());


always #5 clk = ~clk;

initial begin
    $dumpfile("results_gcd/gcd.vcd");
    $dumpvars;

    clk = 0;
    rst = 0;
    #1 rst = 1;
    #1 rst =0;

    x_i = 4;
    y_i = 16;
end

endmodule