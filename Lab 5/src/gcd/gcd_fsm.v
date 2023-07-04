module gcd_fsm (
    input x_eq_y, x_gt_y, x_lt_y, clk, rst,
    output reg data_en, x_sel, y_sel, keep_x, keep_y, x_ld, y_ld, ready
);


parameter [2:0] 
START = 3'b000, 
LOAD = 3'b001, 
X_GT_Y = 3'b101, 
X_EQ_Y = 3'b111, 
X_LT_Y = 3'b011;


reg [2:0] state, next;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        state <= START;
        end
    else state <= next;
end

always @(x_eq_y or x_gt_y or x_lt_y or state) begin
    next = state; 

    case(state)
    
    START : begin
        next = LOAD;
    end
    
    LOAD : begin
        if (x_gt_y) next = X_GT_Y;
        else if (x_eq_y) next = X_EQ_Y;
        else if (x_lt_y) next = X_LT_Y;
    end

    X_GT_Y : begin
        next = LOAD;
    end

     X_EQ_Y : begin
        next = START;
    end

     X_LT_Y : begin
        next = LOAD;
    end
    
    endcase
end

always @(state) begin
    ready = 0; x_ld = 0; y_ld = 0; data_en = 0;
    case(state)
    
    START : begin
        x_sel = 1;
        y_sel = 1;
        keep_x = 0;
        keep_y = 0;
    end
    
    LOAD : begin
        x_ld = 1;
        y_ld = 1;
    end

    X_GT_Y : begin
        x_sel = 0;
        y_sel = 0;
        keep_x = 0;
        keep_y = 1;
    end

     X_EQ_Y : begin
        data_en = 1;
        ready = 1;
    end

     X_LT_Y : begin
        x_sel = 0;
        y_sel = 0;
        keep_x = 1;
        keep_y = 0;
    end
    endcase
end
    
endmodule