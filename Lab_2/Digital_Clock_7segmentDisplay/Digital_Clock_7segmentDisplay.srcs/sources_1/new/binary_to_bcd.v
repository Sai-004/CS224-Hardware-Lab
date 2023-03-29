`timescale 1ns / 1ps

module binary_to_bcd(
    input [5:0] binary,
    output reg [3:0] thos,
    output reg [3:0] huns,
    output reg [3:0] tens,
    output reg [3:0] ones
    );
    
    reg [5:0] store=0;
    
    always @(binary)
        begin
            store=binary;
            thos=store/1000;
            
            store=store%1000;
            huns=store/100;
            
            store=store%100;
            tens= store/10;
            
            ones = store%10; 
        end
endmodule
