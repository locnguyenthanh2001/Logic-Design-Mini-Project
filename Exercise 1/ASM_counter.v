module ASM_counter(clk,inA,rs,s,out);
input [7:0]inA;
input clk;
input rs, s;
output reg[3:0] out;

reg [1:0]state,next_state;
reg [7:0]a;
reg [3:0]count;

parameter A = 2'b01;
parameter B = 2'b00;
parameter C = 2'b11;

always @(posedge clk or posedge rs)

 begin

  if(rs)
    state <= A;
  else state<= next_state;
  
  end
  
 always @(*) begin
  next_state = state;

 case (state)  
  A:begin
 
		 if(s) next_state = B;
		 end
				 
				 
	B : begin
		 if(a == 8'b00000000) next_state = C;
		 end
		 
		 
	C : begin
				  
				  if(s) next_state =C;
				  else next_state =A;
				
			  end
			  
			  default : begin
							next_state = state;
							end
endcase
end
always @(posedge clk)
begin
case(state)
A:begin
out <=0;
a <= inA;
count <= 0;
end
B: begin
a<={1'b0,a[7:1]}; count <= count + a[0];
end
C: out <= count;
default: begin
a<=0;
count <=0;
out <=0;
end
endcase
end
endmodule
		  
		 
		 
	
	
	
  
	 

