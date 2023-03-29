`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 14.01.2023 14:59:26
// Design Name: 4-bit FullAdder
//
// Module Name: fulladder
// Project Name: Hardware Lab-1
// Target Devices: BASYS 3 Artix-7 FPGA (XC7A35T-CPG236C))
//////////////////////////////////////////////////////////////////////////////////

//full adder using 2 half adders
module fulladder (S,C_OUT,x,y,z);
    input x,y,z;
    output S,C_OUT;
    wire Initial_Sum,c1,c2; //Outputs of first XOR and two AND gates
    //Instantiate the half adders
    halfadder HA1(Initial_Sum,c1,x,y),  //sum of x,y
              HA2(S,c2,Initial_Sum,z);  //sum of (x+y),z
    or gate(C_OUT,c2,c1);   //final carry of the sum x,y,z
endmodule