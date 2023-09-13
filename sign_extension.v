module signextend(clk,const,const_out);
 input clk;
 input [5:0] const;
 reg [15:0] const_internal;
 output [15:0] const_out;
 
 always@(*)
 begin
 if(const[5]==0)
 const_internal<=const|16'h0000;
 else if(const[5]==1)
 const_internal<=const|32704;
 end
 assign const_out=const_internal;
 endmodule

