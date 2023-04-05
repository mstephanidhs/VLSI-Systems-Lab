module zer_decoder_tb();
  parameter width = 4;
  parameter outwidth = 2**width;
  parameter delay = 1;

  reg   en;
  reg	[width-1:0] enc;
  wire	[outwidth-1:0] dec;
  integer i,errors=0;
  integer expected;

  generate
    if (width==3) decoder #(.size(width)) DUT (.en(en), .enc(enc), .dec(dec));
    else decoder #(.size(width)) DUT (.en(en), .enc(enc), .dec(dec));
  endgenerate
  


  initial begin
    for (i=0;i<2**(width+1);i=i+1)
    begin
        {en,enc}=i;
        #(delay)
        expected=(1-en)*(2**enc);
        $display("%5t | Testing: en=%d enc=%2d | Got dec=%b", $time, en, enc,dec);
        if (dec !== expected) begin
            $display("%0t error in en=%d enc=%0d", $time, en, enc);
            errors=errors+1;
        end
    end
    $display("Finished with %0d errors", errors);
  end

 

endmodule
  