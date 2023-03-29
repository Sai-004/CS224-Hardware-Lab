`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2023 15:25:45
// Design Name: 
// Module Name: transmitter
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

module transmitter(
    input clk,
    input [7:0] data,
    input transmit,
    input reset,
    output reg TxD
    
);

    reg [3:0] bit_counter;
    reg [13:0] baudrate_counter;
    reg [9:0] shiftright_register;
    reg state, next_state;
    reg shift;
    reg load;
    reg clear;
    reg [30:0] DEB;
     reg [1:0] cpy;
     initial cpy<=transmit;

    always @(posedge clk)
    begin
        if(reset)
        begin
            state <= 0;
            bit_counter <= 0;
            baudrate_counter <= 0;
        end else 
        begin 
            baudrate_counter <= baudrate_counter + 1;
            if(baudrate_counter == 10415)
            begin
                state <= next_state;
                baudrate_counter <= 0;
                if(load)
                    shiftright_register <= {1'b1,data,1'b0};
                if(clear)
                    bit_counter <= 0;
                if(shift)
                begin
                    shiftright_register <= shiftright_register>>1;
            bit_counter = bit_counter + 1;
                end
            end
        end
    end

    always @(posedge clk)
    begin
        load <= 0;
        shift <= 0;
        clear <= 0;
        TxD <= 1;
       

        case(state)
            0: begin
                if(transmit==1)
                begin
                    next_state <= 1;
                    load <= 1;
                    shift <= 0;
                    clear <= 0;
                    
            end
            else begin
                next_state <= 0;
                TxD <= 1;
            end
            end
            //end
            1: begin
                if(bit_counter == 10)
                begin
                    next_state <= 0;
                    clear <= 1;
                    cpy<=0;
                end
                else 
                begin
                    next_state <= 1;
                    TxD  <= shiftright_register[0];
                    shift <= 1;
                end
            end
            default: next_state <= 0;
        endcase
    end
endmodule
