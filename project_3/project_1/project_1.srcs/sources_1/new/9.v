module sim_fulladder_32;
     reg[31:0] A,B;
     reg Ci;
     wire Co;
     wire[31:0] S;
     initial begin
       A = 32'd0;
       B = 32'd0;
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
        A <= {$random};
        B <= {$random};
        #50
        A <= {$random};
        B <= {$random};
      end
      fulladder_32 ADD32(
       .A (A),
       .B (B),
       .Ci (Ci),
       .Co (Co),
       .S (S)
      );
endmodule
