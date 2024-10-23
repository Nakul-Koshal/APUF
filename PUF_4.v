`timescale 1ns / 1ps



module PUF_4
(
input clk,rst,            
output [31:0] c_bits,      //Challenge bits
output mkg1,mkg2,mkg3,mkg4 //Outputs from MKG gate
);

wire [4:1]dff; //Outputs from D flip-flops in Arbiters 
wire ww3;

//4 arbiter as we have 4 input MKG gate 
arbiter arb1(clk,rst,c_bits,dff[1]);
arbiter arb2(clk,rst,c_bits,dff[2]);
arbiter arb3(clk,rst,c_bits,dff[3]);
arbiter arb4(clk,rst,c_bits,dff[4]);

MKG_gate mkg(dff[1],dff[2],dff[3],dff[4],mkg1,mkg2,ww3,mkg4);
assign mkg3 = mkg1 ^ ww3;

endmodule
