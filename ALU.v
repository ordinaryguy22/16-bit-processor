module alu(clk,rst,var_1,rt_in,constant_in,shamtt,funct,opco,zer,neg,car,ovf,constant_en,result_out,hi_out,lo_out);
 
 input clk,rst;
 input [15:0] var_1,rt_in;
 input [15:0] constant_in;
 input constant_en;
 input [2:0] shamtt,funct;
 input zer,neg,car,ovf;
 input [3:0] opco;
 reg [16:0] result,hi,lo;
 output [16:0] result_out,hi_out,lo_out;
 reg [15:0] var_2;
 assign result_out=result; assign hi_out=hi; assign lo_out=lo; 

always@(*)
 begin
 if(constant_en==0)
 	var_2=rt_in;
 else if(constant_en==1)
 	var_2=constant_in;
 end
 
 always@(*)
 begin
 if (opco==0 && funct==0)
 	result=var_1+var_2;
 else if (opco==0 && funct==1 && neg==1)
 	result=var_1+var_2;
 else if (opco==0 && funct==2 && zer==1)
 	result=var_1+var_2;
 else if(opco==1)
 	result=var_1<<shamtt;
 else if(opco==2)
 	result=var_1>>shamtt;
 else if(opco==3)
 	result=var_1|var_2;
 else if(opco==4)
 	result=var_1&var_2;
 else if(opco==10)
 	{hi,lo}=var_1*var_2;
 else if(opco==5)
 	result=var_1+var_2;
 else if(opco==7)
 	result=var_1+var_2;
 else if(opco==8)
 	result=var_1+var_2;
 end
 endmodule

