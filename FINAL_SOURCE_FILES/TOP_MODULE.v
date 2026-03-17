module TOP_MODULE #(parameter DATA_WIDTH = 16, parameter DIVISOR = 100_000_000)(
    input clk,      // Main input clock
    input rst,      // Reset
    input [1:0] sw, // Switch input
    output [DATA_WIDTH-1:0] LED // Output LED
);

    // Internal Signals
    wire clk_out;   // Divided clock output

    // Instantiate Clock Divider
    Clock_Divider #(DIVISOR) CLK_DIV (
        .clk_in(clk),
        .rst(rst),
        .clk_out(clk_out)
    );

    // Instantiate BIST Controller & Datapath (TOP_BIST)
    TOP_BIST #(DATA_WIDTH) BIST_SYSTEM (
        .clk(clk_out),  // Use divided clock
        .rst(rst),
        .sw(sw),
        .LED(LED)
    );

endmodule
