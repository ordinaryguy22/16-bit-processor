module statusr(clock,reset,opc,alu_ans,hi_ans,lo_ans,sr_out);
input clock,reset;
reg [11:0] empty;
input [16:0] alu_ans,hi_ans,lo_ans;
input [3:0] opc;
reg [15:0] status_out;
reg z_out,n_out,ca_out,of_out;
reg [3:0] opcode;
output [15:0] sr_out;

assign sr_out=status_out;

initial
begin 
empty=0;
end

always@(posedge clock,posedge reset)
begin
opcode<=opc;
end

always@(*)
begin
if(opcode==0 || opcode==1 || opcode==2 || opcode==3 || opcode==4 || opcode==5)
begin
if (alu_ans==0)
z_out<=1;
end
else if(opcode==10 && hi_ans==0 && lo_ans==0)
z_out<=1;
else
z_out<=0;

if(opcode==0 || opcode==1 || opcode==2 || opcode==3 || opcode==4 || opcode==5)
begin
if(alu_ans[16:15]==1)
n_out<=1;
end
else if(opcode==10 && hi_ans[16:15]==1)
n_out<=1;
else if(opcode==10 && hi_ans==0 && lo_ans[16:15]==1)
n_out<=1;
else
n_out<=0;

if(opcode==0 && alu_ans[16]==1)
ca_out<=1;
else if(opcode==0 && alu_ans[16]==0)
ca_out<=0;
else 
ca_out<=0;

if(opcode==0 || opcode==1 || opcode==2 || opcode==3 || opcode==4 || opcode==5)
begin
if(alu_ans[16]==1)
of_out<=1;
end
else if(hi_ans[16]==1)
of_out<=1;
else
of_out<=0;

end
 always@(*)
 begin
 if(reset==1)
 	status_out=0;
 else if(reset==0)
 	status_out={empty,z_out,n_out,ca_out,of_out};
 end
endmodule



