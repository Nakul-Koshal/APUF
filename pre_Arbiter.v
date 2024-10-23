`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2024 10:50:24
// Design Name: 
// Module Name: pre_Arbiter
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


module pre_Arbiter
(
input I0,I1,sel, 
output Y0,Y1
    );
    
mux_2_1 m1(I0,I1,sel,Y0); //Mux 1
mux_2_1 m2(I1,I0,sel,Y1); //Mux 2
   
endmodule
