`timescale 1ns / 1ps

module RTC(clk, swreset,out);

    input clk, swreset;
    output  reg [1:0]out;
         
    wire sw, reset;
    
    assign sw = swdate | swtimer | swtime;
    assign reset = swreset;

    reg [7:0]contador;
    //esta va a ser el contador que cambie en las distintas direcciones de hora, fecha y cronometro
    always @(posedge clk)
        if (sw) begin
            contador = 7'b00100001;
        end
        else if (out == 2) begin
            if (contador < 67) begin
                if (contador == 38) begin
                    contador = 65;
                end
                else begin 
                    contador = contador + 1;
                end
            end
            else begin
                contador = 33;
            end
        end                  
        
endmodule
