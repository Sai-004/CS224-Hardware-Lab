`timescale 1ns / 1ps

module driver_7segment(
    input clk_100Mhz,
    input clr,
    input [15:0] value,
    output reg [6:0] seg,
    output reg [3:0] an
    );
    
    wire [6:0] seg1,seg2,seg3,seg4;
    reg [17:0] segclk;
    reg [2:0] state;
    
    decoder_7segment disp1(value[3:0],seg1);
    decoder_7segment disp2(value[7:4],seg2);
    decoder_7segment disp3(value[11:8],seg3);
    decoder_7segment disp4(value[15:12],seg4);
    
    always @(posedge clk_100Mhz)
    segclk <= segclk + 1'b1;
    
    always @(posedge segclk[17] or posedge clr)
    begin
        if(clr==1)
            begin
                seg<=7'b0000000;
                an<=4'b0000;
                state<=3'b000;
            end
        else 
            begin
                case(state)
                3'b000: 
                    begin
                        seg<=seg1;
                        an<=4'b1110;
                        state<=3'b001;
                    end
                3'b001:
                    begin
                        seg<=seg2;
                        an<=4'b1101;
                        state<=3'b010;
                    end
                3'b010:
                    begin
                        seg<=seg3;
                        an<=4'b1011;
                        state<=3'b011;
                    end
                3'b011:
                    begin
                        seg<=seg4;
                        an<=4'b0111;
                        state<=3'b000;
                    end
                endcase
            end
    end
    
endmodule
