`timescale 1ns / 1ps
module prueba_edita(date, stime, timer, clk, control, reset, counter, actuals);

parameter stnd = 4'b0000;     
parameter write = 4'b0001;
parameter write11 = 4'b0010;
parameter write1 = 4'b0011;
parameter write12 = 4'b0100;
parameter write2 = 4'b0101;
parameter write3 = 4'b0110;
parameter write4 = 4'b0111;      
parameter formato = 4'b1000; 

    input date, stime, timer,  clk, reset;
    output control, counter, actuals;
    reg [3:0] actuals = stnd;
    reg [3:0] control;
    reg [5:0] counter;
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
        if (orstate == 1 && counter <= 39)
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
    begin 
        case(actuals)
        stnd : begin 
        if (orstate == 0)
        begin
            actuals <= stnd;
            control <= 4'b0000;
        end
        else
            actuals <= write;
        end    
        write : begin
            if (counter >= 0 && counter <= 3)
                begin
                    actuals <= write;
                    control <= 4'b1101;
                end
            else 
                actuals <= write11;
            end               
        write11 : begin                
                if (counter >= 6'b000100 && counter <= 6'b000101)
                    begin   
                        actuals <= write11;
                        control <= 4'b1001;
                    end
                else
                    actuals <= write1;
                end
        write1 : begin                
            if (counter >= 6'b000110 && counter <= 6'b001011)
                begin   
                    actuals <= write1;
                    control <= 4'b0010;
                end
            else
                actuals <= write12;
            end
        write12 : begin                
            if (counter >= 6'b001100 && counter <= 6'b001101)
                begin   
                    actuals <= write12;
                    control <= 4'b1001;
                end
            else
                actuals <= write2;
            end
        write2 : begin
            if (counter >= 6'b001110 && counter <= 6'b011001)
                begin
                    actuals <= write2;
                    control <= 4'b1101;
                end    
            else 
                actuals <= write3;
            end
      write3 : begin
            if (counter >= 6'b011010 && counter <= 6'b011111)
                begin
                    actuals <= write3;
                    control <= 4'b0110;
                end                
            else 
                actuals <= write4;
            end
     write4 : begin
            if (counter >= 6'b100000 && counter <= 6'b101000)
                begin
                    actuals <= write4;
                    control <= 4'b1101;
                end
            else
                actuals <= write;

            end
        endcase
     end
endmodule
