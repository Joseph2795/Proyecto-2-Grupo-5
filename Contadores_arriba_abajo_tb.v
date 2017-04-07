`timescale 1ns / 1ps

module Contadores_arriba_abajo_tb(
    );
    reg arriba, abajo, tiempo, hora, cronometro, sw, swformat, reset, clk;
    wire [5:0]counter_s;
    wire [5:0]counter_m;
    wire [4:0]counter_h;
    wire [5:0]counter_timer_s;
    wire [5:0]counter_timer_m;
    wire [4:0]counter_timer_h;
    wire [4:0]counter_date_d;
    wire [3:0]counter_date_m;
    wire [6:0]counter_date_a;
    reg [4:0]contador;
    
    Contadores_arriba_abajo tb(.clk(clk),
        .push_up(arriba),
        .push_down(abajo), .stime(hora),
        .date(tiempo), .timer(cronometro),
        .counterlr(contador), .counter_stime_s(counter_s),
        .counter_stime_m(counter_m), .counter_stime_h(counter_h),
        .sw(sw), .swformat(swformat), .counter_timer_s(counter_timer_s),
        .counter_timer_m(counter_timer_m), .counter_timer_h(counter_timer_h),
        .counter_date_d(counter_date_d), .counter_date_m(counter_date_m),
        .counter_date_a(counter_date_a), .swreset(reset)
        );
    initial
    begin
        clk = 0;
        arriba = 0;
        abajo = 1;
        hora = 1;
        tiempo = 0;
        cronometro = 0;
        contador = 3;
        swformat = 1;
        #5 reset = 1;
        #10 reset = 0;
        #5 sw = 0;
        #15 sw = 1;

    end
    
    always
    begin
        #10 clk = ~clk;   
    end
    
endmodule
