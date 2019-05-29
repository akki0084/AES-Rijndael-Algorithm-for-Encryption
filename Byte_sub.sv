module Byte_sub(
               input logic [127:0]A,
               output logic [127:0]S_B);
//reg [127:0]S_B;

mem S_B1(A[127:120], S_B[127:120]);
mem S_B2(A[119:112], S_B[119:112]);
mem S_B3(A[111:104], S_B[111:104]);
mem S_B4(A[103:96], S_B[103:96]);
mem S_B5(A[95:88], S_B[95:88]);
mem S_B6(A[87:80], S_B[87:80]);
mem S_B7(A[79:72], S_B[79:72]);
mem S_B8(A[71:64], S_B[71:64]);
mem S_B9(A[63:56], S_B[63:56]);
mem S_B10(A[55:48], S_B[55:48]);
mem S_B11(A[47:40], S_B[47:40]);
mem S_B12(A[39:32], S_B[39:32]);
mem S_B13(A[31:24], S_B[31:24]);
mem S_B14(A[23:16], S_B[23:16]);
mem S_B15(A[15:8], S_B[15:8]);
mem S_B16(A[7:0], S_B[7:0]);

/*always @(posedge clk or aes_in_en)
begin
if(aes_in_en)
B <= S_B;
end*/

endmodule
