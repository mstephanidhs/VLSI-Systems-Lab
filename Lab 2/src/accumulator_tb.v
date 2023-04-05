module accumulator_tb #(
    parameter m=4,
    parameter n=2,
    parameter k=4
)
    
reg clock, reset, parallel_load;
reg [(m+n)*k-1:0] input_data;
wire ready;
wire [m+n+k-2:0] output_sum;


accumulator #(.m(m), .n(n), .k(k)) my_accumulator (
    .din(input_data),
    .pl(parallel_load),
    .clk(clock),
    .rstn(reset),
    .ready(ready),
    .sum(output_sum)
);


initial begin
    clock = 0;
    reset = 0;
    parallel_load = 0;
    #1 reset = 1;
    #1 reset = 0;
    #1 reset = 0;
end

always #5 clock = ~clock;

initial begin
    #9;
    input_data = $random;
    parallel_load = 1;
    
end






endmodule