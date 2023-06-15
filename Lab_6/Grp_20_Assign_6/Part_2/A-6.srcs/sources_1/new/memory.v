`timescale 1ns / 1ps

module memory(
    input wire channel,
    input wire clk,
    input wire grant_P2M,
    input wire grant_M2P,
    input wire [31:0] data_P2M,
    output reg BASR_isFull,
    output reg [8:0] page_hit_ctr,
    output reg request_M2BC,
    output reg [41:0] data_M2P
);
    reg [4:0] c1_fetched_instr_ctr;
    reg [4:0] c2_fetched_instr_ctr;
    reg [3:0] c1_instr_ctr;
    reg [3:0] c2_instr_ctr;
    
    initial begin
        page_hit_ctr=0;
    end
    reg [41:0] c1_fetched_instr [0:7];
    reg [41:0] c2_fetched_instr [0:7];
    reg flip_bit=0;
    reg [31:0] BASR1 [0:7];//BASR1
    reg [7:0] BASR1_empty;//BASR1 empty or not checking
    reg [31:0] BASR2 [0:7];
    reg BASR2_empty[0:7];
    reg [9:0] BASR1_ctr [0:7];//BASR1 counter
    reg [9:0] BASR2_ctr [0:7];//BASR2 counter   
    reg [7:0] row_buffer [0:1][0:7][0:15];//row buffer address
    integer i=0;
    integer j=0;
    integer k=0;

    initial begin
        c1_fetched_instr_ctr=0;
        c2_fetched_instr_ctr=0;
        c1_instr_ctr=0;
        c2_instr_ctr=0;
        for(i=0;i<8;i=i+1)
        begin
            BASR1_empty[i]=0;
            BASR2_empty[i]=0;
            BASR1_ctr[i]=0;
            BASR2_ctr[i]=0;
        end
        for(i=0;i<2;i=i+1)
        begin
            for(j=0;j<8;j=j+1)
            begin
                for(k=0;k<16;k=k+1)
                begin
                    row_buffer[i][j][k]=-1;
                end
            end
        end 
    end

    reg [9:0] top=0;
    reg [9:0] bottom=0;  
    reg [31:0] instr_buffer [0:31];
    reg [41:0] data_P2M_prev=-1;

    always@(posedge clk)
    begin
        if(top<32)
        begin
            instr_buffer[top]=data_P2M;
            top=top+1;
        end
        if(bottom<32)
        begin
            if(instr_buffer[bottom][25]==0)
            begin
                if(c1_instr_ctr<8)
                begin
                    if(row_buffer[instr_buffer[bottom][25]][instr_buffer[bottom][24:22]][instr_buffer[bottom][21:18]]==instr_buffer[bottom][17:10])
                    begin
                        page_hit_ctr=page_hit_ctr+1;
                        for(i=0;i<8;i=i+1)
                        begin
                            if(BASR1_empty[i]==0)
                                begin
                                    BASR1[i]=instr_buffer[bottom];
                                    bottom=bottom+1;
                                    BASR1_ctr[i]=32;
                                    BASR1_empty[i]=1;
                                    c1_instr_ctr=c1_instr_ctr+1;
                                end
                        end
                    end 
                    else 
                    begin
                        row_buffer[instr_buffer[bottom][25]][instr_buffer[bottom][24:22]][instr_buffer[bottom][21:18]]=instr_buffer[bottom][17:10];
                        for(i=0;i<8;i=i+1)
                        begin
                            if(BASR1_empty[i]==0)
                                begin
                                    BASR1[i]=instr_buffer[bottom];
                                    bottom=bottom+1;
                                    BASR1_ctr[i]=160;
                                    BASR1_empty[i]=1;
                                    c1_instr_ctr=c1_instr_ctr+1;
                                end
                        end    
                    end 
                end
            end
            if(instr_buffer[bottom][25]==1)
            begin
                if(c2_instr_ctr<8)
                begin
                    if(row_buffer[instr_buffer[bottom][25]][instr_buffer[bottom][24:22]][instr_buffer[bottom][21:18]]==instr_buffer[bottom][17:10])
                    begin
                        page_hit_ctr=page_hit_ctr+1;
                        for(i=0;i<8;i=i+1)
                                begin
                                    if(BASR2_empty[i]==0)
                                        begin
                                            BASR2[i]=instr_buffer[bottom];
                                            bottom=bottom+1;
                                            BASR2_ctr[i]=32;
                                            BASR2_empty[i]=1;
                                            c2_instr_ctr=c2_instr_ctr+1;
                                        end
                                end
                    end 
                    else 
                    begin
                        row_buffer[instr_buffer[bottom][25]][instr_buffer[bottom][24:22]][instr_buffer[bottom][21:18]]=instr_buffer[bottom][17:10];
                        for(i=0;i<8;i=i+1)
                                        begin
                                            if(BASR2_empty[i]==0)
                                                begin
                                                    BASR2[i]=instr_buffer[bottom];
                                                    bottom=bottom+1;
                                                    BASR2_ctr[i]=160;
                                                    BASR2_empty[i]=1;
                                                    c2_instr_ctr=c2_instr_ctr+1;
                                                end
                                        end
                    end 
                end
            end
        end

        for(i=0;i<8;i=i+1)
            begin
                if(BASR1_ctr[i]!=0&&BASR1_empty[i]==1)
                begin
                    BASR1_ctr[i]=BASR1_ctr[i]-1;
                end
                if(BASR1_ctr[i]!=0&&BASR1_ctr[i]==32&&BASR1_empty[i]==1)
                begin
                    row_buffer[BASR1[i][25]][BASR1[i][24:22]][BASR1[i][21:18]]=BASR1[i][17:10];
                end
            end
        for(i=0;i<8;i=i+1)
            begin
                if(BASR2_ctr[i]!=0&&BASR2_empty[i]==1)
                begin
                    BASR2_ctr[i]=BASR2_ctr[i]-1;
                end
                if(BASR2_ctr[i]!=0&&BASR2_ctr[i]==32&&BASR2_empty[i]==1)
                begin
                    row_buffer[BASR2[i][25]][BASR2[i][24:22]][BASR2[i][21:18]]=BASR2[i][17:10];
                end
            end
    
        for(i=0;i<8;i=i+1)
            begin
                if(BASR1_ctr[i]==0&&BASR1_empty[i]==1)
                begin
                c1_instr_ctr=c1_instr_ctr-1;
                BASR1_empty[i]=0;
                end
                if(BASR2_ctr[i]==0&&BASR2_empty[i]==1)                
                begin
                c2_instr_ctr=c2_instr_ctr-1;
                BASR2_empty[i]=0;
                end
            end

        data_M2P=0;
        request_M2BC=0;
        BASR_isFull=0;
    end
endmodule