`timescale 1ns / 1ps

module cache(
    input wire [31:0] address,      //loading the instruction 
    input wire clk,                 //input clock
    output reg [10:0] hit_count,    //hit counter
    output reg [10:0] miss_count   //miss counter
);

reg [3:0] mshr_buffer_status; //outputing the status of the 4blocks of mshr component
reg [17: 0] instr [255:0][3 : 0];   //cache memory
reg [3:0] lru [255:0][3:0];         //lru counter
reg mshr_is_full;                   //checking if mshr is full
reg hit;                            //checking for hit
reg [31:0] instr_buffer [1100:0];   //instruction buffer
reg [31:0] mshr [3:0];              //mshr
reg [17:0] curr_tag;                //current tag
reg [7:0] curr_index;               //current index
reg [31:0] curr_instr;              //current instruction
reg [1:0] b_index, index_max;       //for finding the max and min lru counter blocks
reg [10:0] top=0, bottom=0;         //instruction buffer variables
reg [9:0] mshr_counter [3:0];       //mshr counters for checking the stalling of 400 cycles
integer i=0, j=0;
reg [1:0] state=0;

//initializing the variables and registers
initial begin
    hit_count=0;
    miss_count=0;
    hit=0;
    for(i=0;i<256;i=i+1)
        begin
            for(j=0;j<4;j=j+1)
                begin
                    instr[i][j]=-1;
                    lru[i][j]=0;
                end 
        end
    
    mshr_buffer_status=0;
    for(i=0;i<4;i=i+1)
        begin
            mshr_counter[i]=0;
        end
end

//always block with clock for reading each instructions... 
always@(posedge clk)
begin
//adding the instruction to the instruction buffer
instr_buffer[top]=address;
top=top+1;

//checking if the mshr buffer is full
if(mshr_buffer_status==4'b1111)//if mshr is full
    mshr_is_full=1;
else
    mshr_is_full=0;
    
//if mshr is not full
if(mshr_is_full!=1&&top!=bottom)
begin
    if(state==0)
    begin
        //store the current instruction in variables
        curr_instr=instr_buffer[bottom];
        curr_tag = instr_buffer[bottom][31:14];
        curr_index = instr_buffer[bottom][13:6];
        bottom=bottom+1;
        hit=0;
        //in case of hit, handling the instruction
            //checking if it belongs to which block of the cache index
            if(instr[curr_index][0] == curr_tag )
            begin
                hit=1;
                hit_count = hit_count +1;
                index_max=0;
                //location the recently used block
                if(lru[curr_index][1]>lru[curr_index][index_max])
                    begin
                        index_max=1;
                    end
                if(lru[curr_index][2]>lru[curr_index][index_max])
                    begin
                        index_max=2;
                    end
                if(lru[curr_index][3]>lru[curr_index][index_max])
                    begin
                        index_max=3;
                    end
                //changing the lru values of the blocks
                lru[curr_index][0]=lru[curr_index][index_max]+1;
                b_index=0;
            end
            else if(instr[curr_index][1] == curr_tag )
            begin
                hit=1;
                hit_count = hit_count +1;
                index_max=0;
                //location the recently used block
                if(lru[curr_index][1]>lru[curr_index][index_max])
                    begin
                        index_max=1;
                    end
                if(lru[curr_index][2]>lru[curr_index][index_max])
                    begin
                        index_max=2;
                    end
                if(lru[curr_index][3]>lru[curr_index][index_max])
                    begin
                        index_max=3;
                    end
                //changing the lru values of the blocks
                lru[curr_index][1]=lru[curr_index][index_max]+1;
                b_index=1;
            end   
            else if(instr[curr_index][2] == curr_tag )
            begin
                hit=1;
                hit_count = hit_count +1;
                index_max=0;
                //location the recently used block
                if(lru[curr_index][1]>lru[curr_index][index_max])
                    begin
                        index_max=1;
                    end
                if(lru[curr_index][2]>lru[curr_index][index_max])
                    begin
                        index_max=2;
                    end
                if(lru[curr_index][3]>lru[curr_index][index_max])
                    begin
                        index_max=3;
                    end
                //changing the lru values of the blocks
                lru[curr_index][2]=lru[curr_index][index_max]+1;
                b_index=2;
            end  
            else if(instr[curr_index][3] == curr_tag )
            begin
                hit=1;
                hit_count = hit_count +1;
                index_max=0;
                //location the recently used block
                if(lru[curr_index][1]>lru[curr_index][index_max])
                    begin
                        index_max=1;
                    end
                if(lru[curr_index][2]>lru[curr_index][index_max])
                    begin
                        index_max=2;
                    end
                if(lru[curr_index][3]>lru[curr_index][index_max])
                    begin
                        index_max=3;
                    end
                //changing the lru values of the blocks
                lru[curr_index][3]=lru[curr_index][index_max]+1;
                b_index=3;
            end   
        state=state+1;
    end
    
    if(state==1)
        begin
        
            if(hit==0)//if miss occurs,do lru replacement policy
                begin
                miss_count=miss_count+1;
                if(mshr_buffer_status[0]==0)
                    begin
                        mshr_buffer_status[0]=1;//filles mshr 
                        //mshr_counter[0]=1;//mshr clock made 1
                        mshr[0]=curr_instr;//pushing into mshr
                    end 
                else if(mshr_buffer_status[1]==0)
                    begin
                        mshr_buffer_status[1]=1;//filles mshr 
                        //mshr_counter[1]=1;//mshr clock made 1
                        mshr[1]=curr_instr;//pushing into mshr
                    end 
                else if(mshr_buffer_status[2]==0)
                    begin
                        mshr_buffer_status[2]=1;//filles mshr 
                        //mshr_counter[2]=1;//mshr clock made 1
                        mshr[2]=curr_instr;//pushing into mshr
                    end 
                else if(mshr_buffer_status[3]==0)
                    begin
                        mshr_buffer_status[3]=1;//filles mshr 
                        //mshr_counter[3]=1;//mshr clock made 1
                        mshr[3]=curr_instr;//pushing into mshr
                    end 
                end 
        state=0;
    end

end
//When mshr is not full,access and search if hit occurs or not
//mshr implementation
//counting the cycles of the instructions stalled in mshr (waits for 400 cycles)

if(mshr_buffer_status[0]==1)
        begin
            mshr_counter[0]=mshr_counter[0]+1;
        end 
if(mshr_buffer_status[1]==1)
        begin
            mshr_counter[1]=mshr_counter[1]+1;
        end 
if(mshr_buffer_status[2]==1)
        begin
            mshr_counter[2]=mshr_counter[2]+1;
        end 
if(mshr_buffer_status[3]==1)
        begin
            mshr_counter[3]=mshr_counter[3]+1;
        end 

//for(i=0;i<4;i=i+1)
//begin
//    if(mshr_buffer_status[i]==1)
//        begin
//            mshr_counter[i]=mshr_counter[i]+1;
//        end  
//end

//checking each of the mshr blocks (4)
//after waiting for 400 cycles...
if(mshr_counter[0]==400)
        begin
            //storing the mshr instruction details in variables
            curr_tag = mshr[0][31:14];
            curr_index = mshr[0][13:6];
            mshr_counter[0]=0;
            mshr_buffer_status[0]=0;
            b_index =0;
            index_max=0;
            
            //finding the last recently accessed block of the cache index
            if(lru[curr_index][1]<lru[curr_index][b_index])
            begin
                b_index=1;	
            end
            //finding the most recently accessed block in the cache index
            if(lru[curr_index][1]>lru[curr_index][index_max])
            begin
                index_max=1;
            end
            //finding the last recently accessed block of the cache index
            if(lru[curr_index][2]<lru[curr_index][b_index])
            begin
                b_index=2;	
            end
            //finding the most recently accessed block in the cache index
            if(lru[curr_index][2]>lru[curr_index][index_max])
            begin
                index_max=2;
            end
            //finding the last recently accessed block of the cache index
            if(lru[curr_index][3]<lru[curr_index][b_index])
            begin
                b_index=3;	
            end
            //finding the most recently accessed block in the cache index
            if(lru[curr_index][3]>lru[curr_index][index_max])
            begin
                index_max=3;
            end
            
//            for(j = 1; j < 4; j=j+1)
//                begin
//                    //finding the last recently accessed block of the cache index
//                    if(lru[curr_index][j]<lru[curr_index][b_index])
//                    begin
//                        b_index=j;	
//                    end
//                    //finding the most recently accessed block in the cache index
//                    if(lru[curr_index][j]>lru[curr_index][index_max])
//                    begin
//                        index_max=j;
//                    end
//                end	
            //changing the lru counters
            lru[curr_index][b_index]=lru[curr_index][index_max]+1;
            //sending the stalled instruction from mshr to the respective cache memory block
            instr[curr_index][b_index]=curr_tag;
        end
if(mshr_counter[1]==400)
        begin
            //storing the mshr instruction details in variables
            curr_tag = mshr[1][31:14];
            curr_index = mshr[1][13:6];
            mshr_counter[1]=0;
            mshr_buffer_status[1]=0;
            b_index =0;
            index_max=0;
            
            //finding the last recently accessed block of the cache index
            if(lru[curr_index][1]<lru[curr_index][b_index])
            begin
                b_index=1;	
            end
            //finding the most recently accessed block in the cache index
            if(lru[curr_index][1]>lru[curr_index][index_max])
            begin
                index_max=1;
            end
            //finding the last recently accessed block of the cache index
            if(lru[curr_index][2]<lru[curr_index][b_index])
            begin
                b_index=2;	
            end
            //finding the most recently accessed block in the cache index
            if(lru[curr_index][2]>lru[curr_index][index_max])
            begin
                index_max=2;
            end
            //finding the last recently accessed block of the cache index
            if(lru[curr_index][3]<lru[curr_index][b_index])
            begin
                b_index=3;	
            end
            //finding the most recently accessed block in the cache index
            if(lru[curr_index][3]>lru[curr_index][index_max])
            begin
                index_max=3;
            end
            
//            for(j = 1; j < 4; j=j+1)
//                begin
//                    //finding the last recently accessed block of the cache index
//                    if(lru[curr_index][j]<lru[curr_index][b_index])
//                    begin
//                        b_index=j;	
//                    end
//                    //finding the most recently accessed block in the cache index
//                    if(lru[curr_index][j]>lru[curr_index][index_max])
//                    begin
//                        index_max=j;
//                    end
//                end	
            //changing the lru counters
            lru[curr_index][b_index]=lru[curr_index][index_max]+1;
            //sending the stalled instruction from mshr to the respective cache memory block
            instr[curr_index][b_index]=curr_tag;
        end
if(mshr_counter[2]==400)
        begin
            //storing the mshr instruction details in variables
            curr_tag = mshr[2][31:14];
            curr_index = mshr[2][13:6];
            mshr_counter[2]=0;
            mshr_buffer_status[2]=0;
            b_index =0;
            index_max=0;
            
            //finding the last recently accessed block of the cache index
            if(lru[curr_index][1]<lru[curr_index][b_index])
            begin
                b_index=1;	
            end
            //finding the most recently accessed block in the cache index
            if(lru[curr_index][1]>lru[curr_index][index_max])
            begin
                index_max=1;
            end
            //finding the last recently accessed block of the cache index
            if(lru[curr_index][2]<lru[curr_index][b_index])
            begin
                b_index=2;	
            end
            //finding the most recently accessed block in the cache index
            if(lru[curr_index][2]>lru[curr_index][index_max])
            begin
                index_max=2;
            end
            //finding the last recently accessed block of the cache index
            if(lru[curr_index][3]<lru[curr_index][b_index])
            begin
                b_index=3;	
            end
            //finding the most recently accessed block in the cache index
            if(lru[curr_index][3]>lru[curr_index][index_max])
            begin
                index_max=3;
            end
            
//            for(j = 1; j < 4; j=j+1)
//                begin
//                    //finding the last recently accessed block of the cache index
//                    if(lru[curr_index][j]<lru[curr_index][b_index])
//                    begin
//                        b_index=j;	
//                    end
//                    //finding the most recently accessed block in the cache index
//                    if(lru[curr_index][j]>lru[curr_index][index_max])
//                    begin
//                        index_max=j;
//                    end
//                end	
            //changing the lru counters
            lru[curr_index][b_index]=lru[curr_index][index_max]+1;
            //sending the stalled instruction from mshr to the respective cache memory block
            instr[curr_index][b_index]=curr_tag;
        end
if(mshr_counter[3]==400)
        begin
            //storing the mshr instruction details in variables
            curr_tag = mshr[3][31:14];
            curr_index = mshr[3][13:6];
            mshr_counter[3]=0;
            mshr_buffer_status[3]=0;
            b_index =0;
            index_max=0;
            
            //finding the last recently accessed block of the cache index
            if(lru[curr_index][1]<lru[curr_index][b_index])
            begin
                b_index=1;	
            end
            //finding the most recently accessed block in the cache index
            if(lru[curr_index][1]>lru[curr_index][index_max])
            begin
                index_max=1;
            end
            //finding the last recently accessed block of the cache index
            if(lru[curr_index][2]<lru[curr_index][b_index])
            begin
                b_index=2;	
            end
            //finding the most recently accessed block in the cache index
            if(lru[curr_index][2]>lru[curr_index][index_max])
            begin
                index_max=2;
            end
            //finding the last recently accessed block of the cache index
            if(lru[curr_index][3]<lru[curr_index][b_index])
            begin
                b_index=3;	
            end
            //finding the most recently accessed block in the cache index
            if(lru[curr_index][3]>lru[curr_index][index_max])
            begin
                index_max=3;
            end
            
//            for(j = 1; j < 4; j=j+1)
//                begin
//                    //finding the last recently accessed block of the cache index
//                    if(lru[curr_index][j]<lru[curr_index][b_index])
//                    begin
//                        b_index=j;	
//                    end
//                    //finding the most recently accessed block in the cache index
//                    if(lru[curr_index][j]>lru[curr_index][index_max])
//                    begin
//                        index_max=j;
//                    end
//                end	
            //changing the lru counters
            lru[curr_index][b_index]=lru[curr_index][index_max]+1;
            //sending the stalled instruction from mshr to the respective cache memory block
            instr[curr_index][b_index]=curr_tag;
        end

//for(i=0;i<4;i=i+1)
//begin
//    if(mshr_counter[i]==400)
//        begin
//            //storing the mshr instruction details in variables
//            curr_tag = mshr[i][31:14];
//            curr_index = mshr[i][13:6];
//            mshr_counter[i]=0;
//            mshr_buffer_status[i]=0;
//            b_index =0;
//            index_max=0;
            
//            for(j = 1; j < 4; j=j+1)
//                begin
//                    //finding the last recently accessed block of the cache index
//                    if(lru[curr_index][j]<lru[curr_index][b_index])
//                    begin
//                        b_index=j;	
//                    end
//                    //finding the most recently accessed block in the cache index
//                    if(lru[curr_index][j]>lru[curr_index][index_max])
//                    begin
//                        index_max=j;
//                    end
//                end	
//            //changing the lru counters
//            lru[curr_index][b_index]=lru[curr_index][index_max]+1;
//            //sending the stalled instruction from mshr to the respective cache memory block
//            instr[curr_index][b_index]=curr_tag;
//        end
//end
////end of mshr implementation
end
//end of always

endmodule