`timescale 1ns / 1ps

module RTC(clk, swdate, swtime, swtimer, swreset, state, v_sync, ADo, control, posicion);

    input clk, swdate, swtime, swtimer, swreset, v_sync;
    output  reg [2:0]state = rst;
    output ADo, control, posicion;
         
    wire sw, reset;
    reg [7:0] ADo;
    wire [7:0] ADo_ini;
    wire [7:0] ADo_lect;
    reg [3:0] control;
    wire pass_ini;
    wire contador;
    wire [3:0] control_inicializacion;
    wire [3:0] control_lectura;
    wire [6:0] contador_inicializacion;
    wire [6:0] contador_lectura;
    reg [3:0] posicion;
    reg [3:0] posicion_lectura;
    
    assign sw = swdate | swtimer | swtime;
    assign reset = swreset;
    
    parameter rst = 3'b000;
    parameter inicializa = 3'b001;
    parameter lee = 3'b011;
    parameter waiting = 3'b010;
    parameter edita = 3'b100;
    
    always @(posedge clk)
    begin
        if (state == 1)
            control <= control_inicializacion;
        else if (state == 3)
            control <= control_lectura;
        else
            control <= 4'b0;
    end
    
    always @(posedge clk)
    begin
        if (state == 1)
        begin
            posicion <= 9;
            ADo <= ADo_ini;
        end
        else if (state == 3)
        begin
            posicion <= posicion_lectura;
            ADo <= ADo_lect;
        end
        else
        begin
            posicion <= 9;
            ADo <= 8'b0;
        end
        end
    
        always @(posedge clk)
    begin
        if (contador_lectura == 33)
        begin
            posicion_lectura <= 0;
        end
        else if (contador_lectura == 34)
        begin
            posicion_lectura <= 1;
        end
        else if (contador_lectura == 35)
        begin
            posicion_lectura <= 2;
        end
        else if (contador_lectura == 36)
        begin
            posicion_lectura <= 5;
        end
        else if (contador_lectura == 37)
        begin
            posicion_lectura <= 4;
        end
        else if (contador_lectura == 38)
        begin
            posicion_lectura <= 3;
        end
        else if (contador_lectura == 65)
        begin
            posicion_lectura <= 6;
        end
        else if (contador_lectura == 66)
        begin
            posicion_lectura <= 7;
        end
        else if (contador_lectura == 67)
        begin
            posicion_lectura <= 8;
        end
        else
        begin
            posicion_lectura <= 9;
        end
    end

    always @(posedge clk)
    begin
       if (reset) begin
            state <= inicializa;
       end
       else
            case (state)
                rst : begin
                   if (!swreset)
                      state <= rst;
                   else
                      state <= inicializa;
                end
                inicializa : begin
                   if (pass_ini)
                      state <= waiting;
                   else
                      state <= inicializa;
                end
                waiting : begin
                   if (reset)
                      state <= inicializa;
                   if (sw && !v_sync)
                      state <= edita;
                   else if (v_sync)
                      state <= lee;
                   else
                      state <= waiting;
                end
                edita : begin
                   if (sw)
                      state <= waiting;
                   else
                      state <= edita;
                end
                lee : begin
                   if (reset)
                      state <= inicializa;
                   else if (contador_lectura == 68)
                      state <= waiting;
                   else
                      state <= lee;
                end
             endcase
       end      

Inicia init (.date(swdate), .stime(swtime), .trol(state), .timer(swtimer), .clk(clk), .control(control_inicializacion), .reset(reset), .AD(ADo_ini), .pass_ini(pass_ini));

FSM_pr lee_ciclo (.date(swdate), .stime(swtime), .timer(swtimer), .clk(clk), .control(control_lectura), .reset(reset),.AD(ADo_lect), .contador(contador_lectura),.state(state),.v_sync(v_sync),);

    
endmodule
