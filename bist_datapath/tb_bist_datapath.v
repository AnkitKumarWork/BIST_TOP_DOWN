// Testbench
module BIST_DATAPATH_TB;
    parameter DATA_WIDTH = 16;
    reg clk, rst, en_JC, en_RC, en_LFSR;
    reg [1:0] sw;
    wire [DATA_WIDTH-1:0] LED, C1, C2, C3;
    wire RC_CLK, JC_CLK, LFSR_CLK;

    // Instantiate DUT
    BIST_DATAPATH #(DATA_WIDTH) DUT (
        .clk(clk),
        .rst(rst),
        .en_JC(en_JC),
        .en_RC(en_RC),
        .en_LFSR(en_LFSR),
        .sw(sw),
        .LED(LED),
        .C1(C1),
        .C2(C2),
        .C3(C3),
        .RC_CLK(RC_CLK),
        .JC_CLK(JC_CLK),
        .LFSR_CLK(LFSR_CLK)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        clk = 0; rst = 1; en_JC = 0; en_RC = 0; en_LFSR = 0; sw = 2'b00;
        #10 rst = 0; en_RC = 1;
        #20 en_RC = 0; en_JC = 1;
        #20 en_JC = 0; en_LFSR = 1;
        #20 en_LFSR = 0; sw = 2'b01;
        #20 sw = 2'b10;
        #20 sw = 2'b11;
        #500 $stop;
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%0t | RC_CLK=%b JC_CLK=%b LFSR_CLK=%b | C1=%h C2=%h C3=%h | LED=%h", 
                 $time, RC_CLK, JC_CLK, LFSR_CLK, C1, C2, C3, LED);
    end
endmodule
