module top_aes(input logic clk, reset,
               input logic [127:0]plaintext,
               input logic [127:0]key,
               output logic [127:0]ciphertext);

 logic round_ctrl, aes_en = 0;
 logic aes_in_en, aes_out_en, key_exp_in_en, key_exp_out_en;
 logic  [127:0]A, state_out, state_in;
 logic  [127:0]key_in, key_out, key_input, state_input;
 logic [3:0]round;
initial begin
state_in = A;
key_in = key;
end
assign state_input = aes_in_en ? state_in : A;

always@(posedge clk)
begin
assign key_in = key_exp_in_en ? key_input : key;
end
//assign A = plaintext ^ key;
always@(posedge clk)
begin
if (reset)
begin
//state_in <= 0;
aes_en <= 0;

A <= 0;
end
else
begin
//state_in <= A;
aes_en <= 1;

A <= plaintext ^ key;
end
end

/*always@(plaintext)
begin
 aes_en = 1'b1;
 key_in = key;
 round = 4'b0001;
end*/
control_fsm fsm(clk, reset, aes_en, round_ctrl, aes_in_en, aes_out_en, key_exp_in_en, key_exp_out_en);

//AES 
AES_Enc aes(state_input, key_out, round, state_out);
flipflop ff1(clk, aes_in_en, reset, state_out, state_in);
Key_gen kg(key_input, round, key_out);
flipflop ff2(clk, key_exp_in_en, reset, key_out, key_input);
flipflop #4 ff3(clk, aes_out_en, reset, round + 1, round);
round_check rc(round, round_ctrl);
always@(round_ctrl)
begin
if(round_ctrl == 0)
ciphertext = 0;
else
ciphertext = state_input;
end

endmodule

