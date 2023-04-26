module vmcoffee (
    input C5, C10, NFC, BEANS, rstn, clk,
    input [4:0] WATER,
    output reg COFFEE, ERROR
);

parameter [1:0] IDLE = 2'b00, INSERTED5 = 2'b01, PAID = 2'b10, ERROR_FOUND = 2'b11;
reg [1:0] state, next;

always @(posedge clk or negedge rstn) begin
    if (!rstn) state <= IDLE;
    else       state <= next;
end

always @(state or C5 or C10 or NFC or BEANS or WATER) begin
    next = state; COFFEE = 0 ; ERROR = 1;
    case (state)
        IDLE: begin
            if (C5) next = INSERTED5;
            else if (C10) next = PAID;
            else if (!NFC) next = PAID;
            else if (WATER<2 || !BEANS) next = ERROR_FOUND;
        end

        INSERTED5: begin
            if (C5) next = PAID;
            else if (C10) next = PAID;
            else if (!NFC) next = PAID;
        end

        PAID: 
        begin
            next = IDLE;
            COFFEE = 1;
        end

        ERROR_FOUND: begin
            if (WATER>1 && BEANS) next=IDLE;
            ERROR = 0;
        end
    endcase  
end

endmodule