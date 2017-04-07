`timescale 1ns / 1ps

module Contadores_arriba_abajo(clk, sw, swreset, stime, timer, date, counterlr, counter_stime_s, counter_stime_m, counter_stime_h, counter_timer_s, counter_timer_m, counter_timer_h, counter_date_d, counter_date_m, counter_date_a, push_up, push_down, swformat);

input clk, sw, swreset, stime, timer, date, counterlr, push_up, push_down, swformat;
output counter_stime_s, counter_stime_m, counter_stime_h;
output counter_timer_s, counter_timer_m, counter_timer_h;
output counter_date_d, counter_date_m, counter_date_a;

reg [5:0]counter_stime_s;
reg [5:0]counter_stime_m;
reg [4:0]counter_stime_h;
reg [5:0]counter_timer_s;
reg [5:0]counter_timer_m;
reg [4:0]counter_timer_h;
reg [4:0]counter_date_d;
reg [3:0]counter_date_m;
reg [6:0]counter_date_a;
wire[4:0]counterlr;
wire push_up, push_down, swformat, sw;
 
   always @(posedge clk)
   if (swreset) begin
       counter_stime_s = 6'b0;
       counter_stime_m = 6'b0;
       counter_stime_h = 5'b0;
       counter_timer_s = 6'b0;
       counter_timer_m = 6'b0;
       counter_timer_h = 5'b0;
       counter_date_d = 5'b0;
       counter_date_m = 4'b0;
       counter_date_a = 7'b0;
   end
   else
   begin
      if (sw) begin
         //contador para el tiempo
        if (stime) begin        
            if (push_up) begin
            //contador de segundos cuando se presiona boton arriba
                if (counterlr == 1) begin
                    if (counter_stime_s < 59) begin
                        counter_stime_s = counter_stime_s + 1;
                    end
                    else begin
                        counter_stime_s = 0;
                    end
                end
            //contador de minutos cuando se presiona boton arriba
                else if (counterlr == 2) begin
                    if (counter_stime_m < 59) begin
                        counter_stime_m = counter_stime_m + 1;
                    end
                    else begin
                        counter_stime_m = 0;
                    end
                end
            //contador de horas cuando se presiona boton arriba
                else if (counterlr == 3) begin
                    if (swformat) begin  //formato 12 horas
                        if (counter_stime_h < 12) begin
                            counter_stime_h = counter_stime_h + 1;;
                        end
                        else begin 
                            counter_stime_h = 1;;
                        end
                    end
                    else begin
                        if (counter_stime_h < 23) begin
                            counter_stime_h = counter_stime_h + 1;
                        end
                        else begin
                            counter_stime_h = 0;
                        end
                    end
                end 
            end       
            else if (push_down) begin
            //contador de segundos cuando se presiona abajo
                if (counterlr == 1) begin
                    if (counter_stime_s > 0) begin
                        counter_stime_s = counter_stime_s - 1;
                    end
                    else begin
                        counter_stime_s = 59;
                    end
                end
            //contador de minutos cuando se presiona abajo
                else if (counterlr == 2) begin
                    if (counter_stime_m > 0) begin
                        counter_stime_m = counter_stime_m - 1;
                    end
                    else begin
                        counter_stime_m = 59;
                    end
                end
            //contador de horas cuando se presiona abajo
                else if (counterlr == 3) begin
                    if (swformat) begin //formato 12 horas
                        if (counter_stime_h > 1) begin
                            counter_stime_h = counter_stime_h - 1;
                        end
                        else begin 
                            counter_stime_h = 12;
                        end
                    end
                    else begin
                        if (counter_stime_h > 0) begin
                            counter_stime_h = counter_stime_h - 1;
                        end
                        else begin
                            counter_stime_h = 23;
                        end
                    end
                end
            end
        end
        //contador para la fecha    
        else if (date)
        begin
            if (push_up) begin
            //contador de dias cuando se presiona arriba
                if (counterlr == 4) begin
                    if (counter_date_d < 31) begin
                        counter_date_d = counter_date_d + 1;
                    end
                    else begin
                        counter_date_d = 1;
                    end
                end
            //contador de meses cuando se presiona arriba
                else if (counterlr == 5) begin
                    if (counter_date_m < 12) begin
                        counter_date_m = counter_date_m + 1;
                    end
                    else begin
                        counter_date_m = 1;
                    end
                end
            //contador de años cuando se presiona arriba
                else if (counterlr == 6) begin
                    if (counter_date_a < 99) begin
                        counter_date_a = counter_date_a + 1;
                    end
                    else begin
                        counter_date_a = 0;
                    end
                end 
            end        
            else if (push_down) begin
            //contador de dias cuando se presiona abajo
                if (counterlr == 4) begin
                    if (counter_date_d > 1) begin
                        counter_date_d = counter_date_d - 1;
                    end
                    else begin
                        counter_date_d = 31;
                    end
                end
            //contador de meses cuando se presiona abajo
                else if (counterlr == 5) begin
                    if (counter_date_m > 1) begin
                        counter_date_m = counter_date_m - 1;
                    end
                    else begin
                        counter_date_m = 12;
                    end
                end
            //contador de años cuando se presiona abajo
                else if (counterlr == 6) begin
                    if (counter_date_a > 0) begin
                        counter_date_a = counter_date_a - 1;
                    end
                    else begin
                        counter_date_a = 99;
                    end
                end
            end
        end           
            //contador para el cronometro
        else if (timer)
        begin        
            if (push_up) begin
            //contador de segundos cuando se presiona arriba
                if (counterlr == 1) begin
                    if (counter_timer_s < 59) begin
                        counter_timer_s = counter_timer_s + 1;
                    end
                    else begin
                        counter_timer_s = 0;
                    end
                end
            //contador de minutos cuando se presiona arriba
                else if (counterlr == 2) begin
                    if (counter_timer_m < 59) begin
                        counter_timer_m = counter_timer_m + 1;
                    end
                    else begin
                        counter_timer_m = 0;
                    end
                end
            //contador de horas cuando se presiona arriba
                else if (counterlr == 3) begin
                    if (counter_timer_h < 23) begin
                        counter_timer_h = counter_timer_h + 1;
                    end
                    else begin
                        counter_timer_h = 0;
                    end
                end 
            end        
            else if (push_down) begin
            //contador de segundos cuando se presiona abajo
                if (counterlr == 1) begin
                    if (counter_timer_s > 0) begin
                        counter_timer_s = counter_timer_s - 1;
                    end
                    else begin
                        counter_timer_s = 59;
                    end
                end
            //contador de minutos cuando se presiona abajo
                else if (counterlr == 2) begin
                    if (counter_timer_m > 0) begin
                        counter_timer_m = counter_timer_m - 1;
                    end
                    else begin
                        counter_timer_m = 59;
                    end
                end
            //contador de horas cuando se presiona abajo
                else if (counterlr == 3) begin
                    if (counter_timer_h > 0) begin
                        counter_timer_h = counter_timer_h - 1;
                    end
                    else begin
                        counter_timer_h = 23;
                    end
                end
            end
        end
    end 
          end        
endmodule
