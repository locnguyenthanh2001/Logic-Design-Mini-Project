module interface_ASM(SW, LEDR,KEY);
input [17:0]SW;
output [3:0]LEDR;
input [3:0]KEY;
ASM_counter u2(KEY[0],SW[9:2], SW[0], SW[1],LEDR);
endmodule
