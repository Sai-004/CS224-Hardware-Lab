`timescale 1ns / 1ps

module dramtb;
 reg [31:0] instruction;
 wire [8:0] page_hit_ctr;
 reg clk;
 wire [4:0] c1_fetched_instr_ctr;
 wire [4:0] c2_fetched_instr_ctr;
 wire [3:0] c1_instr_ctr;
 wire [3:0] c2_instr_ctr;
 initial clk = 0;//clock initialization
 always #0.001 clk = ~clk;//clock creation

 wire request_M2BC;
 wire request_P2BC;
 wire grant_P2M;
 wire grant_M2P;
 wire BASR_isfull;
 wire channel;
 wire [41:0] data_P2M;
 wire [41:0] data_M2P;
 wire [8:0] bottom;
 
 processor p(
            .grant_P2M(grant_P2M),.instruction(instruction),
            .clk(clk),.grant_M2P(grant_M2P),.BASR_isfull(BASR_isfull),
            .channel(channel),.request_P2BC(request_P2BC),
            .data_M2P(data_M2P),.data_P2M(data_P2M),.bottom(bottom)
            );

 bus_controller b(
            .clk(clk),.request_M2BC(request_M2BC),
            .request_P2BC(request_P2BC),.grant_P2M(grant_P2M),.grant_M2P(grant_M2P)
            );

 memory m(
            .BASR_isfull(BASR_isfull),.page_hit_ctr(page_hit_ctr),.channel(channel),
            .clk(clk),.grant_P2M(grant_P2M),.request_M2BC(request_M2BC),.grant_M2P(grant_M2P),
            .data_P2M(data_P2M),.data_M2P(data_M2P),.c1_fetched_instr_ctr(c1_fetched_instr_ctr),.c2_fetched_instr_ctr(c2_fetched_instr_ctr),
            .c1_instr_ctr(c1_instr_ctr),.c2_instr_ctr(c2_instr_ctr)
        );
 
 initial begin
 #0.001 instruction = 3;
 #0.002 instruction = 3;
 #0.002 instruction = 2003;
 #0.002 instruction = 3;
 #0.002 instruction = 3;
 #0.002 instruction = 3;
 #0.002 instruction = 33554433;
 #0.002 instruction = 33556433;
 #0.002 instruction = 33554433;
 #0.002 instruction = 33556433;
 #0.002 instruction = 33554433;
 #0.002 instruction = 33554433;
 #0.002 instruction = 33554433;
 #0.002 instruction = 33554433;
 #0.002 instruction = 33554433;
 #0.002 instruction = 33554433;
 #0.002 instruction = 33554433;
 #0.002 instruction = 33554433;
 #0.002 instruction = 33554433;
 #0.002 instruction = 33554433;
 #0.002 instruction = 33554433;
 #0.002 instruction = 33554433;
 #0.002 instruction = 33554433;
 #0.002 instruction = 33554433;
 #0.002 instruction = 33554433;
 #0.002 instruction = 33554433;
 #0.002 instruction = 33554433;
 #0.002 instruction = 33554433;
 #0.002 instruction = 33554433;
 #0.002 instruction = 33554433;
 #0.002 instruction = 33554433;
 #0.002 instruction = 33554433;
 #50 
 #0.1
 $finish;
 end
endmodule