module binarySearch( inA, clk, rs, s,out,find);
input[7:0] inA;
input clk;
input rs;
input s;
output reg [4:0] out;
output reg find;
reg [4:0] add;
wire [7:0] q;
integer Min = 0;
integer Max = 31;
parameter A = 3'b000;
parameter B = 3'b001;
parameter C = 3'b010;
parameter D = 3'b011;
parameter F = 3'b100;
reg [2:0] state, next_state;
memory m1(.address(add),.clock(clk),.q(q));
always @(posedge clk) begin
if(rs) state <= A;
else state <= next_state;
end
always @(*) begin
case(state)
A: begin
if(s) next_state = F;
else next_state = A;
end
B: begin
 next_state = C;
end
C: begin
if(find == 1 || (Min == Max &&  inA != q))
next_state = D;
else
next_state = F;
end
F: begin
next_state = B;
end
D: begin
if(s) next_state = D;
else next_state = A;
end
default state = state;
endcase 
end
always @(posedge clk) begin
out <= 0; find <= 0;
case(state)
A: begin
out <= 0; find <= 0;
add <= (Max + Min) /2;
end
B: begin
if(q == inA) begin
find <= 1;
end
else if(q > inA) begin
Max <= add;
end
else if(q < inA) begin
Min <= add;
end
end
C: begin
add <= (Max + Min) / 2;
end
F: begin
end
D: begin
if(find)
out <= add;
end
default begin
out <= 0;
find <=0;
end
endcase
end
endmodule
