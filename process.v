`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.05.2021 17:27:35
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
//          111             Inversion

always@(negedge clka)
    begin
        if(reset)
            begin
                Rout <= 8'd0;
			    Gout <= 8'd0;
			    Bout <= 8'd0;
			    OKout = 1'b0;
            end
        else if(operation == 3'b000)//Brightness increase
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
        else if(operation == 3'b001)//Brightness decrease
           begin
               if(OKin)
				   begin 
				       Rtemp = Rin - value;
				       Gtemp = Gin - value;
				       Btemp = Bin - value;
				       if(Rtemp  < 0) Rout <= 0;
				       else Rout <= Rtemp;
				       if(Gtemp < 0) Gout <= 0;
				       else Gout <= Gtemp;
				       if(Btemp < 0) Bout <= 0;
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
        else if(operation == 3'b010)//Grayscale
           begin
               if(OKin)
				   begin 
				       Rout <= (Rin >> 2) + (Rin >> 5) + (Rin >> 6) + (Gin >>1) + (Gin >>4) + (Gin >>6) + (Bin >>4) + (Bin >>5) + (Bin >>6);
			           Gout <= (Rin >> 2) + (Rin >> 5) + (Rin >> 6) + (Gin >>1) + (Gin >>4) + (Gin >>6) + (Bin >>4) + (Bin >>5) + (Bin >>6);
			           Bout <= (Rin >> 2) + (Rin >> 5) + (Rin >> 6) + (Gin >>1) + (Gin >>4) + (Gin >>6) + (Bin >>4) + (Bin >>5) + (Bin >>6);
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
        else if(operation == 3'b011)//Red filter
           begin
               if(OKin)
				   begin 
				       Rout <= Rin;
			           Gout <= 8'd0;
			           Bout <= 8'd0;
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
        else if(operation == 3'b100)//Red filter
          begin
              if(OKin)
			     begin
			         Rout <= 8'd0;
			         Gout <= Gin;
			         Bout <= 8'd0;
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
        else if(operation == 3'b101)//Blue filter
          begin
              if(OKin)
			     begin
			         Rout <= 8'd0;
			         Gout <= 8'd0;
			         Bout <= Bin;
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
        else if(operation == 3'b110)//Threshold
          begin
            if(OKin)
                begin
                    Rtemp = (Rin >> 2) + (Rin >> 5) + (Rin >> 6) + (Gin >>1) + (Gin >>4) + (Gin >>6) + (Bin >>4) + (Bin >>5) + (Bin >>6);
			        Gtemp = (Rin >> 2) + (Rin >> 5) + (Rin >> 6) + (Gin >>1) + (Gin >>4) + (Gin >>6) + (Bin >>4) + (Bin >>5) + (Bin >>6);
			        Btemp = (Rin >> 2) + (Rin >> 5) + (Rin >> 6) + (Gin >>1) + (Gin >>4) + (Gin >>6) + (Bin >>4) + (Bin >>5) + (Bin >>6);
			
			        if(Rtemp > value) Rout <= 8'd0;
			        else Rout <= 8'd255;
			        if(Gtemp > value) Gout <= 8'd0;
			        else Gout <= 8'd255;
			        if(Btemp > value) Bout <= 8'd0;
			        else Bout <= 8'd255;
			        OKout = 1'b1;
			    end
			else
			    begin
			        Rout <= 8'd0;
			        Gout <= 8'd0;
			        Bout <= 8'd0;
			        OKout = 1'b0;
			    end
           end
        else if(operation == 3'b111)//Inversion
          begin
              if(OKin)
			     begin
			         Rout <= 255 - Rin;
			         Gout <= 255 - Gin;
			         Bout <= 255 - Bin;
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
