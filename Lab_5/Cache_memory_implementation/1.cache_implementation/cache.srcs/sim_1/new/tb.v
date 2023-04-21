`timescale 1ns / 1ps

module cachetb;
    wire [31:0] instr;
    reg [31:0] instr_reg;
    reg clk;
    wire [10:0] hit_count;
    wire [10:0] miss_count;
    wire [3:0] buffer_stat;
    
    initial clk = 0;//clock initialization
    always #0.001 clk = ~clk;//clock creation
    
    cache c(.address(instr),.clk(clk),.hit_count(hit_count),.miss_count(miss_count));
    integer i=0;
    initial begin
    #0.001 instr_reg = $random; 
    
    //inputing 4 random instructions   
    for(i=0;i<4;i=i+1)
    #0.002 instr_reg = $random;
    
    //inputing same intruction 1000 times
    for(i=0;i<1000;i=i+1)
    #0.002 instr_reg = 32'b00000000110011001100110011001100;
    
    //stalling time of the mshr buffer
    //wrote this for showing remaining instructions
    for(i=0;i<792;i=i+1)
    #0.002;
    
    $finish;
    end
    assign instr = instr_reg;
endmodule