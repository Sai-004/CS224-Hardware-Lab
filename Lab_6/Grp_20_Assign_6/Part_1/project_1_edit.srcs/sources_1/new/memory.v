`timescale 1ns / 1ps

module memory(
    input wire channel,
    input wire clk,
    input wire grant_P2M,
    input wire grant_M2P,
    input wire [41:0] data_P2M,
    output reg request_M2BC,
    output reg BASR_isfull,
    output reg [8:0] page_hit_ctr,
    output reg [41:0] data_M2P,
    output reg [4:0] c1_fetched_instr_ctr,
    output reg [4:0] c2_fetched_instr_ctr,
    output reg [3:0] c1_instr_ctr,
    output reg [3:0] c2_instr_ctr
);
    reg [41:0] BASR_c1 [7:0];//BASR_c1
    reg [41:0] BASR_c1_queue [7:0][7:0];//BASR_c1queue
    reg BASR_c1_empty[7:0];//BASR_c1 empty or not checking
    reg [4:0] BASR_c1_queue_ctr[7:0];//BASR_c1 queue counter
    reg [41:0] BASR_c2 [7:0];//BASR_c2
    reg [41:0] BASR_c2_queue [7:0][7:0];//BASR_c2queue
    reg [4:0] BASR_c2_queue_ctr[7:0];//BASR_c1 queue counter
    reg BASR_c2_empty[7:0];//BASR_c1 empty or not checking
    reg [8:0] BASR_c1_ctr [7:0];//BASR_c1 counter
    reg [8:0] BASR_c2_ctr [7:0];//BASR_c2 counter
    reg [7:0] row_buffer [255:0];//row buffer address
    reg [4:0] ctr=0;
    reg [41:0] c1_fetched_instr_buffer [10:0];
    reg [41:0] c2_fetched_instr_buffer [10:0];
    reg flip_bit=0;
    integer i=0;
    integer j=0;
    integer k=0;
    integer l=0;

    initial
    begin
        page_hit_ctr=0;
        c1_fetched_instr_ctr=0;
        c2_fetched_instr_ctr=0;
        c1_instr_ctr=0;
        c2_instr_ctr=0;
    end
    
initial begin
        for(i=0;i<8;i=i+1)
        begin
            BASR_c1_empty[i]=0;
            BASR_c2_empty[i]=0;
            BASR_c1_queue_ctr[i]=0;
            BASR_c2_queue_ctr[i]=0;
            BASR_c1_ctr[i]=0;
            BASR_c2_ctr[i]=0;
        end
    end
    
    initial begin
        for(i=0;i<256;i=i+1)
                begin
                    row_buffer[i]=-1;//row buffer initialising
                end
    end

    reg bank_conflict=0;
    
    always@(data_P2M)
    begin
        bank_conflict=0;
        if (c1_instr_ctr<8)
        begin
            case(data_P2M[35])
                0   :   begin
                            for(i=0;i<8;i=i+1)
                                begin
                                    if(BASR_c1[i][31:28]==data_P2M[31:28]&&BASR_c1_empty[i]==1)//bank conflict checking
                                        begin
                                            BASR_c1_queue[i][BASR_c1_queue_ctr[i]]=data_P2M;
                                            BASR_c1_queue_ctr[i]=BASR_c1_queue_ctr[i]+1;
                                            c1_instr_ctr=c1_instr_ctr+1;
                                            bank_conflict=1;
                                        end
                                end
                        end
                1   :    begin
                            for(i=0;i<8;i=i+1)
                                begin
                                    if(BASR_c2[i][31:28]==data_P2M[31:28]&&BASR_c2_empty[i]==1)
                                        begin
                                            BASR_c2_queue[i][BASR_c2_queue_ctr[i]]=data_P2M;
                                            BASR_c2_queue_ctr[i]=BASR_c2_queue_ctr[i]+1;
                                            c2_instr_ctr=c2_instr_ctr+1;
                                            bank_conflict=1;
                                        end
                                end
                        end
            endcase
        end

        if(bank_conflict==0&&row_buffer[data_P2M[35]*128+data_P2M[34:32]*8+data_P2M[31:28]]==data_P2M[27:20])
            begin
                page_hit_ctr=page_hit_ctr+1;
                case(data_P2M[35])
                    0   :   begin
                                l=0;
                                for(i=0;i<8;i=i+1)
                                    begin
                                        if(BASR_c1_empty[i]==0&&l==0)
                                            begin
                                                BASR_c1[i]=data_P2M;
                                                BASR_c1_queue_ctr[i]=0;
                                                BASR_c1_ctr[i]=32;
                                                BASR_c1_empty[i]=1;
                                                c1_instr_ctr=c1_instr_ctr+1;
                                                l=1;
                                            end
                                    end
                            end
                    1   :   begin
                                l=0;
                                for(i=0;i<8;i=i+1)
                                    begin
                                        if(BASR_c2_empty[i]==0&&l==0)
                                            begin
                                                BASR_c2[i]=data_P2M;
                                                BASR_c2_queue_ctr[i]=0;
                                                BASR_c2_ctr[i]=32;
                                                BASR_c2_empty[i]=1;
                                                c2_instr_ctr=c2_instr_ctr+1;
                                                l=1;
                                            end
                                    end
                            end 
                endcase
            end 
        if(bank_conflict==0&&row_buffer[data_P2M[35]*128+data_P2M[34:32]*8+data_P2M[31:28]]!=data_P2M[27:20])
        begin
            case(data_P2M[35])
                    0   :   begin
                                l=0;
                                for(i=0;i<8;i=i+1)
                                    begin
                                        if(BASR_c1_empty[i]==0&&l==0)
                                            begin
                                                BASR_c1[i]=data_P2M;
                                                BASR_c1_queue_ctr[i]=0;
                                                BASR_c1_ctr[i]=160;
                                                BASR_c1_empty[i]=1;
                                                c1_instr_ctr=c1_instr_ctr+1;
                                                l=1;
                                            end
                                    end
                            end
                    1   :   begin
                                l=0;
                                for(i=0;i<8;i=i+1)
                                    begin
                                        if(BASR_c2_empty[i]==0&&l==0)
                                            begin
                                                BASR_c2[i]=data_P2M;
                                                BASR_c2_queue_ctr[i]=0;
                                                BASR_c2_ctr[i]=160;
                                                BASR_c2_empty[i]=1;
                                                c2_instr_ctr=c2_instr_ctr+1;
                                                l=1;
                                            end
                                    end
                            end 
                endcase
        end
    end

    always@(posedge clk)
    begin

        BASR_isfull=0;
        if((c1_instr_ctr>=8&&channel==0)||(c2_instr_ctr>=8&&channel==1))
        begin
            BASR_isfull=1;
        end

        for(i=0;i<8;i=i+1)
        begin
            if(BASR_c1_ctr[i]!=0&&BASR_c1_empty[i]==1)
            begin
                BASR_c1_ctr[i]=BASR_c1_ctr[i]-1;
            end
            if(BASR_c1_ctr[i]!=0&&BASR_c1_ctr[i]==32&&BASR_c1_empty[i]==1)
            begin
                row_buffer[BASR_c1[i][35]*128+BASR_c1[i][34:32]*8+BASR_c1[i][31:28]]=BASR_c1[i][27:20];
            end
        end

        for(i=0;i<8;i=i+1)
        begin
            if(BASR_c2_ctr[i]!=0&&BASR_c2_empty[i]==1)
            begin
                BASR_c2_ctr[i]=BASR_c2_ctr[i]-1;
            end
            if(BASR_c2_ctr[i]!=0&&BASR_c2_ctr[i]==32&&BASR_c2_empty[i]==1)
            begin
                row_buffer[BASR_c2[i][35]*128+BASR_c2[i][34:32]*8+BASR_c2[i][31:28]]=BASR_c2[i][27:20];
            end
        end   

        for(i=0;i<8;i=i+1)
        begin
            
            if(BASR_c1_ctr[i]==0&&BASR_c1_empty[i]==1)
            begin
                c1_fetched_instr_buffer[c1_fetched_instr_ctr]=BASR_c1[i];
                c1_fetched_instr_ctr=c1_fetched_instr_ctr+1;
                if(BASR_c1_queue_ctr[i]!=0)
                begin
                    BASR_c1[i]=BASR_c1_queue[i][0];
                    for(j=0;j<BASR_c1_queue_ctr[i]-1;j=j+1)
                    begin
                        BASR_c1_queue[i][j]=BASR_c1_queue[i][j+1];
                    end 
                    if(row_buffer[BASR_c1[i][35]*128+BASR_c1[i][34:32]*8+BASR_c1[i][31:28]]==BASR_c1[i][27:20])
                    begin
                        page_hit_ctr=page_hit_ctr+1;
                        BASR_c1_ctr[i]=32;
                    end
                    else
                    begin
                        BASR_c1_ctr[i]=160;
                    end                                                 
                                    
                    c1_instr_ctr=c1_instr_ctr-1;
                    BASR_c1_queue_ctr[i]=BASR_c1_queue_ctr[i]-1;
                end
                else
                begin
                    BASR_c1_empty[i]=0;
                end
            end
                
            if(BASR_c2_ctr[i]==0&&BASR_c2_empty[i]==1)
            begin
                c2_fetched_instr_buffer[c2_fetched_instr_ctr]=BASR_c2[i];
                c2_fetched_instr_ctr=c2_fetched_instr_ctr+1;
                
                if(BASR_c2_queue_ctr[i]!=0)
                begin
                    BASR_c2[i]=BASR_c2_queue[i][0];
                    for(j=0;j<BASR_c2_queue_ctr[i]-1;j=j+1)
                    begin
                        BASR_c2_queue[i][j]=BASR_c2_queue[i][j+1];                
                    end 
                    if(row_buffer[BASR_c2[i][35]*128+BASR_c2[i][34:32]*8+BASR_c2[i][31:28]]==BASR_c2[i][27:20])
                    begin
                        page_hit_ctr=page_hit_ctr+1;
                        BASR_c2_ctr[i]=32;
                    end
                    else
                    begin
                        BASR_c2_ctr[i]=160;
                    end
                    c2_instr_ctr=c2_instr_ctr-1;
                    BASR_c2_queue_ctr[i]=BASR_c2_queue_ctr[i]-1;
                end 
                else
                begin
                    BASR_c2_empty[i]=0;
                end
            end 
        end

        if(flip_bit==1&&c2_fetched_instr_ctr==0)
        begin
            request_M2BC=0;
            flip_bit=0;
        end
        else if(flip_bit==0&&c1_fetched_instr_ctr==0)
        begin
            request_M2BC=0;
            flip_bit=1;
        end
        else if(flip_bit==1&&c2_fetched_instr_ctr!=0)
        begin
            if(request_M2BC==0&&grant_P2M==0)
            begin
                request_M2BC=1;
            end
            if(grant_M2P==1)
            begin
                request_M2BC=0;
                data_M2P=c2_fetched_instr_buffer[0];
                for(i=0;i<c2_fetched_instr_ctr-1;i=i+1)
                begin
                    c2_fetched_instr_buffer[i]=c2_fetched_instr_buffer[i+1];
                end
                c2_fetched_instr_ctr=c2_fetched_instr_ctr-1;
                flip_bit=0;
            end
        end
        else if(flip_bit==0&&c1_fetched_instr_ctr!=0)
        begin
            if(request_M2BC==0&&grant_P2M==0)
            begin
                request_M2BC=1;
            end
            if(grant_M2P==1) 
            begin
                request_M2BC=0;
                data_M2P=c1_fetched_instr_buffer[0];
                for(i=0;i<c1_fetched_instr_ctr-1;i=i+1)
                begin
                    c1_fetched_instr_buffer[i]=c1_fetched_instr_buffer[i+1];
                end
                c1_fetched_instr_ctr=c1_fetched_instr_ctr-1;
                flip_bit=1;
            end
        end
    end                 
endmodule