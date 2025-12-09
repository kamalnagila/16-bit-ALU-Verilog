module bit_alu(
 input [15:0] a ,
 input [15:0] b, //  16 bit input
 input [2:0] alu_in, // selection  line input
 output reg [15:0] alu_out, 
 output reg [16:0] carryout
);
  reg [16:0] temp; // 16 to hold carry

 always @ (*) begin
   case (alu_in)

   3'b000: begin temp=a+b;
           alu_out=temp[15:0];
           carryout=temp[16];
   end

   3'b001: begin temp=a-b;
           alu_out=temp[15:0];
           carryout=temp[16];
   end

   3'b010: begin alu_out=a & b; // AND
           carryout=0;
   end

   3'b011: begin 
             alu_out= a | b ; // OR
             carryout= 0;
   end

   3'b100: begin alu_out= a -1; // decrement in a
           carryout = 0;
   end

   3'b101: begin alu_out= a+1 ; // increment in a 
           carryout=0;
   end

   3'b110:begin alu_out= ~a; // not a
           carryout=0;
   end
   
   3'b111: begin alu_out= a ^b; // xor 
           carryout=0;
   end
            
      default: begin 
                alu_out= 4'b0000;
                carryout=0;
      end
   endcase
    
 end
endmodule
