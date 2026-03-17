module BIST_CONTROLLER (
input clk,
input rst,
input [1:0] sw,
output reg en_JC,
output reg en_RC,
output reg en_LFSR
);

reg [1:0] ps , ns;


parameter IDLE = 2'b00,
          RC= 2'b01,
          JC= 2'b10,
          LFSR = 2'b11;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        ps <= IDLE;
    end else begin
        ps <= ns;
    end
end
always@(*) begin
    case (ps)
        IDLE: begin
            if (sw == 2'b01) begin
                ns = RC;
            end else if (sw == 2'b10) begin
                ns = JC;
            end else if (sw == 2'b11) begin
                ns = LFSR;
            end else begin
                ns = IDLE;
            end
        end
        
        RC: begin
            if (sw == 2'b01) begin
                ns = RC;
            end else if (sw == 2'b10) begin
                ns = JC;
            end else if (sw == 2'b11) begin
                ns = LFSR;
            end else begin
                ns = IDLE;
            end
        end
        
        JC: begin
             if (sw == 2'b01) begin
                ns = RC;
            end else if (sw == 2'b10) begin
                ns = JC;
            end else if (sw == 2'b11) begin
                ns = LFSR;
            end else begin
                ns = IDLE;
            end
        end
        
        LFSR: begin
             if (sw == 2'b01) begin
                ns = RC;
            end else if (sw == 2'b10) begin
                ns = JC;
            end else if (sw == 2'b11) begin
                ns = LFSR;
            end else begin
                ns = IDLE;
            end
        end
        
        default: ns = IDLE; // Default case to avoid latches
    endcase
end

// Enable signals for each counter
always @(*) begin
    case (ps)
        IDLE: begin
            en_RC = 1'b0;
            en_JC = 1'b0;
            en_LFSR = 1'b0;
        end
        
        RC: begin
            en_RC = 1'b1;
            en_JC = 1'b0;
            en_LFSR = 1'b0;
        end
        
        JC: begin
            en_RC = 1'b0;
            en_JC = 1'b1;
            en_LFSR = 1'b0;
        end
        
        LFSR: begin
            en_RC = 1'b0;
            en_JC = 1'b0;
            en_LFSR = 1'b1;
        end
        
        default: begin
            en_RC = 1'b0;
            en_JC = 1'b0;
            en_LFSR = 1'b0; // Default case to avoid latches
        end
    endcase
end
endmodule 