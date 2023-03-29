`timescale 1ns / 1ps

module clock_top(
    input clk_100Mhz,//using inbuilt clock
    input play_pause, //pausing the clock
    input reset, //reset
    input select,//select
    input increment, //increment
    output [6:0] seg,//displaying in seven segment
    output [5:0] anodes,//anodes connection for 4 seven segment displays
    output reg [3:0] state =0
    );
    
    wire [3:0] h1, h2, s1, s2, m1, m2;
    reg hr_up, min_up ,sec_up;
    reg [28:0] selector =0;
    
     //clock instantiating
     digital_clock clock(clk_100Mhz,play_pause,reset,min_up,hr_up,sec_up,s1,s2,m1,m2,h1,h2);
     //converting time to HH:MM:SS
     driver_7segment seg7(clk_100Mhz,1'b0,h2,h1,m2,m1,s2,s1, seg, anodes);
      
      //selection and increment
      always@(posedge clk_100Mhz)
          begin
              selector = selector + 1;
              hr_up = 1'b0;
              sec_up =1'b0;
              min_up =1'b0;
              if(selector >= 50_000_100)
                  selector <= 0;
              if(selector == 50_000_000 && select == 1 )
                  begin
                      case(state)
                        0:state=1;    //seconds increment
                        1:state=2;    //minutes increment
                        2:state=3;    //hours increment
                        3:state=0;    
                      endcase
                  end 
              if(selector == 50_000_000 && state == 1 )
                  begin
                    if(increment==1)
                        sec_up = 1'b1;
                  end
              if(selector == 50_000_000 && state == 2 )
                  begin
                    if(increment==1)
                        min_up = 1'b1;
                  end
              if(selector == 50_000_000 && state == 3 )
                  begin
                    if(increment==1)
                        hr_up = 1'b1;
                  end
          end
          
endmodule
