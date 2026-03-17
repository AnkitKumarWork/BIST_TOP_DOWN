module clock_gate (
    input clk,
    input en_RC,
    input en_JC,
    input en_LFSR,
    output RC_CLK,
    output JC_CLK,
    output LFSR_CLK
);

assign RC_CLK = clk & en_RC; 
assign JC_CLK = clk & en_JC;
assign LFSR_CLK = clk & en_LFSR;

endmodule