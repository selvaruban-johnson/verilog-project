`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/30/2020 05:22:59 PM
// Design Name: 
// Module Name: bram
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

module dual_port_sram (input wr_clk,wr_en, [2:0]wr_addr, [7:0]d_in, input rd_en, rd_clk, [2:0]rd_addr, output reg [7:0]d_out );
(*ram_style = "block"*)reg [7:0] mem [9:0];
always @(posedge wr_clk)
    begin
        if(wr_en)
            mem[wr_addr]<=d_in;
    end  
always @ (posedge rd_clk)
begin
    if (rd_en)
        d_out <= mem[rd_addr];
end 
endmodule

