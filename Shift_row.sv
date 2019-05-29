module shift_row(//input logic clk,
                 input logic [127:0]B,
                 output logic [127:0]B_shift); 

/*always@(posedge clk)
begin
B_shift[127:120] <= B[127:120];
B_shift[119:112] <= B[87:80];
B_shift[111:104] <= B[47:40];
B_shift[103:96] <= B[7:0];

B_shift[95:88] <= B[95:88];
B_shift[87:80] <= B[55:48];
B_shift[79:72] <= B[15:8];
B_shift[71:64] <= B[103:96];

B_shift[63:56] <= B[63:56];
B_shift[55:48] <= B[23:16];
B_shift[47:40] <= B[111:104];
B_shift[39:32] <= B[71:64];

B_shift[31:24] <= B[31:24];
B_shift[23:16] <= B[119:112];
B_shift[15:8] <= B[79:72];
B_shift[7:0] <= B[39:32];
end*/

assign B_shift[127:120] = B[127:120];
assign B_shift[119:112] = B[87:80];
assign B_shift[111:104] = B[47:40];
assign B_shift[103:96] = B[7:0];

assign B_shift[95:88] = B[95:88];
assign B_shift[87:80] = B[55:48];
assign B_shift[79:72] = B[15:8];
assign B_shift[71:64] = B[103:96];

assign B_shift[63:56] = B[63:56];
assign B_shift[55:48] = B[23:16];
assign B_shift[47:40] = B[111:104];
assign B_shift[39:32] = B[71:64];

assign B_shift[31:24] = B[31:24];
assign B_shift[23:16] = B[119:112];
assign B_shift[15:8] = B[79:72];
assign B_shift[7:0] = B[39:32];

endmodule
