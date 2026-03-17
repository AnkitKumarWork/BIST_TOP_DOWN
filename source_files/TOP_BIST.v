module TOP_BIST #(parameter DATA_WIDTH = 16)(
    input clk,
    input rst,
    input [1:0] sw,
    output [DATA_WIDTH-1:0] LED
);
    
    wire en_JC;
    wire en_RC;
    wire en_LFSR;
    
    // Instantiate the BIST Controller
    BIST_CONTROLLER BIST_CTRL (
        .clk(clk),
        .rst(rst),
        .sw(sw),
        .en_JC(en_JC),
        .en_RC(en_RC),
        .en_LFSR(en_LFSR)
    );
    
    // Instantiate the BIST Datapath
    BIST_DATAPATH #(DATA_WIDTH) BIST_DP (
        .clk(clk),
        .rst(rst),
        .en_JC(en_JC),
        .en_RC(en_RC),
        .en_LFSR(en_LFSR),
        .sw(sw),
        .LED(LED)
    );
endmodule