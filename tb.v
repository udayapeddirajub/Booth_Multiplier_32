`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.02.2023 15:33:54
// Design Name: 
// Module Name: tb
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


module tb;
reg signed [31:0]a,b;
wire signed [63:0]y;
booth_32 uut(.A(a),.B(b),.y(y));
initial begin
a=0;b=0;
#10a=-8'd1;b=1;
#10 a=10;b=10;
#10 a=-10;b=10;
#10 a=8'hff;b=8'hff;
#10 a=8'h7f;b=8'h7f;
#10 a=-128;b=257;

end
initial #80$finish;
endmodule
