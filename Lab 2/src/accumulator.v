module accumulator #(
    parameter m=4,
    parameter n=2,
    parameter k=4
) (
    input [(m+n)*k-1:0] din,
    input pl, clk, rstn,
    output ready,
    output reg [m+n+(k-1)-1:0] sum
);

reg shift_enable;
reg load_enable;
reg counter;
wire [m+n-1:0] sreg_sum_connect;
wire [k-1:0] sreg_din_bus[m+n-1:0];

assign load_enable = pl & ready;
assign shift_enable = ~ready;

integer p,q;

for(p=0; p<m+n ; p = p+1 ) begin
    for (q=0; q<k-1 ; q=q+1) begin

        assign sreg_din_bus[p][q] = din[q*(m+n)+p]
    end
end


genvar i,j;

generate
    for (i=0; i<m+n-1; i=i+1) begin : reg_file
        shift_reg #(.size(k-1)) sr(
            .clk(clk),
            .rstn(rstn), 
            .din(sreg_din_bus[i]),
            .pl(load_enable), 
            .en(shift_enable), 
            .si(din[i]), 
            .so(sreg_sum_connect[i]))  
    end 
endgenerate


always @(posedge clk, negedge rstn) begin

    if (!rstn){
        for (i=0; i<m+n-1; i=i+1) reg_file[i].shift_reg = 0;
        ready <= 1;
        counter <= 0;
        shift_enable <= 0;
    }
end

always @(posedge clk) begin
if (ready) begin
    counter <= 0;
    if(pl) begin
        ready <= 0;
        sum <= din[(m+n)*k-1:(m+n)*(k-1)-2];
    end 
end
else begin
    counter <= counter+1;
    sum <= sum + sreg_sum_connect;
    if (counter == k) ready <=1;
end
end

endmodule