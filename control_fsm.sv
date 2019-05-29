module control_fsm(input logic clk, reset,
                   input logic aes_en, round_ctrl,
                   output logic aes_in_en, aes_out_en, key_exp_in_en, key_exp_out_en);

logic [1:0]state, next_state;
logic [3:0]controls;
//typedef enum logic[1:0]  {IDLE, CALC, DONE} state_type;
//atate_type state, next_state;
parameter IDLE = 2'b00;
parameter CALC = 2'b01;
parameter DONE = 2'b10;

always_ff @(posedge clk or posedge reset)
     begin
      if (reset) state <= IDLE;
      else state <= next_state;
     end

always_comb
  begin
   next_state = state;
   case(state)
     IDLE: if(aes_en)  next_state = CALC;  
     CALC: if(round_ctrl)  next_state = DONE; 
     DONE: next_state = IDLE;
  default: next_state = 2'bx;
   endcase
  end
assign {aes_in_en,aes_out_en,key_exp_in_en,key_exp_out_en} = controls;
always_comb
  begin
   case(state)
     IDLE: controls <= 4'b0000;  //aes_in_en <= 0;  aes_out_en <= 0;  key_exp_in_en <= 0; key_exp_out_en <= 0;
     CALC: controls <= 4'b1111;  //aes_in_en <= 1;  aes_out_en <= 1;  key_exp_in_en <= 1; key_exp_out_en <= 1;
     DONE: controls <= 4'b0000;  //aes_in_en <= 0;  aes_out_en <= 0;  key_exp_in_en <= 0; key_exp_out_en <= 0;
    default: controls <= 4'bxxxx; //aes_in_en <= 1'bx;  aes_out_en <= 1'bx;  key_exp_in_en <= 1'bx; key_exp_out_en <= 1'bx;
   endcase
  end
endmodule
