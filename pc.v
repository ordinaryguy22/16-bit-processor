module pc_main(clk,rst,j_sele,pc_sele,adr_in,funct,neg,zer,ovf,car,label,pc_out);
 input clk,rst,j_sele,pc_sele;
 input [8:0] adr_in,label;
 input [2:0] funct;
 input neg,zer,ovf,car;
 reg [7:0] pc;
 output [7:0] pc_out;
 wire [7:0] incr;
 always@(posedge clk, posedge rst)
 begin
 if(rst==1)
 	pc<=0;
 else if(j_sele==0 & pc_sele==0)
 	pc<=incr;
 else if(j_sele==1 & pc_sele==0)
 	pc<=pc+adr_in;
 else if(j_sele==0 & pc_sele==1)
	if (funct==1 && neg==1)
 	pc<=label;
	else if (funct==2 && zer==1)
 	pc<=label;
	else if (funct==3 && ovf==1)
 	pc<=label;
	else if (funct==4 && car==1)
 	pc<=label;
 end
 assign incr=pc+1;
 assign pc_out=pc;
 endmodule

