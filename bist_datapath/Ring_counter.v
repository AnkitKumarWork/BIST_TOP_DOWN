module Ring_counter #(DATA_WIDTH = 16)(
    input RC_CLK,
    input rst,
   // input en_RC,
    output [DATA_WIDTH-1:0] C1
    
);

reg [DATA_WIDTH-1:0] c1_reg;

always @(posedge RC_CLK or posedge rst) begin

    if(rst)
        c1_reg <= 16'h0001;
    else //if(en_RC)
        c1_reg <= {c1_reg[DATA_WIDTH-2:0], c1_reg[DATA_WIDTH-1]};
end

assign C1 = c1_reg;

endmodule