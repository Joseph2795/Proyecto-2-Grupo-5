`timescale  1 ns / 1 ps
module Caracter_gen(pixel_x, pixel_y, clk, video_on_out, swcolors, sw_timer, sw_fecha, sw_hora, colors_out, boton_ed, switches, ctrl_ed, char_addr, pos, dato_print);

input clk, video_on_out, sw_hora, sw_fecha, sw_timer, boton_ed;
output [2:0] colors_out;
output switches, dato_print;
input [8:0] pixel_y;
input [9:0] pixel_x;
input [2:0] swcolors;
output ctrl_ed, char_addr, pos;

reg [6:0] char_addr;
wire [2:0] switches;
wire [3:0] row_addr;
wire [10:0] rom_addr;
wire [2:0] bit_addr;
wire [7:0] font_word;
reg font_bit;
wire font_bitw;
reg [2:0] colors;
reg ctrl_fondo = 0;
reg [2:0] caracter = 3'b111;
wire [1:0] FSMedit;
wire [1:0] FSMpos;
wire [3:0] boton_ed;
reg ctrl_edit;
wire ctrl_ed;
reg [3:0] pos;
wire [7:0] data_R;
reg [3:0] dato_print;

ROM_RTC data_RTC (.addr(pos),.data(data_R));

ROM font_unit(
.addr(rom_addr), 
.data(font_word)
);

FSM_pantalla ctrl_p (.clk(clk),.reset(reset),.sw_timer(sw_timer),.sw_fecha(sw_fecha),.sw_hora(sw_hora),.boton_ed(boton_ed),.FSMedit(FSMedit),.FSMpos(FSMpos),.switches(switches));

assign row_addr=pixel_y[4:1];
assign rom_addr={char_addr,row_addr};
assign bit_addr=pixel_x[3:1];
assign colors_out = colors;
assign font_bitw = font_bit;
assign ctrl_ed = ctrl_edit;

always @*
begin
    if (~(1 < pixel_x[9:4] && pixel_x[9:4] < 38) || pixel_y[8:5] == 0 || pixel_y[8:5] == 14)
        begin
            ctrl_fondo <= 1;    
        end 
    else if ((10 <= pixel_x[9:4] && pixel_x[9:4] <= 29) && (2 <= pixel_y[8:5] &&  pixel_y[8:5] <= 5))
        begin
            ctrl_fondo <= 1;
        end 
    else if ((4 <= pixel_x[9:4] && pixel_x[9:4] <= 15) && (9 <= pixel_y[8:5] && pixel_y[8:5] <= 12))
        begin
            ctrl_fondo <= 1;
        end 
    else if ((24 <= pixel_x[9:4] && pixel_x[9:4] <= 35) && (9 <= pixel_y[8:5] && pixel_y[8:5] <= 12))
        begin
            ctrl_fondo <= 1;
        end 
    else
        begin
            ctrl_fondo <= 0;
        end
end

always @*
begin
    if ((pixel_x[9:4] == 16 || pixel_x[9:4] == 17) && pixel_y[8:5] == 4 && FSMedit == 3 && FSMpos == 1)//Editando_hora
        begin
            ctrl_edit <= 1;   
        end 
    else if ((pixel_x[9:4] == 19 || pixel_x[9:4] == 20) && pixel_y[8:5] == 4 && FSMedit == 3 && FSMpos == 2)//
        begin
            ctrl_edit <= 1; 
        end           
    else if ((pixel_x[9:4] == 22 || pixel_x[9:4] == 23) && pixel_y[8:5] == 4 && FSMedit == 3 && FSMpos == 3)//
        begin
            ctrl_edit <= 1;
        end 
    else if ((pixel_x[9:4] == 5 || pixel_x[9:4] == 6) && pixel_y[8:5] == 11 && FSMedit == 2 && FSMpos == 1)//Editando_fecha
        begin
            ctrl_edit <= 1; 
        end 
    else if ((pixel_x[9:4] == 8 || pixel_x[9:4] == 9) && pixel_y[8:5] == 11 && FSMedit == 2 && FSMpos == 2)//
        begin
            ctrl_edit <= 1; 
        end           
    else if ((pixel_x[9:4] == 12 || pixel_x[9:4] == 13 || pixel_x[9:4] == 11 || pixel_x[9:4] == 14) && pixel_y[8:5] == 11 && FSMedit == 2 && FSMpos == 3)//
        begin
            ctrl_edit <= 1; 
        end
    else if ((pixel_x[9:4] == 26 || pixel_x[9:4] == 27) && pixel_y[8:5] == 11 && FSMedit == 1 && FSMpos == 1)//Editando_timer
            begin
            ctrl_edit <= 1;   
            end 
    else if ((pixel_x[9:4] == 29 || pixel_x[9:4] == 30) && pixel_y[8:5] == 11 && FSMedit == 1 && FSMpos == 2)//
        begin
            ctrl_edit <= 1; 
        end           
    else if ((pixel_x[9:4] == 32 || pixel_x[9:4] == 33) && pixel_y[8:5] == 11 && FSMedit == 1 && FSMpos == 3)//
        begin
            ctrl_edit <= 1;
        end
    else
        begin
            ctrl_edit <= 0;
        end
end

//BEGIN - CAMBIO DE CARACTER

always @*
begin
    if (pixel_x[9:4] == 16 && pixel_y[8:5] == 4)//Editando_hora
        begin
             pos <= 2;
             dato_print <= data_R[7:4];
        end 
    else if (pixel_x[9:4] == 17 && pixel_y[8:5] == 4)//Editando_hora
        begin
             pos <= 2;
             dato_print <= data_R[3:0];
        end 
    else if (pixel_x[9:4] == 19 && pixel_y[8:5] == 4)//Editando_hora
        begin
             pos <= 1;
             dato_print <= data_R[7:4];
        end 
    else if (pixel_x[9:4] == 20 && pixel_y[8:5] == 4)//Editando_hora
        begin
             pos <= 1;  
             dato_print <= data_R[3:0];         
        end 
    else if (pixel_x[9:4] == 22 && pixel_y[8:5] == 4)//Editando_hora
        begin
             pos <= 0;
             dato_print <= data_R[7:4];
        end 
    else if (pixel_x[9:4] == 23 && pixel_y[8:5] == 4)
        begin
             pos <= 0;
             dato_print <= data_R[3:0];
        end 
    else if (pixel_x[9:4] == 26 && pixel_y[8:5] == 11)
        begin
             pos <= 8;
             dato_print <= data_R[7:4];
        end 
    else if (pixel_x[9:4] == 27 && pixel_y[8:5] == 11)
        begin
             pos <= 8;
             dato_print <= data_R[3:0];
        end
    else if (pixel_x[9:4] == 29 && pixel_y[8:5] == 11)
        begin
             pos <= 7;
             dato_print <= data_R[7:4];
        end 
    else if (pixel_x[9:4] == 30 && pixel_y[8:5] == 11)
        begin
             pos <= 7;
             dato_print <= data_R[3:0];
        end 
    else if (pixel_x[9:4] == 32 && pixel_y[8:5] == 11)
        begin
             pos <= 6;
             dato_print <= data_R[7:4];
        end 
    else if (pixel_x[9:4] == 33 && pixel_y[8:5] == 11)
        begin
             pos <= 6;
             dato_print <= data_R[3:0];
        end 
    else if (pixel_x[9:4] == 5 && pixel_y[8:5] == 11)
        begin
             pos <= 5;
             dato_print <= data_R[7:4];
        end 
    else if (pixel_x[9:4] == 6 && pixel_y[8:5] == 11)
        begin
             pos <= 5;
             dato_print <= data_R[3:0];
        end 
    else if (pixel_x[9:4] == 8 && pixel_y[8:5] == 11)
        begin
             pos <= 4;
             dato_print <= data_R[7:4];
        end 
    else if (pixel_x[9:4] == 9 && pixel_y[8:5] ==11)
        begin
             pos <= 4;
             dato_print <= data_R[3:0];
        end
    else if (pixel_x[9:4] == 11 && pixel_y[8:5] == 11)
        begin
             pos <= 3;
             dato_print <= data_R[7:4];
        end 
    else if (pixel_x[9:4] == 12 && pixel_y[8:5] == 11)
        begin
             pos <= 3;
             dato_print <= data_R[7:4];
        end
    else if (pixel_x[9:4] == 13 && pixel_y[8:5] == 11)
        begin
             pos <= 3;
             dato_print <= data_R[7:4];
        end 
    else if (pixel_x[9:4] == 14 && pixel_y[8:5] == 11)
        begin
             pos <= 3;
             dato_print <= data_R[3:0];
        end   
    else
        begin
            pos <= 9;
            dato_print <= data_R[3:0];
        end 
end

//END - CAMBIO DE CARACTER

always @ *
begin
if (pos == 9)
begin
    if (pixel_x[9:4] == 18 && pixel_y[8:5] == 2)//h
        begin
            char_addr <= 7'h48;   
        end 
    else if (pixel_x[9:4] == 19 && pixel_y[8:5] == 2)//o
        begin
            char_addr <= 7'h4f;        
        end 
    else if (pixel_x[9:4] == 20 && pixel_y[8:5] == 2)//r
        begin
            char_addr <= 7'h52;        
        end 
    else if (pixel_x[9:4] == 21 && pixel_y[8:5] == 2)//a
        begin
            char_addr <= 7'h41;        
        end 
    else if (pixel_x[9:4] == 25 && pixel_y[8:5] == 9)//c
        begin
            char_addr <= 7'h43;   
        end 
    else if (pixel_x[9:4] == 26 && pixel_y[8:5] == 9)//r
        begin
            char_addr <= 7'h52;        
        end 
    else if (pixel_x[9:4] == 27 && pixel_y[8:5] == 9)//o
        begin
            char_addr <= 7'h4f;        
        end 
    else if (pixel_x[9:4] == 28 && pixel_y[8:5] == 9)//n
        begin
            char_addr <= 7'h4e;        
        end 
    else if (pixel_x[9:4] == 29 && pixel_y[8:5] == 9)//o
        begin
            char_addr <= 7'h4f;   
        end 
    else if (pixel_x[9:4] == 30 && pixel_y[8:5] == 9)//m
        begin
            char_addr <= 7'h4d;        
        end 
    else if (pixel_x[9:4] == 31 && pixel_y[8:5] == 9)//e
        begin
            char_addr <= 7'h45;        
        end 
    else if (pixel_x[9:4] == 32 && pixel_y[8:5] == 9)//t
        begin
            char_addr <= 7'h54;        
        end 
    else if (pixel_x[9:4] == 33 && pixel_y[8:5] == 9)//r
        begin
            char_addr <= 7'h52;   
        end 
    else if (pixel_x[9:4] == 34 && pixel_y[8:5] == 9)//o
        begin
            char_addr <= 7'h4f;        
        end 
    else if (pixel_x[9:4] == 7 && pixel_y[8:5] == 9)//f
        begin
            char_addr <= 7'h46;        
        end 
    else if (pixel_x[9:4] == 8 && pixel_y[8:5] == 9)//e
        begin
            char_addr <= 7'h45;        
        end 
    else if (pixel_x[9:4] == 9 && pixel_y[8:5] == 9)//c
        begin
            char_addr <= 7'h43;        
        end 
    else if (pixel_x[9:4] == 10 && pixel_y[8:5] == 9)//h
        begin
            char_addr <= 7'h48;   
        end 
    else if (pixel_x[9:4] == 11 && pixel_y[8:5] == 9)//a
        begin
            char_addr <= 7'h41;        
        end 
    //SEPARADORES
    else if ((pixel_x[9:4] == 18 || pixel_x[9:4] == 21) && pixel_y[8:5] == 4)//:
        begin
            char_addr <= 7'h3a;   
        end 
    else if ((pixel_x[9:4] == 28 || pixel_x[9:4] == 31) && pixel_y[8:5] == 11)//:
        begin
            char_addr <= 7'h3a;        
        end 
    else if ((pixel_x[9:4] == 7 || pixel_x[9:4] == 10) && pixel_y[8:5] == 11)//'/'
        begin
            char_addr <= 7'h2f;   
        end
    //SI NINGUNO CUMPLE 
    else if ((pixel_x[9:4] == 7 || pixel_x[9:4] == 10) && pixel_y[8:5] == 11)//'/'
        begin
            char_addr <= 7'h2f;   
        end
    else if ((pixel_x[9:4] == 7 || pixel_x[9:4] == 10) && pixel_y[8:5] == 11)//'/'
        begin
            char_addr <= 7'h2f;   
        end  
    else
        begin
            char_addr <= 7'h20;
        end
end                          
else
    begin
    if (dato_print == 0)   
        begin
            char_addr <= 7'h30;
        end 
    else if (dato_print == 1)   
        begin
            char_addr <= 7'h31;
        end           
    else if (dato_print == 2)   
        begin
            char_addr <= 7'h32;
        end 
    else if (dato_print == 3)   
        begin
            char_addr <= 7'h33;
        end 
    else if (dato_print == 4)   
        begin
            char_addr <= 7'h34;
        end 
    else if (dato_print == 5)   
        begin
            char_addr <= 7'h35;
        end           
    else if (dato_print == 6)   
        begin
            char_addr <= 7'h36;
        end 
    else if (dato_print == 7)   
        begin
            char_addr <= 7'h37;
        end 
    else if (dato_print == 8)   
        begin
            char_addr <= 7'h38;
        end 
    else if (dato_print == 9)   
        begin
            char_addr <= 7'h39;
        end      
    else
        begin
            char_addr <= 7'h20;
        end    
    end
end

always @*
begin
case(bit_addr)
    3'b000: font_bit <= font_word[7];
    3'b001: font_bit <= font_word[6];
    3'b010: font_bit <= font_word[5];
    3'b011: font_bit <= font_word[4];
    3'b100: font_bit <= font_word[3];
    3'b101: font_bit <= font_word[2];
    3'b110: font_bit <= font_word[1];
    3'b111: font_bit <= font_word[0];
endcase
end

always @*
if (video_on_out == 0)
begin
    colors <= 3'b000;
end
else
    begin
    if (font_bitw == 1 && ctrl_fondo == 1 && ctrl_edit == 0)
        begin
            colors <= 3'b000;
        end
    else if (font_bitw == 1 && ctrl_edit == 1)
    begin
        colors <= 3'b111;
    end
    else if (ctrl_fondo == 1 && font_bitw == 0)
        begin
            colors <= swcolors;
        end
    else
    begin
        colors <= 3'b000;
    end
end

endmodule