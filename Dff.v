`timescale 1ns / 1ps



module Dff
(
input D,clk,rst,
output reg q
);
    
always @(posedge clk) begin
if (rst)
q <= 1'b1;
else
q <= D;
end

endmodule
