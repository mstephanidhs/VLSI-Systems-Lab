module zer_accumulator_tb();
  parameter m = 4;
  parameter n = 4;
  parameter k = 10;
  localparam width = m+n;
  localparam swidth = $clog2(k*(2**(m+n)-1));
  localparam cwidth = $clog2(k);

  localparam period = 2;

  function [k*width-1:0] newdin(input a);
  begin: name
      integer ii;
      for (ii=0; ii<k; ii=ii+1) begin
        newdin[ii*width+:width] = $random();
      end
  end
  endfunction

  reg clk=1;
  reg rstn;

  reg pl;
  reg [k*width-1:0] din;
  wire [swidth-1:0] sum;
  wire ready;
  reg [swidth-1:0] expected;

  integer i,j, errors=0;


  accumulator #(.m(m), .n(n), .k(k)) DUT (.clk(clk), .rstn(rstn), .pl(pl), .din(din), .ready(ready), .sum(sum));

  always #(0.5*period) clk=~clk;

  initial begin
      //$monitor("%0t, %d %0d %0d %0d %0d %0d %d", $time, DUT.mypl, DUT.done, DUT.counter_reg, DUT.addend, DUT.newsum, ready, sum);
      rstn=0;
      din=0;
      pl=1'b0;
      #(0.5*period);
      rstn=1;
      #(1.5*period);

      for (i=0; i<100; i=i+1) begin
        din=newdin(1'b0);
        expected=0;
        pl=1'b1;
        $display("%0t, pl: %0b  din:%b", $time, pl, din);
        for (j=0;j<k;j=j+1) begin
          expected = expected + din[j*width+:width];
          //$display("%d %d",expected, din[j*width+:width]);
        end
        #(period);
        while (ready != 1)  #(period) din=newdin(1'b0);
        if (sum !== expected) begin
          $display("%0t, Expected: %0d got %0d", $time, expected, sum);
          errors=errors+1;
        end
        pl=1'b0;
        for (j=0;j<$random()%3;j=j+1) #( period );        
      end
      $display("Finished with %0d errors", errors);
      $finish;
  end

  always @ (posedge clk) begin

  end


endmodule
  