`timescale 1ns/1ps

module TOP_BIST_TB;
    parameter DATA_WIDTH = 16;

    // Testbench Signals
    reg clk, rst;
    reg [1:0] sw;
    wire [DATA_WIDTH-1:0] LED;

    // Instantiate the TOP_BIST module
    TOP_BIST #(DATA_WIDTH) DUT (
        .clk(clk),
        .rst(rst),
        .sw(sw),
        .LED(LED)
    );

    // Clock generation (10ns period -> 100MHz frequency)
    always #5 clk = ~clk;

    // Test Sequence
    initial begin
        // Initialize Inputs
        clk = 0;
        rst = 1;
        sw = 2'b00;
        
        // Apply Reset
        #10 rst = 0;
        
        // Test different switch conditions
        #20 sw = 2'b01;  // Activate RC
        #200 sw = 2'b10; // Activate JC
        #200 sw = 2'b11; // Activate LFSR
        #200 sw = 2'b00; // Back to IDLE

        // End Simulation
        #100 $stop;
    end

    // Monitor Outputs
    initial begin
        $monitor("Time=%0t | sw=%b | LED=%h", 
                 $time, sw, LED);
    end

endmodule
