module alu_tb #(
    parameter alu_size = 4,
    parameter fileout = "alu_tb_result.txt"
);

reg [alu_size-1:0] A, B;
reg [4:0] opcode;
wire [alu_size-1:0] Y;
wire [4:0] status;

integer i,f;
    

alu #(.n(alu_size)) dut(
    .A(A),
    .B(B),
    .Y(Y),
    .opcode(opcode),
    .status(status)
);    

initial begin
f = $fopen(fileout,"w");

for (opcode=0;opcode<16;opcode=opcode+1)begin
    for(i=0;i<10;i=i+1)begin
    A=$random;
    B=$random;
    #5;
    $fwrite(f,"%d %d %d %d \n", opcode, A, B, Y );
    #5;
    end
end

end



endmodule