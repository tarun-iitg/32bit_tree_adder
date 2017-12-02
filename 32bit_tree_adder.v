module bit32_tree_adder(sum,in);
   input [31:0]in;
   output [5:0]sum;

   wire [1:0]  w[15:0] ;
   wire [2:0]  x[7:0] ;
   wire [3:0]  y[3:0];
wire  [4:0]z[1:0]  ;
   
//16 one bit adder(half adder) 
   genvar      i,j,k,l;

   generate
      for(i=0;i<16;i=i+1)
	half_adder h1(w[i][0],w[i][1],in[2*i],in[2*i+1]);
      endgenerate
   


   //8 two bit adder
generate
      for(j=0;j<8;j=j+1)
	adder_2bit a2(x[j][1:0],x[j][2],w[2*j],w[2*j+1]);
      endgenerate
      

// 4 three bit adder

   generate
      for(k=0;k<4;k=k+1)
	adder_3bit a3(y[k][2:0],y[k][3],x[2*k],x[2*k+1]);
      endgenerate
   
   //2 four bit adder
generate
      for(l=0;l<2;l=l+1)
        adder_4bit a4(z[l][3:0],z[l][4],y[2*l],y[2*l+1]);
      endgenerate
     

 //1 five bit adder

   adder_5bit a5(sum[4:0],sum[5],z[0],z[1]);
   
   
   

endmodule // 32_bit_tree_adder


module half_adder(s,c,a,b);
   input a,b;
   output c,s;
   assign {c,s}=a+b;
endmodule // half_adder

module adder_2bit(s,c,a,b);
   input [1:0]a,b;
   output [1:0] s;
   output 	c ;
   assign {c,s}=a+b ;
endmodule // adder_2bit

module adder_3bit(s,c,a,b);
   input [2:0]a,b;
   output [2:0] s;
   output 	c ;
   assign {c,s}=a+b ;
endmodule // adder_3bit

module adder_4bit(s,c,a,b);
   input [3:0]a,b;
   output [3:0] s;
   output 	c ;
   assign {c,s}=a+b ;
endmodule // adder_4bit

module adder_5bit(s,c,a,b);
   input [4:0]a,b;
   output [4:0] s;
   output 	c ;
   assign {c,s}=a+b ;
endmodule // adder_5bit
