module TOP_BIST #(parameter DATA_WIDTH = 16)(
    input clk,
    input rst,
    input [1:0] sw,
    output [DATA_WIDTH-1:0] LED
);

    // Internal Enable Signals
    wire en_JC, en_RC, en_LFSR;

    // Instantiate BIST Controller
    BIST_CONTROLLER CTRL (
        .clk(clk),
        .rst(rst),
        .en_JC(en_JC),
        .en_RC(en_RC),
        .en_LFSR(en_LFSR),
        .sw(sw)
    );

    // Instantiate BIST Datapath
    BIST_DATAPATH #(DATA_WIDTH) DP (
        .clk(clk),
        .rst(rst),
        .en_JC(en_JC),
        .en_RC(en_RC),
        .en_LFSR(en_LFSR),
        .sw(sw),
        .LED(LED)
    );

endmodule
