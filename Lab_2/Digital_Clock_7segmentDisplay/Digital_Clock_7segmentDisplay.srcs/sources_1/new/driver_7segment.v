`timescale 1ns / 1ps

module driver_7segment(
    input clk_100Mhz,
    input clr,
    input [3:0] h2,
    input [3:0] h1,
    input [3:0] m2,
    input [3:0] m1,
    input [3:0] s2,
    input [3:0] s1,
    output reg [6:0] seg,
    output reg [5:0] an
    );
    
    wire [6:0] seg1,seg2,seg3,seg4,seg5,seg6;
    reg [17:0] segclk;
    reg [2:0] state;
    
    decoder_7segment disp1(h2,seg1);
    decoder_7segment disp2(h1,seg2);
    decoder_7segment disp3(m2,seg3);
    decoder_7segment disp4(m1,seg4);
    decoder_7segment disp5(s2,seg5);
    decoder_7segment disp6(s1,seg6);
    
    always @(posedge clk_100Mhz)
    segclk <= segclk + 1'b1;
    
    always @(posedge segclk[17] or posedge clr)
    begin
        if(clr==1)
            begin
                seg<=7'b0000000;
                an<=6'b000000;
                state<=3'b000;
            end
        else 
            begin
                case(state)
                3'b000: 
                    begin
                        seg<=seg1;
                        an<=6'b011111;
                        state<=3'b001;
                    end
                3'b001:
                    begin
                        seg<=seg2;
                        an<=6'b101111;
                        state<=3'b010;
                    end
                3'b010:
                    begin
                        seg<=seg3;
                        an<=6'b110111;
                        state<=3'b011;
                    end
                3'b011:
                    begin
                        seg<=seg4;
                        an<=6'b111011;
                        state<=3'b100;
                    end
                3'b100:
                    begin
                        seg<=seg5;
                        an<=6'b111101;
                        state<=3'b101;
                    end
                3'b101:
                    begin
                        seg<=seg6;
                        an<=6'b111110;
                        state<=3'b000;
                    end
                endcase
            end
    end
    
endmodule
