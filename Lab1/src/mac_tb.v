module mac_tb;
    parameter input_width = 4;
    parameter sum_width = 10;
    parameter fileout = "mac_tb_result.txt";

    reg [input_width-1:0] a,b;
    wire [sum_width-1:0] sum;
    reg clock, reset;
    integer f;

    mac #(.iwidth(input_width), .swidth(sum_width)) testmac (
        .a_i(a),
        .b_i(b),
        .sum_o(sum),
        .clk(clock),
        .rstn(reset)
    );



    initial begin
        clock = 0;
        reset = 1;
        #2 reset = 0;
        #2 reset = 1;
    end


    always #5 clock = ~clock;

    initial begin 
        f = $fopen(fileout, "w");
        repeat(20) begin
            a = $random;
            b = $random;
            #10;
        end 
        $finish;    
    end

    initial begin
        #6
        repeat(20) begin 
            $fwrite(f,"%d %d %d\n", a, b, sum );
            #10;
        end
    end
endmodule