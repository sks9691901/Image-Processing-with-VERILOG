`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:34:05 05/25/2021
// Design Name:   BRAM
// Module Name:   C:/Users/sks96/Xilinx Projects/ImageProcessing/ram_test.v
// Project Name:  ImageProcessing
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: BRAM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ram_test;

	// Inputs
	reg clka;
	reg ena;
	reg [0:0] wea;
	reg [16:0] addra;
	reg [23:0] dina;

	// Outputs
	wire [23:0] douta;

	// Instantiate the Unit Under Test (UUT)
	BRAM uut (
		.clka(clka),
		.ena(ena), 
		.wea(wea), 
		.addra(addra), 
		.dina(dina), 
		.douta(douta)
	);

	initial begin
		// Initialize Inputs
		clka = 1'b0;
		wea = 1'b0;
		addra = 17'd0;
		dina = 24'd0;
		ena = 1'b1;
	end
	
	always #5 clka = ~clka;
	
	always@(posedge clka)
	begin
	   if(addra < 90002)
	       begin
	           $display("ADDRESS => %d\tBit Value => %b",addra,douta);
	           addra = addra + 1;
	       end
	   else
	       begin
	           $display("DONE!");
	           $finish;
	       end
	end
endmodule
