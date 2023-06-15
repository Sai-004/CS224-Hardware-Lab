`timescale 1ns / 1ps

module top_module(
   input wire clk,
   output [6:0] seg,
   output [5:0] en,
   input sw,
   output wire [8:0]  page_hit_ctr
);
   reg [3:0] thous,hunds,tens,ones;
   reg [8:0] bcd_input=0;   

   always @(page_hit_ctr) 
   begin
      bcd_input   =  page_hit_ctr; 
      thous =  bcd_input/1000;
      bcd_input   =  bcd_input%1000;
      hunds =  bcd_input/100;
      bcd_input   =  bcd_input%100;
      tens  =  bcd_input/10;
      ones  =  bcd_input%10;
   end
   
   reg [25:0] count=0;
   reg slow_clk;
   always@(posedge clk)
   begin
      count <= count+1;
      if(count==50)
      begin
         count<=0;
         slow_clk =  ~slow_clk;
      end 
   end
   
   binarytobcd_converter bcd(pagehit,thousands,hundreds,tens,ones);
//   sevenseg_driver seven(clk,sw,4'b0100,4'b0100,thous,hunds,tens,ones,seg,en);
   reg [31:0] instruction;
   reg [31:0] instr [0:31];
   wire request_M2BC;
   wire request_P2BC;
   wire grant_P2M;
   wire grant_M2P;
   wire BASR_isfull;
   wire channel;
   wire [41:0] data_P2M;
   wire [41:0] data_M2P;
   wire [10:0] bottom;

   processor p1(
               .grant_P2M(grant_P2M),.instruction(instruction),
               .clk(slow_clk),.grant_M2P(grant_M2P),.BASR_isfull(BASR_isfull),
               .channel(channel),.request_P2BC(request_P2BC),
               .data_M2P(data_M2P),.data_P2M(data_P2M),.bottom(bottom)
               );

   bus_controller b1(
               .clk(slow_clk),.request_M2BC(request_M2BC),.request_P2BC(request_P2BC),
               .grant_P2M(grant_P2M),.grant_M2P(grant_M2P)
               );

   memory m1(
               .BASR_isfull(BASR_isfull),.page_hit_ctr(page_hit_ctr),
               .channel(channel),.clk(slow_clk),.grant_P2M(grant_P2M),
               .request_M2BC(request_M2BC),.grant_M2P(grant_M2P),.data_P2M(data_P2M),.data_M2P(data_M2P)
            );
   
   initial begin
      instr[0]=1;
      instr[1]=2;
      instr[2]=1;
      instr[3]=2;
      instr[4]=1;
      instr[5]=2000;
      instr[6]=1;
      instr[7]=262144;
      instr[8]=262144;
      instr[9]=2;
      instr[10]=2000;
      instr[11]=2;
      instr[12]=1;
      instr[13]=2;
      instr[14]=1;
      instr[15]=2;
      instr[16]=1;
      instr[17]=2;
      instr[18]=1;
      instr[19]=2;
      instr[20]=1;
      instr[21]=2;
      instr[22]=1;
      instr[23]=2;
      instr[24]=1;
      instr[25]=2;
      instr[26]=1;
      instr[27]=1;
      instr[28]=2;
      instr[29]=1;
      instr[30]=2;
      instr[31]=362144;
   end
   
   integer i=0;
   always@(posedge slow_clk)
   begin
      if(i!=32)
      begin
         instruction=instr[i];
         i=i+1;
      end
   end 
endmodule
