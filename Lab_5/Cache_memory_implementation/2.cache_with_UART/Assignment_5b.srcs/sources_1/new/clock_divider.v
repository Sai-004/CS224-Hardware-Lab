`timescale 1ns / 1ps

module python_clk_sync(
    input clk_in, // 100MHz E3 clock
    output reg clk_out // 1Hz 
);
reg [27:0] count=0;

always@(posedge clk_in)
begin
    count=count+1;
    if(count==50_000_000)
    begin
        count=0;
        clk_out=~clk_out;
    end
end
endmodule