`timescale 1ns / 1ps

module RTC_tb(
    );
    
    wire [1:0]out;
    reg clk, swdate, swtime, swtimer, swreset;
    
    RTC tb(
        .clk(clk), .swdate(swdate),
        .swtimer(swtimer), .swtime(swtime),
        .swreset(swreset), .out(out)
        );
        
    initial
    begin
        clk = 0;
        #5 swreset = 1;
        #10 swreset = 0;
        swdate = 0;
        swtime = 1;
        swtimer = 0;
        #150 swreset = 1;
    end
    
    always
    begin
        #10 clk = ~clk;
    end
        
endmodule
