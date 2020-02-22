`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/30/2020 08:02:38 PM
// Design Name: 
// Module Name: asynchronous_fifo
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


module asynchronous_fifo(
output full,empty, [7:0]d_out,
input wr_clk,rd_clk,wr_en,rd_en,rst,[7:0]d_in);
wire [2:0]wr_addr,rd_addr;
wire wen;
wire [3:0]wr_ptr,rd_ptr,wq2_rd_ptr,rq2_wr_ptr;

and(wen,wr_en,~full); 

dual_port_sram  bram(.wr_clk(wr_clk),.rd_en(rd_en),.wr_en(wen),.wr_addr(wr_addr),.d_in(d_in),
.rd_clk(rd_clk),.rd_addr(rd_addr),.d_out(d_out));

r_ptr_and_empty r1 (.rd_rst(rst),.rd_clk(rd_clk),.rd_en(rd_en),.rq2_wptr(rq2_wr_ptr),
.empty(empty),.rd_addr(rd_addr),.rd_ptr(rd_ptr));

w_ptr_and_full w1 (.full(full),.wr_addr(wr_addr),.wr_ptr(wr_ptr),.wr_en(wr_en),
.wr_rst(rst),.wr_clk(wr_clk),.wq2_rptr(wq2_rd_ptr));

sync_w2r r2w(.rq2_wr_ptr(rq2_wr_ptr),.wr_ptr(wr_ptr),.rd_rst(rst),.rd_clk(rd_clk));

sync_r2w w2r(.wq2_rd_ptr(wq2_rd_ptr),.rd_ptr(rd_ptr), .wr_rst(rst), .wr_clk(wr_clk));

endmodule
