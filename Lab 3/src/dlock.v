module dlock (
    input [3:0] SW16, // keyboard
    input SW1, //reset
    input SW2, //enter
    input SW3, //open check
    input rstn, //password reset
    input clk,
    output reg lock,
    output reg Error,
    output reg  [2:0] counter
);

reg comp_reset, comp_preset, locked;
wire equal;
reg [15:0] log;

reg [2:0] state, next;

parameter [2:0] 
DOOR_CLOSED = 3'b000, 
LOCK_UNLOCK = 3'b001, 
DOOR_OPEN = 3'b010, 
CHANGE_CODE = 3'b011, 
WRONG_CODE = 3'b100,
CHECK_PASSWORD = 3'b101;





lockcomp #(.password({4'b0011,4'b0011,4'b0011,4'b0011})) password_holder (
    .reset(comp_reset),
    .preset(comp_preset),
    .equal(equal),
    .in(log)
    );

always @(counter) if (counter>4) counter = 0;



always @(posedge clk or negedge rstn) begin

    if (!rstn) begin 
        state <= DOOR_OPEN;
        comp_reset <= 1;
        counter <= 0;
        locked <= 0;
    end

    else       state <= next;
end


always @(state, SW16, posedge SW1, posedge SW2, posedge SW3) begin
    next = state; lock = 0; Error = 0; comp_preset = 0; comp_reset = 0;

    case (state) 

    DOOR_CLOSED: begin
        
        if (SW2) begin
         log[counter*4 +:4] = SW16;
         counter = counter + 1;
        end    

        if (counter == 4) begin
            next = CHECK_PASSWORD;
        end    
    end

    CHECK_PASSWORD:begin
        counter = 0;
        if (equal == 1) next = LOCK_UNLOCK;
        else next = WRONG_CODE;
    end



    LOCK_UNLOCK: begin
        counter = 0;
        lock = 1;
        log = 16'bx;
        locked = ~locked;
        if(!SW3 && locked) next = DOOR_CLOSED;
        else if (!locked) next = DOOR_OPEN;
    end



    DOOR_OPEN: begin
        if (SW1 && !SW3) next = LOCK_UNLOCK;
        
        if (SW2) begin
            if(log[0 +: 12] == 12'b111100011111) begin
            counter = 0;
            next = CHANGE_CODE;
            end
        end

        if(!SW2 && (SW16 !== 4'bz))begin
         log[counter*4 +:4] = SW16;
         counter = counter + 1;
        end
    end



    CHANGE_CODE: begin

        if (SW2) begin
            if (
                SW16 == 4'b0001 ||  //*
                SW16 == 4'b0010 ||  //A
                SW16 == 4'b0110 ||  //B
                SW16 == 4'b0101 ||  //C
                SW16 == 4'b0100 ||  //D
                SW16 == 4'b1111 )   //#
                
                begin
                    next = WRONG_CODE;
                    counter = 0;
                end

                else begin 
                    if(SW16 !== 4'bz) begin
                        log[counter*4 +:4] = SW16;
                        counter = counter + 1;
                    end
                end
        end  

        if (counter == 4) begin
                        comp_preset = 1;
                        next = DOOR_OPEN;
                    end
    end



    WRONG_CODE: begin
        Error = 1;
        if(SW16 !== 4'bz) begin
            log[counter*4 +:4] = SW16;
            counter = counter + 1;
        end

        if(log == 16'b0101011001100010) begin  
            counter = 0;
            next = locked?DOOR_CLOSED:CHANGE_CODE;
        end
    end
    endcase
end





    
endmodule
