`timescale 1ns / 1ps

module RTC(clk, swdate, swtime, swtimer, swreset,out);

    input clk, swdate, swtime, swtimer, swreset;
    output  reg [1:0]out;
         
    wire sw, reset;
    
    assign sw = swdate | swtimer | swtime;
    assign reset = swreset;
    
    parameter rst = 2'b00;
    parameter inicializa = 2'b01;
    parameter lee = 2'b10;
    parameter edita = 2'b11;
    
    reg [1:0] state = rst;

    always @(posedge clk)
       if (reset) begin
            state <= rst;
            out <= 2'b00;
       end
       else
            case (state)
                rst : begin
                   if (swreset)
                      state <= rst;
                   else
                      state <= inicializa;
                   out <= 2'b00;
                end
                inicializa : begin
                   if (sw)
                      state <= edita;
                   else
                      state <= lee;
                   out <= 2'b01;
                end
                lee : begin
                   if (sw)
                      state <= edita;
                   else
                      state <= lee;
                   out <= 2'b10;
                end
                edita : begin
                   if (sw)
                      state <= edita;
                   else
                      state <= lee;
                   out <= 2'b11;
                end
                default : begin  // Fault Recovery
                   state <= rst;
                   out <= 2'b00;
                end
             endcase

endmodule
