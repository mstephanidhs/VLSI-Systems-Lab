module decoder_tb #(
    parameter dec_size = 3
);

reg [dec_size-1:0] dec_input;
wire [2**dec_size-1:0] dec_output;
reg enable;

decoder #(.size(dec_size)) test_dec(dec_input, enable, dec_output);

integer i,j;
integer error=0;

initial begin

$display("\n\nThis is a test for: %d inputs! \n ", dec_size);

for (i = 0; i<2**dec_size ;i=i+1) begin
        for (j=0; j<=1; j=j+1) begin
            
            dec_input = i;
            enable = j;
            #5;
            if (!enable)begin
                if (dec_output!= 8'b1 << i) error = 1;
            end
            else begin
                if (dec_output) error = 1;
            end

            if (error) begin
                $display("❌ Error in simulation when: \n enable:%b,\n dec_input:%b,\n ouput:%b ",enable, dec_input, dec_output);
                $finish;
            end
            else $display("✅ enable:%b dec_input:%b ouput:%b ",enable, dec_input, dec_output);
        end 
    end
    $display("✅ Congrats! It's working.");
end

endmodule