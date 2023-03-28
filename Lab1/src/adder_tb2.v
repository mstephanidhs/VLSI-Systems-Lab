module adder_tb2;
    parameter n = 8;
    parameter delay = 10;
    parameter fileout= "file1.txt";

    reg [n-1:0]   a,b;
    reg [n:0]     sum;
    reg check;
    wire [n:0]    out;
    integer f;
  
    rca #(.width(n)) DUT (
                        .a_i(a),
                        .b_i(b),
                        .sum_o(out)
                     );

    initial begin
        f = $fopen(fileout, "w");
        repeat(10) begin
             a = $random % (2<<n);
             b = $random % (2<<n);
             #(delay) ;
            $fwrite(f,"%d %d %d\n", a, b, out );
        end
        $finish;
    end
 
endmodule
