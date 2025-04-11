module fulladder_1(
    input A,B,Ci,
    output S,Co
    );
    assign Co=(A&B)|(A&Ci)|(B&Ci);
    assign S=(~A&~Ci&B)|(A&~Ci&~B)|(~A&Ci&~B)|(A&Ci&B);
endmodule