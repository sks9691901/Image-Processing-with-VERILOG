`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.05.2021 17:28:48
// Design Name: 
// Module Name: process_test
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


module process_test;

    integer file;
    
    // Inputs
    reg [7:0] Rin,Gin,Bin,value; //*******
    reg [2:0] operation;               //******> For process.v
    reg clka,reset,OKin;         //******* 
    
    reg ena,wea;                 //*******
    reg [17:0]addra;                   //******> For BRAM
    reg [23:0]dina;              //*******
    
    // Outputs
    wire [7:0] Rout;             //*******
    wire [7:0] Gout;                   //*
    wire [7:0] Bout;                   //******> For process.v
    wire OKout;                  //*******
    
    wire [23:0]douta;            //************> For BRAM
    
    // Instantiate the Unit Under Test (UUT)
    BRAM uut1 (
		.clka(clka),
		.ena(ena), 
		.wea(wea), 
		.addra(addra), 
		.dina(dina), 
		.douta(douta)
	);
	process uut2 (
        .Rin(Rin),
        .Gin(Gin),
        .Bin(Bin),
        .value(value),
        .operation(operation),
        .clka(clka),
        .reset(reset),
        .OKin(OKin),
        .Rout(Rout),
        .Gout(Gout),
        .Bout(Bout),
        .OKout(OKout)
	);
    
    initial begin
    
        //clka = 1'b0;
        
        Rin = 8'd0;
        Gin = 8'd0;
        Bin = 8'd0;
        operation = 3'b111;  //===========================> SELECT OPERATION HERE
        value = 8'd20;       //===========================> GIVE A VALUE FOR BRIGHTNESS or THRESHOLD
        reset = 1'b0;
        OKin = 1'b0;
        
		wea = 1'b0;
		addra = 18'd0;
		dina = 24'd0;
		ena = 1'b1;
        
        // open the coe file to write
        file = $fopen("inversion.coe","wb");
        //#0.25;
    end
    
    initial begin
        clka = 1'b0;
        forever #1 clka = ~clka;
    end
    
    always@(posedge clka)
	begin
	   if(addra == 18'd0)
	       fork
	           begin
	               $fwrite(file,"Memory_initialization_radix=2;\n");
	               addra = addra + 1;
	           end
	           #1;
	       join
	   else if(addra == 18'd1)
	       fork
	           begin
	               $fwrite(file,"Memory_initialization_vector=\n");
	               addra = addra + 1;
	           end
	           #1.75;
	       join
	   else if(addra < 18'd200001)
	       begin
	           fork
	               begin
	                   {Rin,Gin,Bin} = douta;
	                   #0.2 OKin = 1'b1;
	               end
	               #0.25;
	           join
	           #1;
	           if(OKout)
	               fork
	                   #0.5;
	                   begin
	                       $fwrite(file,"%b%b%b,\n",Rout,Gout,Bout);
	                       OKin = 1'b0;
	                       addra = addra + 1;
	                   end
	               join
	       end
	   else
	       begin
	           $fwrite(file,"%b%b%b;",Rout,Gout,Bout);
	           $fclose(file);
	           #1 $finish;
	       end
	end
    
endmodule