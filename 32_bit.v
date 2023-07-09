`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2023 11:15:18
// Design Name: 
// Module Name: 32_bit
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


module booth_32(input signed [31:0]A,B,output reg signed [63:0]y);

wire signed[63:0]h1;
wire signed[61:0]h2;

wire signed[59:0]h3;
wire signed[57:0]h4;
wire signed[55:0]h5;
wire signed[53:0]h6;
wire signed[51:0]h7;
wire signed[49:0]h8;

wire signed[61:0]hsum1;
wire signed[59:0]hsum2;

wire signed[61:0]hsum12;
wire signed[55:0]hsum34;
wire signed[55:0]hsum3;
wire signed[51:0]hsum4;


wire signed[61:0]first_half;
wire signed[47:0]second_half;


wire signed[47:0]d1;
wire signed[45:0]d2;
wire signed[43:0]d3;
wire signed[41:0]d4;
wire signed[39:0]d5;
wire signed[37:0]d6;
wire signed[35:0]d7;
wire signed[33:0]d8;

wire signed[45:0]sum12;
wire signed[43:0]sum2;
wire signed[45:0]sum1;
wire signed[39:0]sum34;
wire signed[39:0]sum3;
wire signed[35:0]sum4;




decoder_8 hb1(.cntrl({B[1:0],1'b0}),.a(A),.y(h1));
decoder_8 #(.N(62))hb2(.cntrl(B[3:1]),.a(A),.y(h2));
decoder_8 #(.N(60))hb3(.cntrl(B[5:3]),.a(A),.y(h3));
decoder_8 #(.N(58))hb4(.cntrl(B[7:5]),.a(A),.y(h4));
decoder_8 #(.N(56))hb5(.cntrl(B[9:7]),.a(A),.y(h5));
decoder_8 #(.N(54))hb6(.cntrl(B[11:9]),.a(A),.y(h6));
decoder_8 #(.N(52))hb7(.cntrl(B[13:11]),.a(A),.y(h7));
decoder_8 #(.N(50))hb8(.cntrl(B[15:13]),.a(A),.y(h8));


decoder_8 #(.N(48))b1(.cntrl(B[17:15]),.a(A),.y(d1));
decoder_8 #(.N(46))b2(.cntrl(B[19:17]),.a(A),.y(d2));
decoder_8 #(.N(44))b3(.cntrl(B[21:19]),.a(A),.y(d3));
decoder_8 #(.N(42))b4(.cntrl(B[23:21]),.a(A),.y(d4));
decoder_8 #(.N(40))b5(.cntrl(B[25:23]),.a(A),.y(d5));
decoder_8 #(.N(38))b6(.cntrl(B[27:25]),.a(A),.y(d6));
decoder_8 #(.N(36))b7(.cntrl(B[29:27]),.a(A),.y(d7));
decoder_8 #(.N(34))b8(.cntrl(B[31:29]),.a(A),.y(d8));

assign hsum1=h2+h1[63:2];
assign hsum2={h4+h3[59:2],h3[1:0]};
assign hsum3={h6+h5[55:2],h5[1:0]};
assign hsum4={h8+h7[51:2],h7[1:0]};
assign hsum12={hsum2+hsum1[61:2],hsum1[1:0]};
assign hsum34={hsum4+hsum3[55:4],hsum3[3:0]};

assign first_half={hsum34+hsum12[61:6],hsum12[5:0]};



assign sum1=d2+d1[47:2];
assign sum2={d4+d3[43:2],d3[1:0]};
assign sum3={d6+d5[39:2],d5[1:0]};
assign sum4={d8+d7[35:2],d7[1:0]};
assign sum12={sum2+sum1[45:2],sum1[1:0]};
assign sum34={sum4+sum3[39:4],sum3[3:0]};

assign second_half={sum34+sum12[45:6],sum12[5:0],d1[1:0]};

always@(*)
begin
y={second_half+first_half[61:14],first_half[13:0],h1[1:0]};
end








endmodule
