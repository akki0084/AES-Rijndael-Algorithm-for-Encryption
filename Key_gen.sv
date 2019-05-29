module Key_gen(//input logic key_exp_in_en,
               input logic [127:0]key_in,
               input logic [3:0]round,
               output logic [127:0]key_out);

logic [31:0]W[3:0];
wire [31:0]g_out;
G_func gout(key_in[31:0], round, g_out);
assign W[0] = key_in[127:96] ^ g_out[31:0];
assign W[1] = W[0] ^ key_in[95:64];
assign W[2] = W[1] ^ key_in[63:32];
assign W[3] = W[2] ^ key_in[31:0];

always@*
begin
if(round < 4'b1011 & round > 4'b0000)
     begin
	key_out <= {W[0], W[1], W[2], W[3]};
     end
else if (round == 4'b0000)
        key_out <= key_in;
else
        key_out <= 0;
end
endmodule


