module Add_round_key(
                     input logic [127:0]state_in,
                     input logic [127:0]round_key,
                     output logic [127:0]state_out);
/*reg [127:0]aes_out,key_out;
always@(posedge clk or aes_out_en)
begin
if(aes_out_en)
aes_out <= state_in;
end

always@(posedge clk or key_exp_out_en)
begin
if(key_exp_out_en)
key_out <= round_key;
end*/
assign state_out[127:0] = state_in[127:0] ^ round_key[127:0];
endmodule
