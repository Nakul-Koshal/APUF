`timescale 1ns / 1ps



module PUF_32
(
input clk,rst,
output [31:0] c_bits,        //Challenge bits
output mkg1,mkg2,mkg3,mkg4,  //Outputs from PUF (1-bit each)
output reg [31:0] puf_output //32-bit output to be collected in this
);

reg [31:0] temp; //Temporary register to hold the 4-bit PUF outputs accumulated over 8 Cycles
reg [3:0] cnt;   //Count the number of time written into the temp register

PUF_4 puf4(clk,rst,c_bits,mkg1,mkg2,mkg3,mkg4); 

always @(posedge clk)
begin
if(rst) 
begin
puf_output <= 32'b0;
temp       <= 32'b0;
cnt        <= 4'b0;
end
else begin
temp <= {temp[27:0],mkg1,mkg2,mkg3,mkg4}; //Left shift 
cnt  <= cnt + 1; //Number of times shifted 

if(cnt == 4'd8) begin //If whole temp register if full
cnt        <= 4'd0;
puf_output <= temp;   //Final output in "puf_output"
end
end
end   

endmodule
