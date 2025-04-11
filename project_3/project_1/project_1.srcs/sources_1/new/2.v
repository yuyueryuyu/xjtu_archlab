module sim_fulladder_1;
    reg A,B,ci;
    wire s,co;
    initial begin
        A= 1'b0;
        B= 1'b0;
        ci = 1'b0;
    end
    always begin
        #50 B <= 1'b1;
        #50 A <= 1'b1;
        #50 B <= 1'b0;
        #50
        ci <= 1'b1;
        A <= 1'b0;
        B <= 1'b0;
        #50 B <= 1'b1;
        #50 A <= 1'b1;
        #50 B <= 1'b0;
        #10
        $finish;
    end
    fulladder_1 FA1(
        .A (A),
        .B (B),
        .Ci (ci),
        .S (s),
        .Co (co)
        ); 
endmodule