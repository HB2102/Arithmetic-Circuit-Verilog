//full adder module
module fullAdder ( 
    input a,b,cin,
    output sum,cout
);
    
    xor(w0,a,b);
    xor(sum,w0,cin);

    and(w1,a,b);
    and(w2,w0,cin);
    or(cout,w1,w2);

endmodule


// 4to1 mux module
module mux1x4 (
    input i1,i2, i3, i4,s0,s1,
    output y
    );
    
    
    not(ns0 , s0);
    not(ns1 , s1);

    and(w0, i1, ns0, ns1);
    and(w1, i2, ns0, s1);
    and(w2, i3, s0, ns1);
    and(w3, i4, s0, s1);

    or(y,w0,w1,w2,w3);

endmodule



//AC module

module AC (
    input [3:0] a,
    input [3:0] b,
    input s1,s0,cin,
    output [3:0] d,
    output carry
);

    assign z = 0;
    not(o,z);
    
    not(nb0,b[0]);
    mux1x4 m0(b[0],nb0,z,o,s1,s0,y0);

    not(nb1,b[1]);
    mux1x4 m1(b[1],nb1,z,o,s1,s0,y1);

    not(nb2,b[2]);
    mux1x4 m2(b[2],nb2,z,o,s1,s0,y2);

    not(nb3,b[3]);
    mux1x4 m3(b[3],nb3,z,o,s1,s0,y3);

    fullAdder f0(a[0],y0,cin,d[0],c0);
    fullAdder f1(a[1],y1,c0,d[1],c1);
    fullAdder f2(a[2],y2,c1,d[2],c2);
    fullAdder f3(a[3],y3,c2,d[3],carry);


    
endmodule


module tb_AC;
  // Inputs
  reg [3:0] a, b;
  reg s1,s2,cin;
  // Outputs
  wire [3:0] d;
  wire carry;

  // Instantiate the Unit Under Test (UUT)
  AC ac(a,b,s1,s2,cin,d,carry);


  initial begin
    // Initialize inputs
    a = 4'b1010;
    b = 4'b0101;
    s1 = 0;
    s2 = 0;
    cin = 0;
    #100;

    a = 4'b1010;
    b = 4'b0101;
    s1 = 0;
    s2 = 0;
    cin = 1;
    #100;

    a = 4'b1010;
    b = 4'b0101;
    s1 = 0;
    s2 = 1;
    cin = 0;
    #100;

    a = 4'b1010;
    b = 4'b0101;
    s1 = 0;
    s2 = 1;
    cin = 1;
    #100;

    a = 4'b1010;
    b = 4'b0101;
    s1 = 1;
    s2 = 0;
    cin = 0;
    #100;

    a = 4'b1010;
    b = 4'b0101;
    s1 = 1;
    s2 = 0;
    cin = 1;
    #100;

    a = 4'b1010;
    b = 4'b0101;
    s1 = 1;
    s2 = 1;
    cin = 0;
    #100;

    a = 4'b1010;
    b = 4'b0101;
    s1 = 1;
    s2 = 1;
    cin = 1;
    #100;

    
  end
         
endmodule




