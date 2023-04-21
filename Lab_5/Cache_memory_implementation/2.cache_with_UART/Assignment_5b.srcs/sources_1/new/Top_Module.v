`timescale 1ns / 1ps

module top_module(
    input clk, // 100 MHz E3 clock
    input inp_Rxd, // Serial input from PC
    input hit_or_miss, // Hit or Miss switch
    output [7:0] instr, // Data packets from PC
    output [7:0] hitmiss, // Hiit or Miss counter
    output [7:0] an, // anode
    output dp // cathode
);
wire [7:0] inp;
wire clk_1Hz;
wire [7:0] hits;
wire [7:0] miss;

// Clock divider
python_clk_sync Clock_1Hz(clk, clk_1Hz);

// Cache Instantiation
cache c(clk_1Hz, inp, hits, miss);

// UART communication setup
uart recv(clk, 1'b0, inp_Rxd, inp);

// Output assignments
assign instr = inp;
assign hitmiss = hit_or_miss ? hits : miss;
assign an=8'b01111111;
assign dp=clk_1Hz;

endmodule
