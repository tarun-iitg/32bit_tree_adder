module test ;
   reg [31:0]in;
   wire [5:0] sum;
   bit32_tree_adder m1(sum,in);
   initial
     begin
     $monitor("input=%b output=%d",in,sum);
	$dumpfile("32bit_tree_adder.vcd");
	$dumpvars(0);
     end

   initial begin
      #1 in=0 ;
      #5 in=5 ;
      #5 in=7 ;
   end

endmodule // test

      
