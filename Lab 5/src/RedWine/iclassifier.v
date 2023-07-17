module iclassifier (
    input [2*(11*4)-1:0] weights2,
    input [6*(11*4)-1:0] weights6,
    input [2*8-1:0] bias2,
    input [6*8-1:0] bias6,
    input load_params,
    input [11*4-1:0] activations,
    input clk, rstn,
    output [2:0] Y
);


//---Input and hidden layer
wire [31:0] hidden_layer_out;

ineuron #(
    .m(11),
    .k(4),
    .n(8),
    .b(8)
) neuron2_1(
    .clk(clk),
    .rstn(rstn),
    .activations(activations),
    .weights_in(weights2),
    .bias_in(bias2),
    .load_params(load_params),
    .out(hidden_layer_out[0+:16])
);

ineuron #(
    .m(11),
    .k(4),
    .n(8),
    .b(8)
) neuron2_2(
    .clk(clk),
    .rstn(rstn),
    .activations(activations),
    .weights_in(weights2),
    .bias_in(bias2),
    .load_params(load_params),
    .out(hidden_layer_out[17+:16])
);
//--------------------------


//--- Output Layer
wire [25*6-1:0] out;

ineuron #(
    .m(2),
    .k(16),
    .n(8),
    .b(8)
) neuron3_1(
    .clk(clk),
    .rstn(rstn),
    .activations(hidden_layer_out),
    .weights_in(weights6),
    .bias_in(bias6),
    .load_params(load_params),
    .out(out[25*0+:25])
);

ineuron #(
    .m(2),
    .k(16),
    .n(8),
    .b(8)
) neuron3_2(
    .clk(clk),
    .rstn(rstn),
    .activations(hidden_layer_out),
    .weights_in(weights6),
    .bias_in(bias6),
    .load_params(load_params),
    .out(out[25*1+:25])
);

ineuron #(
    .m(2),
    .k(16),
    .n(8),
    .b(8)
) neuron3_3(
    .clk(clk),
    .rstn(rstn),
    .activations(hidden_layer_out),
    .weights_in(weights6),
    .bias_in(bias6),
    .load_params(load_params),
    .out(out[25*2+:25])
);

ineuron #(
    .m(2),
    .k(16),
    .n(8),
    .b(8)
) neuron3_4(
    .clk(clk),
    .rstn(rstn),
    .activations(hidden_layer_out),
    .weights_in(weights6),
    .bias_in(bias6),
    .load_params(load_params),
    .out(out[25*3+:25])
);

ineuron #(
    .m(2),
    .k(16),
    .n(8),
    .b(8)
) neuron3_5(
    .clk(clk),
    .rstn(rstn),
    .activations(hidden_layer_out),
    .weights_in(weights6),
    .bias_in(bias6),
    .load_params(load_params),
    .out(out[25*4+:25])
);

ineuron #(
    .m(2),
    .k(16),
    .n(8),
    .b(8)
) neuron3_6(
    .clk(clk),
    .rstn(rstn),
    .activations(hidden_layer_out),
    .weights_in(weights6),
    .bias_in(bias6),
    .load_params(load_params),
    .out(out[25*5+:25])
);
//--------------------------

//---Implementing the argmax
integer i;
integer max;


always @(out) begin
    Y=1;
    max=0;
     for (i = 0; i<6;i=i+1 ) begin
        if (out[i*25+:25] > max) begin
            max=out[i*25+:25];
            Y=i+1;
        end
     end
end

//--------------------------

endmodule