`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 14.01.2023 14:53:39
// Design Name: 4-bit FullAdder
//
// Module Name: fulladder_4bit
// Project Name: Hardware Lab-1
// Target Devices: BASYS 3 Artix-7 FPGA (XC7A35T-CPG236C))
//////////////////////////////////////////////////////////////////////////////////

//4bit adder
module fulladder_4bit (S,C_OUT,A,B,C_IN);
    input [3:0] A,B;    //4bit inputs A,B
    input C_IN;           //1bit carry input
    output [3:0] S;     //4bit output S indicating the sum of A,B,C0
    output C_OUT;          //1bit output C4 indicating the final carry
    wire Carry_1,Carry_2,Carry_3; //Intermediate carries
    //Instantiate the full adder
    //4 full adders are called for each bit of the inputs A,B
    fulladder FA0 (S[0],Carry_1,A[0],B[0],C_IN),
              FA1 (S[1],Carry_2,A[1],B[1],Carry_1),
              FA2 (S[2],Carry_3,A[2],B[2],Carry_2),
              FA3 (S[3],C_OUT,A[3],B[3],Carry_3);
endmodule