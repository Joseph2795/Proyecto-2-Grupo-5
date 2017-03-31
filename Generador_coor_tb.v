`timescale  1 ns / 1 ps
module Control_VGA_tb();

integer Pantalla;

reg clk, reset, sw_hora, sw_fecha, sw_timer;
wire h_sync, v_sync;
wire [3:0] boton_ed;
reg [2:0] swcolors;
wire [2:0] colors_out;
wire [9:0] counter_x_sync;
wire [2:0] switches;

Control_VGA test (.clk(clk),.reset(reset),.swcolors(swcolors),.sw_timer(sw_timer),.sw_fecha(sw_fecha),.sw_hora(sw_hora),.boton_ed(boton_ed),.h_sync(h_sync),.v_sync(v_sync),.colors_out(colors_out),.counter_x_sync(counter_x_sync),.switches(switches));

initial 
    begin
    Pantalla = $fopen("resultados.txt", "w");
    clk = 0;
    sw_hora = 1;
    sw_fecha = 0;
    sw_timer = 0;
    swcolors = 3'b101;
    #5 reset = 1;
    #5 reset = 0;  
    #25000000 $fclose(Pantalla);  
    end
always
    begin
        #5 clk = ~clk;
    end
always @(counter_x_sync)
    begin
        $fwrite(Pantalla,"%d \n",colors_out);
    end
endmodule   