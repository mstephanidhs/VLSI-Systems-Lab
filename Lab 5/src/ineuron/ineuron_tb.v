`include "./src/ineuron/ineuron.v"

module ineuron_tb;

parameter nofActivations = 4;
parameter bitsofActivations = 4;
parameter bitsofweights = 4;
parameter bitsofbias = 4;

reg clk;
reg rstn;
reg signed [nofActivations*bitsofActivations-1:0] activations;
reg signed [nofActivations*bitsofweights-1:0] weights_in;
reg signed [bitsofbias-1:0] bias_in;
reg load_params;
wire [(bitsofweights+bitsofActivations) + $clog2(nofActivations) - 1:0] out;


integer f;


ineuron #(
    .m(nofActivations),
    .n(bitsofweights),
    .k(bitsofActivations),
    .b(bitsofbias)
)
DUT
(
    .rstn(rstn),
    .clk(clk),
    .activations(activations),
    .weights_in(weights_in),
    .bias_in(bias_in),
    .load_params(load_params),
    .out(out)
);


localparam CLK_PERIOD = 100;
always #(CLK_PERIOD/2) clk=~clk;

initial begin
    $dumpfile("./results/ineuron/ineuron.vcd");
    $dumpvars;
    f = $fopen("./results/ineuron/ineuron.txt","w");
    clk = 0;
end

initial begin
    rstn = 0;
    #10 rstn = 1 ;

    repeat(100)
    begin
        #20;
        load_params = 1;
        activations = $random;
        weights_in = $random;
        bias_in = $random;
        #80 load_params = 0;
        $fwrite(f,"%b %b %b %b \n", activations, weights_in, bias_in, out);
    end

    #1000 rstn = 1;

    $finish;
end

endmodule
