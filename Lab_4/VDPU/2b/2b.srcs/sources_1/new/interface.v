`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2023 15:24:21
// Design Name: 
// Module Name: interface
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

module top_module(
clk,inp,seg,digit,Txd,push_button,md,inp1,disp
    );
    input clk;
    input inp;
    input push_button;
    output [6:0] seg; // lsb
    output [7:0] digit;
    output [7:0] md;
    reg [3:0] cnt;
    output [7:0] inp1;
    reg slow_clk;
    input disp;
     wire stat;
    output wire Txd;
     wire ready;
     wire [7:0] out1,out2;
     wire [7:0] temp1;
     reg [7:0]TEMP;
     vdpu v(inp1,clk,stat,ready,seg,push_button,md,digit,out1,out2);
        Receiver_RxD r(clk,1'b0,inp,inp1);
        transmitter t1(clk,temp1,ready,1'b0,Txd);
        always @(posedge clk) begin
                if(disp==1) TEMP=out2;
                else TEMP=out1;
                end
        assign temp1=TEMP;
endmodule
