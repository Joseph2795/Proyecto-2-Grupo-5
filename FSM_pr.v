`timescale 1ns / 1ps
module FSM_pr(date, stime, timer, clk, control, reset, counter, actuals,datos,AD,contador,ram);

    parameter stnd = 4'b0000;     
    parameter read = 4'b0001;
    parameter read11 = 4'b0010;
    parameter read1 = 4'b0011;
    parameter read12 = 4'b0100;
    parameter read2 = 4'b0101;
    parameter read3 = 4'b0110;
    parameter read4 = 4'b0111;      
    parameter formato = 4'b1000; 
    
    input date, stime, timer,  clk, reset,datos;
    output control, counter, actuals,AD,contador,ram;
    reg [3:0] actuals = stnd;
    reg [3:0] control;
    reg [5:0] counter;
    reg [7:0] contador;
    reg [7:0] AD;
    reg [7:0] ram;
    wire [7:0] datos;
    
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
        if (orstate == 0 && counter <= 39)
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
   if (reset) 
   begin
       contador = 7'b00100001;
   end
   else if (counter == 0 && orstate == 0) begin
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

always @(posedge clk)
    begin 
        case(actuals)
        stnd : begin 
        if (orstate == 1)
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
           assign AD = contador; 
        end
    else if (counter >=17 && counter <= 23)
        begin
            assign ram = contador;
        end    
    else if (counter >= 30 && counter <= 36)
        begin
            assign AD = datos; 
        end
    else if (counter >=37 && counter <= 40)
        begin
            assign ram = datos;
        end    
    else
        assign AD = 0;                    

endmodule

