`timescale  1 ns / 1 ps

module Control_VGA(clk, reset, swcolors, sw_timer, sw_fecha, sw_hora, sw_formato, boton_edit, h_sync, v_sync, colors_out, data_out, control);//, counter_x_sync,);//, counter_x_sync, switches, boton_ed, ctrl_ed, pixel_x, pixel_y, dato_print, char_addr, pos);

input clk, reset, swcolors, sw_timer, sw_formato, sw_fecha, sw_hora, boton_edit;
output  h_sync, v_sync, colors_out, control; 
inout data_out; //counter_x_sync, switches, boton_ed, ctrl_ed, pixel_x, pixel_y, dato_print, char_addr, pos;

reg [1:0] r_reg;
wire [2:0] switches;
wire [1:0] r_nxt;
reg clk_track;
wire [8:0] pixel_y;
wire [9:0] pixel_x;
reg [9:0] counter_x;
reg [8:0] counter_y;
wire clk_out;
reg [9:0] counter_x_sync;
reg [9:0] counter_y_sync;
reg video_on;
wire v_sync, h_sync, video_on_out;
wire [2:0] swcolors;
wire clk_cnt, font_bitw;
wire [2:0] colors_out;
reg font_bit;
wire [9:0] a;
wire [9:0] b;
reg comp;
wire [3:0] boton_ed;
wire [3:0] boton_edit;
wire ctrl_ed;
wire [3:0] dato_print;
wire [6:0] char_addr;
wire [3:0] pos;
wire [3:0] control;

//boton[0] = Up
//boton[1] = Down
//boton[2] = pos_izq
//boton[3] = pos_der

Caracter_gen generator (.pixel_x(pixel_x),.pixel_y(pixel_y),.clk(clk),.video_on_out(video_on_out),.swcolors(swcolors),.sw_timer(sw_timer),.sw_fecha(sw_fecha),.sw_hora(sw_hora),.boton_ed(boton_ed),.colors_out(colors_out),.switches(switches),.ctrl_ed(ctrl_ed),.char_addr(char_addr),.pos(pos),.dato_print(dato_print));

debounce deb1(.clk(clk),.signalInput(boton_edit[0]),.signalOutput(boton_ed[0]),.reset(reset));
debounce deb2(.clk(clk),.signalInput(boton_edit[1]),.signalOutput(boton_ed[1]),.reset(reset));
debounce deb3(.clk(clk),.signalInput(boton_edit[2]),.signalOutput(boton_ed[2]),.reset(reset));
debounce deb4(.clk(clk),.signalInput(boton_edit[3]),.signalOutput(boton_ed[3]),.reset(reset));

always @(posedge clk or posedge reset)
 
begin
  if (reset)
     begin
        r_reg <= 2'b0;
	    clk_track <= 1'b0;  
     end
  else
  begin 
      if (r_nxt == 2'b10)
           begin
             r_reg <= 0;
             clk_track <= ~clk_track;
             comp <= ~clk_track;
           end
      else
      begin 
          r_reg <= r_nxt;
          comp <= 0;
      end
    end
end

assign r_nxt = r_reg+1;   	      
assign clk_out = clk_track;
assign clk_cnt = comp;

always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        counter_x_sync <= 10'b0;
        counter_y_sync <= 10'b0; 
        video_on <= 1'b0;      
    end
    else
    begin
        if (clk_out && clk_cnt)	
        begin
            counter_x_sync <= counter_x_sync + 1;
            if (counter_x_sync == 799)
            begin
                if (counter_y_sync == 524)
                begin
                    counter_y_sync <= 10'b0;
                    counter_x_sync <= 10'b0;
                end
                else
                begin
                    counter_y_sync <= counter_y_sync + 1;
                    counter_x_sync <= 10'b0;   
                end         
            end     
        end
        
    end
end
 
assign a = counter_x_sync;
assign b = counter_y_sync;
assign h_sync = ~(counter_x_sync >= 703 && counter_x_sync <= 799);
assign v_sync = ~(counter_y_sync > 522 && counter_y_sync <= 524);  
assign video_on_out = ((counter_y_sync >= 33 && counter_y_sync <= 512)&&(counter_x_sync >= 48 && counter_x_sync <= 687)); 

always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        counter_x <= 10'b0;
        counter_y <= 9'b0;   
    end
    else 
    begin
        if (clk_out && video_on_out && clk_cnt)
        begin
            counter_x = counter_x + 1;
            if (counter_x == 640)
            begin
                if (counter_y== 479)
                begin
                    counter_y <= 10'b0;
                    counter_x <= 10'b0;
                end
                else
                begin
                    counter_y <= counter_y+ 1;
                    counter_x <= 10'b0;   
                end 
            end               
        end
    end 
end

assign pixel_x = counter_x;
assign pixel_y = counter_y;

endmodule
