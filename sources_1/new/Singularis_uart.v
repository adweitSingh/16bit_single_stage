`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2024 00:15:16
// Design Name: 
// Module Name: Singularis_uart
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


module Singularis_uart(
    input clk, clk_en, reset_n,
    input rd_uart,
    input rx,           

    input [7:0] w_data, 
    input wr_uart, 
    
    output tx_full,
    output rx_empty,    
    output tx,

    output [6:0] sseg,
    output [0:7] AN,
    output DP,
    output [15:0] display_out,
    output clk_en_out
    );
    assign clk_en_out = clk_en;
    wire [7:0] instr;
    Top_processor Top_g(reset_n, clk, clk_en, instr, rd_uart, display_out);
    terminal_demo uart(clk, reset_n, rd_uart, rx_empty, rx, w_data, wr_uart ,tx_full ,tx ,sseg ,AN ,DP ,instr);
    
endmodule
