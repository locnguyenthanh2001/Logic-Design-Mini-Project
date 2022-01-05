`timescale 1ns/1ns
module test_bench_ASM();
reg [7:0]inA;
reg clk, rs ,s;

wire [3:0] out;

ASM_counter u0(clk, inA, rs, s,out);
initial
clk =0;

always
#5 clk=~clk;


initial begin
$monitor( "s=%b,inA=%b,rs=%b,out=%b", s,inA,rs,out);
 #20 rs<=1'b1;
 #20 rs<=1'b0;
 #20 s<=0;inA = 8'b10101111;
 #10 s <=1;
 #10 s<=1;
 #10 s<=1;
 #10 s<=1;
 #10 s<=1;
 #10 s<=1;
 #10 s<=1;
 #10 s<=1;
 #10 s<=1;
 #10 s<=0;
 #20 s<=0;inA = 8'b11101111;
 #10 s <=1;
 #10 s<=1;
 #10 s<=1;
 #10 s<=1;
 #10 s<=1;
 #10 s<=1;
 #10 s<=1;
 #10 s<=1;
 #10 s<=1;
end
endmodule


