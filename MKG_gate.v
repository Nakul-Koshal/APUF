`timescale 1ns / 1ps



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
