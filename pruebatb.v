`timescale 1ns / 1ps
module pruebatb();
    reg date, stime, timer, clk, reset;
    wire [3:0] control;
    wire [5:0] counter;
    prueba_edita list (.date(date),.stime(stime),.timer(timer),.clk(clk),.control(control),.reset(reset),.counter(counter));
    initial 
        begin
            #5 reset = 1;
            #5 reset = 0;
            clk = 0;
            stime = 1; 
            timer = 0;
            date = 0;
        end
    always
        begin
            #5 clk = ~clk;
        end             
endmodule
