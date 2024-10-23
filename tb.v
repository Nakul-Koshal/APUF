`timescale 1ns / 1ps



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
