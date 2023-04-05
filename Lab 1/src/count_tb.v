module count_tb;
    parameter  counter_c0 = 3;
    parameter  counter_c1 = 16;

    reg clk, rstn, count;
    wire [counter_c0-1:0] out;
    wire [counter_c1-1:0] out_2;

count #(.c0_size(counter_c0), .c1_size(counter_c1)) test_count(
    .clock(clk),
    .reset(rstn),
    .enable(count),
    .c0(out),
    .c1(out_2)
);

always #5 clk = ~clk;  

initial begin
        clk <= 0;
        rstn <= 1;
        count <= 1;   
        #2 rstn <= 0;
        #4 rstn <= 1;


        #80 count <= 0;

        #90 count <= 1;
        $finish;
    end


endmodule