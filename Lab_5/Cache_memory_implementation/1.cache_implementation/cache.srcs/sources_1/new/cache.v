`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.04.2023 13:37:41
// Design Name: 
// Module Name: cache
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ccache(input wire [31:0] address,input wire clk,output reg [20:0] hits,output reg [10:0] misses,output reg [3:0] present);
reg [17 : 0] cachee [255:0][3 : 0]; 
reg [17 :0] lru [255:0][3:0];
reg mshrfull,hitormiss;
reg [31:0] queue [1000:0];
//to initialize tags
integer i=0;
integer j=0;
initial begin
    hits=0;
    misses=0;
    hitormiss=0;
    for(i=0;i<256;i=i+1)
    begin
    for(j=0;j<4;j=j+1)
    begin
    cachee[i][j]=-1;
    lru[i][j]=0;
    end 
    end
    present[0]=0;
    present[1]=0;
    present[2]=0;
    present[3]=0;
end
reg [9:0] mshrclk [3:0];
initial begin
    for(i=0;i<4;i=i+1)
    begin
    mshrclk[i]=0;
    end   
end
reg [31:0] mshr [3:0];
reg [17:0] currtag;
reg [7:0] currindex;
reg [31:0] curraddress;
reg[1:0] blockindex;
reg[1:0] maxindex;
reg [10:0] front=0;
reg [10:0] back=0;
always@(posedge clk)
begin
queue[front]=address;
front=front+1;

if(present!=4'b1111)//if mshr is not full
mshrfull=0;
else
mshrfull=1;
if(mshrfull!=1&&front!=back)
begin
curraddress=queue[back];
currtag = queue[back][31:14];
currindex = queue[back][13:6];
back=back+1;
hitormiss=0;
//for hit cases
//hit handling
    if(cachee[currindex][0] == currtag )
    begin
    hitormiss=1;
    hits = hits +1;
    lru[currindex][0] = lru[currindex][0]+1;
    blockindex=0;
    end
    else if(cachee[currindex][1] == currtag )
    begin
    hitormiss=1;
    hits = hits +1;
    lru[currindex][1] = lru[currindex][1]+1;
    blockindex=1;
    end   
    else if(cachee[currindex][2] == currtag )
    begin
    hitormiss=1;
    hits = hits +1;
    lru[currindex][2] = lru[currindex][2]+1;
    blockindex=2;
    end  
    else if(cachee[currindex][3] == currtag )
    begin
    hitormiss=1;
    hits = hits +1;
    lru[currindex][3] = lru[currindex][3]+1;
    blockindex=3;
    end   
if(hitormiss==0)//if miss occurs,do lru replacement policy
begin
misses=misses+1;
if(present[0]==0)
begin
present[0]=1;//filles mshr 
mshrclk[0]=1;//mshr clock made 1
mshr[0]=curraddress;//pushing into mshr
end 
else if(present[1]==0)
begin
present[1]=1;//filles mshr 
mshrclk[1]=1;//mshr clock made 1
mshr[1]=curraddress;//pushing into mshr
end 
else if(present[2]==0)
begin
present[2]=1;//filles mshr 
mshrclk[2]=1;//mshr clock made 1
mshr[2]=curraddress;//pushing into mshr
end 
else if(present[3]==0)
begin
present[3]=1;//filles mshr 
mshrclk[3]=1;//mshr clock made 1
mshr[3]=curraddress;//pushing into mshr
end 
end 
end //for when mshr is not full,access and search for hit or miss occurs
//mshr implementation


if(present[0]==1)
begin
mshrclk[0]=mshrclk[0]+1;
end    
if(present[1]==1)
begin
mshrclk[1]=mshrclk[1]+1;
end 
if(present[2]==1)
begin
mshrclk[2]=mshrclk[2]+1;
end 
if(present[3]==1)
begin
mshrclk[3]=mshrclk[3]+1;
end 


if(mshrclk[0]==400)
begin
currtag = mshr[0][31:14];
currindex = mshr[0][13:6];
mshrclk[0]=0;
present[0]=0;
blockindex =0;
maxindex=0;
for(i = 1; i < 4; i=i+1)
begin
if(lru[currindex][i]<lru[currindex][blockindex])
begin
 blockindex=i;	
end
if(lru[currindex][i]>lru[currindex][maxindex])
begin
maxindex=i;
end
end	
lru[currindex][blockindex]=lru[currindex][maxindex]+1;
cachee[currindex][blockindex]=currtag;
end


if(mshrclk[1]==400)
begin
currtag = mshr[1][31:14];
currindex = mshr[1][13:6];
mshrclk[1]=0;
present[1]=0;
blockindex =0;
maxindex=0;

for(i = 1; i < 4; i=i+1)
begin
if(lru[currindex][i]<lru[currindex][blockindex])
begin
 blockindex=i;	
end
if(lru[currindex][i]>lru[currindex][maxindex])
begin
maxindex=i;
end
end	
lru[currindex][blockindex]=lru[currindex][maxindex]+1;
cachee[currindex][blockindex]=currtag;
end


if(mshrclk[2]==400)
begin
currtag = mshr[2][31:14];
currindex = mshr[2][13:6];
mshrclk[2]=0;
present[2]=0;
blockindex =0;
maxindex=0;
for(i = 1; i < 4; i=i+1)
begin
if(lru[currindex][i]<lru[currindex][blockindex])
begin
 blockindex=i;	
end
if(lru[currindex][i]>lru[currindex][maxindex])
begin
maxindex=i;
end
end	
lru[currindex][blockindex]=lru[currindex][maxindex]+1;
cachee[currindex][blockindex]=currtag;
end


if(mshrclk[3]==400)
begin
currtag = mshr[3][31:14];
currindex = mshr[3][13:6];
mshrclk[3]=0;
present[3]=0;
blockindex =0;
maxindex=0;
for(i = 1; i < 4; i=i+1)
begin
if(lru[currindex][i]<lru[currindex][blockindex])
begin
 blockindex=i;	
end
if(lru[currindex][i]>lru[currindex][maxindex])
begin
maxindex=i;
end
end	
lru[currindex][blockindex]=lru[currindex][maxindex]+1;
cachee[currindex][blockindex]=currtag;
end


//end of mshr implementation





end//always end
endmodule
