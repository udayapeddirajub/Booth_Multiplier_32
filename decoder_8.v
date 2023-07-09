`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2023 11:20:20
// Design Name: 
// Module Name: decoder_8
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
`timescale 1ns / 1ps


module decoder_8#(parameter N=64)(input [2:0]cntrl,signed[31:0]a,output reg signed[N-1:0]y);

wire signed [N-1:0]buffer;

assign buffer = $signed(a);

always@(*)
begin

case(cntrl)

            3'b000 : y=0;
            3'b001 : y={buffer[N-1:32],a};
            3'b010 : y={buffer[N-1:32],a};
            3'b011 : y={buffer[N-1:32],(a<<1)};
            3'b100 : y=(~({buffer[N-1:32],(a<<1)}) + 1'b1);
            3'b101 : y=(~({buffer[N-1:32],a}) + 1'b1);
            3'b110 : y=(~({buffer[N-1:32],a}) + 1'b1);
            3'b111 : y=0;
            
            default: y=0;
endcase
end
endmodule
