module gcd_tb;

parameter word = 8;

reg [word-1:0] x_i, y_i;

reg clk, rst;

wire [word-1:0] data_o;
wire ready;

gcd #(.word(word)) dut (.x_i(x_i), .y_i(y_i), .clk(clk), .rst(rst), .data_o(data_o), .ready(ready));

integer i,j,f;

always #5 clk = ~clk;

initial begin
    $dumpfile("results_gcd/gcd.vcd");
    $dumpvars;
    f = $fopen("results_gcd/gcd_results.txt","w");

    clk = 0;
    rst = 0;
    

    for ( i=1 ; i < 2**word ; i = i+1 ) begin
        for (j=1 ; j < 2**word ; j = j+1 ) begin

            #1 rst = 1;
            #1 rst = 0;
            #1;
            x_i = i;
            y_i = j;

            while (!ready) #1;
            $fwrite(f,"%d %d %d \n", x_i, y_i, data_o);
        end
    end

    $finish;
end

endmodule