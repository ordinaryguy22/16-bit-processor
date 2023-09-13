module data_mem(clk,rst,wr_en,read_en,data_in,address,data_out);
 
 input clk,rst;
 input wr_en,read_en;
 input [15:0] data_in,address;
 reg [15:0] data_internal;
 output [15:0] data_out;
 reg [15:0] ram [9:0];
 integer k;

always@(posedge clk, posedge rst)
begin
if (rst==1)
for(k=0; k<10;k=k+1)
 begin
 ram[k]<=k+16384;
 end
 else if(wr_en==1)
 ram[address]<=data_in;
end

always@(*)
begin
if(read_en==1)
 data_internal=ram[address];
end


 assign data_out=data_internal;
 

 endmodule

