`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2017 08:40:58 AM
// Design Name: 
// Module Name: ROM_RTC
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module ROM_RTC(
   input wire [3:0] addr,
   output reg [7:0] data
  );
  
  // signal declaration
  reg [3:0] addr_reg; 

  // body
  always @* 
     addr_reg <= addr;
     
  always @*
  begin
     case (addr_reg)
        4'b0000: data = 8'b00000000;
        4'b0001: data = 8'b00000000;
        4'b0010: data = 8'b00000000;
        4'b0011: data = 8'b00000000;
        4'b0100: data = 8'b00000001;
        4'b0101: data = 8'b00000001;
        4'b0110: data = 8'b00000000;
        4'b0111: data = 8'b00000000;
        4'b1000: data = 8'b00000000; 
        4'b1001: data = 8'b11111111;   
     endcase
  end
endmodule
