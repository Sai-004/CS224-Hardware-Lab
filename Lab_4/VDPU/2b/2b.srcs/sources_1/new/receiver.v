`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2023 15:26:28
// Design Name: 
// Module Name: receiver
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

module Receiver_RxD(
    input clk, //100Mhz FPGA board clock
    input reset, //reset button
    input RxD, 
    output [7:0] RxData
);

reg shift;
reg state,next_state;
reg [3:0] bit_counter;
reg[1:0] sample_counter;
reg [13:0] baudrate_counter;
reg [9:0] rxshift_reg;
reg clear_bitcounter, inc_bitcounter, inc_samplecounter, clear_samplecounter;


parameter clk_freq = 100_000_000;
parameter baud_rate = 9_600;
parameter div_sample = 4;
parameter div_counter = clk_freq/(baud_rate*div_sample);
parameter mid_sample = (div_sample/2);
parameter div_bit = 10;

assign RxData = rxshift_reg [8:1];

always @(posedge clk)
begin 
    if(reset)
    begin
        state <= 0;
        bit_counter <= 0;
        baudrate_counter <= 0;
        sample_counter <= 0;
    end else
    begin 
        baudrate_counter <= baudrate_counter + 1;
        if(baudrate_counter >= div_counter - 1) 
        begin  
            baudrate_counter <= 0;
            state <= next_state;
            if(shift) rxshift_reg <= {RxD,rxshift_reg[9:1]};
            if(clear_samplecounter) sample_counter <= 0;
            if(inc_samplecounter) sample_counter <= sample_counter + 1;
            if(clear_bitcounter) bit_counter <= 0;
            if(inc_bitcounter) bit_counter <= bit_counter + 1;
        end
    end
end

always @(posedge clk)
begin 
    shift <= 0;
    clear_samplecounter <= 0;
    inc_samplecounter <= 0;
    clear_bitcounter <= 0;
    inc_bitcounter <= 0;
    next_state <= 0;
    case(state)
        0:begin
            if(RxD)
            begin
                next_state <= 0;
            end
            else 
            begin
                next_state <= 1;
                clear_bitcounter <= 1;
                clear_samplecounter <= 1;
            end
        end
        1:begin
            next_state <= 1;
            if(sample_counter == mid_sample - 1) shift <= 1;
                if(sample_counter == div_sample - 1) begin
                    if(bit_counter == div_bit - 1)begin
                next_state <= 0;
                    end
                    inc_bitcounter <= 1;
                    clear_samplecounter <= 1;

                end
                else inc_samplecounter <= 1;
        end
        default: next_state <= 0;
    endcase
end
endmodule
