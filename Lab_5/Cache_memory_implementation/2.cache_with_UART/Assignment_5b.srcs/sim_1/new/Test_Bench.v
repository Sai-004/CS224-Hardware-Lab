`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2023 00:25:38
// Design Name: 
// Module Name: Test_Bench
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


module Test_Bench;
reg clk;
reg [7:0] dataIn;
wire [7:0] hits;
wire [7:0] miss;

// DUT instantiation
cache DUT(clk,dataIn,hits,miss);
    
initial begin
clk<=0;
forever #10 clk =~clk;
end
    
initial
begin
dataIn = 8'b11111111;
#20
//
dataIn = 8'b00000000;
#20 
dataIn = 8'b00000000;
#20
dataIn = 8'b01100000;
#20
dataIn = 8'b10101111;
#20
dataIn = 8'b00000000;
#20 
dataIn = 8'b00000000;
#20
dataIn = 8'b01100000;
#20
dataIn = 8'b10101111;
#20
dataIn = 8'b00000000;
#20 
dataIn = 8'b00000000;
#20
dataIn = 8'b01100000;
#20
dataIn = 8'b10101111;
#20
dataIn = 8'b00000000;
#20 
dataIn = 8'b00000000;
#20
dataIn = 8'b01100000;
#20
dataIn = 8'b10101111;
#20
dataIn = 8'b00000000;
#20 
dataIn = 8'b00000100;
#20
dataIn = 8'b01100000;
#20
dataIn = 8'b10101111;
#20
dataIn = 8'b00000000;
#20 
dataIn = 8'b00000100;
#20
dataIn = 8'b01100000;
#20
dataIn = 8'b10110111;
#20
dataIn = 8'b00000000;
#20 
dataIn = 8'b00000110;
#20
dataIn = 8'b01100000;
#20
dataIn = 8'b10110111;
#20
dataIn = 8'b00000000;
#20 
dataIn = 8'b00000000;
#20
dataIn = 8'b01100000;
#20
dataIn = 8'b10110111;
#20
dataIn = 8'b00000000;
#20 
dataIn = 8'b00000000;
#20
dataIn = 8'b01100000;
#20
dataIn = 8'b10111011;
#20
dataIn = 8'b11111110;
#50
$finish;     
end
endmodule
