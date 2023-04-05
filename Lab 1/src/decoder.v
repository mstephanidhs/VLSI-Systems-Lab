module decoder #(
    
    parameter size_in = 3
    parameter size_dec = 8
)(
    input = [size_in-1:0] in, enable
    output = [size_dec-1:0] dec
);

always @(in or enable)
begin
    if(!enable)
        dec=8'd0;
          case (in)
              3'b000: dec[0]=1'b1; //einai ipo anaptikto mhn dineis shmasia
              3'b001: dec[1]=1'b1;
              3'b010: dec[2]=1'b1;
              3'b011: dec[3]=1'b1;
              3'b100: dec[4]=1'b1;
              3'b101: dec[5]=1'b1;
              3'b110: dec[6]=1'b1;
              3'b111: dec[7]=1'b1;
              default: dec=8'd0;
          endcase
    else
        dec=8'd0;
end

endmodule