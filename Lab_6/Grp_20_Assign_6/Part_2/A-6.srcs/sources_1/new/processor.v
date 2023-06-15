`timescale 1ns / 1ps

module processor(
    input wire grant_P2M,
    input wire [31:0] instruction,
    input wire [41:0] data_M2P,
    input wire clk,
    input wire grant_M2P,
    input wire BASR_isfull,
    output reg channel,
    output reg request_P2BC,
    output reg [41:0] data_P2M,
    output reg [8:0] bottom
);
    reg [41:0] instr_buffer [500:0];
    reg [8:0] top=0;
    initial begin
    bottom=0;
    end
    always@(posedge clk)
    begin
        if(top!=32)
            begin
                instr_buffer[top][41:10]=instruction;
                instr_buffer[top][8:0]=top;
                instr_buffer[top][9]=0;
                top=top+1;
            end

        channel=instr_buffer[bottom][35];
        
        if(BASR_isfull==0&&bottom>=10&&instr_buffer[bottom-10][9]==1&&grant_M2P==0)
            begin
                request_P2BC=1;
            end
        
        if((instr_buffer[bottom-10][9]==0&&bottom>=10)||(BASR_isfull==1))
            begin
                request_P2BC=0;
            end
        
        if(bottom<10&&grant_M2P==0)
            begin
                request_P2BC=1;
            end
        
        if(grant_P2M==1&&BASR_isfull==0)
            begin
                request_P2BC=0;
                data_P2M=instr_buffer[bottom];
                bottom=bottom+1;
            end
     end   
     
     always@(data_M2P)
     begin
     instr_buffer[data_M2P[8:0]][9]=1;
     end
endmodule