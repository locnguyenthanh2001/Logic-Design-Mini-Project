`timescale 1ns/1ns
module testbench();
reg [7:0] inA;
reg clk;
reg rs;
reg s;
wire find;
wire [4:0] out;
binarySearch b1(inA,clk,rs,s,out,find);
initial#5 clk = 1'b0;
always #5 clk=~clk;
initial begin
#10 rs = 1'b1;
#10 rs = 1'b0; s = 1'b0;
#10 inA = 8'b00011000;
#10 s = 1'b1;
end
endmodule 
