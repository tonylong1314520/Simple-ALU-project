module test_bench;
  reg[2:0]a;
  reg[2:0]b;
  reg[1:0]s;
  wire [2:0]f;
  wire [0:0]carryOut;
  wire [0:0]inv;

  ALU test_bench(a, b, s, f , carryOut, inv);
  initial 
    begin
	#0  a=101;b=111;s=10;

      $monitor($time,"a=%b,b=%b,s=%b,carry=%b,f=%b, inv=%b",a,b,s,carryOut, f, inv);
end
   
endmodule 
