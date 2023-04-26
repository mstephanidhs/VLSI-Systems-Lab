module lockcomp #(
    parameter size = 16,
    parameter password = 16'b0
) (
    input reset, preset,
    input [size-1:0] in,
    output reg equal
);

reg [size-1:0] stored_number = password;


always @(in or stored_number) begin
    if (in == stored_number) equal = 1;
    else equal = 0;
end

always @(posedge preset) stored_number = in;
always @(posedge reset) stored_number = password;    
endmodule