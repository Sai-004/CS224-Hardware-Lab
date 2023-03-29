`timescale 1ns / 1ps

module decoder_7segment(
            bcd,
            seg
            );
    input [3:0] bcd;    //initializing bcd as an 4 bit input signal
    output [7:0] seg;    //initializing seg as an 8 bit output signal
    reg [7:0] seg;      //initializing bcd signal as registers
     
    always @ (bcd)      //using the always statement to indicate any change in the bcd signal results in evaluating the declared cases
    begin
        case(bcd)   //begining the case statement which evaluates the bcd value and assigns the appropriate contol signals to our 8bit output signal).
            0: seg = 7'b0000001;
            1: seg = 7'b1001111;
            2: seg = 7'b0010010;
            3: seg = 7'b0000110;
            4: seg = 7'b1001100;
            5: seg = 7'b0100100;
            6: seg = 7'b0100000;
            7: seg = 7'b0001111;
            8: seg = 7'b0000000;
            9: seg = 7'b0000100;
            default: seg=7'b1111111;   //any other value
        endcase
    end
    endmodule
