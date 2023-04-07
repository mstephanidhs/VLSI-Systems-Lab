module shift_reg #(
    parameter size = 4
) (
    input clk,
    input rstn,
    input [size-1:0] din,
    input pl,
    input en,
    input si,
    output so
);

reg [size-1:0] data;
reg lsb_out;

assign so = lsb_out;


always @(posedge clk, negedge rstn ) begin
    if (pl) data <= din;
    if (en) {data,lsb_out} <= {si,data};
    if (!rstn) begin 
        data <=0; 
        lsb_out <= 0;
    end
end

    
endmodule