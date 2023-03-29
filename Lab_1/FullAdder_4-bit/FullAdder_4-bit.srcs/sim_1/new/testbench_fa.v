`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 14.01.2023 15:05:51
// Design Name: 4-bit FullAdder
//
// Module Name: testbench_fa
// Project Name: Hardware Lab-1
// Target Devices: BASYS 3 Artix-7 FPGA (XC7A35T-CPG236C)) 
//////////////////////////////////////////////////////////////////////////////////

//testbench module for the 4bit full adder
module testbench_fa;
reg [3:0] A,B;  //4bit registers for the 4bit inputs A & B
reg C_IN;       //1bit register for C_IN
wire [3:0] SUM; //4bit output SUM
wire C_OUT;     //1bit output C_OUT
fulladder_4bit FA_4 (SUM, C_OUT, A, B, C_IN);
initial 
    begin
        //6 testcases with a interval of 100ps
        A = 4'd0; B = 4'd0; C_IN = 1'd0;
        #0.1
        A = 4'd3; B = 4'd4;
        #0.1
        A = 4'd2; B = 4'd5;
        #0.1
        A = 4'd9; B = 4'd9;
        #0.1
        A = 4'd10; B = 4'd15;
        #0.1
        A = 4'd11; B = 4'd5; C_IN = 1'd1;
    end
endmodule
