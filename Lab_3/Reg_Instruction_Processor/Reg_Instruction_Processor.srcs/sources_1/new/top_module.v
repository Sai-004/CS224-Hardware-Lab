`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Create Date: 14.02.2023 10:21:25
// Design Name: 
// Module Name: top_module
// Project Name: 
// 
//////////////////////////////////////////////////////////////////////////////////

module top_module(
  input clk,
  input clear,  //SW1
  input control,  //SW0
  input [2:0] opcode,   //SW2-4
  input [2:0] reg_in,   //SW5-7
  input [7:0] scan_value,//SW8-15
  output [13:0] acc,     //accumulator reg
  output [6:0] seg7,
  output [3:0] anodes
);
  
  reg [7:0] rf [0:7];
  reg [13:0] acc_reg;
  reg [13:0] led;
  wire [13:0] display;
  reg control_prev;

  always @ (posedge clk) 
    begin
        control_prev <= control;
        if (control_prev == 0 & control == 1) 
            begin
              case (opcode)
                3'b000: acc_reg <= acc_reg + rf[reg_in];
                3'b001: acc_reg <= acc_reg - rf[reg_in];
                3'b010: acc_reg <= rf[reg_in];
                3'b011: rf[reg_in] <= acc_reg;
                3'b100: acc_reg <= scan_value;
                3'b101: led <= acc_reg;            //PRINT
              endcase
            end
    end
  
  assign acc = acc_reg;
  
  bin2bcd disp(led,display);
  driver_7segment seven_segment(clk,1'b0,display,seg7,anodes);
  
endmodule
