`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2020 06:59:22 PM
// Design Name: 
// Module Name: sync_w2r
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


module sync_w2r (output reg [3:0] rq2_wr_ptr, input [3:0] wr_ptr,input rd_clk, rd_rst);
 reg [3:0] rq1_wptr;
 always @(posedge rd_clk, posedge rd_rst)
 if (rd_rst) 
    {rq2_wr_ptr,rq1_wptr} <= 0;
 else 
    {rq2_wr_ptr,rq1_wptr} <= {rq1_wptr,wr_ptr};
endmodule