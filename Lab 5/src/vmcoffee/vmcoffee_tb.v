module vmcoffee_tb;

reg C5, C10, NFC, BEANS, clk, rstn ;
wire ERROR, COFFEE;
reg [4:0] WATER ;

vmcoffee DUT (
    .C5(C5), 
    .C10(C10), 
    .NFC(NFC), 
    .BEANS(BEANS), 
    .rstn(rstn), 
    .clk(clk), 
    .ERROR(ERROR), 
    .COFFEE(COFFEE), 
    .WATER(WATER)); 

always #5 clk = ~clk;

initial begin
    $dumpfile("vmcoffee.vcd");
    $dumpvars;

    WATER = 2;
    BEANS = 1;
    C5 = 0 ; 
    C10 = 0;
    NFC = 1;




    clk = 0;
    rstn = 0;
    #1 rstn = 1;
    //if(dut.state==0) $display("✅ Reset Signal Working.");
    //else $display("❌ Reset Signal Working.");

    #1 NFC = 0;
    #4 NFC = 1;
    
    if (COFFEE == 1) $display("✅ NFC Payment Working.");
    else $display("❌ NFC Payment Working.");

    WATER = 1;

    #20 if (ERROR == 0) $display("✅ Water Sensor Working : No water.");
    else $display("❌ Water Sensor Working : No water.");

    #1 WATER = 30;

    #10 if (ERROR == 1) $display("✅ Water Sensor Working : Water Full.");
    else $display("❌ Water Sensor Working : Water Full.");

    #1 C5 = 1;
    #10 C5 = 0;

    #5 C5 = 1;
    #5 C5 = 0;

    #1 if (COFFEE == 1) $display("✅ Coin Payment Working. (5 + 5)");
    else $display("❌ Coin Payment Working.");

    #10 BEANS = 0;

    #20 if (ERROR == 0) $display("✅ Bean Sensor Working : Out of beans.");
    else $display("❌ Bean Sensor Working : Out of beans.");

    #100 BEANS = 1;
    #10 if (ERROR == 1) $display("✅ Bean Sensor Working : Beans Full.");
    else $display("❌ Bean Sensor Working : Beans Full.");


    C5 = 1;
    #2 C5 = 0;
    #1 C10 = 1;
    #5 C10 = 0;

    if (COFFEE == 1) $display("✅ Coin Payment Working. (5 + 10)");
    else $display("❌ Coin Payment Working.");

    #15 C10 = 1;
    #5 C10 = 0;

    if (COFFEE == 1) $display("✅ Coin Payment Working. (only 10)");
    else $display("❌ Coin Payment Working.");


    #25 $finish;
end



    
endmodule