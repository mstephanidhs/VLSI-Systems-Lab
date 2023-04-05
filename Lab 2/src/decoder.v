module decoder #(
    parameter size = 3
)(
    input wire [size-1:0] enc, 
    input en,
    output reg [2**size-1:0] dec
);

    always @(*) begin
        if(!en) begin
            dec = 0;
            dec[enc] = 1;
        end  
        else begin
            dec = 0;
        end
    end
endmodule
