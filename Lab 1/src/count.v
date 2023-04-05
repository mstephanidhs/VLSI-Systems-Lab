module count #(
    parameter  c0_size = 3,
    parameter  c1_size = 16
)(
    input clock, reset, enable,
    output reg [c0_size-1:0] c0,
    output reg [c1_size-1:0] c1
);



always @(posedge clock or negedge reset) begin
    if (!reset) begin
        c0 = 0;
        c1 = 2;
    end
    else if (enable)
    begin
        c0 = c0 + 1;
        if (c0==0) 
            c1 = c1+1;
    end
end

endmodule