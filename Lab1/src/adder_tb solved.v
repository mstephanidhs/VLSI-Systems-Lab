module adder_tb;
    parameter n = 8;
    parameter delay = 10;

    reg [n-1:0]   a,b;
    reg [n:0]     sum;
    reg check;
    wire [n:0]    out;
    integer i=0;
  
    rca #(.width(n)) DUT (
                        .a_i(a),
                        .b_i(b),
                        .sum_o(out)
                     );

    initial begin
        for (a=0; a<=255 ; a=a+1)
            for (b=0; b<=255 ; b=b+1)
                sum = a+b;
                if (out == sum) check=1'b1;
                else check=1'bX;
    end



endmodule