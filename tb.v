`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.10.2024 09:47:07
// Design Name: 
// Module Name: tb
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


module tb();
reg clk,rst;
wire [31:0] c_bits;
wire mkg1,mkg2,mkg3,mkg4;
wire [31:0] puf_output;

PUF_32 a1(clk,rst,c_bits,mkg1,mkg2,mkg3,mkg4,puf_output);

always #10
clk=~clk;

initial begin
clk=1'b0;
rst=1'b1;
#100;
rst=1'b0;
end

endmodule
