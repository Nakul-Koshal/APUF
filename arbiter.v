`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2024 10:54:31
// Design Name: 
// Module Name: arbiter
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


module arbiter
#(parameter N = 32) //Length of MUX chain
(
input clk,rst,
input [N-1:0]c_bits, //Challenge bits = No. of pre-arbiters
output dff           //Output from D flip-flop
);

wire inp0,inp1;    //Inputs to first pre-arbiter
wire [(2*N)-1:0]w; //Intermediate wires in mux chains

assign inp0 = 1'b0, inp1 = 1'b1; 

LFSR_challenge_bits LFSR_1(clk,rst,c_bits); //Challenge bits generation

pre_Arbiter p1(inp0,inp1,c_bits[0],w[0],w[1]); //First pre-arbiter

//Chain of pre-arbiter = Arbiter
generate
genvar K;
for(K = 1; K < N ; K = K + 1)
begin: pre_Arbiters
pre_Arbiter p2(w[2*K-2],w[2*K-1],c_bits[K],w[2*K],w[2*K+1]);  
end
endgenerate 

Dff ff(w[(2*N)-2],w[(2*N)-1],1'b0,dff); //Fianl output of Arbiter from D flip-flop

endmodule
