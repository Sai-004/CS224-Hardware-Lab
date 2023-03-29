`timescale 1ns / 1ps

(* use_dsp="Yes" *)module VDPU(
    input clk,                  // clock
    inout [7:0] DIO,            // 8-bit data input/output DIO
    output reg [1:0] status     // status output
    );
    reg [2:0] mode_sel;         // 2bits for mode selection, other 2bits for X,Y selection
    integer state_sel;          // VDPU state selection
    reg [4:0] ctr;              // counter
    reg [7:0] X [0:15];         // Vector X
    reg [7:0] Y [0:15];         // Vector Y
    reg [15:0] S;               // Output S
    reg [7:0] out;              // displaying 8-bit output
    integer i;                  // constant
    
    initial         // initialising all the required values
    begin
        state_sel=0;
        ctr =0;
        mode_sel =0;
        S = 0;
        out = 0;
        status = 0;
        for(i=0;i<16;i=i+1)
        begin
            X[i] <= 8'b0;
        end
        for(i=0;i<16;i=i+1)
        begin
            Y[i] <= 8'b0;
        end
    end
    assign DIO = (state_sel == 4)? out: 8'bz;

    always @(posedge clk) begin
    
            // Working State (Idle/before input)
            if(state_sel == 0)
                begin
                    if(DIO[7:4] == 4'b1111 && ctr == 0) begin       // 1111XXXX for GO signal
                        mode_sel <= DIO[3:1];
                        state_sel <= 1;
                        ctr <= 1;
                        status <= 2'b01;
                        out <= 0;
                    end
                    else
                        status <= 2'b00;
                end

            // Read LSB of S    
            else if (state_sel == 1)
                begin
                    if(ctr == 1) begin
                        S[7:0] <= DIO;
                        ctr <= 2;
                        state_sel <= 2;
                    end
                end

             // Read MSB of S
             else if (state_sel == 2)
                begin
                    if(ctr == 2) begin
                        S[15:8] <= DIO;
                        ctr <= 3;
                        state_sel <= 3;
                    end
                end

             // Computation of S
             else if (state_sel == 3)
                begin
                    if(ctr >= 3 || ctr <= 18) begin
                        case (mode_sel[2:1])
                            2'b01: begin                   //DATA_READY_MODE
                                S = S + (X[ctr-3]*Y[ctr-3]);
                                if (ctr == 18) begin                                    
                                    status = 2'b10;
                                    out <= S[7:0];
                                    state_sel = 4;
                                end
                                ctr = ctr + 1'b1;
                            end
                            2'b10: begin                   //PARTIAL_READY_MODE
                                if (mode_sel[0:0]==1'b0)
                                    X[ctr-3] = DIO;
                                else
                                    Y[ctr-3] = DIO;
                                S = S + (X[ctr-3]*Y[ctr-3]);
                                if (ctr == 18) begin                                    
                                    status = 2'b10;
                                    out <= S[7:0];
                                    state_sel = 4;
                                end
                                ctr = ctr + 1'b1;
                            end
                            2'b11: begin                   //DATA_TRANSFER_MODE
                                if (mode_sel[0:0]==1'b0)
                                    X[ctr-3] = DIO;
                                else
                                    Y[ctr-3] = DIO;
                                if (ctr == 18) begin                                    
                                    status = 2'b10;
                                    state_sel = 4;
                                end
                                ctr = ctr + 1'b1;
                            end
                        endcase
                    end
                end
                
                // Diaplaying S output
                else if (state_sel == 4)
                begin
                    if(ctr == 19) begin
                        out <= S[15:8];
                        status <= 2'b11;
                        ctr <= ctr + 1'b1;
                    end
                    else if(ctr == 20) begin
                        out <= 0;
                        status <= 0;
                        ctr <= 0;
                        state_sel <= 0;
                    end
                end
    end
endmodule