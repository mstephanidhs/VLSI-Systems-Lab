module dlock_tb;


reg [3:0] keyboard;
reg reset, open, enter, rstn, clk;

wire lock, Error;
wire [2:0] counter;


parameter [3:0]
in_1 = 4'b1101,
in_2 = 4'b1110,
in_3 = 4'b1000,
in_4 = 4'b0111,
in_5 = 4'b1010,
in_6 = 4'b000,
in_7 = 4'b1011,
in_8 = 4'b1001,
in_9 = 4'b0011,
in_A = 4'b0010,
in_B = 4'b0110,
in_C = 4'b0101,
in_D = 4'b0100,
in_star = 4'b0001,
in_hash = 4'b1111;


dlock dut(
    .SW16(keyboard),
    .SW1(reset),
    .SW2(enter),
    .SW3(open),
    .rstn(rstn),
    .clk(clk),
    .lock(lock),
    .Error(Error),
    .counter(counter)
);

always #5 clk=~clk;

initial begin
    $dumpfile("dlock.vcd");
    $dumpvars;

    clk = 0;
    open = 1;
    reset = 0;
    enter = 0;
    rstn = 1;
    #1 rstn = 0;
    #1 rstn = 1;


    //Checking if the door locks
    #10

    #5 reset = 1;
    #10 reset = 0;
    if (!dut.locked) $display("✅ Door refused to lock (door open).");
    else $display("❌ Door refused to lock (door open).");

    open = 0;

    #5 reset = 1;
    #10 reset = 0;
    if (dut.locked) $display("✅ Door Locked.");
    else $display("❌ Door Locked.");


    //Checking default password
    #1 keyboard = in_9;
    #15 enter = 1;
    #5 enter = 0;
    
    #15 enter = 1;
    #5 enter = 0;

    #15 enter = 1;
    #5 enter = 0;

    #15 enter = 1;
    #5 enter = 0;
    if (!dut.locked) $display("✅ Door Unlocked with default password.");
    else $display("❌ Door Unlocked with default password.");

    //Checking 



    #100

$finish;

    
end




endmodule