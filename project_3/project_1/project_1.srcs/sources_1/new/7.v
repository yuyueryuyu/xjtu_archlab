module sim_fulladder_16;
     reg[15:0] A,B;
     reg Ci;
     wire Co;
     wire[15:0] S;
     initial begin
        A = 16'd0;
        B = 16'd0;
        Ci = 0;
     end
     always begin
        #10
        A <= {$random};
        B <= {$random};
        #50
        A <= {$random};
        B <= {$random};
        #50
        Ci<= 1;
        A  <= {$random};
        B <= {$random};
        #50
        A <= {$random};
        B <= {$random};
     end
     fulladder_16 ADD16(
        .A (A),
        .B (B),
        .Ci (Ci),
        .Co (Co),
        .S (S)
        ); 
endmodule