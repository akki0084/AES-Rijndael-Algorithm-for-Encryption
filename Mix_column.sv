module Mix_column(input logic[127:0]B_shift,
                  output logic [127:0]C);
genvar i;
reg [31:0]row[3:0];

function [7:0]xtime;
 input [7:0]x;
begin
  xtime = (x & 8'h80) ? ((x<<1) ^ 8'h1b) : (x<<1);
end
endfunction

generate for(i = 0; i < 4; i = i+1)
begin: loop_gen
always@(B_shift)
begin: colmix
reg [7:0]b0,b1,b2,b3,tmp;
reg [31:0]r[3:0];
/*r[0] = {B_shift[127:120], B_shift[95:88], B_shift[63:56], B_shift[31:24]};
r[1] = {B_shift[127:120], B_shift[95:88], B_shift[63:56], B_shift[31:24]};
r[2] = B_shift[95:64];
r[3] = {B_shift[127:120], B_shift[95:88], B_shift[63:56], B_shift[31:24]};*/
r[0] = B_shift[31:0];
r[1] = B_shift[63:32];
r[2] = B_shift[95:64];
r[3] = B_shift[127:96];

b0 = r[i][31:24];
b1 = r[i][23:16];
b2 = r[i][15:8];
b3 = r[i][7:0];
tmp = b0^b1^b2^b3;
row[i][31:24] = r[i][31:24]^tmp^xtime(b0^b1);
row[i][23:16] = r[i][23:16]^tmp^xtime(b1^b2);
row[i][15:8] = r[i][15:8]^tmp^xtime(b2^b3);
row[i][7:0] = r[i][7:0]^tmp^xtime(b3^b0);
end
end
endgenerate
/*always@(posedge clk)
begin
C <= {row[3],row[2],row[1],row[0]};
end*/
assign C = {row[3],row[2],row[1],row[0]};
endmodule
