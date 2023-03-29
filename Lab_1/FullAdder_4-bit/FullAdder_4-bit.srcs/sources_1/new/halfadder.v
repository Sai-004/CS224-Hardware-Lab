`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 14.01.2023 15:01:17
// Design Name: 4-bit FullAdder
//
// Module Name: halfadder
// Project Name: Hardware Lab-1
// Target Devices: BASYS 3 Artix-7 FPGA (XC7A35T-CPG236C))
//////////////////////////////////////////////////////////////////////////////////

//Gate-level hierarchical description of 4-bit adder
//half adder using primitive gates (xor & and)
module halfadder (S,C,x,y);
    input x,y;
    output S,C;
    //Instantiate primitive gates
    xor (S,x,y);    //sum of x,y
    and (C,x,y);    //carry of the sum x,y
endmodule
