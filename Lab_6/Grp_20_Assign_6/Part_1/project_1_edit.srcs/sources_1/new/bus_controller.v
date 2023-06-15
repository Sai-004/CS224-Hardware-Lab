`timescale 1ns / 1ps

module bus_controller(
    input wire clk,
    input wire request_M2BC,
    input wire request_P2BC,
    output reg grant_P2M,
    output reg grant_M2P
);
    initial begin
        grant_P2M=0;
        grant_M2P=0;
    end
    reg [3:0] BC_stall_ctr=0;
    
    always@(posedge clk)
    begin
        if(request_P2BC==1&&grant_M2P==0)
            begin
                grant_P2M=0;
                BC_stall_ctr=BC_stall_ctr+1;
                if(BC_stall_ctr==10)
                    begin
                        grant_P2M=1;
                        BC_stall_ctr=0;   
                    end
            end
        if(request_M2BC==1&&grant_P2M==0)
            begin
                grant_M2P=0;
                BC_stall_ctr=BC_stall_ctr+1;
                if(BC_stall_ctr==10)
                    begin
                        grant_M2P=1;
                        BC_stall_ctr=0;   
                    end
            end
    end
endmodule