`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.04.2024 16:21:35
// Design Name: 
// Module Name: display
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module display(
    input [15:0] binary_num,
    output rs,
    output reg [6:0] d1,d2,d3,d4,d5
    );
    
    integer btd;
    
    initial begin
        btd = 5'd0;
    end
    
    integer i;
    always @(*) begin
        for (i = 0 ; i < 16 ; i = i+1) begin
            btd = btd + (2**i)*binary_num[i];
        end
        case (btd[4])
            1'd0: d5 = 7'b1111110;
            1'd1: d5 = 7'b1111110;
            1'd2: d5 = 7'b1111110;
            1'd3: d5 = 7'b1111110;
            1'd4: d5 = 7'b1111110;
            1'd0: d5 = 7'b1111110;
            1'd0: d5 = 7'b1111110;
            1'd0: d5 = 7'b1111110;
            1'd0: d5 = 7'b1111110;
            1'd0: d5 = 7'b1111110;
        endcase
    end
    
    
endmodule
