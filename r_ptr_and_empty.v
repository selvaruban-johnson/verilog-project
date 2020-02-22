`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/30/2020 10:10:22 PM
// Design Name: 
// Module Name: r_ptr_and_empty
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


module r_ptr_and_empty(input rd_rst,rd_clk,rd_en,[3:0]rq2_wptr,
output reg empty,output reg [2:0]rd_addr,output reg [3:0]rd_ptr);
reg [3:0]rd_count;

always @ (posedge rd_clk,posedge rd_rst)
begin
    if(rd_rst)
    begin
        empty <= 1;
        rd_count <=0;
        rd_addr <= 0;
        rd_ptr <=0;
    end
    else
    begin
        if(rd_ptr==rq2_wptr)
        begin
            empty<=1;
        end
        else
        begin
            empty <= 0;
            rd_count <= rd_count + (rd_en&~empty);
            rd_ptr <= {rd_count[3],rd_count[3:1]^rd_count[2:0]};
            rd_addr <= rd_count[2:0];
        end
    end
    
end
endmodule

