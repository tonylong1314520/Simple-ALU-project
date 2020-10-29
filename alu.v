module ALU(a, b, sel, f, carryOut, invalid);
/* ----------2 3 Bit Input ALU -----------------*/
  //outputs
  output reg carryOut;
  output reg [2:0]f;
  output reg invalid;
  //inputs 
  input [2:0] a;
  input [2:0] b;
  input [1:0] sel;

  always@(sel,a,b)

  begin
    //invalid is equal to 0 at every true case, default inv is 1
    case(sel)
      //Add 3 bit inputs A and B for a 3 bit output with carry
      2'b00 : begin {carryOut, f}= a+b; invalid=0; end 
      //multiply input A by 2
      2'b01 : begin {carryOut, f}=a*2; invalid=0; end 
      //xor 2 3 bit inputs 
      2'b10 : begin {carryOut, f[2:0]} = a[2:0]^b[2:0]; invalid=0; end
      //used when the select is 11 or not right
      default :  begin {carryOut, f}=0000; invalid=1; end
    endcase

end
endmodule 