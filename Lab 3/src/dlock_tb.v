module dlock_tb;


reg [3:0] keyboard;
reg reset, open, enter, rstn, clk;

wire lock, Error;
wire [2:0] counter;


parameter [3:0]
in_0 = 4'b1100,
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
    keyboard = 4'bz;
    #1 rstn = 0;
    #1 rstn = 1;
    #10;

    //Checking if the door locks
    

    #5 reset = 1;
    #10 reset = 0;
    if (!lock) $display("✅ Door refused to lock (door open).");
    else $display("❌ Door refused to lock (door open).");

    open = 0;

    #5 reset = 1;
    #5 reset = 0;
    if (lock) $display("✅ Door Locked.");
    else $display("❌ Door Locked.");

    #40;

    //Checking default password
    keyboard = in_9;
    #5 enter = 1;
    #5 enter = 0;
    
    #15 enter = 1;
    #5 enter = 0;

    #15 enter = 1;
    #5 enter = 0;

    #15 enter = 1;
    #5 enter = 0;
    #1 keyboard = 4'bz;

    #10 if (lock) $display("✅ Door Unlocked with default password.");
    else $display("❌ Door Unlocked with default password.");

    #40;

    //Checking changing password
    #10 keyboard = in_hash;
    #5 keyboard = 4'bz;
    #10 keyboard = in_star;
    #5 keyboard = 4'bz;
    #10 keyboard = in_hash;
    #10 keyboard = 4'bz;
    #10 enter = 1;
    #5 enter = 0;


    #5 keyboard = in_1;
    #5 enter = 1;
    #1 enter = 0;

    #5 keyboard = in_0;
    #5 enter = 1;
    #1 enter = 0;

    #5 keyboard = in_0;
    #5 enter = 1;
    #1 enter = 0;

    #5 keyboard = in_4;
    #5 enter = 1;
    #1 enter = 0;
    #5 keyboard = 4'bz;
    
    if (dut.password_holder.stored_number == {in_4,in_0,in_0,in_1}) $display("✅ Password Changed.");
    else $display("❌ Password Changed.");
    #40;


    // Checking Wrong Password

    #10 reset = 1;
    #5 reset = 0;

    #15 keyboard = in_5;
    #5 enter = 1;
    #1 enter = 0;

    #5 keyboard = in_7;
    #5 enter = 1;
    #1 enter = 0;

    #5 keyboard = in_9;
    #5 enter = 1;
    #1 enter = 0;

    #5 keyboard = in_1;
    #5 enter = 1;
    #5 enter = 0;
    keyboard = 4'bz;

    #20
    if (Error) $display("✅ Wrong Password.");
    else $display("❌ Wrong Password.");


    #40;
    //Checking ABBC -> locked door
    #10 keyboard = in_A;
    #5 keyboard = 4'bz;
    #10 keyboard = in_B;
    #5 keyboard = 4'bz;
    #10 keyboard = in_B;
    #5 keyboard = 4'bz;
    #10 keyboard = in_C;

    #10
    if (!Error) $display("✅ Operation retrieved using ABBC. Retrying Password");
    else $display("❌ Operation retrieved using ABBC. Retrying Password");

    #40;
    
    
    //Checking new password 

    #5 keyboard = in_1;
    #5 enter = 1;
    #1 enter = 0;

    #5 keyboard = in_0;
    #5 enter = 1;
    #1 enter = 0;

    #5 keyboard = in_0;
    #5 enter = 1;
    #1 enter = 0;

    #5 keyboard = in_4;
    #5 enter = 1;
    #5 enter = 0;
    #1 keyboard = 4'bz;
    #10;
    
    if (lock) $display("✅ New password unlocks the lock.");
    else $display("❌ New password unlocks the lock.");

    #40;


    // Checking non decimals in new password
    #10 keyboard = in_hash;
    #5 keyboard = 4'bz;
    #10 keyboard = in_star;
    #5 keyboard = 4'bz;
    #10 keyboard = in_hash;
    #10 keyboard = 4'bz;
    #10 enter = 1;
    #5 enter = 0;

    #10 keyboard = in_A;
    #5 enter = 1;
    #5 enter = 0;

    #10
    if (Error) $display("✅ Decimals not accepted.");
    else $display("❌ Decimals not accepted.");
    #40;


    // Checking ABBC -> unlocked door
    #10 keyboard = in_A;
    #5 keyboard = 4'bz;
    #10 keyboard = in_B;
    #5 keyboard = 4'bz;
    #10 keyboard = in_B;
    #5 keyboard = 4'bz;
    #10 keyboard = in_C;
    #20
    if (!Error) $display("✅ Operation retrieved using ABBC. Password didn't change");
    else $display("❌ Operation retrieved using ABBC. Password didn't change");

    




    #100
    $finish;  


end




endmodule