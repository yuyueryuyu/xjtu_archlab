module sim_fulladder_4;
    reg[3:0] A,B;
    reg Ci; //最低位进位
    wire Co;
    wire[3:0] S;
    integer i,j;
    initial begin
        A = 4'b0000;
        B = 4'b0000;
        Ci = 1;
    end
    always begin
        for(i = 0; i <15;i=i+1) begin
            #10 ;
            B <= 4'b0000;
            A <= A + 4'b0001;
            for(j=0;j<15;j=j+1) begin
                #10 ;
                B <= B + 4'b0001;
            end
        end
     end
      fulladder_4 ADD4(
          .A (A),
          .B (B),
          .Ci (Ci),
          .Co (Co),
          .S (S)
       );
endmodule