`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2024 10:46:36
// Design Name: 
// Module Name: LFSR_challenge_bits
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


module LFSR_challenge_bits
#(parameter N=32)
(
input clk,rst,
output [N-1:0]c_bits
);

wire [N-2:0]h;
wire w11,w12,w13,w14;

assign h=31'b1010101010101001101010101010100;

generate
genvar K;
for(K = 1; K < N ; K = K + 1)
begin: Dffs
Dff dff(c_bits[K],clk,rst,c_bits[K-1]);  
end
endgenerate 

assign w11=c_bits[0]^(c_bits[1]*h[0])^(c_bits[2]*h[1])^(c_bits[3]*h[2])^(c_bits[4]*h[3])^(c_bits[5]*h[4])^(c_bits[6]*h[5])^(c_bits[7]*h[6]);
assign w12=w11^(c_bits[8]*h[7])^(c_bits[9]*h[8])^(c_bits[10]*h[9])^(c_bits[11]*h[10])^(c_bits[12]*h[11])^(c_bits[13]*h[12])^(c_bits[14]*h[13])^(c_bits[15]*h[14]);
assign w13=w12^(c_bits[16]*h[15])^(c_bits[17]*h[16])^(c_bits[18]*h[17])^(c_bits[19]*h[18])^(c_bits[20]*h[19])^(c_bits[21]*h[20])^(c_bits[22]*h[21])^(c_bits[23]*h[22]);
assign w14=w13^(c_bits[24]*h[23])^(c_bits[25]*h[24])^(c_bits[26]*h[25])^(c_bits[27]*h[26])^(c_bits[28]*h[27])^(c_bits[29]*h[28])^(c_bits[30]*h[29])^(c_bits[31]*h[30]);

Dff d32(w14,clk,rst,c_bits[31]);

endmodule
