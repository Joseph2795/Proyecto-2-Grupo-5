`timescale 1ns / 1ps
module FSM_pr(date, stime, timer, clk, control, reset, AD, state, contador, v_sync, control_dato_lectura);

    parameter stnd = 4'b0000;     
    parameter read = 4'b0001;
    parameter read11 = 4'b0010;
    parameter read1 = 4'b0011;
    parameter read12 = 4'b0100;
    parameter read2 = 4'b0101;
    parameter read3 = 4'b0110;
    parameter read4 = 4'b0111;      
    parameter formato = 4'b1000; 
    
    input date, stime, timer, clk, reset, state, v_sync;
    output control, AD, contador, control_dato_lectura;
    reg [3:0] actuals = stnd;
    reg [3:0] control;
    reg [5:0] counter;
    reg [7:0] contador;
    reg [7:0] AD;
    reg control_dir_lect;
    reg control_dato_lectura;
    wire [2:0] state; 
    
    wire orstate;
    assign orstate = date | stime | timer;       
   /*Control
   control[3] = CS
   control[2] = AD
   control[1] = RD
   control[0] = WR
   */
always @(posedge clk)
begin
    if (reset)
    begin
        counter <= 6'b0;
    end
    else
    begin
        if (orstate == 0 && counter <= 39 && state == 3)
        begin
            counter <= counter + 1;        
        end
        else
        begin
            counter <= 6'b0;
        end
    end
end 

always @(posedge clk)
   if (v_sync) 
   begin
       contador = 7'b00100000;
   end
   else if (counter == 0 && orstate == 0 && state == 3) begin
       if (contador < 67) begin
           if (contador == 38) begin
               contador = 65;
           end
           else begin
               contador = contador + 1;
           end
       end
       else begin
           contador = 68;
       end
   end       

always @(posedge clk)
    begin 
        case(actuals)
        stnd : begin 
        if (orstate == 1 || state != 3)
        begin
            actuals <= stnd;
            control <= 4'b0000;
        end
        else
            actuals <= read;
        end    
        read : begin
            if (counter >= 0 && counter <= 3)
                begin
                    actuals <= read;
                    control <= 4'b1111;
                end
            else 
                actuals <= read11;
            end               
        read11 : begin                
                if (counter >= 6'b000100 && counter <= 6'b000101)
                    begin   
                        actuals <= read11;
                        control <= 4'b1011;
                    end
                else
                    actuals <= read1;
                end
        read1 : begin                
            if (counter >= 6'b000110 && counter <= 6'b001011)
                begin   
                    actuals <= read1;
                    control <= 4'b0000;
                end
            else
                actuals <= read12;
            end
        read12 : begin                
            if (counter >= 6'b001100 && counter <= 6'b001101)
                begin   
                    actuals <= read12;
                    control <= 4'b1011;
                end
            else
                actuals <= read2;
            end
        read2 : begin
            if (counter >= 6'b001110 && counter <= 6'b011001)
                begin
                    actuals <= read2;
                    control <= 4'b1111;
                end    
            else 
                actuals <= read3;
            end
      read3 : begin
            if (counter >= 6'b011010 && counter <= 6'b011111)
                begin
                    actuals <= read3;
                    control <= 4'b0101;
                end                
            else 
                actuals <= read4;
            end           
     read4 : begin
            if (counter >= 6'b100000 && counter <= 6'b101000)
                begin
                    actuals <= read4;
                    control <= 4'b1111;
                end
            else
                actuals <= read;
            end
        endcase
     end
           
always@(posedge clk)
    if  (counter >= 10 && counter <= 16 && orstate==0)
        begin 
           AD <= contador; 
           control_dir_lect <= 1;
           control_dato_lectura <= 0;
        end
    else if  (counter >= 32 && counter <= 34 && orstate==0)
        begin 
           AD <= 8'bz; 
           control_dato_lectura <= 1;
           control_dir_lect <= 1;
        end
    else 
        begin
            control_dir_lect <= 0;
            AD <= 8'bz;
            control_dato_lectura <= 0;
        end          

endmodule