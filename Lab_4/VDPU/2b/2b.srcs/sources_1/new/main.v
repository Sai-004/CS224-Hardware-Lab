`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2023 15:27:35
// Design Name: 
// Module Name: main
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

module vdpu( inp,clk,stat,ready,seg,push_button,md,digit,out1,out2,signal
    );
    input [7:0] inp;
    output reg [7:0] out1;
    output reg [7:0] out2;
    output [7:0] seg;
    output [7:0] digit;
        output [7:0] md;
      input signal;
    input clk;
    output reg stat = 0;
    output reg ready=1;
    input  push_button;
    reg [7:0] x [15:0]; 
    reg [7:0] y [15:0]; 
    reg [15:0] S=0; 
    reg [2:0] mode;
    reg [7:0] temp;  
    reg[4:0] state_reg, state_next,temp1;
    initial state_next = 0; 
    reg [15:0] temp_s;
       reg [28:0] digit_timer=0;
       reg [2:0] digit_select=0;
       reg [3:0] curr_digit;
       reg [3:0] units=0;
       reg [3:0] tens=0;
       reg [3:0] hund=0;
       reg [3:0] th=0;
       reg [3:0] ten_th=0;
        reg [7:0] digit=0;
    always @(posedge push_button) begin
    
        state_reg = state_next; // default state_next
        temp_s=S;
            units=temp_s%10;
            temp_s=temp_s/10;
            tens= temp_s%10;
            temp_s=temp_s/10;
            hund=temp_s%10;
            temp_s=temp_s/10;
            th=temp_s%10;
            temp_s=temp_s/10;
            ten_th=temp_s%10;
                
        case (state_reg)
            0 : begin
                        temp = inp;
                       case(temp)
                        8'b11110000 : begin 
                                mode = 1;
                                end
                        8'b11110001 : begin
                                mode = 2;
                                end
                        8'b11110010 : begin 
                                mode = 3;
                                end
                        8'b11110011 : begin
                                mode = 4;
                                end
                        endcase
                        
                        state_next = 1;
                        end
                
            1 : begin
                    state_next = 2;
                    stat = 1;
                    ready=0;
                    S[15:8]=inp[7:0];
                end  
            2 : begin
                    state_next = 3; 
                    S[7:0]=inp[7:0];
                end   
            19 : begin
                    out1<=S[7:0];
                    state_next = 20; 
                end  
            20 : begin
                    out2<=S[15:8];
                    state_next = 0; 
                    stat =0;
                    ready=1;
                end
            default : begin
                    temp1 = state_reg - 3;
                    if(mode==1)begin
                        temp = x[temp1]*y[temp1];
                        S = S + temp;   
                    end
                    if(mode==2)begin
                        x[temp1] = inp;
                        temp = x[temp1]*y[temp1];
                        S=S + temp;
//                        $display("sum%d",S);
                    end
                    if(mode==3)begin
                        x[temp1] = inp;
                    end
                    if(mode==4)begin
                        y[temp1] = inp;
                    end 
                    state_next = state_reg + 1; 
                end           
          endcase
     end 
     
     
       assign md=state_reg;
       
      
          always @(posedge clk) begin          //this is for seven segment display // 1ms x 4 displays = 4ms refresh period
            if(digit_timer == 9999) begin         // The period of 200MHz clock is 5ns (1/200,000,000 seconds)
                digit_timer = 0;                   // 5ns x 100,000 = 0.5ms //after every 0.5ms digit displayed will changes
                digit_select =  (digit_select + 1)%5;
            end
            else
                digit_timer =  digit_timer + 1;
    end
          
       
         always @(digit_select) begin   //whenever digit_select changes
 
        case(digit_select) 
     //the bit which is zero gives the position of digit to display
            3'b000 : digit = 8'b11111110;   // Turn on ones digit
            3'b001 : digit = 8'b11111101;   // Turn on tens digit
            3'b010 : digit = 8'b11111011;   // Turn on hundreds digit
            3'b011: digit = 8'b11110111;
            3'b100: digit = 8'b11101111;
        endcase
    end     
    
    always @(posedge clk) begin
  //code for seven segment display
                 case(digit_select)
                     3'b000: begin
                                curr_digit=units;
  end
  3'b001: begin
                 curr_digit=tens;
  end
  
  3'b010: begin
                curr_digit=hund;
  end
  
  3'b011: begin
       curr_digit=th;
       end
   3'b100: begin 
     curr_digit=ten_th;
     end
  endcase
  end

reg [7:0] seg;
 
       always @(posedge clk) begin
  case(curr_digit) //seven segment
  4'b0000 : begin seg <= 7'b0000001; end
                4'b0001 : begin seg <= 7'b1001111; end
                4'b0010 : begin seg <= 7'b0010010; end
                4'b0011 : begin seg <= 7'b0000110; end
                4'b0100 : begin seg <= 7'b1001100; end
                4'b0101 : begin seg <= 7'b0100100; end
                4'b0110 : begin seg <= 7'b0100000; end
                4'b0111 : begin seg <= 7'b0001111; end
                4'b1000 : begin seg <= 7'b0000000; end
                4'b1001 : begin seg <= 7'b0001100; end
                default : begin seg <= 7'b1111111; end
     endcase
     end 
     
     
     
endmodule
