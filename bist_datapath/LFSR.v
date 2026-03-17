module LFSR #(DATA_WIDTH = 16)(
    input LFSR_CLK,
    input rst,
   // input en_LFSR,
    output [DATA_WIDTH-1:0] C3
    
);

reg [DATA_WIDTH-1:0] C3_reg;

always @(posedge LFSR_CLK or posedge rst) begin

    if(rst)
        C3_reg <= 16'hABCD; 
    else //if(en_LFSR)   
        C3_reg <= {C3_reg[14:0], C3_reg[11] ^  C3_reg[12] ^  C3_reg[13] ^  C3_reg[15]};
end

assign C3 = C3_reg;

endmodule