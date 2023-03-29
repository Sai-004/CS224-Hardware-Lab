`timescale 1ns / 1ps

module digital_clock(
    input clk_100Mhz, enable, reset, min_up, hr_up, sec_up,
    output [3:0] s1, s2, m1, m2, h1, h2
    );
 
    reg [5:0] hour =0, minutes=0, seconds=0;
    integer clk_count=0;
    
    always @ (posedge clk_100Mhz)
    begin
    //reset clock
    if (reset==1'b1)
    {hour,minutes,seconds}<=0;
    
    //set clock
    else if (min_up==1'b1)
    if (minutes==6'd59)
    minutes<=0;
    else minutes<=minutes+1'd1;
    else if (hr_up ==1'b1)
    if (hour==6'd23)
    hour<=0;
    else hour<=hour+1'd1;
    else if (sec_up==1'b1)
    if (seconds==6'd59)
    seconds<=0;
    else seconds<=seconds +1'd1;
    
    //count
    else if (enable==1'b1)
    if (clk_count==100_000_000)
    begin
    clk_count<=0;
    if(seconds==6'd59)
    begin
    seconds<=0;
    if (minutes==6'd59)
    begin minutes<=0;
    if (hour==6'd23)
    hour<=0;
    else
    hour<=hour+1'd1;
    end
    else
    minutes<=minutes+1'd1;
    end
    else
    seconds<=seconds+1'd1;
    end
    else
    clk_count<=clk_count+1;
    end
    
   //binary_to_bcd module converts the numbers and display the on the 7-segment
    binary_to_bcd secs( seconds, , , s2, s1);
    binary_to_bcd mins( minutes, , , m2, m1);
    binary_to_bcd hrs( hour, , , h2, h1);
    
endmodule