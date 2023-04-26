module lockcomp_tb;

parameter password = 16'b0;
parameter size = 16;

reg reset, preset;
reg [size-1:0] input_number;
wire equal;



reg [size-1:0] temp;

lockcomp #(.password(password)) dut (.reset(reset), .preset(preset), .in(input_number), .equal(equal));


initial begin
    
    $dumpfile("lockcomp.vcd");
    $dumpvars;

    preset = 0;
    reset = 0;

    input_number = 0;
    #1
    if (equal==1) $display("✅ Default password working.");
    else $display("❌ Default password working.");

    #5
    temp = $random;
    input_number = temp;
    preset = 1;
    #1 
    preset = 0;
    if (dut.stored_number==temp) $display("✅ Preset Working. (Number Stored)");
    else $display("❌ Preset Working. (Number Stored)");
   
    #5
    input_number = $random;
    #1
    if (equal==0) $display("✅ Wrong comparison Working.");
    else $display("❌ Wrong comparison Working.");
    
    #5
    input_number = temp;
    #1
    if (equal==1) $display("✅ Preset Working. (Number Used)");
    else $display("❌ Preset Working. (Number Used)");
   
    reset=1;
    #1
    reset=0;
    #1
    input_number=16'b0;
    #1
    if (equal==1) $display("✅ Reset Working. (Correct Comparison)");
    else $display("❌ Reset Working.");
   
    #5
    input_number = $random;
    #10
    if (equal==0) $display("✅ Reset Working. (Wrong Comparison)");
    else $display("❌ Reset Working. (Wrong Comparison)");
    #10


    $finish;
end

    
endmodule