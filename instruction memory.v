module intruc_memory (clk,rst,pc_in,instruction_out);
 input clk,rst;
 input [7:0] pc_in;
 reg [15:0] instruction;
 output [15:0] instruction_out;
 reg [15:0] value [0:20];
 assign instruction_out=instruction;


initial
begin
//You may have to rename the instr memory (ROM) with the one used in your project
	value[0] = 16'b000_010_001_000_0000; //ADD
	value[1] = 16'b010_010_000_001_0001; //sll
	value[2] = 16'b001_010_001_010_0010; //slr
	value[3] = 16'b010_010_000_011_0011; //or
	value[4] = 16'b010_010_011_100_0100; //and
	value[5] = 16'b000_011_100_101_0101; //addi
	value[6] = 16'b000_000_001_011_0110; //li
	value[7] = 16'b000_100_011_000_0111; //lw
	value[8] = 16'b000_010_000_000_1000; //sw
	value[9] = 16'b000_000_000_011_1001; //b
	value[10] = 16'b000_011_001_000_1010; //mul	
	value[11] = 16'b000_011_001_000_1011; //mflo	
	value[12] = 16'b000_000_000_011_1100; //mfhi	
	value[13] = 16'b001_010_001_000_0000; //addn (add if negative flag is raised)
	value[14] = 16'b011_010_001_000_1001; //bof (branch if overflow flag is raised)
end

 always @(posedge clk)
 begin
if(rst==1)
instruction<=0;
else if(rst==0)
 instruction<=value[pc_in];
 end
 endmodule
