module shift_reg_tb #(
    parameter reg_size = 4
);

reg clock, reset, serial_input, parallel_load, enable;
wire serial_output;
reg [reg_size-1:0] data_in;
integer check = 1;
integer i;
integer temp;

shift_reg #(.size(reg_size)) myshiftreg (
    .clk(clock), 
    .rstn(reset), 
    .si(serial_input), 
    .pl(parallel_load), 
    .en(enable), 
    .so(serial_output), 
    .din(data_in)
    );

initial begin
    clock = 0;
    reset = 1;
    enable=0;
    parallel_load=0;
    data_in=0;
    serial_input=0;

    #1 reset = 0;
    #1 reset = 1;
    $display("Time=%t, Input=%b, Data_reg=%b", $time, data_in, myshiftreg.data);

end

always #5 clock = ~clock;


initial begin
    // Checking Parallel Load
    #3;
    for (i=0; i<10; i=i+1) begin
        data_in = $random;
        parallel_load = 1;
        #10;
        if (data_in != myshiftreg.data) check = 0;

        $display("Time=%t, Input=%b, Data_reg=%b", $time, data_in, myshiftreg.data);
        parallel_load = 0;
    end
    if (!check) begin
        $display("❌ Error in simulation: Parallel Load is not working");
        $finish;
    end
    else $display("✅ Parallel Load is working");

    // Checking Serial Load
    for (i=0; i<10; i=i+1) begin
        temp = myshiftreg.data;
        serial_input = $random;
        enable=1;
        #10;
        $display("Time=%t, Input=%b, Data_reg=%b, Serial_out=%b", $time, serial_input, myshiftreg.data, serial_output);
        enable=0;


        if (!(myshiftreg.data =={serial_input,temp[reg_size-1:1]} && serial_output == temp[0])) check=0;
    end
    if (!check) begin
        $display("❌ Error in simulation: Serial Load is not working");
        $finish;
    end
    else $display("✅ Serial Load is working");
    $finish;
end 
endmodule