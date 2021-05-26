`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.05.2021 07:35:37
// Design Name: 
// Module Name: process
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


module process(Rout,Gout,Bout,OKout,Rin,Gin,Bin,operation,value,clka,reset,OKin);

input clka,reset,OKin;
input [7:0]Rin,Gin,Bin,value;
input [2:0]operation;

output reg [7:0]Rout,Gout,Bout;
output reg OKout;

reg [7:0]Rtemp,Gtemp,Btemp;

//      [2:0]parameter      operation
//          000             Brightness increase
//          001             Brightness decrease
//          010             Grayscale
//          011             Red filter
//          100             Green filter
//          101             Blue filter
//          110             Threshold
//          111             Convolution

always@(negedge clka)
    begin
        if(reset)
            begin
                Rout <= 8'd0;
			    Gout <= 8'd0;
			    Bout <= 8'd0;
			    OKout = 1'b0;
            end
        else if(operation == 3'b000)
           begin
               if(OKin)
				   begin 
				       Rtemp = Rin + value;
				       Gtemp = Gin + value;
				       Btemp = Bin + value;
				       if(Rtemp > 255) Rout <= 255;
				       else Rout <= Rtemp;
				       if(Gtemp > 255) Gout <= 255;
				       else Gout <= Gtemp;
				       if(Btemp > 255) Bout <= 255;
				       else Bout <= Btemp;
				       OKout = 1'b1;
				   end
			   else		
			       begin
			            Rout <= 8'd0;
			            Gout <= 8'd0;
			            Bout <= 8'd0;
			            OKout = 1'b1;
			       end	
           end
    end

endmodule
