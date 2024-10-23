`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.10.2024 08:27:32
// Design Name: 
// Module Name: MKG_gate
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


module MKG_gate
(
input  A,B,C,D,
output P,Q,R,S
);

assign P = A;
assign Q = C;
assign R = ((~A & ~D) ^ ~B) ^ C;
assign S = (((~A & ~D) ^ ~B) & C) ^ ((A & B) ^ D);

endmodule
