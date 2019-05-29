module AES_Enc(//input logic aes_in_en,
               input logic [127:0]state_in,key_in,
               input logic [3:0]round,
               output logic [127:0]state_out);
logic [127:0]C;
logic [127:0]B, B_shift;

Byte_Substitution bs(state_in, B);
Shift_row sr(B, B_shift);
Mix_col mc(B_shift, C);
always@*
begin
if(round < 4'b1010 & round > 4'b0000)
 state_out = C ^ key_in;
else if(round == 4'b1010)
 state_out = B_shift ^ key_in;
else state_out = 0;
end

endmodule
