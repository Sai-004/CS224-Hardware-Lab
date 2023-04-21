`timescale 1ns / 1ps

module top_module(
    input clk,
    input rx_pin,
    output wire [10:0] miss_count
    );

wire rx_ready,tx_ready;
wire [7:0] recd_output;
reg [23:0] buffer =0;
reg clock = 0;
reg [31:0] address;
reg [2:0] state;
wire [10:0] hit_count;
reg send;
wire clk_out;

UART_RX_CTRL receiver(clk,rx_pin,rx_ready,recd_output);

cache i1(address,clk_out,hit_count,miss_count);

Clock_divider c(clk,clk_out);

always @(posedge rx_ready)
begin
    if (state == 0) begin
        address[31:24] = recd_output;
        state = state + 1;
        clock = 0;
    end
    else if (state == 1) begin
        address[23:16] = recd_output;
        state = state + 1;
    end
    else if (state == 2) begin
        address[15:8] = recd_output;
        state = state + 1;
    end
    else if (state == 3) begin
        address[7:0] = recd_output;
        state = state + 1;
    end
    else begin
       clock = 1;
       state = 0;
    end 
end

endmodule