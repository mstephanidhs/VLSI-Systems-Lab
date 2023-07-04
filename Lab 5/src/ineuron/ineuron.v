module ineuron #(
    m = 4,
    k = 4,
    n = 4,
    b = 2
) (
    input signed [m*k-1:0] activations_in,
    input signed [m*n-1:0] weights_in,
    input signed [b-1:0] bias_in,
    input load_params,
    output signed [(n+k)+(m-1)-1:0] out
);




    
endmodule