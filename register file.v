module regfile(clk,rst,rs_loc,rt_loc,rd_loc,alu_data,hi_data,lo_data,constant_data,ram_data,out_sel,writesignal,hilo_en,rs_out,rt_out); 
input [2:0] rs_loc,rt_loc,rd_loc;
 input clk,rst,hilo_en;
 input [16:0] alu_data,hi_data,lo_data;
 input [15:0] constant_data,ram_data;
 input [3:0] out_sel;
 input writesignal;
 output [15:0] rs_out,rt_out;
 reg [15:0] rs_internal,rt_internal;
 reg [15:0] hi_r,lo_r;
 reg [15:0] rd_data;
 reg [15:0] registers[7:0];
 integer i;
 always@(posedge clk,posedge rst)
 begin
 	if(rst==1)
 	for(i=0; i<8;i=i+1)
 	begin
 	registers[i]<=0;
 	end
	else if(writesignal==1)
 	registers[rd_loc]<=rd_data;
 end

 always@(posedge clk,posedge rst)
 begin
 	if(rst==1)
 	begin
	hi_r<=0;
	lo_r<=0;
	end
	else if (hilo_en==1)
	begin
	hi_r<=hi_data;
	lo_r<=lo_data;
	end
 end
 
always@(*)
begin
rs_internal=registers[rs_loc];
rt_internal=registers[rt_loc];
end

 assign rs_out=rs_internal;
 assign rt_out=rt_internal;
 
 always@(*)
 begin
 if(out_sel==0)
 	rd_data=ram_data;
 else if(out_sel==1)
 	rd_data=alu_data;
 else if(out_sel==2)
 	rd_data=hi_r;
 else if(out_sel==3)
 	rd_data=lo_r;
 else if(out_sel==4)
 	rd_data=constant_data;
 end
 
 endmodule

