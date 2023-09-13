module decoder (clk,instruction,neg,zer,opcode_d,rs_d,rt_d,rd_d,shamt_d,funct_d,constant_d,address_d,const_en_d, write_en_d,read_en_d,write_en2_d,j_sel_d,pc_sel_d,output_sel_d,hilo_en_d);
 input clk;
 input [15:0] instruction;
 input neg,zer;
 wire [3:0] opcode; wire [3:0] opcodee;
 output [3:0] opcode_d;
 wire [2:0] rs,rd,shamt,funct;
 reg [2:0] rt;
 output [2:0] rs_d,rt_d,rd_d,shamt_d,funct_d;
 wire [5:0] constant;
 output [5:0] constant_d;
 wire [8:0] address;
 output [8:0] address_d;
 reg const_en, write_en, write_en2,j_sel,pc_sel,read_en,hilo_en;
 output const_en_d, write_en_d, write_en2_d,read_en_d,j_sel_d,pc_sel_d,hilo_en_d;
 reg [3:0] output_sel;
 output [3:0] output_sel_d;
 //selections
 
 assign opcode_d=opcodee;
 assign rs_d=rs; assign rt_d=rt; assign rd_d=rd; assign shamt_d=shamt;
 assign constant_d=constant;
 assign address_d=address;
 assign const_en_d=const_en; assign write_en_d=write_en; assign write_en2_d=write_en2; assign j_sel_d=j_sel; assign pc_sel_d=pc_sel;
 assign output_sel_d=output_sel;
 assign read_en_d=read_en;
 assign hilo_en_d=hilo_en;
 assign funct_d=funct;

 assign opcode=instruction[3:0];

 
 always @(*)
 	begin 
 	if (opcode==0 && funct==0)
 		begin 
 		output_sel=1;
 		const_en=0;
 		write_en=0;
 		write_en2=1;
 		j_sel=0;
 		pc_sel=0;
		read_en=0;
		hilo_en=1;

 		end 
 	if (opcode==0 && funct==1 && neg==1)
 		begin 
 		output_sel=1;
 		const_en=0;
 		write_en=0;
 		write_en2=1;
 		j_sel=0;
 		pc_sel=0;
		read_en=0;
		hilo_en=1;

 		end 
 	if (opcode==0 && funct==2 && zer==1)
 		begin 
 		output_sel=1;
 		const_en=0;
 		write_en=0;
 		write_en2=1;
 		j_sel=0;
 		pc_sel=0;
		read_en=0;
		hilo_en=1;

 		end 
 	else if (opcode==1| opcode==2| opcode==3 |opcode==4)
 		begin 
 		output_sel=1;
 		const_en=0;
 		write_en=0;
 		write_en2=1;
 		j_sel=0;
 		pc_sel=0;
		read_en=0;
		hilo_en=1;

 		end 
	else if (opcode==10)
begin
 		output_sel=-1;
 		const_en=0;
 		write_en=0;
 		write_en2=0;
 		j_sel=0;
 		pc_sel=0;
		read_en=0;
		hilo_en=1;
end

 	else if (opcode==11)
 		begin 
 		output_sel=3;
 		const_en=0;
 		write_en=0;
 		write_en2=1;
 		j_sel=0;
 		pc_sel=0;
		read_en=0;
		hilo_en=0;
 		end
 	else if (opcode==12)
 		begin
 		output_sel=2;
 		const_en=0;
 		write_en=0;
 		write_en2=1;
 		j_sel=0;
 		pc_sel=0;
		read_en=0;
		hilo_en=0;
 		end
	else if (opcode==5)
		begin
 		output_sel=1;
 		const_en=1;
 		write_en=0;
 		write_en2=1;
 		j_sel=0;
 		pc_sel=0;
		read_en=0;
		hilo_en=0;
		end
	else if (opcode==6)
		begin
 		output_sel=4;
 		const_en=0;
 		write_en=0;
 		write_en2=1;
 		j_sel=0;
 		pc_sel=0;
		read_en=0;
		hilo_en=0;
		end
	else if (opcode==7)
		begin
 		output_sel=0;
 		const_en=1;
 		write_en=0;
 		write_en2=1;
 		j_sel=0;
 		pc_sel=0;
		read_en=1;
		hilo_en=0;
		end
	else if (opcode==8)
		begin
 		output_sel=-1;
 		const_en=1;
 		write_en=1;
 		write_en2=0;
 		j_sel=0;
 		pc_sel=0;
		read_en=0;
		hilo_en=0;	
		end
	else if (opcode==9 && funct==0)
		begin
 		output_sel=-1;
 		const_en=0;
 		write_en=0;
 		write_en2=0;
 		j_sel=1;
 		pc_sel=0;
		read_en=0;
		hilo_en=0;
		end
	else if (opcode==9 && funct>0)
		begin
 		output_sel=-1;
 		const_en=0;
 		write_en=0;
 		write_en2=0;
 		j_sel=0;
 		pc_sel=1;
		read_en=0;
		hilo_en=0;
		end
 end
 
 //splitter
assign opcodee=instruction[3:0];
assign rd=instruction[6:4];
assign rs=instruction[9:7];
always@(*)
begin
if (opcode==8)
 rt=rd;
else
 rt=instruction[12:10];
end
assign shamt=instruction[15:13];
assign constant=instruction[15:10];
assign address=instruction[12:4];
assign funct=instruction[15:13];
 endmodule
