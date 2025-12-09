`include "16bit.v"
module bit_test;
 reg[15:0] a;
 reg [15:0] b;
 reg  [2:0] alu_in;
 wire [15:0] alu_out;
 wire [16:0] carryout;

 bit_alu dut(a,b,alu_in,alu_out,carryout);
 initial begin
     $dumpfile("16bit.vcd");
     $dumpvars(0,bit_test);
 end

     initial begin
        a= 16'hAAAA ; b = 16'hFFfF; // hexavalues

        alu_in = 3'b000; #10; 
        alu_in = 3'b001; #10;  
        alu_in = 3'b010; #10;  
        alu_in = 3'b011; #10;  
        alu_in = 3'b100; #10;  
        alu_in = 3'b101; #10;  
        alu_in = 3'b110; #10;  
        alu_in= 3'b111; #10; 

        $finish;
     end
endmodule