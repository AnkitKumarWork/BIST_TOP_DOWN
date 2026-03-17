module mux_4x1 #(parameter DATA_WIDTH = 16)(
    input [DATA_WIDTH-1:0] C1,
    input [DATA_WIDTH-1:0] C2,
    input [DATA_WIDTH-1:0] C3,
    input [1:0] sw,
    output reg [DATA_WIDTH-1:0] LED);

    always @(*) begin
        case (sw)
            2'b00: LED = 16'h0000;
            2'b01: LED = C1;
            2'b10: LED = C2;
            2'b11: LED = C3; // Default case to avoid latches
            default: LED = 16'h0000; // Default case to avoid latches
        endcase
    end
endmodule