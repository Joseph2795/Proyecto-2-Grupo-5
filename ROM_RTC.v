`timescale 1ns / 1ps
module ROM_RTC (
clk, // Clock Input
address     , // Address Input
data        , // Data bi-directional
data_out,
we           // Write Enable/Read Enable
); 

parameter DATA_WIDTH = 8 ;
parameter ADDR_WIDTH = 4 ;
parameter RAM_DEPTH = 1 << ADDR_WIDTH;

//--------------Input Ports----------------------- 

input [ADDR_WIDTH-1:0] address     ;
input                  we          ;
//--------------Inout Ports----------------------- 
input data       ;
output data_out       ;
input clk;

//--------------Internal variables---------------- 
reg [DATA_WIDTH-1:0] data_out ;
wire [DATA_WIDTH-1:0] data ;
reg [DATA_WIDTH-1:0] mem [0:RAM_DEPTH-1];
reg                  oe_r;

//--------------Code Starts Here------------------ 

// Tri-State Buffer control 
// output : When we = 0, oe = 1, cs = 1


// Memory Write Block 
// Write Operation : When we = 1, cs = 1
always @(posedge clk)
begin : MEM_WRITE
   if (we ) begin
       mem[address] <= data;  
       data_out <= data_out;
   end
   else
   begin
       data_out <= mem[address];
       mem[address] <= mem[address];
   end
end

endmodule