module fulladder (
    // Inputs
    input a,
    input b,
    input cin,

    // Outputs
    output s,
    output cout
);

    wire a_b_xor = ~a ^ ~b;

    // Sum: XOR of a, b, and cin
    assign s = a_b_xor ^ ~cin;

    // Carry: (A * B) + (cin * (A ^ B))
    assign cout = (~a & ~b) | ( ~cin & a_b_xor );

endmodule