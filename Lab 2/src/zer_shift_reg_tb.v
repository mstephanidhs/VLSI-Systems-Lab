module zer_shift_reg_tb();
  parameter n = 4;
  parameter width = 1;

  localparam period = 2;

  function [n*width-1:0] newdin(input a);
  begin: name
      integer ii;
      for (ii=0; ii<n; ii=ii+1) begin
        newdin[ii*width+:width] = $random();
      end
  end
  endfunction

  reg clk=1;
  reg rstn;

  reg pl, en;
  reg [width-1:0] si;
  reg [n*width-1:0] din;
  reg [n*width-1:0] shift;
  wire [width-1:0] so;
  reg [width-1:0] expected;

  integer i,j, errors=0;


  shift_reg #(n) DUT (.clk(clk), .rstn(rstn), .pl(pl), .en(en), .si(si), .din(din), .so(so));

  always #(0.5*period) clk=~clk;

  initial begin
      //$monitor("%0t, %b %b %b %b %b %b", $time, shift, expected,  pl, en, si, so);
      rstn=0;
      din=0;
      pl=1'b0;
      en=1'b0;
      si=1'b0;
      #(0.5*period);
      rstn=1;
      #(0.5*period);
      for (j=0; j<100; j=j+1) begin
        din=newdin(1'b0);
        pl=1'b1;
        $display("%0t, pl: %0b  din:%b", $time, pl, din);
        for (i=0; i<n+4; i=i+1) begin
            #(period) pl=1'b0;
            din=newdin(1'b0);
            en=$random();
            si=$random();
            $display("%0t, en: %0b  si:%0b", $time, en, si);
        end
      end
      $display("Finished with %0d errors", errors);
      $finish;
  end

  always @ (posedge clk or negedge rstn) begin
    if (!rstn) begin
      expected <= {width{1'b0}};
    end
    else begin
      expected <= shift[width-1:0];
    end
  end

  always @ (posedge clk or negedge rstn) begin
    if (!rstn) begin
      shift <= {n*width{1'b0}};
    end
    else begin
      if (pl) shift<=din;
      else if (en) shift<={si,shift[n*width-1:width]};
    end
  end

  always @ (posedge clk) begin
    #(1)
    if (so !== expected) begin
      $display("%0t, Expected: %0d got %0d", $time, expected, so);
      errors=errors+1;
    end
  end

endmodule
  