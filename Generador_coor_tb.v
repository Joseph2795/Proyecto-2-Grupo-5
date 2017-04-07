`timescale  1 ns / 1 ps
module Control_VGA_tb();

integer Pantalla;

reg clk, reset, sw_hora, sw_fecha, sw_timer;
wire h_sync, v_sync;
reg [3:0] boton_edit;
reg [2:0] swcolors;
wire [2:0] colors_out;
wire [9:0] counter_x_sync;
wire [2:0] switches;
wire [3:0] boton_ed;
wire [1:0] FSMedit;
wire [1:0] FSMpos;
wire [8:0] pixel_y;
wire [9:0] pixel_x;
wire ctrl_ed;
wire [3:0] dato_print;
wire [6:0] char_addr;
wire [3:0] pos;

Control_VGA test (.clk(clk),.reset(reset),.swcolors(swcolors),.sw_timer(sw_timer),.sw_fecha(sw_fecha),.sw_hora(sw_hora),.boton_edit(boton_edit),.h_sync(h_sync),.v_sync(v_sync),.colors_out(colors_out),.counter_x_sync(counter_x_sync));//,.counter_x_sync(counter_x_sync),.switches(switches),.boton_ed(boton_ed),.ctrl_ed(ctrl_ed),.pixel_x(pixel_x),.pixel_y(pixel_y),.char_addr(char_addr),.pos(pos),.dato_print(dato_print));
//FSM_pantalla rte (.clk(clk),.reset(reset),.sw_timer(sw_timer),.sw_fecha(sw_fecha),.sw_hora(sw_hora),.boton_ed(boton_ed),.FSMedit(FSMedit),.FSMpos(FSMpos),.switches(switches));

initial 
    begin
    Pantalla = $fopen("resultados.txt", "w");
    boton_edit = 4'b0100;
    clk = 0;
    sw_hora = 0;
    sw_fecha = 1;
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
always @(counter_x_sync)
    begin
    if (counter_x_sync == 50)  
        boton_edit[2] <= 0; 
//    else if (counter_x_sync == 60)  
//            boton_edit[2] <= 1; 
//    else if (counter_x_sync == 70)  
//            boton_edit[2] <= 0; 
    end
endmodule   