`timescale 1ns / 1ps

module debounce(

	input clk,
	input signalInput,
	output signalOutput,
	input reset,
	output contador
	
    );

reg [2:0] contador;

always @ (posedge clk)
  if (reset == 1)
     contador <= 3'b000;
  else
     contador <= {contador[1:0], signalInput};

assign signalOutput = !contador[0] & contador[1] & contador[2];
	
endmodule