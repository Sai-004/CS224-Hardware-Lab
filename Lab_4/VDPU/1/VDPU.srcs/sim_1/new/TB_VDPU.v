`timescale 1ns / 1ps

module TB_VDPU;
    reg clk;
    wire [7:0] DIO;
    reg [7:0] inp;
    wire [1:0] status;
    reg [1:0] sta;
    VDPU uut (
    .clk(clk),
    .DIO(DIO), 
    .status(status)
    );
    initial begin
        clk = 1;
        inp = 8'b0;
        sta = 2'b01;
    end
    assign DIO = (sta[1] == 1'b0)? inp : 8'bz;
    always #0.5
        clk = ~clk;
    always @ (status)
        sta = status;
    initial begin
        #1;
        // Send input data
        inp = 8'b11111101; // GO signal,DATA_TRANSFER_MODE,select X
        #1 inp = 8'b00000000; // S_LOW = 0
        #1 inp = 8'b00000000; // S_HIGH = 0
        #1 inp = 8'b00000100; // X0 = 4
        #1 inp = 8'b00000101; // X1 = 5
        #1 inp = 8'b00000110; // X2 = 6
        #1 inp = 8'b00000111; // X3 = 7
        #1 inp = 8'b00001000; // X4 = 8
        #1 inp = 8'b00001001; // X5 = 9
        #1 inp = 8'b00001010; // X6 = 10
        #1 inp = 8'b00001011; // X7 = 11
        #1 inp = 8'b00001100; // X8 = 12
        #1 inp = 8'b00001101; // X9 = 13
        #1 inp = 8'b00001110; // X10 = 14
        #1 inp = 8'b00001111; // X11 = 15
        #1 inp = 8'b00010000; // X12 = 16
        #1 inp = 8'b00010001; // X13 = 17
        #1 inp = 8'b00010010; // X14 = 18
        #1 inp = 8'b00010011; // X15 = 19
        #2; // end of one 20 cycles mode
        #1 inp = 8'b11111010; // GO signal,PARTIAL_READY_MODE,select Y
        #1 inp = 8'b00000000; // S_LOW = 0
        #1 inp = 8'b00000000; // S_HIGH = 0
        #1 inp = 8'b00000011; // Y0 = 3
        #1 inp = 8'b00000101; // Y1 = 5
        #1 inp = 8'b00001000; // Y2 = 8
        #1 inp = 8'b00001010; // Y3 = 10
        #1 inp = 8'b00001001; // Y4 = 9
        #1 inp = 8'b00000100; // Y5 = 4
        #1 inp = 8'b00001101; // Y6 = 13
        #1 inp = 8'b00000111; // Y7 = 7
        #1 inp = 8'b00001110; // Y8 = 14
        #1 inp = 8'b00010001; // Y9 = 17
        #1 inp = 8'b00000001; // Y10 = 1
        #1 inp = 8'b00010011; // Y11 = 19
        #1 inp = 8'b00010001; // Y12 = 17
        #1 inp = 8'b00001111; // Y13 = 15
        #1 inp = 8'b00001100; // Y14 = 12
        #1 inp = 8'b00001011; // Y15 = 11
        #2; // end of one 20 cycles mode
        #1 inp = 8'b11110110; // GO signal,DATA_READY_MODE,ANY(XX)
        #1 inp = 8'b00000001; // S_LOW = 0
        #1 inp = 8'b00000001; // S_HIGH = 0
        #2; // end of one 20 cycles mode
    end
endmodule
