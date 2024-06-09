// Write your modules here!
`timescale 1 ns/100 ps

module mux21 
  #(parameter Size=10)
  (output[Size-1:0]y, input s, input [Size-1:0] a1, a0);
	assign y= s? a1:a0;
endmodule

`timescale 1 ns/100 ps

module comp_1bit (output g, l, input gi, li, xi, yi);

	assign g = gi | (~li & ( xi & ~yi));
	assign l = li | (~gi & (~xi &  yi));

endmodule

module 
  comp #(parameter Size=10)
  (output g, l, input [Size-1:0] x, y);

  	wire [Size:0] gi, li;

  	assign gi[Size] = 0, li[Size] = 0;

	genvar i;
	generate						//Verilog-2001
      	for (i=0; i<Size; i=i+1)
	    begin: row
	        comp_1bit ui (gi[i], li[i], gi[i+1], li[i+1], x[i], y[i]);
	    end
	endgenerate

	assign g = gi[0], l = li[0];

endmodule

module BN 
  #(parameter Size=2) 
  (output[Size-1:0]max,min, input [Size-1:0] A,B);
  wire g,l;
  comp #(.Size(Size)) u0 (g,l,A,B);
  mux21 #(.Size(Size)) u1 ( max, l,  B, A);
  mux21 #(.Size(Size)) u2 ( min, l,  A, B);
endmodule
