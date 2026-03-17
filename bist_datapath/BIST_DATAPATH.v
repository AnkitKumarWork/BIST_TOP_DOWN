module BIST_DATAPATH #(parameter DATA_WIDTH = 16)(
    input clk,
    input rst,
    input en_JC,
    input en_RC,
    input en_LFSR,
    input [1:0] sw,
    output [DATA_WIDTH-1:0] LED,
    output [DATA_WIDTH-1:0] C1,
    output [DATA_WIDTH-1:0] C2,
    output [DATA_WIDTH-1:0] C3,
    output RC_CLK,
    output JC_CLK,
    output LFSR_CLK
);

// Instantiate the Ring Counter
Ring_counter #(DATA_WIDTH) RC (
    .RC_CLK(RC_CLK),
    .rst(rst),
    .C1(C1)
);

// Instantiate the Johnson Counter
Johnson_counter #(DATA_WIDTH) JC (
    .JC_CLK(JC_CLK),
    .rst(rst),
    .C2(C2)
);

// Instantiate the LFSR
LFSR #(DATA_WIDTH) LFSR (
    .LFSR_CLK(LFSR_CLK),
    .rst(rst),
    .C3(C3)
);

// Instantiate the MUX
mux_4x1 #(DATA_WIDTH) MUX (
    .C1(C1),
    .C2(C2),
    .C3(C3),
    .sw(sw),
    .LED(LED)
);

// Instantiate the Clock Gate
clock_gate CG (
    .clk(clk),
    .en_RC(en_RC),
    .en_JC(en_JC),
    .en_LFSR(en_LFSR),
    .RC_CLK(RC_CLK),
    .JC_CLK(JC_CLK),
    .LFSR_CLK(LFSR_CLK)
);

endmodule