`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.01.2024 19:57:34
// Design Name: 
// Module Name: memory_instruction
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


module instruction_memory(
    input clk,
    input reset,
    input [7:0] instruction,
    input button,
    input [5:0] read_address,
    output [15:0] instruction_out
);
    reg [15:0] memory [0:63];
    reg [5:0] counter;
    reg c1;
    initial begin
        counter = 6'b0;
    end
    integer i;
    always @(posedge button, posedge reset, posedge clk) begin
        if(reset) begin
            c1 <= 'b0;
            counter <= 'b0; 
        end
        else if(button == 1) begin
            if (c1 == 0)begin
                    memory[counter][15:8] = instruction;
                    c1 = 1;
            end
            else begin
                    memory[counter][7:0] = instruction;
                    c1 = 0;
                    counter = counter + 1;
            end
        end
    end
    
// initial
// begin
//    memory[0] = 16'b01_00001_000_000001; // LOAD 16 IN R0
//    memory[1] = 16'b01_00001_001_000001; // LOAD 1 IN R1
//    memory[2] = 16'b00_01110_010_001_001; // SQUARE R1 STORE IN R2
//    memory[3] = 16'b00_10000_011_010_000; 
//    memory[4] = 16'b10_10100_000111_001;// BRANCH TO 7 IF R0<R2
//    memory[5] = 16'b00_00100_001_000001; // R1++
//    memory[6] = 16'b10_10100_000010_000; // UNCONDITIONAL JUMP TO 2
//    memory[7] = 16'b00_00110_001_000001; // R1--
//    memory[8] = 16'b11_10110_001_111111; // DISPLAY R1
// end
    
    assign instruction_out = memory[read_address];
    
endmodule