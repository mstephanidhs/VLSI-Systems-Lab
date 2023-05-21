module gcd_fsm (
    input x_eq_y, x_gt_y, x_lt_y, clk, rst
    output reg data_en, x_sel, y_sel, keep_x, keep_y, x_ld, y_ld
);


parameter [2:0] 
START = 3'b000, 
LOAD = 3'b001, 
X_GT_Y = 3'b101, 
X_EQ_Y = 3'b111, 
X_LT_Y = 3'b011;


reg [2:0] state, next;

always @(posedge clk or posedge rst) begin
    if (rst) state <= START;
    else       state <= next;
end

always @(x_eq_y or x_gt_y or x_lt_y) begin
    next = state; x_ld = 0; y_ld = 0; data_en = 0;
    case(state)
    
    START : begin
        x_sel = 0;
        y_sel = 0;
        keep_x = 0;
        keep_y = 0;

        next = LOAD;
    end
    
    LOAD : begin
        x_ld = 1;
        y_ld = 1;

        if (x_gt_y) next = X_GT_Y;
        else if (x_eq_y) next = X_EQ_Y;
        else (x_lt_y) next = X_LT_Y;
    end

    X_GT_Y : begin
        x_sel = 0;
        y_sel = 0;
        keep_x = 0;
        keep_y = 1;

        next = LOAD;
    end

     X_EQ_Y : begin
        data_en = 1;
        next = START;
    end

     X_LT_Y : begin
        x_sel = 0;
        y_sel = 0;
        keep_x = 1;
        keep_y = 0;

        next = LOAD;
    end
    
    endcase


end
    
endmodule