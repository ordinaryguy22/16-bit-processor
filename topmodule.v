module processor(clock,reset);
input clock,reset;

wire jumpselect,pcselect; wire [8:0] adrsin; wire [7:0] counter; wire [15:0] srout; wire [2:0] functd;
pc_main progrmcountr(clock,reset,jumpselect,pcselect,adrsin,functd,srout[2],srout[3],srout[0],srout[1],adrsin,counter);

wire [15:0] instructionout;
intruc_memory instructionsmemory(clock,reset,counter,instructionout);

wire [3:0] opc; wire [2:0] rss,rtt,rdd,shamtd; wire [5:0] cons;
wire consten,writeen,writeen2,readen,hiloen; wire [3:0] outputselect;
decoder decoding(clock,instructionout,srout[2],srout[3],opc,rss,rtt,rdd,shamtd,functd,cons,adrsin,consten,writeen,readen,writeen2,jumpselect,pcselect,outputselect,hiloen);

wire [15:0] constout;
signextend signextension(clock,cons,constout);

wire [16:0] arithlu,hid,lod; wire [15:0] memdata,oper1,oper2;
regfile registerfilee(clock,reset,rss,rtt,rdd,arithlu,hid,lod,constout,memdata,outputselect,writeen2,hiloen,oper1,oper2);

alu mathlogic(clock,reset,oper1,oper2,constout,shamtd,functd,opc,srout[3],srout[2],srout[1],srout[0],consten,arithlu,hid,lod);


data_mem datasmemory(clock,reset,writeen,readen,oper2,arithlu[15:0],memdata);


statusr statusregister(clock,reset,opc,arithlu,hid,lod,srout);

endmodule
