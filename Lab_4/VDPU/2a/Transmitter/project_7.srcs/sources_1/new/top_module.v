`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2023 02:08:47 PM
// Design Name: 
// Module Name: top_mod
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
/////////////////////////////////////////////////////////////////////////////////
module Top_module(
    input [7:0] data,
    input clk,
    input transmit1,
    output TxD,
    output TxD_debug,
    output transmit_debug,
    output btn_debug,
    output clk_debug
);
    wire transmit_out;

    assign Tx_debug = TxD;
    assign transmit_debug = transmit1;
    assign btn_debug = reset;
    assign clk_debug = clk;
       
     transmitter t1(clk,data,transmit1,reset,TxD);
     //Debounce_Signals(clk,transmit1,transmit_out);

endmodule
