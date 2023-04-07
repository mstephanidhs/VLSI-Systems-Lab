module accumulator_tb #(
    parameter m=4,
    parameter n=2,
    parameter k=4
);
    
reg clock, reset, parallel_load;
reg [(m+n)*k-1:0] input_data;
wire ready;
wire [m+n+k-2:0] output_sum;

reg [(m+n)*k-1:0] temp;
integer i, j, error, expected, pll;



accumulator #(.m(m), .n(n), .k(k)) my_accumulator (
    .din(input_data),
    .pl(parallel_load),
    .clk(clock),
    .rstn(reset),
    .ready(ready),
    .sum(output_sum)
);


initial begin
    error = 0;
    clock = 0;
    reset = 0;
    parallel_load = 0;
    reset = 0;
    #1 reset = 1;
end

always #5 clock = ~clock;

initial begin
    #3;
    for (i=0;i<1000;i=i+1) begin
        for (pll=1; pll>=0; pll = pll-1) begin
            parallel_load = pll;
            expected = 0;

            if (parallel_load) begin
                temp = $random;
                input_data = temp;
                #10 input_data = $random;
            end
            else begin
                temp = output_sum;
                input_data = $random;
            end


            while(!ready) #1;


            if (parallel_load) for (j=1;j<=k;j=j+1) expected = expected + temp[(m+n)*j-1-:(m+n)];
            else #10 expected = temp; 
            
            if (output_sum != expected ) error = error+1;

            if (error) begin
                $display("❌ Error in simulation");
                $finish;
            end
            else $display("---------------------------------------\n|✅ Accumulator working correctly \n|\t Time : %t \n|\t din : %b \n|\t sum : %b \n|\t pl  : %b\n---------------------------------------\n",$time, pll?temp:input_data, output_sum, parallel_load);
        end
    end
    $finish;
end





endmodule