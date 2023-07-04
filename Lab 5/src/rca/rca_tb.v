module rca_tb;
    parameter n = 8;
    parameter delay = 100;

    reg [n-1:0]   a,b;
    reg [n:0]     sum;
    reg check;
    wire [n:0]    out;
    integer i,j;
  
    rca #(.width(n)) DUT (
                        .a_i(a),
                        .b_i(b),
                        .sum_o(out)
                     );

    initial begin
        for (i=0; i<=255 ; i=i+1)begin
            a=i;
            for (j=0; j<=255 ; j=j+1) begin
                b=j;
                sum = a+b;
                #delay;
                if (out == sum) check=1'b1;
                else check=1'bX;
                #delay;                
            end
        end
    end



endmodule