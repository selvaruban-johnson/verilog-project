`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2020 05:39:15 PM
// Design Name: 
// Module Name: sync_r2w
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


module sync_r2w (output reg [3:0] wq2_rd_ptr,input [3:0] rd_ptr, input wr_clk, wr_rst);
 reg [3:0] wq1_rptr;
 always @(posedge wr_clk, posedge wr_rst)
 if (wr_rst) 
    {wq2_rd_ptr,wq1_rptr} <= 0;
 else 
    {wq2_rd_ptr,wq1_rptr} <= {wq1_rptr,rd_ptr};
endmodule