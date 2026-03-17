module BIST_CONTROLLER (
    input clk,
    input rst,
    input [1:0] sw,
    output reg en_JC,
    output reg en_RC,
    output reg en_LFSR
);
    reg [1:0] ps,ns;
    // State Encoding
    parameter IDLE = 2'b00,
              RC   = 2'b01,
              JC   = 2'b10,
              LFSR = 2'b11;

    //reg [1:0] ns; // Next state

    // State Register (Sequential Logic)
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            ps <= IDLE;
        end else begin
            ps <= ns;
        end
    end

    // Next State Logic (Combinational)
    always @(*) begin
        case (ps)
            IDLE: begin
                case (sw)
                    2'b01: ns = RC;
                    2'b10: ns = JC;
                    2'b11: ns = LFSR;
                    default: ns = IDLE;
                endcase
            end
            
            RC: begin
                case (sw)
                    2'b01: ns = RC;
                    2'b10: ns = JC;
                    2'b11: ns = LFSR;
                    default: ns = IDLE;
                endcase
            end
            
            JC: begin
                case (sw)
                    2'b01: ns = RC;
                    2'b10: ns = JC;
                    2'b11: ns = LFSR;
                    default: ns = IDLE;
                endcase
            end
            
            LFSR: begin
                case (sw)
                    2'b01: ns = RC;
                    2'b10: ns = JC;
                    2'b11: ns = LFSR;
                    default: ns = IDLE;
                endcase
            end
            
            default: ns = IDLE;
        endcase
    end

    // Output Logic (Combinational)
    always @(*) begin
        en_RC   = (ps == RC);
        en_JC   = (ps == JC);
        en_LFSR = (ps == LFSR);
    end

endmodule
