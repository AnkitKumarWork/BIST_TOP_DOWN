module Johnson_counter #(parameter DATA_WIDTH = 16)(
    input JC_CLK,
    input rst,
   // input en_JC,
    output reg [DATA_WIDTH-1:0] C2
);

    always @(posedge JC_CLK or posedge rst) begin
        if (rst)
            C2 <= 16'h0000; // Reset the counter
        else // if (en_JC)
            C2 <= {~C2[DATA_WIDTH-16], C2[DATA_WIDTH-1:1]}; // Shift and invert MSB
    end

endmodule