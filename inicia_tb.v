`timescale 1ns / 1ps

module inicia_tb();
reg date, stime, timer, clk, reset;
wire [7:0] contador;
wire [1:0] cont;
wire [7:0] AD;
wire [3:0] control;
wire [5:0] counter;

Inicia list (.cont(cont),.contador(contador),.AD(AD),.date(date),.stime(stime),.timer(timer),.clk(clk),.control(control),.reset(reset),.counter(counter));
initial 
    begin
        #5 reset = 1;
        #5 reset = 0;
        clk = 0;
        stime = 0; 
        timer = 0;
        date = 0;
    end
always
    begin
        #5 clk = ~clk;
        
    end              
endmodule
/*
`timescale 1ns / 1ps
module lectura();
endmodule

*/