module ineuron #(
    parameter m = 4, // #activations
    parameter k = 4, // activation bits
    parameter n = 4, // weight bits
    parameter b = 2  // bias bits
) (
    input clk, rstn, 
    input signed [m*k-1:0] activations,
    input signed [m*n-1:0] weights_in,
    input signed [b-1:0] bias_in,
    input load_params,
    output [(n+k) + $clog2(m) - 1:0] out
);

//---Loading the weights and the bias
reg signed [m*n-1:0] weights;
reg signed [b-1:0] bias;

always @(posedge clk or negedge rstn) begin // @(loadparams) Εδώ μήπως είναι από τις λίγες περιπτώσεις που πρέπει να προτιμήσουμε latces λόγω κατανάλωσης;
    if (!rstn) 
    begin
        weights = 0;
        bias = 0;
    end
    else if (load_params) 
    begin 
        weights <= weights_in;
        bias <= bias_in;
    end
end
//--------------------------------



//---Implementing the Relu
wire signed [(n+k) + $clog2(m)-1:0] result; // Το άθροισμα των βεβαρυμένων activations.
assign out = result[(n+k) + $clog2(m)-1] ? 0 : result; 
//--------------------------------



//---Weighted sums and final sum
wire [(2*m-1) * ((n+k) + $clog2(m)) - 1 : 0] sums; // Μερικά Αθροίσματα. Σπαταλάμε πολλά bits στους ενδιάμεσους κόμβους αλλά δεν ξέρω πως να το περιγράψω ώστε να το αποφύγουμε.
wire [m*(k+n)-1:0] weighted; // Βεβαρυμένα activations.
assign result = $signed(sums[(n+k) + $clog2(m) - 1 : 0]) + $signed(bias);


//multiplications
genvar gi;
generate
        for (gi=0;gi<m;gi=gi+1) begin
            assign weighted[gi*(n+k) +: n+k] = $signed(weights[gi*n +: n]) * $signed(activations[gi*k +: k]);
            assign sums[((2*m-1)*((n+k) + $clog2(m))-1) - gi*((n+k) + $clog2(m)) -: (n+k) + $clog2(m) ] = $signed(weighted[gi*(n+k) +: n+k]);  //θα μπορούσε να παραληφθεί η προηγούμενη γραμμή αλλά την κρατάμε για οργανωτικούς λόγους.
        end
    endgenerate


//additions
generate
        for (gi=0;gi<m-1;gi=gi+1) begin
            assign sums[gi * ((n+k) + $clog2(m)) +: (n+k) + $clog2(m)] = $signed(sums[ (2*gi+1) * ((n+k) + $clog2(m)) +: (n+k) + $clog2(m)] + sums[(2*gi+2) * ((n+k) + $clog2(m)) +: (n+k) + $clog2(m)]) ;
        end
    endgenerate
//--------------------------------


endmodule