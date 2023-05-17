module accumulator #(
  parameter m = 4,
  parameter n = 4,
  parameter k = 4,
  parameter width = m+n,
  parameter swidth = $clog2(k*(2**(m+n)-1)),
  parameter cwidth = $clog2(k)
)(
  input clk, rstn,
  input pl,
  input [k*width-1:0] din,
  output [swidth-1:0] sum,
  output ready
);
  reg ready_reg;
  reg [swidth-1:0] sum_reg;
  reg [cwidth-1:0] counter_reg;
  wire [swidth-1:0] newsum;
  wire [width-1:0] addend;
  wire mypl;

  sreg #(k-1, width) summands (.clk(clk), .rstn(rstn), .pl(mypl), .en(1'b1), .si({width{1'b0}}), .din(din[k*width-1:width]), .so(addend));


  assign mypl = pl & ready_reg;
  assign done = (counter_reg == 1);
  
  always @ (posedge clk or negedge rstn) begin
    if (!rstn) begin
      ready_reg <= 1'b1;
    end
    else begin
      if (done) ready_reg <= 1'b1;
      else if (mypl) ready_reg <= 1'b0;
    end
  end

  always @ (posedge clk or negedge rstn) begin
    if (!rstn) begin
      sum_reg <= {swidth{1'b0}};
    end
    else begin
      if (mypl) begin
        //sum_reg <= {swidth{1'b0}};
        sum_reg <=din[width-1:0];
      end
      else begin
        sum_reg <= newsum;
      end
    end
  end

  always @ (posedge clk or negedge rstn) begin
    if (!rstn) begin
      counter_reg <= k;
    end
    else begin
      if (mypl) begin
        //counter_reg <= {swidth{1'b0}};
        counter_reg <=k;
      end
      else begin
        if (counter_reg != 0) counter_reg <= counter_reg-1;
      end
    end
  end

  assign newsum = addend + sum_reg;
  assign sum = sum_reg;
  assign ready = ready_reg;

endmodule
