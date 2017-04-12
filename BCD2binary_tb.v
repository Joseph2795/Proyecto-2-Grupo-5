`timescale 1ns / 1ps

module BCD2binary_tb(
    );

    reg [7:0]bcd;
    wire [3:0]binario;
    
    bcd2binary b1(
        .bcd(bcd),.binario(binario)
    );
        
    initial
    begin
        bcd=8'b00000000;
        $monitor($time, ,"bcd", ,"%b",bcd,  , "bin","ary", ,"%b",binario);
    end
    
    always
    begin
        #1 bcd=bcd+1;
    end
    
    initial
    begin
        #22 $stop;
    end
    
endmodule
