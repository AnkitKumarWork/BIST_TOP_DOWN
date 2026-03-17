`timescale 1ns / 1ps

module test_TOP_BIST;

    // Parameters
    parameter DATA_WIDTH = 16;

    // Inputs
    reg clk;
    reg rst;
    reg [1:0] sw;

    // Outputs
    wire [DATA_WIDTH-1:0] LED;

    // Instantiate the TOP_BIST module
    TOP_BIST #(DATA_WIDTH) uut (
        .clk(clk),
        .rst(rst),
        .sw(sw),
        .LED(LED)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test stimulus
    initial begin
        // Initialize inputs
        rst = 1;
        sw = 2'b00;

        // Apply reset
        #10 rst = 0;

        // Test case 1: sw = 2'b00
        #10 sw = 2'b00;

        // Test case 2: sw = 2'b01
        #100 sw = 2'b01;

        // Test case 3: sw = 2'b10
        #100 sw = 2'b10;

        // Test case 4: sw = 2'b11
        #100 sw = 2'b11;

        // End simulation
        #200 $stop;
    end

    // Monitor outputs
    initial begin
        $monitor("Time = %0t | rst = %b | sw = %b | LED = %h", $time, rst, sw, LED);
    end

endmodule