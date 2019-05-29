module round_check(input [3:0]round,
                   output logic round_ctrl);
				   
				   always@(round)
				   begin
				   if (round < 4'b1011)
				   round_ctrl = 0;
				   else 
				   round_ctrl = 1;
				   end
				   endmodule
